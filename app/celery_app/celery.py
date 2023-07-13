import os
import threading
from datetime import datetime, timedelta

import rospy
from celery import Celery

from app.crud.tasks import task as crud
from app.db.database import SessionLocal
from app.schemas.tasks import Task, TaskStatus
from app.services.task_service import monitor_sensor_data

password = os.environ.get("REDIS_PASSWORD", "sample_password")
app = Celery(
    "tasks",
    broker=f"redis://:{password}@redis:6379/0",
    backend=f"redis://:{password}@redis:6379/0",
)

app.autodiscover_tasks(["celery.tasks"], force=True)
app.conf.broker_transport_options = {"visibility_timeout": 60 * 60 * 24 * 2}


@app.task
def start_task(task_id, eta_time):
    """Update the task status to IN_PROGRESS and update the ROS parameter
    If the task is everyday task, update the eta_time to tomorrow and push the task to celery again. Only the task is deleted, the function will end.

    :param task_id: get the task from database by task_id

    :return: result: str
    """

    result = datetime.now().strftime("%Y-%m-%d %H:%M:%S") + "once task"
    db = SessionLocal()

    task = crud.get(db, task_id)
    if task is None:
        return "task not found"
    crud.update(
        db, db_obj=task, obj_in={"status": TaskStatus.IN_PROGRESS.value}
    )
    db.close()

    try:
        rospy.set_param("/patrol_state", 1)
        # TODO call the corresponding service to pass the XML file to the robot
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
