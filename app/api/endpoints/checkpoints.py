import numpy as np

from fastapi import Depends, HTTPException

from app.api.api import create_generic_router
from app.crud.tasks import task as task_crud
from app.crud.checkpoints import checkpoint as crud
from app.crud.robots import robot as robot_crud
from app.db.database import SessionLocal
from app.schemas.checkpoints import (
    CheckPoint,
    CheckPointCreate,
    CheckPointUpdate,
)
from app.models.models import CheckPoint as CheckPointModel


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


def before_created(checkpoint, db):
    robot = robot_crud.get(db=db, id=checkpoint.robot_id)
    if robot is None:
        raise HTTPException(status_code=404, detail="Robot not found")


def before_delete(checkpoint_id, db):
    tasks = task_crud.get_multi(
        db=db,
        checkpoint_ids__any=checkpoint_id,
    )
    if tasks:
        raise HTTPException(
            status_code=400,
            detail="Could not delete the checkpoint, there are tasks using it.",
        )


hooks = {
    "before_created": before_created,
    "before_delete": before_delete,
}

router = create_generic_router(
    crud, CheckPointCreate, CheckPointUpdate, CheckPoint, hooks=hooks
)


@router.post("/batch")
def create_batch(
    start: int,
    end: int,
    interval: int,
    velocity: float,
    gimbal_points: list = [],
    robot_id: int = 1,
    db: SessionLocal = Depends(get_db),
):
    arr = np.arange(start, end, interval)
    if arr[-1] != end:
        arr = np.append(arr, end)
    checkpoints = []
    from datetime import datetime

    for i in arr:
        checkpoint = {
            "name": f"POSITION:{i}mm VELOCITY:{velocity}mm/s",
            "robot_id": robot_id,
            "position": i,
            "velocity": velocity,
            "gimbal_points": gimbal_points,
            "created_at": datetime.now(),
            "updated_at": datetime.now(),
        }
        checkpoints.append(checkpoint)

    db.bulk_insert_mappings(CheckPointModel, checkpoints)
    db.commit()

    return {"message": "success"}


@router.post("/robot/{robot_id}")
def create_by_robot_id(
    robot_id: int,
    db: SessionLocal = Depends(get_db),
):
    robot = robot_crud.get(db=db, id=robot_id)
    if robot is None:
        raise HTTPException(status_code=404, detail="Robot not found")
    checkpoint = CheckPointCreate(
        name="Checkpoint",
        robot_id=robot_id,
        position=robot.position,
        velocity=robot.velocity,
    )
    return crud.create(db=db, obj_in=checkpoint)
