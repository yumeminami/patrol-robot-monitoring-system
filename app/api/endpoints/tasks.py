from app.schemas.tasks import Task, TaskCreate, TaskUpdate, TaskStatus
from app.crud.tasks import task as crud
from app.api.api import create_generic_router
from fastapi import HTTPException


async def before_update(id, task_update, db):
    task = await crud.get(db, id)
    task = task.__dict__
    if task is None:
        raise HTTPException(status_code=404, detail="Task not found")
    if (
        task["status"] == TaskStatus.COMPLETED.value
        or task["status"] == TaskStatus.IN_PROGRESS.value
    ):
        raise HTTPException(
            status_code=400,
            detail="task is already completed or in progress, cannot be updated",
        )


hooks = {"before_update": before_update}
router = create_generic_router(crud, TaskCreate, TaskUpdate, Task, hooks=hooks)
