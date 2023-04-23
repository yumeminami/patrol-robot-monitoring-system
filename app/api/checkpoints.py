from fastapi import APIRouter, Depends
from fastapi.responses import JSONResponse
from app.db.database import SessionLocal
from app.schemas.checkpoints import CheckPoint, CheckPointCreate, CheckPointUpdate
from app.crud.checkpoints import checkpoint as crud

router = APIRouter()


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


@router.get("/", response_model=list[CheckPoint])
async def read_checkpoints(db: SessionLocal = Depends(get_db)):
    checkpoints = await crud.get_multi(db=db)
    return checkpoints


@router.get("/{checkpoint_id}", response_model=CheckPoint)
async def read_checkpoint(checkpoint_id: int, db: SessionLocal = Depends(get_db)):
    db_checkpoint = await crud.get(db=db, id=checkpoint_id)
    if db_checkpoint is None:
        return JSONResponse(status_code=404, content="Checkpoint not found")
    return db_checkpoint


@router.post("/", response_model=CheckPoint)
async def create_checkpoints(checkpoint: CheckPointCreate, db: SessionLocal = Depends(get_db)):
    return await crud.create(db=db, obj_in=checkpoint)


@router.post("/{checkpoint_id}", response_model=CheckPoint)
async def update_checkpoint(
        checkpoint_id: int,
        checkpoint: CheckPointUpdate,
        db: SessionLocal = Depends(get_db)):
    db_checkpoint = await crud.get(db=db, id=checkpoint_id)
    if db_checkpoint is None:
        return JSONResponse(status_code=404, content="Checkpoint not found")
    return await crud.update(db=db, db_obj=db_checkpoint, obj_in=checkpoint)


@router.delete("/{checkpoint_id}", response_model=CheckPoint)
async def delete_checkpoint(checkpoint_id: int, db: SessionLocal = Depends(get_db)):
    db_checkpoint = await crud.get(db=db, id=checkpoint_id)
    if db_checkpoint is None:
        return JSONResponse(status_code=404, content="Checkpoint not found")
    return await crud.remove(db=db, id=checkpoint_id)
