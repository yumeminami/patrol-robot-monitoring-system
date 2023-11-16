from urllib.parse import urlparse
from app.api.api import create_generic_router, remove_file
from app.crud.patrol_images import patrol_image as crud
from app.schemas.patrol_images import (
    PatrolImage,
    PatrolImageUpdate,
)


def after_delete(id, patrol_image, db):
    try:
        parsed_url = urlparse(patrol_image.image_url)
        remove_file("app" + parsed_url.path)
    except FileNotFoundError:
        pass


patrol_images_hooks = {
    "after_delete": after_delete,
}

router = create_generic_router(
    crud=crud,
    create_schema=None,
    update_schema=PatrolImageUpdate,
    db_model=PatrolImage,
    hooks=patrol_images_hooks,
)
