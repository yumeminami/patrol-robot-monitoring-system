from app.api.api import create_generic_router
from app.celery_app.celery import push_task_to_celery
from app.crud.tasks import task as crud
from app.schemas.tasks import Task, TaskCreate, TaskUpdate


def after_created(task, db):
    """
    After task created, push it to celery
    """
    push_task_to_celery(task)


def after_update(task_id, task, db):
    """
    After task updated, push it to celery
    """
    push_task_to_celery(task)


hooks = {
    "after_created": after_created,
    "after_update": after_update,
}
router = create_generic_router(crud, TaskCreate, TaskUpdate, Task, hooks=hooks)
