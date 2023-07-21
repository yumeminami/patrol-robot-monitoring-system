from app.api.api import create_generic_router
from app.crud.patrol_images import patrol_image as crud
from app.schemas.patrol_images import (
    PatrolImage,
    PatrolImageCreate,
    PatrolImageUpdate,
)

router = create_generic_router(
    crud, PatrolImageCreate, PatrolImageUpdate, PatrolImage
)
