from app.schemas.tasks import Task, TaskCreate, TaskUpdate, TaskStatus
from app.crud.tasks import task as crud
from app.api.api import create_generic_router
from fastapi import HTTPException
from app.services.task_service import (
    create_task_xml,
)
from app.utils.parse_execution_time import parse_execution_time
from app.celery_app.celery import start_task
from app.utils.log import logger


def before_created(task_create, db):
    create_task_xml(task_create, db)


def after_created(task, db):
    """
    After task created, push it to celery
    """
    task = Task.from_orm(task)
    for execution_time in task.execution_time:
        eta_time = parse_execution_time(execution_time)
        start_task.apply_async(args=(task.id, eta_time), eta=eta_time)
        logger.info(f"Task {task.id} will start at {execution_time}")


def before_update(id, task_update, db):
    """
    Before task updated, check if the task is completed or stopped
    If it is, raise an exception to tell the user that the task cannot be updated
    """
    task = crud.get(db, id)
    task = task.__dict__
    if task is None:
        raise HTTPException(status_code=404, detail="Task not found")
    if (
        task["status"] == TaskStatus.COMPLETED.value
        or task["status"] == TaskStatus.STOPPED.value
    ):
        raise HTTPException(
            status_code=400,
            detail="task is already completed, cannot be updated",
        )


hooks = {
    "before_created": before_created,
    "after_created": after_created,
    "before_update": before_update,
}
router = create_generic_router(crud, TaskCreate, TaskUpdate, Task, hooks=hooks)
