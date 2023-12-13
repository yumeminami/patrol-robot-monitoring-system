from app.api.api import create_generic_router
from app.db.database import SessionLocal
from app.crud.task_logs import task_log as crud
from app.schemas.task_logs import TaskLog, TaskLogUpdate
from app.crud.patrol_videos import patrol_video as crud_patrol_video
from app.crud.patrol_images import patrol_image as crud_patrol_image
from app.schemas.patrol_videos import PatrolVideo
from app.schemas.patrol_images import PatrolImage


def after_read(task_log):
    task_log = TaskLog.from_orm(task_log)
    patrol_videos = [
        PatrolVideo.from_orm(patrol_video).video_url
        for patrol_video in crud_patrol_video.get_by_task_log_id(
            db=SessionLocal(), task_log_id=task_log.id
        )
    ]
    patrol_images = [
        PatrolImage.from_orm(patrol_image).image_url
        for patrol_image in crud_patrol_image.get_by_task_log_id(
            db=SessionLocal(), task_log_id=task_log.id
        )
    ]
    task_log.patrol_images = patrol_images
    task_log.patrol_videos = patrol_videos

    return task_log


def after_reads(task_logs):
    return task_logs[::-1]


hooks = {"after_reads": after_reads, "after_read": after_read}

router = create_generic_router(
    crud=crud,
    create_schema=None,
    update_schema=TaskLogUpdate,
    db_model=TaskLog,
    hooks=hooks,
)
