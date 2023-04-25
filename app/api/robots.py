from app.schemas.robots import RobotCreate, RobotUpdate, Robot
from app.crud.robots import robot as crud
from app.api.api import create_generic_router

from fastapi import Depends
from sqlalchemy.orm import Session

from app.db.database import SessionLocal


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


def customize_robot_response(robot):
    robot_data = robot.__dict__
    tasks = robot.tasks.all()
    if tasks:
        # TODO Make sure that the last task is the current task
        task = tasks[-1]
        robot_data['task_id'] = task.id
        robot_data['task_status'] = task.status
    return robot_data


router = create_generic_router(
    crud,
    RobotCreate,
    RobotUpdate,
    Robot,
    custom_read=customize_robot_response,
    custom_read_multi=customize_robot_response)


# take photo
@router.get("/{id}/photo")
def take_photo(id: int, db: Session = Depends(get_db)):
    robot = crud.read(db, id)
    if robot is None:
        raise HTTPException(status_code=404, detail="Robot not found")
    # TODO: Take photo
    return {"message": "Photo taken"}


# start or stop video stream
@router.post("/{id}/video")
def start_stop_video(id: int, db: Session = Depends(get_db)):
    robot = crud.read(db, id)
    if robot is None:
        raise HTTPException(status_code=404, detail="Robot not found")
    # TODO: Start or stop video stream
    return {"message": "Video stream started or stopped"}
