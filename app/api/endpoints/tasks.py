from app.schemas.tasks import Task, TaskCreate, TaskUpdate, TaskStatus
from app.crud.tasks import task as crud
from app.api.api import create_generic_router
from fastapi import HTTPException
from app.services.task_service import (
    create_task_xml,
    run_node,
    update_parameter,
)


async def before_created(task_create, db):
    await create_task_xml(task_create, db)


async def after_created(task, db):
    # TODO push the task to the mq
    # run_node()
    update_parameter()


async def before_update(id, task_update, db):
    task = await crud.get(db, id)
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
