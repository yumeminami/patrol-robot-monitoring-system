import os

from fastapi import File, UploadFile
from fastapi.responses import JSONResponse

from app.api.api import create_generic_router, remove_file
from app.crud.patrol_videos import patrol_video as crud
from app.db.database import SessionLocal
from app.schemas.patrol_videos import (
    PatrolVideo,
    PatrolVideoCreate,
    PatrolVideoUpdate,
)
from app.settings import config


def after_delete(id, patrol_video, db):
    remove_file("app/" + patrol_video.video_url)


patrol_videos_hooks = {
    "after_delete": after_delete,
}

router = create_generic_router(
    crud=crud,
    create_schema=None,
    update_schema=PatrolVideoUpdate,
    db_model=PatrolVideo,
    hooks=patrol_videos_hooks,
)


@router.post("/{video_id}/{algorithm}/{sensitivity}")
async def accept_detected_video(
    video_id: str,
    algorithm: str,
    video_file: UploadFile = File(...),
):
    try:
        deteced_video_data = await video_file.read()

        detected_video_file_path = (
            f"{config.VIDEO_DIR}/{video_id}_{algorithm}.avi"
        )

        with open(detected_video_file_path, "wb") as f:
            f.write(deteced_video_data)

        db = SessionLocal()
        patrol_video = crud.get_by_uuid(db, uuid=video_id)
        if patrol_video:
            patrol_video_detected = PatrolVideoCreate(
                video_url=os.path.relpath(detected_video_file_path, "app"),
                task_id=patrol_video.task_id,
                uuid=video_id,
                start_position=patrol_video.start_position,
                end_position=patrol_video.end_position,
                velocity=patrol_video.velocity,
            )

            crud.create(db, obj_in=patrol_video_detected)

        return JSONResponse(content={"message": "OK"})

    except Exception as e:
        return JSONResponse(content={"message": str(e)}, status_code=500)
