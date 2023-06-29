import os
import threading
from datetime import timedelta

from celery import Celery

from app.services.task_service import update_parameter, monitor_sensor_data
from app.crud.tasks import task as crud
from app.schemas.tasks import Task
from app.schemas.tasks import TaskStatus
from app.db.database import SessionLocal

password = os.environ.get("REDIS_PASSWORD", "sample_password")
app = Celery(
    "tasks",
    broker=f"redis://:{password}@redis:6379/0",
    backend=f"redis://:{password}@redis:6379/0",
)

app.autodiscover_tasks(["celery.tasks"], force=True)


@app.task
def start_task(task_id, eta_time):
    """Update the task status to IN_PROGRESS and update the ROS parameter
    If the task is everyday task, update the eta_time to tomorrow and push the task to celery again.

    :param task_id: get the task from database by task_id

    :return: success
    """
    db = SessionLocal()

    task = crud.get(db, task_id)
    if task is None or task.status == TaskStatus.COMPLETED.value:
        return "task not found or task is completed"
    crud.update(
        db, db_obj=task, obj_in={"status": TaskStatus.IN_PROGRESS.value}
    )
    db.close()

    update_parameter()

    task = Task.from_orm(task)
    if task.is_everyday:
        eta_time = eta_time + timedelta(days=1)
        start_task.apply_async(args=(task_id, eta_time), eta=eta_time)

    thread = threading.Thread(target=monitor_sensor_data, args=(task,))
    thread.start()

    return "success"
