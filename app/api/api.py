from fastapi import APIRouter, Depends
from fastapi.responses import JSONResponse
from sqlalchemy.orm import Session

from app.crud.base import CRUDBase
from app.db.database import SessionLocal

from typing import Callable, Optional, Dict

from .deps import oauth2_scheme


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
    hooks: Optional[Dict[str, Callable]] = None,
):
    router = APIRouter()

    if hooks is None:
        hooks = {}

    @router.get("/", response_model=list[db_model])
    async def read_items(
        db: Session = Depends(get_db), token: str = Depends(oauth2_scheme)
    ):
        items = await crud.get_multi(db=db)
        on_read = hooks.get("on_read")
        if on_read:
            return [on_read(item) for item in items]
        return items

    @router.get("/{item_id}", response_model=db_model)
    async def read_item(
        item_id: int,
        db: Session = Depends(get_db),
        token: str = Depends(oauth2_scheme),
    ):
        db_item = await crud.get(db=db, id=item_id)
        if db_item is None:
            return JSONResponse(status_code=404, content="Item not found")
        on_read = hooks.get("on_read")
        if on_read:
            return on_read(db_item)
        return db_item

    @router.post("/", response_model=db_model)
    async def create_item(
        item: create_schema,
        db: Session = Depends(get_db),
        token: str = Depends(oauth2_scheme),
    ):
        created_item = await crud.create(db=db, obj_in=item)

        on_create = hooks.get("on_create")
        if on_create:
            await on_create(created_item)

        return created_item

    @router.put("/{item_id}", response_model=db_model)
    async def update_item(
        item_id: int,
        item: update_schema,
        db: Session = Depends(get_db),
        token: str = Depends(oauth2_scheme),
    ):
        db_item = await crud.get(db=db, id=item_id)
        if db_item is None:
            return JSONResponse(status_code=404, content="Item not found")

        updated_item = await crud.update(db=db, db_obj=db_item, obj_in=item)

        on_update = hooks.get("on_update")
        if on_update:
            await on_update(item_id, updated_item)
        return updated_item

    @router.delete("/{item_id}", response_model=db_model)
    async def delete_item(
        item_id: int,
        db: Session = Depends(get_db),
        token: str = Depends(oauth2_scheme),
    ):
        db_item = await crud.get(db=db, id=item_id)
        if db_item is None:
            return JSONResponse(status_code=404, content="Item not found")
        removed_item = await crud.remove(db=db, id=item_id)

        on_delete = hooks.get("on_delete")
        if on_delete:
            await on_delete(item_id, removed_item)
        return removed_item

    return router
