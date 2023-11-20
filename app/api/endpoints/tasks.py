from fastapi import HTTPException, status

from app.api.api import create_generic_router
from app.celery_app.celery import push_task_to_celery
from app.crud.tasks import task as crud
from app.crud.robots import robot as robot_crud
from app.schemas.tasks import (
    Task,
    TaskCreate,
    TaskUpdate,
    TaskStatus,
    TaskType,
)
from app.services.ros_service import PatrolControlCommand, patrol_control


def before_created(task, db):
    """
    Before task created, push it to celery
    """
    task_name = task.name
    tasks = crud.get_multi_by_name(db=db, name=task_name)
    if tasks:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Task name already exists",
        )


def after_created(created_task, db):
    """
    After task created, push it to celery
    """
    push_task_to_celery(created_task)


def before_update(task_id, update_task, db):
    task_name = update_task.name
    tasks = crud.get_multi_by_name(db=db, name=task_name)
    if len(tasks) > 1: 
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Task name already exists",
        )

    try:
        task = crud.get(db=db, id=task_id)
        robot = robot_crud.get(db=db, id=task.robot_id)
        if task.status != update_task.status:
            """
            Update task status
            IN_PROGRESS -> STOPPED: stop the robot
            """
            if (
                update_task.status == TaskStatus.STOPPED.value
                and task.status == TaskStatus.IN_PROGRESS.value
            ):
                patrol_command = (
                    PatrolControlCommand.STOP_NORMAL.value
                    if task.type == TaskType.MANUAL.value
                    else PatrolControlCommand.STOP_AUTO.value
                )
                patrol_control(
                    robot_name=robot.name, patrol_command=patrol_command
                )
    except Exception as e:
        print(e)


def after_update(task_id, updated_task, db):
    """
    After task updated, push it to celery
    """
    push_task_to_celery(updated_task)


hooks = {
    "before_created": before_created,
    "after_created": after_created,
    "before_update": before_update,
    "after_update": after_update,
}
router = create_generic_router(crud, TaskCreate, TaskUpdate, Task, hooks=hooks)
