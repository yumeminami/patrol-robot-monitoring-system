from app.schemas.checkpoints import CheckPoint, CheckPointCreate, CheckPointUpdate
from app.crud.checkpoints import checkpoint as crud
from app.api.api import create_generic_router

router = create_generic_router(
    crud,
    CheckPointCreate,
    CheckPointUpdate,
    CheckPoint)
