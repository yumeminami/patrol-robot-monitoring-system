from app.api.api import create_generic_router
from app.crud.gimbalpoints import gimbal_point as crud
from app.schemas.gimbalpoints import (
    GimbalPoint,
)

router = create_generic_router(
    crud=crud, create_schema=None, update_schema=None, db_model=GimbalPoint
)
