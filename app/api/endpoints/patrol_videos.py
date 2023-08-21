from app.api.api import create_generic_router, remove_file
from app.crud.patrol_videos import patrol_video as crud
from app.schemas.patrol_videos import (
    PatrolVideo,
    PatrolVideoCreate,
    PatrolVideoUpdate,
)


def after_delete(id, patrol_video, db):
    remove_file("app/" + patrol_video.video_url)


patrol_videos_hooks = {
    "after_delete": after_delete,
}

router = create_generic_router(
    crud,
    PatrolVideo,
    PatrolVideoCreate,
    PatrolVideoUpdate,
    hooks=patrol_videos_hooks,
)
