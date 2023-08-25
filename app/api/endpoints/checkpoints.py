from fastapi import HTTPException

from app.api.api import create_generic_router
from app.crud.checkpoints import checkpoint as crud
from app.crud.robots import robot as robot_crud
from app.schemas.checkpoints import (
    CheckPoint,
    CheckPointCreate,
    CheckPointUpdate,
)


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
