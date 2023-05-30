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
    db = SessionLocal()

    task = crud.get(db, task_id)
    # print(task)
    crud.update(
        db, db_obj=task, obj_in={"status": TaskStatus.IN_PROGRESS.value}
    )
    # run_node()
    update_parameter()

    return "success"