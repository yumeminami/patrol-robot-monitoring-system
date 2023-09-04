from fastapi import Depends, HTTPException

from app.api.api import create_generic_router
from app.crud.checkpoints import checkpoint as crud
from app.crud.robots import robot as robot_crud
from app.db.database import SessionLocal
from app.schemas.checkpoints import (
    CheckPoint,
    CheckPointCreate,
    CheckPointUpdate,
)


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


hooks = {
    "before_created": before_created,
}

router = create_generic_router(
    crud, CheckPointCreate, CheckPointUpdate, CheckPoint, hooks=hooks
)


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
