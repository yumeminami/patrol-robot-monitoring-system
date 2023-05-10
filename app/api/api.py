from fastapi import APIRouter, Depends
from fastapi.responses import JSONResponse, FileResponse
from sqlalchemy.orm import Session
import pandas as pd
from app.crud.base import CRUDBase
from app.db.database import SessionLocal
from starlette.background import BackgroundTasks
import os

from typing import Callable, Optional, Dict

from .deps import oauth2_scheme


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


def remove_file(path: str) -> None:
    os.remove(path)


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

    @router.get("", response_model=list[db_model])
    async def read_items(
        background_tasks: BackgroundTasks,
        skip: int = 0,
        limit: int = 100,
        export: bool = False,
        db: Session = Depends(get_db),
        token: str = Depends(oauth2_scheme),
    ):
        before_read = hooks.get("before_read")
        if before_read:
            items = [before_read(item) for item in items]

        items = await crud.get_multi(db=db, skip=skip, limit=limit)
        if items is None:
            return JSONResponse(status_code=404, content="Item not found")
        after_read = hooks.get("after_read")
        if after_read:
            items = [after_read(item) for item in items]

        if export:
            # check item type is db model 
            items_data = []
            for item in items:
                if isinstance(item, db_model) == False:
                    item = db_model.from_orm(item)
                items_data.append(item.__dict__)
            
            # convert to pandas dataframe
            df = pd.DataFrame(items_data)

            file_name = "export.xlsx"
            df.to_excel(file_name, index=False, engine="openpyxl")

            # remove file after returnning response
            background_tasks.add_task(remove_file, file_name)
            return FileResponse(
                file_name,
                media_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                filename=file_name,
            )
        return items

    @router.get("/{item_id}", response_model=db_model)
    async def read_item(
        item_id: int,
        db: Session = Depends(get_db),
        token: str = Depends(oauth2_scheme),
    ):
        before_read = hooks.get("before_read")
        if before_read:
            before_read(item_id)

        db_item = await crud.get(db=db, id=item_id)
        if db_item is None:
            return JSONResponse(status_code=404, content="Item not found")
        after_read = hooks.get("after_read")
        if after_read:
            return after_read(db_item)
        return db_item

    @router.post("", response_model=db_model)
    async def create_item(
        item: create_schema,
        db: Session = Depends(get_db),
        token: str = Depends(oauth2_scheme),
    ):
        before_created = hooks.get("before_created")
        if before_created:
            await before_created(item, db)

        try:
            created_item = await crud.create(db=db, obj_in=item)
        except Exception as e:
            return JSONResponse(status_code=400, content=e.__str__())
        after_created = hooks.get("after_created")
        if after_created:
            await after_created(created_item, db)

        return created_item

    @router.put("/{item_id}", response_model=db_model)
    async def update_item(
        item_id: int,
        item: update_schema,
        db: Session = Depends(get_db),
        token: str = Depends(oauth2_scheme),
    ):
        before_updated = hooks.get("before_update")
        if before_updated:
            await before_updated(item_id, item, db)

        db_item = await crud.get(db=db, id=item_id)
        if db_item is None:
            return JSONResponse(status_code=404, content="Item not found")

        try:
            updated_item = await crud.update(
                db=db, db_obj=db_item, obj_in=item
            )
        except Exception as e:
            return JSONResponse(status_code=400, content=e.__str__())

        after_update = hooks.get("after_update")
        if after_update:
            await after_update(item_id, updated_item, db)
        return updated_item

    @router.delete("/{item_id}", response_model=db_model)
    async def delete_item(
        item_id: int,
        db: Session = Depends(get_db),
        token: str = Depends(oauth2_scheme),
    ):
        before_delete = hooks.get("before_delete")
        if before_delete:
            await before_delete(item_id, db)

        db_item = await crud.get(db=db, id=item_id)
        if db_item is None:
            return JSONResponse(status_code=404, content="Item not found")

        try:
            removed_item = await crud.remove(db=db, id=item_id)
        except Exception as e:
            return JSONResponse(status_code=400, content=e.__str__())

        after_delete = hooks.get("after_delete")
        if after_delete:
            await after_delete(item_id, removed_item, db)
        return removed_item

    return router
