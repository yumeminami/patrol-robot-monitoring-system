import os

from fastapi import APIRouter, HTTPException

from app.utils.utils import position_to_time
from app.settings import config

router = APIRouter()


@router.get("/")
def get_panorama_video():
    for file_name in os.listdir(config.PANORAMA_VIDEO_DIR):
        if file_name.startswith("panorama_video") and file_name.endswith(
            ".mp4"
        ):
            return {"video_name": file_name}
    raise HTTPException(status_code=404, detail="Video not found")


@router.get("/video_time")
def get_panorama_video_time(position: int):
    time = position_to_time(position)
    if time:
        return {"time": time}
    else:
        raise HTTPException(status_code=404, detail="Position not found")
