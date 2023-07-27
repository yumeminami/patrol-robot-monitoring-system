import os
from ast import literal_eval
from datetime import datetime
from celery import Celery

from app.crud.robots import robot as robot_crud
from app.crud.sensors import sensor as sensor_crud
from app.crud.tasks import task as task_crud
from app.db.database import SessionLocal
from app.db.redis import redis_client
from app.utils.log import logger

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
    "regular-query-tasks-every-day": {
        "task": "app.celery_app.celery.regular_query_tasks",
        "schedule": 60.0 * 60.0 * 24.0,
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
        """
        # TODO check the task log time of the last executed task

        """"
        Push all the task execution times to celery.
        At the same time, the task id and the execution time are stored in redis.
        """
        # for execution_time in task.execution_times:
        #     eta_time = parse_execution_time(execution_time)
        #     celery_task_id = start_task.apply_async(
        #         args=(task.id), eta=eta_time
        #     )
        #     redis_client.hset(
        #         f"task_{task.id}", execution_time, celery_task_id
        #     )
        #     logger.error(f"Task {task.id} will start at {execution_time}")

    db.close()
    return (
        f"{datetime.now().strftime('%Y-%m-%d %H:%M:%S')} regular query tasks"
    )


@app.task()
def start_task(task_id, execution_time):
    """
    Before the task execution, we need to query the task from database and check it again.
    There will be kinds of situations:

    1. The task is not deleted and not modified.
    2. The task is deleted.
    3. The task is modified.

    Situation 1:
    Start the task.

    Situation 2:
    Do not start the task.

    Situation 3:
    Update the task and start the task.


    """

    # with SessionLocal() as db:
    #     task = task_crud.get(db, task_id)
    #     if task is None:
    #         return "task not found"

    #     robot = robot_crud.get(db, task.robot_id)
    #     if robot is None:
    #         return "robot not found"

    #     try:
    #         file_name = create_task_xml(task, db)
    #         xml_data = None
    #         with open(file_name, "r") as f:
    #             xml_data = f.read()

    #         if patrol_control(
    #             robot_name=robot.name,
    #             patrol_command=PatrolControlCommand.START.value,
    #             xml_data=xml_data,
    #         ):
    #             logger.error(f"Robot '{robot.name}' start task success!")
    #         os.remove(file_name)
    #     except Exception as e:
    #         print(e)

    #     task = Task.from_orm(task)

    #     thread = threading.Thread(target=monitor_sensor_data, args=(task,))
    #     thread.start()
    return (
        f"task_id: {task_id} execution_time: "
        + datetime.now().strftime("%Y-%m-%d")
        + " "
        + str(execution_time)
    )
