from datetime import datetime

from app.api.api import create_generic_router
from app.celery_app.celery import app, start_task
from app.crud.tasks import task as crud
from app.db.redis import redis_client
from app.schemas.tasks import Task, TaskCreate, TaskUpdate
from app.utils.log import logger
from app.utils.parse_execution_time import parse_execution_time


def push_task_to_celery(task_id, task):
    """
    Push all the task execution times to celery.
    If the task has been modified, the old task will be revoked.
    If the task execution time has expired, the task will not be pushed to celery.
    At the same time, the task id and the execution time are stored in redis.
    """
    celery_task_info = redis_client.hgetall(f"task_{task_id}")
    if celery_task_info:
        # If the task has been modified, the old task will be revoked.
        for celery_task_id in celery_task_info.values():
            app.control.revoke(celery_task_id, terminate=True)
        redis_client.delete(f"task_{task_id}")

    for execution_time in task.execution_times:
        # If the task execution time has expired, the task will not be pushed to celery.
        now = datetime.now()
        hour, minute = map(int, execution_time.split(":"))
        execution_time_obj = now.replace(
            hour=hour, minute=minute, second=0, microsecond=0
        )
        if execution_time_obj < now:
            logger.info(f"Task {task.id} has been expired at {execution_time}")
            continue
        eta_time = parse_execution_time(execution_time)
        celery_task = start_task.apply_async(
            args=[task.id, execution_time], eta=eta_time
        )
        redis_client.hset(f"task_{task.id}", execution_time, celery_task.id)
        logger.info(f"Task {task.id} will start at {execution_time}")


def after_created(task, db):
    """
    After task created, push it to celery
    """
    task_id = task.id
    push_task_to_celery(task_id, task)


def after_update(task_id, task, db):
    """
    After task updated, push it to celery
    """
    push_task_to_celery(task_id, task)


hooks = {
    "after_created": after_created,
    "after_update": after_update,
}
router = create_generic_router(crud, TaskCreate, TaskUpdate, Task, hooks=hooks)
