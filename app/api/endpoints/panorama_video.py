import os

from fastapi import APIRouter, HTTPException

from app.settings import config
from app.db.database import SessionLocal
from app.utils.utils import position_to_time
from app.services.ros_service import PatrolControlCommand, patrol_control
from app.crud.robots import robot as robot_crud

router = APIRouter()


@router.get("/")
def get_panorama_video():
    for file_name in os.listdir(config.PANORAMA_VIDEO_DIR):
        if file_name.startswith("panorama_video") and file_name.endswith(".mp4"):
            return {"video_name": file_name}
    raise HTTPException(status_code=404, detail="Video not found")


@router.get("/video_time")
def get_panorama_video_time(position: int):
    time = position_to_time(position)
    if time:
        return {"time": time}
    else:
        raise HTTPException(status_code=404, detail="Position not found")


@router.post("/task/{robot_id}")
def start_panorama_video_task_record(robot_id: int):
    db = SessionLocal()
    robot = robot_crud.get(db, robot_id)
    if robot is None:
        raise HTTPException(status_code=404, detail="Robot not found")
    robot_name = robot.name
    patrol_command = PatrolControlCommand.PANORAMA_VIDEO_RECORD.value

    result = patrol_control(robot_name=robot_name, patrol_command=patrol_command)
    if result is False:
        raise HTTPException(status_code=400, detail="start panorama video task failed")
    return {"message": "start panorama video task success"}
