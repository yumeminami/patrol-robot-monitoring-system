import os
import threading
from datetime import datetime, timedelta

from celery import Celery

from app.crud.tasks import task as task_crud
from app.crud.robots import robot as robot_crud
from app.crud.sensors import sensor as sensor_crud
from app.db.database import SessionLocal
from app.db.redis import redis_client
from app.schemas.tasks import Task, TaskStatus
from app.services.task_service import monitor_sensor_data, create_task_xml
from app.services.ros_service import PatrolCommand, patrol_control
from app.utils.log import logger

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
            patrol_command=PatrolCommand.START.value,
            xml_data=xml_data,
        ):
            logger.error(f"Robot '{robot.name}' start task failed.")

    except Exception as e:
        print(e)

    task = Task.from_orm(task)
    if task.is_everyday:
        eta_time = eta_time + timedelta(days=1)
        start_task.apply_async(args=(task_id, eta_time), eta=eta_time)

        result = datetime.now().strftime("%Y-%m-%d %H:%M:%S") + "everyday task"

    thread = threading.Thread(target=monitor_sensor_data, args=(task,))
    thread.start()

    return result


@app.task()
def update_robot_data(**kwargs):
    """
    Update the robot data from redis to database
    """

    robot_name = kwargs.get("robot_name")
    robot_real_time_info = redis_client.hget(
        robot_name, "robot_real_time_info"
    )
    robot_real_time_info = eval(robot_real_time_info)
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
    sensor_data = redis_client.hget(robot_name, "sensor_data")
    sensor_data = eval(sensor_data)
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
