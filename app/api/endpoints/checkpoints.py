from app.api.api import create_generic_router
from app.crud.checkpoints import checkpoint as crud
from app.schemas.checkpoints import (
    CheckPoint,
    CheckPointCreate,
    CheckPointUpdate,
)

router = create_generic_router(
    crud, CheckPointCreate, CheckPointUpdate, CheckPoint
)
