from app.api.api import create_generic_router, remove_file
from app.crud.patrol_images import patrol_image as crud
from app.schemas.patrol_images import (
    PatrolImage,
    PatrolImageCreate,
    PatrolImageUpdate,
)


def after_delete(id, patrol_image, db):
    remove_file("app/" + patrol_image.image_url)


patrol_images_hooks = {
    "after_delete": after_delete,
}

router = create_generic_router(
    crud,
    PatrolImageCreate,
    PatrolImageUpdate,
    PatrolImage,
    hooks=patrol_images_hooks,
)
