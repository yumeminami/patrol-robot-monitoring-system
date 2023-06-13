from celery import Celery
import os
from app.services.task_service import update_parameter
from app.crud.tasks import task as crud
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
def start_task(task_id):
    """Update the task status to IN_PROGRESS and update the ROS parameter

    :param task_id: get the task from database by task_id

    :return: success
    """
    db = SessionLocal()

    task = crud.get(db, task_id)
    crud.update(
        db, db_obj=task, obj_in={"status": TaskStatus.IN_PROGRESS.value}
    )
    update_parameter()

    return "success"
