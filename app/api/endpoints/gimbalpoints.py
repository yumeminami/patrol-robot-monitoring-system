from app.api.api import create_generic_router

from app.crud.gimbalpoints import gimbal_point as crud
from app.schemas.gimbalpoints import GimbalPoint,GimbalPointCreate,GimbalPointUpdate

router = create_generic_router(crud, GimbalPointCreate, GimbalPointUpdate, GimbalPoint)