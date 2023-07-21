import base64
import os
import threading
import uuid
from ast import literal_eval
from datetime import datetime

import cv2
from celery import Celery

from app.crud.checkpoints import checkpoint as checkpoint_crud
from app.crud.patrol_images import patrol_image as patrol_image_crud
from app.crud.robots import robot as robot_crud
from app.crud.sensors import sensor as sensor_crud
from app.crud.tasks import task as task_crud
from app.db.database import SessionLocal
from app.db.redis import redis_client
from app.schemas.patrol_images import PatrolImageCreate
from app.schemas.tasks import Task, TaskStatus
from app.services.ros_service import PatrolControlCommand, patrol_control
from app.services.task_service import create_task_xml, monitor_sensor_data
from app.settings import config
from app.utils.images import ROS_Image_to_cv2
from app.utils.log import logger
from app.vision_algorithm.vision_algorithm import vision_algorithm as vs

password = os.environ.get("REDIS_PASSWORD", "sample_password")
app = Celery("tasks", broker=f"redis://:{password}@redis:6379/0")

app.autodiscover_tasks(["celery.tasks"], force=True)
app.conf.broker_transport_options = {"visibility_timeout": 60 * 60 * 24 * 2}

app.conf.beat_schedule = {
    "update-robot-data-every-seconds": {
        "task": "app.celery_app.celery.update_robot_data",
        "schedule": 1.0,
        "kwargs": {"robot_name": "zj_robot"},
    },
    "update-sensor-data-every-seconds": {
        "task": "app.celery_app.celery.update_sensor_data",
        "schedule": 1.0,
        "kwargs": {"robot_name": "zj_robot"},
    },
}


@app.task()
def start_task(task_id, eta_time):
    """Call the patrol_control function to start the task.
    If the task is everyday task, update the eta_time to tomorrow and push the task to celery again. Only the task is deleted, the function will end.

    :param task_id: get the task from database by task_id
    :param eta_time: the time that the task will start

    :return: result: str
    """
    result = datetime.now().strftime("%Y-%m-%d %H:%M:%S") + "once task"
    db = SessionLocal()

    task = task_crud.get(db, task_id)
    if task is None:
        return "task not found"
    task_crud.update(
        db, db_obj=task, obj_in={"status": TaskStatus.IN_PROGRESS.value}
    )
    db.close()

    robot = robot_crud.get(db, task.robot_id)
    if robot is None:
        return "robot not found"

    try:
        file_name = create_task_xml(task, db)
        xml_data = None
        with open(file_name, "r") as f:
            xml_data = f.read()

        if patrol_control(
            robot_name=robot.name,
            patrol_command=PatrolControlCommand.START.value,
            xml_data=xml_data,
        ):
            logger.error(f"Robot '{robot.name}' start task success!")
        os.remove(file_name)

    except Exception as e:
        print(e)

    task = Task.from_orm(task)

    thread = threading.Thread(target=monitor_sensor_data, args=(task,))
    thread.start()

    return result


def get_redis_data(key: str, sub_key: str) -> dict:
    data = redis_client.hget(key, sub_key)
    return literal_eval(data) if data else None


@app.task()
def update_robot_data(**kwargs):
    """
    Update the robot data from redis to database
    """

    robot_name = kwargs.get("robot_name")
    robot_real_time_info = get_redis_data(robot_name, "robot_real_time_info")

    if robot_real_time_info is None:
        logger.error("No robot realtime info found in the cache.")

    db = SessionLocal()
    robot = robot_crud.get_by_name(db=db, name=robot_name)

    robot_real_time_info["battery"] = robot_real_time_info["battery_level"]
    robot_real_time_info["battery_status"] = robot_real_time_info[
        "battery_state"
    ]

    try:
        robot = robot_crud.update(
            db,
            db_obj=robot,
            obj_in=robot_real_time_info,
        )
        logger.info(f"Robot '{robot_name}' updated successfully.")
    except Exception as e:
        logger.error(f"Error occurred while updating robot: {e}")
    finally:
        db.close()


@app.task()
def update_sensor_data(**kwargs):
    """
    Update the sensor data from redis to database
    """

    robot_name = kwargs.get("robot_name")
    sensor_data = get_redis_data(robot_name, "sensor_data")
    if sensor_data is None:
        logger.error("No sensor data found in the cache.")

    db = SessionLocal()
    robot = robot_crud.get_by_name(db=db, name=robot_name)
    sensors = sensor_crud.get_multi_by_robot_id(db=db, robot_id=robot.id)

    try:
        for sensor in sensors:
            if sensor.name in sensor_data:
                sensor_crud.update(
                    db,
                    db_obj=sensor,
                    obj_in={"value": sensor_data[sensor.name]},
                )
            else:
                logger.warning(f"Sensor '{sensor.name}' not found in message.")
        logger.info(f"{robot_name} Sensor data updated successfully.")
    except Exception as e:
        logger.error(
            f"Error occurred while updating sensor '{sensor.name}': {e}"
        )
    finally:
        db.close()


@app.task()
def image_detection(image, task_id, checkpoint_id):
    """
    Detect the image and save the result to database

    1. Check if the task and checkpoint exist in the database.

    2. Call the corresponding HTTP API to detect the image.

    3. Save the detection result to the database.

    4. Create alarm if the detection result is abnormal.
    """

    db = SessionLocal()
    task = task_crud.get(db, task_id)
    if task is None:
        logger.error("Task does not exist in the database.")
        return

    checkpoint = checkpoint_crud.get(db, checkpoint_id)
    if checkpoint is None:
        logger.error("Checkpoint does not exist in the database.")
        return

    image_id = str(uuid.uuid4())
    image_cv = ROS_Image_to_cv2(image)
    image_file_path = f"{config.IMAGE_DIR}/{image_id}.jpg"

    patrol_image = PatrolImageCreate(
        image_url=image_file_path,
        task_id=task_id,
        uuid=image_id,
    )
    patrol_image_crud.create(db, obj_in=patrol_image)
    cv2.imwrite(image_file_path, image_cv)

    task = Task.from_orm(task)
    vision_algorithms = task.vision_algorithms

    # Detect
    alarms = []
    _, img_encoded = cv2.imencode(".jpg", image_cv)
    image_base64 = base64.b64encode(img_encoded).decode()
    for vision_algorithm in vision_algorithms:
        print(vision_algorithm.name)
        if vision_algorithm.sensitivity == 0:
            continue
        try:
            detected_alarms = vs.detect(
                image_id=image_id,
                image_base64=image_base64,
                algorithm=vision_algorithm.name,
                sensitivity=vision_algorithm.sensitivity,
            )
            alarms.extend(detected_alarms)
        except Exception as e:
            logger.error("")
            # return

    # Merge
    merge_image_base64 = vs.merge(image_id, image_base64)
    if merge_image_base64 is None:
        logger.error("Nothing Detected.")
        return

    merge_image_file_path = f"{config.IMAGE_DIR}/{image_id}_merge.jpg"
    merge_image_data = base64.b64decode(merge_image_base64)
    with open(
        merge_image_file_path,
        "wb",
    ) as f:
        f.write(merge_image_data)
    patrol_image_merge = PatrolImageCreate(
        image_url=f"{config.IMAGE_DIR}/{merge_image_file_path}",
        task_id=task_id,
        uuid=image_id,
    )
    patrol_image_crud.create(db, obj_in=patrol_image_merge)

    # TODO 3. create alarm if the detection result is abnormal
    if len(alarms) > 0:
        logger.error(f"Alarms detected: {alarms}")
    db.close()
    return
