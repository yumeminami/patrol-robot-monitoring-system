from typing import Callable
import asyncio

from fastapi import Depends
from fastapi.background import BackgroundTasks
from fastapi.exceptions import HTTPException
from fastapi.responses import FileResponse, StreamingResponse
from sqlalchemy.orm import Session

from app.api.api import create_generic_router, remove_file
from app.crud.robots import robot as crud
from app.db.database import SessionLocal
from app.schemas.robots import Robot, RobotCreate, RobotUpdate
from app.services.ros_service import camera_control as camera_control_ros
from app.services.ros_service import gimbal_control as gimbal_control_ros
from app.services.ros_service import (
    gimbal_motion_control as gimbal_motion_control_ros,
)
from app.services.ros_service import position_control as position_control_ros
from app.services.ros_service import stop_control as stop_control_ros
from app.services.ros_service import take_picture as take_picture_ros
from app.services.ros_service import velocity_control as velocity_control_ros
from app.services.ros_service import init_robot as init_robot_ros
from app.ros.ros import video_data


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


robot_hooks = {}

router = create_generic_router(
    crud, RobotCreate, RobotUpdate, Robot, hooks=robot_hooks
)


def control_robot(
    id: int,
    db: Session = Depends(get_db),
    control_func: Callable = None,
    **kwargs,
):
    robot = crud.get(db, id)
    if robot is None:
        raise HTTPException(status_code=404, detail="Robot not found")
    if control_func:
        result, err_msg = control_func(robot_name=robot.name, **kwargs)
        if result:
            return {"message": f"{control_func.__name__} success"}
        else:
            raise HTTPException(status_code=400, detail=str(err_msg))


@router.post("/{id}/velocity_control")
def velocity_control(
    id: int, db: Session = Depends(get_db), velocity_f: float = 0.0
):
    return control_robot(
        id=id, db=db, control_func=velocity_control_ros, velocity_f=velocity_f
    )


@router.post("/{id}/position_control")
def position_control(
    id: int,
    db: Session = Depends(get_db),
    position_control_type: int = 0,
    target_position_f: float = 0.0,
    velocity_f: float = 0.0,
):
    return control_robot(
        id=id,
        db=db,
        control_func=position_control_ros,
        position_control_type=position_control_type,
        target_position_f=target_position_f,
        velocity_f=velocity_f,
    )


@router.post("/{id}/stop_control")
def stop_control(id: int, db: Session = Depends(get_db), stop_type: int = 0):
    return control_robot(
        id=id, db=db, control_func=stop_control_ros, stop_type=stop_type
    )


@router.get("/{id}/photo")
def take_photo(
    background_tasks: BackgroundTasks, id: int, db: Session = Depends(get_db)
):
    robot = crud.get(db, id)
    if robot is None:
        raise HTTPException(status_code=404, detail="Robot not found")

    file_path = take_picture_ros(robot_name=robot.name)
    if file_path:
        background_tasks.add_task(remove_file, file_path)
        return FileResponse(file_path)
    else:
        raise HTTPException(status_code=400, detail="Take photo failed")


@router.post("/{id}/camera_control")
def camera_control(
    id: int, db: Session = Depends(get_db), camera_command: int = 0
):
    return control_robot(
        id=id,
        db=db,
        control_func=camera_control_ros,
        camera_command=camera_command,
    )


@router.post("/{id}/gimbal_control")
def gimbal_control(
    id: int,
    command: int,
    preset_index: int,
    db: Session = Depends(get_db),
):
    return control_robot(
        id=id,
        db=db,
        control_func=gimbal_control_ros,
        command=command,
        preset_index=preset_index,
    )


@router.post("/{id}/gimbal_motion_control")
def gimbal_motion_control(
    id: int,
    command: int,
    db: Session = Depends(get_db),
):
    return control_robot(
        id=id, db=db, control_func=gimbal_motion_control_ros, command=command
    )


async def generate_frames():
    while True:
        if not video_data.empty():
            frame_bytes = video_data.get()
            yield (
                b"--frame\r\n"
                b"Content-Type: image/jpeg\r\n\r\n" + frame_bytes + b"\r\n"
            )
        else:
            await asyncio.sleep(0.01)


@router.get("/{id}/video")
async def stream_video(id: int, db: Session = Depends(get_db)):
    robot = crud.get(db, id)
    if robot is None:
        raise HTTPException(status_code=404, detail="Robot not found")
    robot.name

    return StreamingResponse(
        generate_frames(),
        media_type="multipart/x-mixed-replace; boundary=frame",
    )


@router.post("/{id}/init")
def init_robot(id: int, db: Session = Depends(get_db)):
    robot = crud.get(db, id)
    if robot is None:
        raise HTTPException(status_code=404, detail="Robot not found")
    init_robot_ros(robot_name=robot.name)
    return {"message": "init success"}
