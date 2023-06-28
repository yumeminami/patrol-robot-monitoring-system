from app.schemas.robots import RobotCreate, RobotUpdate, Robot
from app.crud.robots import robot as crud
from app.api.api import create_generic_router

from fastapi import Depends
from sqlalchemy.orm import Session

from app.db.database import SessionLocal
from app.services.ros_service import velocity_control as velocity_control_ros
from app.services.ros_service import position_control as position_control_ros
from app.services.ros_service import stop_control as stop_control_ros
from app.services.ros_service import take_picture as take_picture_ros


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


def after_read(robot):
    tasks = robot.tasks.all()
    robot = Robot.from_orm(robot)
    if tasks:
        task = tasks[-1]
        robot.task_id = task.id
        robot.task_status = task.status
    return robot


robot_hooks = {
    "after_read": after_read,
}

router = create_generic_router(
    crud, RobotCreate, RobotUpdate, Robot, hooks=robot_hooks
)


# velocity control
@router.post("/{id}/velocity_control")
def velocity_control(
    id: int, db: Session = Depends(get_db), velocity_f: float = 0.0
):
    robot = crud.get(db, id)
    if robot is None:
        raise HTTPException(status_code=404, detail="Robot not found")

    if velocity_control_ros(robot_name=robot.name, velocity_f=velocity_f):
        return {"message": "Velocity control success"}
    else:
        return {"message": "Velocity control failed"}


# position control
@router.post("/{id}/position_control")
def position_control(
    id: int,
    db: Session = Depends(get_db),
    position_control_type: int = 0,
    target_position_f: float = 0.0,
    velocity_f: float = 0.0,
):
    robot = crud.get(db, id)
    if robot is None:
        raise HTTPException(status_code=404, detail="Robot not found")

    if position_control_ros(
        robot_name=robot.name,
        position_control_type=position_control_type,
        target_position_f=target_position_f,
        velocity_f=velocity_f,
    ):
        return {"message": "Position control success"}
    else:
        return {"message": "Position control failed"}


# stop control
@router.post("/{id}/stop_control")
def stop_control(id: int, db: Session = Depends(get_db), stop_type: int = 0):
    robot = crud.get(db, id)
    if robot is None:
        raise HTTPException(status_code=404, detail="Robot not found")

    if stop_control_ros(robot_name=robot.name, stop_type=stop_type):
        return {"message": "Stop control success"}
    else:
        return {"message": "Stop control failed"}


# take photo
@router.get("/{id}/photo")
def take_photo(id: int, db: Session = Depends(get_db)):
    robot = crud.get(db, id)
    if robot is None:
        raise HTTPException(status_code=404, detail="Robot not found")

    if take_picture_ros(robot_name=robot.name):
        return {"message": "Photo taken"}
    else:
        return {"message": "Photo failed"}


# start or stop video stream
@router.post("/{id}/video")
def start_stop_video(id: int, db: Session = Depends(get_db)):
    robot = crud.get(db, id)
    if robot is None:
        raise HTTPException(status_code=404, detail="Robot not found")
    # TODO: Start or stop video stream
    return {"message": "Video stream started or stopped"}
