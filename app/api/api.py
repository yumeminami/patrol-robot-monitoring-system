from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session

from app.crud.base import CRUDBase
from app.db.database import SessionLocal

from typing import Callable, Optional


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

def create_generic_router(
    crud: CRUDBase,
    create_schema,
    update_schema,
    db_model,
    custom_read: Optional[Callable] = None,
        custom_read_multi: Optional[Callable] = None,
):
    router = APIRouter()

    @router.get("/", response_model=list[db_model])
    async def read_items(db: Session = Depends(get_db)):
        items = await crud.get_multi(db=db)
        if custom_read_multi:
            return [custom_read_multi(item) for item in items]
        return items

    @router.get("/{item_id}", response_model=db_model)
    async def read_item(item_id: int, db: Session = Depends(get_db)):
        db_item = await crud.get(db=db, id=item_id)
        if db_item is None:
            return JSONResponse(status_code=404, content="Item not found")
        if custom_read:
            return custom_read(db_item)
        return db_items

    @router.post("/", response_model=db_model)
    async def create_item(item: create_schema, db: Session = Depends(get_db)):
        return await crud.create(db=db, obj_in=item)

    @router.put("/{item_id}", response_model=db_model)
    async def update_item(item_id: int, item: update_schema, db: Session = Depends(get_db)):
        db_item = await crud.get(db=db, id=item_id)
        if db_item is None:
            return JSONResponse(status_code=404, content="Item not found")
        return await crud.update(db=db, db_obj=db_item, obj_in=item)

    @router.delete("/{item_id}", response_model=db_model)
    async def delete_item(item_id: int, db: Session = Depends(get_db)):
        db_item = await crud.get(db=db, id=item_id)
        if db_item is None:
            return JSONResponse(status_code=404, content="Item not found")
        return await crud.remove(db=db, id=item_id)

    return router
