from app.api.api import create_generic_router
from app.celery_app.celery import start_task
from app.crud.tasks import task as crud
from app.schemas.tasks import Task, TaskCreate, TaskUpdate
from app.utils.log import logger
from app.utils.parse_execution_time import parse_execution_time


def after_created(task, db):
    """
    After task created, push it to celery
    """
    task = Task.from_orm(task)
    for execution_time in task.execution_time:
        eta_time = parse_execution_time(execution_time)
        start_task.apply_async(args=(task.id, eta_time), eta=eta_time)
        logger.info(f"Task {task.id} will start at {execution_time}")


hooks = {
    "after_created": after_created,
}
router = create_generic_router(crud, TaskCreate, TaskUpdate, Task, hooks=hooks)
