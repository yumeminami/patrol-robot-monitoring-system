import os
from ast import literal_eval
from datetime import datetime
from threading import Thread

from celery import Celery

from app.crud.robots import robot as robot_crud
from app.crud.sensors import sensor as sensor_crud
from app.crud.tasks import task as task_crud
from app.crud.task_logs import task_log as task_log_crud
from app.db.database import SessionLocal
from app.db.redis import redis_client
from app.schemas.tasks import Task, TaskStatus
from app.schemas.task_logs import TaskLogCreate, TaskLog, TaskLogStatus
from app.services.ros_service import patrol_control
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
    "regular-query-tasks-every-6-hours": {
        "task": "app.celery_app.celery.regular_query_tasks",
        "schedule": 60.0 * 60 * 6,
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


@app.task(ignore_result=True)
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
            logger.warning(
                f"Task {task.id} has been expired at {execution_time}"
            )
            continue
        eta_time = parse_execution_time(execution_time)
        celery_task = start_task.apply_async(
            args=[task.id, execution_time], eta=eta_time
        )
        redis_client.hset(f"task_{task.id}", execution_time, celery_task.id)
        logger.warning(f"Task {task.id} will start at {execution_time}")


@app.task(ignore_result=True)
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
    return (
        f"{datetime.now().strftime('%Y-%m-%d %H:%M:%S')} regular query tasks"
    )


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

    try:
        file_name, patrol_command = create_task_xml(task, db)
        xml_data = None
        with open(file_name, "r") as f:
            xml_data = f.read()
        os.remove(file_name)
        logger.error(f"Patrol Command: {patrol_command}")
        if patrol_control(
            robot_name=robot.name,
            patrol_command=patrol_command,
            xml_data=xml_data,
        ):
            logger.error(
                f"Robot '{robot.name}' start task id {task.id} success!"
            )
        else:
            logger.error(
                f"Robot '{robot.name}' start task id {task.id} failed!"
            )
            return f"Robot '{robot.name}' start task id {task.id} failed!"
    except Exception as e:
        logger.error(f"start task error: {e}")
        return f"start task error: {e}"

    task_crud.update(
        db,
        db_obj=task,
        obj_in={"status": TaskStatus.IN_PROGRESS.value},
    )
    task = Task.from_orm(task)

    execution_date = f"{datetime.now().strftime('%Y-%m-%d')} {execution_time}"
    task_log_create = TaskLogCreate(
        task_id=task.id,
        robot_id=task.robot_id,
        execution_date=execution_date,
        type=task.type,
        status=TaskLogStatus.IN_PROGRESS.value,
    )
    task_log = task_log_crud.create(db, obj_in=task_log_create)
    task_log = TaskLog.from_orm(task_log)
    thread = Thread(
        target=monitor_sensor_data, args=(task, execution_date, task_log)
    )
    thread.start()

    redis_client.hdel(f"task_{task_id}", execution_time)
    db.close()

    return (
        f"task_id: {task_id} execution_time: "
        + datetime.now().strftime("%Y-%m-%d")
        + " "
        + str(execution_time)
    )
