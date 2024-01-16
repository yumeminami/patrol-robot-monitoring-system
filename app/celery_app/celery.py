import os
from ast import literal_eval
from datetime import datetime
from threading import Thread
from urllib.parse import urlparse

from celery import Celery
from celery.schedules import crontab

from app.crud.robots import robot as robot_crud
from app.crud.sensors import sensor as sensor_crud
from app.crud.tasks import task as task_crud
from app.crud.task_logs import task_log as task_log_crud
from app.crud.patrol_images import patrol_image as patrol_image_crud
from app.db.database import SessionLocal
from app.db.redis import redis_client
from app.schemas.tasks import Task, TaskStatus
from app.schemas.task_logs import TaskLog, TaskLogCreate, TaskLogStatus
from app.services.ros_service import patrol_control, PatrolControlResponse
from app.services.task_service import (
    create_task_xml,
    monitor_sensor_data,
    fit_frequency,
)
from app.utils.log import logger
from app.utils.parse_execution_time import parse_execution_time

password = os.environ.get("REDIS_PASSWORD", "sample_password")
app = Celery(
    "tasks",
    broker=f"redis://:{password}@redis:6379/0",
    backend=f"redis://:{password}@redis:6379/0",
)

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
    "regular-query-tasks": {
        "task": "app.celery_app.celery.regular_query_tasks",
        "schedule": crontab(hour=16, minute=0),
    },
    "remove-expired-images": {
        "task": "app.celery_app.celery.remove_expired_images",
        "schedule": crontab(hour=16, minute=0),
    },
}


def get_redis_data(key: str, sub_key: str) -> dict:
    data = redis_client.hget(key, sub_key)
    return literal_eval(data) if data else None


@app.task(ignore_result=True)
def update_robot_data(**kwargs):
    """
    Update the robot data from redis to database
    """

    robot_name = kwargs.get("robot_name")
    robot_real_time_info = get_redis_data(robot_name, "robot_real_time_info")

    if robot_real_time_info is None:
        logger.error("No robot realtime info found in the cache.")
        return

    db = SessionLocal()
    robot = robot_crud.get_by_name(db=db, name=robot_name)

    robot_real_time_info["battery"] = robot_real_time_info["battery_level"]
    robot_real_time_info["battery_status"] = robot_real_time_info["battery_state"]

    try:
        robot = robot_crud.update(
            db,
            db_obj=robot,
            obj_in=robot_real_time_info,
        )
    except Exception as e:
        logger.error(f"Error occurred while updating robot: {e}")
    finally:
        db.close()


@app.task(ignore_result=True)
def update_sensor_data(**kwargs):
    """
    Update the sensor data from redis to database
    """

    robot_name = kwargs.get("robot_name")
    sensor_data = get_redis_data(robot_name, "sensor_data")
    if sensor_data is None:
        logger.error("No sensor data found in the cache.")
        return

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
    except Exception as e:
        logger.error(f"Error occurred while updating sensor '{sensor.name}': {e}")
    finally:
        db.close()


@app.task()
def remove_expired_images():
    """
    Remove expired images from the system.

    This function retrieves a list of images that were created before a certain number of days ago,
    and deletes the corresponding image files from the system.

    """
    logger.error("remove_expired_images")
    db = SessionLocal()
    day = 5
    try:
        imgs = patrol_image_crud.get_before_created_at(db=db, day=day)
        print("-------------------------------------------")
        print("task: remove expired images")
        print(f"days: {day} day")
        print(f"total: {len(imgs)} images")
        if len(imgs) == 0:
            print("no expired images need to be removed! ✅  ")
            print("-------------------------------------------")
            return
        for img in imgs:
            file_path = "app" + urlparse(img.image_url).path
            if os.path.exists(file_path):
                os.remove(file_path)
            patrol_image_crud.remove(db=db, id=img.id)
        print("remove the image files successfully! ✅  ")
        print("remove the image records successfully! ✅ ")
        print("-------------------------------------------")

    except FileNotFoundError:
        pass
    finally:
        db.close()

    return f"{datetime.now().strftime('%Y-%m-%d %H:%M:%S')} remove expired images"


def push_task_to_celery(task):
    """
    Push all the task execution times to celery.
    If the task has been modified, the old task will be revoked.
    If the task execution time has expired, the task will not be pushed to celery.
    At the same time, the task id and the execution time are stored in redis.
    """

    task_id = task.id
    celery_task_info = redis_client.hgetall(f"task_{task_id}")
    if celery_task_info:
        for celery_task_id in celery_task_info.values():
            app.control.revoke(celery_task_id, terminate=True)
        redis_client.delete(f"task_{task_id}")
        logger.warning(
            f"task {task_id} has been modified, all celery tasks have been revoked."
        )

    if task.status == TaskStatus.STOPPED.value:
        logger.info(f"Task:{task_id} has been stopped.")
        return

    for execution_time in task.execution_times:
        now = datetime.now()
        hour, minute = map(int, execution_time.split(":"))
        execution_time_obj = now.replace(
            hour=hour, minute=minute, second=0, microsecond=0
        )
        now = now.replace(second=0, microsecond=0)
        if execution_time_obj < now:
            logger.warning(f"Task {task.id} has been expired at {execution_time} today")
            continue
        eta_time = parse_execution_time(execution_time)
        celery_task = start_task.apply_async(
            args=[task.id, execution_time], eta=eta_time
        )
        redis_client.hset(f"task_{task.id}", execution_time, celery_task.id)
        logger.info(f"Task {task.id} will start at {execution_time}")


@app.task()
def regular_query_tasks():
    """
    The celery task is used to tell the system when should the task start but not what the task is.
    Query the tasks and push them to celery which meets the following conditions:

    1. The task is not deleted.
    2. The last task log execution time fit the task execution frequency.

    """
    db = SessionLocal()
    tasks = task_crud.get_all(db=db)
    for task in tasks:
        """ "
        Determine whether the task log time of the last executed task is compared with the current time to check if it meets the frequency set by the task
        Push all the task execution times to celery.
        At the same time, the task id and the execution time are stored in redis.
        """

        if task.status == TaskStatus.STOPPED.value:
            continue
        if fit_frequency(task):
            push_task_to_celery(task)

    db.close()
    return f"{datetime.now().strftime('%Y-%m-%d %H:%M:%S')} regular query tasks"


@app.task()
def start_task(task_id, execution_time):
    """
    Start the task
    1. Get the task and robot information from the database
    2. Generate the task xml file and order the robot to execute the task
    3. Start the thread to monitor the sensor data
    """

    db = SessionLocal()
    task = task_crud.get(db, task_id)
    robot = robot_crud.get(db, task.robot_id)
    execution_date = f"{datetime.now().strftime('%Y-%m-%d')} {execution_time}"
    if task.status == TaskStatus.STOPPED.value:
        """
        #TODO Fix the bug that the task status is stopped but the task is still running
        When the task is stopped, the program will revoke all the celery tasks of the task.
        But after the revoke, the celery still execute the task.
        """
        logger.info(f"Task:{task_id} has been stopped manually.")
        return f"Task:{task_id} has been stopped manually."

    try:
        file_name, patrol_command = create_task_xml(task, db)
        xml_data = None
        with open(file_name, "r") as f:
            xml_data = f.read()
        os.remove(file_name)
        logger.info(f"Patrol Command: {patrol_command}")
        status_code = patrol_control(
            robot_name=robot.name, patrol_command=patrol_command, xml_data=xml_data
        )
        if status_code == PatrolControlResponse.SUCCESS.value:
            logger.info(f"Robot '{robot.name}' start task id {task.id} success!")
        else:
            detail = ""
            if status_code == PatrolControlResponse.FAILED.value:
                detail = "未知原因"
            elif status_code == PatrolControlResponse.LOW_BATTERY.value:
                detail = "电量不足无法开启任务"
            elif status_code == PatrolControlResponse.INTASK.value:
                detail = "正任务中无法开启任务"
            task_log_create = TaskLogCreate(
                task_id=task.id,
                robot_id=task.robot_id,
                execution_date=execution_date,
                type=task.type,
                status=TaskLogStatus.FAILED.value,
                detail=detail,
            )
            task_log = task_log_crud.create(db, obj_in=task_log_create)
            logger.error(
                f"Robot '{robot.name}' start task id {task.id} failed! {detail}"
            )
            return f"Robot '{robot.name}' start task id {task.id} failed! {detail}"
    except Exception as e:
        logger.error(f"start task error: {e}")
        return f"start task error: {e}"

    task_crud.update(
        db,
        db_obj=task,
        obj_in={"status": TaskStatus.IN_PROGRESS.value},
    )
    task = Task.from_orm(task)

    task_log_create = TaskLogCreate(
        task_id=task.id,
        robot_id=task.robot_id,
        execution_date=execution_date,
        type=task.type,
        status=TaskLogStatus.IN_PROGRESS.value,
    )
    task_log = task_log_crud.create(db, obj_in=task_log_create)
    task_log = TaskLog.from_orm(task_log)
    thread = Thread(target=monitor_sensor_data, args=(task, execution_date, task_log))
    thread.start()

    redis_client.hdel(f"task_{task_id}", execution_time)
    db.close()

    return (
        f"task_id: {task_id} execution_time: "
        + datetime.now().strftime("%Y-%m-%d")
        + " "
        + str(execution_time)
    )
