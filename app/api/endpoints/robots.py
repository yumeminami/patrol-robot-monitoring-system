import asyncio
from multiprocessing import Process

import cv2
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
from app.services.ros_service import latest_img_queue
from app.services.ros_service import position_control as position_control_ros
from app.services.ros_service import stop_control as stop_control_ros
from app.services.ros_service import take_picture as take_picture_ros
from app.services.ros_service import velocity_control as velocity_control_ros
from app.services.ros_service import video_streamer

video_processes = {}


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


robot_hooks = {
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
        raise HTTPException(status_code=400, detail="Velocity control failed")


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
        raise HTTPException(status_code=400, detail="Position control failed")


# stop control
@router.post("/{id}/stop_control")
def stop_control(id: int, db: Session = Depends(get_db), stop_type: int = 0):
    robot = crud.get(db, id)
    if robot is None:
        raise HTTPException(status_code=404, detail="Robot not found")

    if stop_control_ros(robot_name=robot.name, stop_type=stop_type):
        return {"message": "Stop control success"}
    else:
        raise HTTPException(status_code=400, detail="Stop control failed")


# take photo
@router.get("/{id}/photo")
def take_photo(
    background_tasks: BackgroundTasks, id: int, db: Session = Depends(get_db)
):
    robot = crud.get(db, id)
    if robot is None:
        raise HTTPException(status_code=404, detail="Robot not found")

    file_name = take_picture_ros(robot_name=robot.name)
    if file_name:
        file_name = "app/images/" + file_name
        background_tasks.add_task(remove_file, file_name)
        return FileResponse(file_name)
    else:
        raise HTTPException(status_code=400, detail="Take photo failed")


# camera control
@router.post("/{id}/camera_control")
def camera_control(
    id: int, db: Session = Depends(get_db), camera_command: int = 0
):
    robot = crud.get(db, id)
    if robot is None:
        raise HTTPException(status_code=404, detail="Robot not found")

    if camera_control_ros(
        robot_name=robot.name, camera_command=camera_command
    ):
        return {"message": "Camera control success"}
    else:
        raise HTTPException(status_code=400, detail="Camera control failed")


async def generate_frames():
    while True:
        if not latest_img_queue.empty():
            img = latest_img_queue.get()
            resized_img = cv2.resize(img, (640, 480))
            _, img_encoded = cv2.imencode(
                ".jpg", resized_img, [cv2.IMWRITE_JPEG_QUALITY, 80]
            )
            frame_bytes = img_encoded.tobytes()
            yield (
                b"--frame\r\n"
                b"Content-Type: image/jpeg\r\n\r\n" + frame_bytes + b"\r\n"
            )
        else:
            await asyncio.sleep(0.1)


@router.get("/{id}/video")
async def stream_video(id: int, db: Session = Depends(get_db)):
    robot = crud.get(db, id)
    if robot is None:
        raise HTTPException(status_code=404, detail="Robot not found")
    robot_name = robot.name

    if robot_name not in video_processes:
        video_process = Process(target=video_streamer, args=(robot_name,))
        video_process.start()
        video_processes[robot_name] = video_process

    return StreamingResponse(
        generate_frames(),
        media_type="multipart/x-mixed-replace; boundary=frame",
    )


@router.post("/{id}/gimbal_control")
def gimbal_control(
    id: int,
    command: int,
    preset_index: int,
    db: Session = Depends(get_db),
):
    robot = crud.get(db, id)
    if robot is None:
        raise HTTPException(status_code=404, detail="Robot not found")
    robot_name = robot.name

    if gimbal_control_ros(
        robot_name=robot_name, command=command, preset_index=preset_index
    ):
        return {"message": "Gimbal control success"}
    else:
        raise HTTPException(status_code=400, detail="Gimbal control failed")


@router.post("/{id}/gimbal_motion_control")
def gimbal_motion_control(
    id: int,
    command: int,
    db: Session = Depends(get_db),
):
    robot = crud.get(db, id)
    if robot is None:
        raise HTTPException(status_code=404, detail="Robot not found")
    robot_name = robot.name

    if gimbal_motion_control_ros(robot_name=robot_name, command=command):
        return {"message": "Gimbal motion control success"}
    else:
        raise HTTPException(
            status_code=400, detail="Gimbal motion control failed"
        )
