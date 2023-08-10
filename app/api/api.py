import os
from typing import Callable, Dict, List, Optional

from fastapi import APIRouter, Depends, HTTPException
from fastapi.background import BackgroundTasks
from fastapi.responses import FileResponse, JSONResponse
from sqlalchemy.orm import Session

from app.crud.base import CRUDBase
from app.db.database import SessionLocal
from app.utils.excel import write_excel

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
    """
    Create generic router for CRUD operations
    The router will have the following endpoints:
    - GET /: return all items
    - GET /{id}: return item with id
    - POST /: create item
    - PUT /{id}: update item with id
    - DELETE /{id}: delete item with id

    :param crud: CRUD object
    :param create_schema: Pydantic model for create
    :param update_schema: Pydantic model for update
    :param db_model: SQLAlchemy model
    :param hooks: dict of hooks to be called before/after CRUD operations

    :return: FastAPI router
    """
    router = APIRouter()

    if hooks is None:
        hooks = {}

    @router.get("", response_model=List[db_model])
    def read_items(
        background_tasks: BackgroundTasks,
        skip: int = 0,
        limit: int = 100,
        export: bool = False,
        db: Session = Depends(get_db),
        token: str = Depends(oauth2_scheme),
    ):
        """
        Read items

        :param background_tasks: BackgroundTasks
        :param skip: skip
        :param limit: limit
        :param export: a flag to export data to excel, default is False. If True, the response will be a file
        and the file will be removed after returning response.
        :param db: database session
        :param token: token

        :return: list of items


        """
        items = crud.get_multi(db=db, skip=skip, limit=limit)
        if items is None:
            return JSONResponse(status_code=404, content="Item not found")
        after_read = hooks.get("after_read")
        if after_read:
            items = [after_read(item) for item in items]

        if export:
            # check item type is db model
            try:
                items_data = []
                for item in items:
                    if isinstance(item, db_model) is False:
                        created_at = item.created_at
                        updated_at = item.updated_at
                        item = db_model.from_orm(item)
                        item.__dict__["created_at"] = created_at
                        item.__dict__["updated_at"] = updated_at

                    items_data.append(item.__dict__)

                file_name = "export.xlsx"
                write_excel(items_data, file_name)

                # remove file after returnning response
                background_tasks.add_task(remove_file, file_name)
            except Exception as e:
                raise HTTPException(status_code=400, detail=e.__str__())
            return FileResponse(
                file_name,
                media_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                filename=file_name,
            )
        return items

    @router.get("/{item_id}", response_model=db_model)
    def read_item(
        item_id: int,
        db: Session = Depends(get_db),
        token: str = Depends(oauth2_scheme),
    ):
        """
        Read item by id

        :param item_id: item id
        :param db: database session
        :param token: token

        :return: item
        """
        before_read = hooks.get("before_read")
        if before_read:
            before_read(item_id)

        db_item = crud.get(db=db, id=item_id)
        if db_item is None:
            return JSONResponse(status_code=404, content="Item not found")
        after_read = hooks.get("after_read")
        if after_read:
            return after_read(db_item)
        return db_item

    @router.post("", response_model=db_model)
    def create_item(
        item: create_schema,
        db: Session = Depends(get_db),
        token: str = Depends(oauth2_scheme),
    ):
        """
        Create item

        :param item: item
        :param db: database session
        :param token: token

        :return: created item
        """
        before_created = hooks.get("before_created")
        if before_created:
            before_created(item, db)

        try:
            created_item = crud.create(db=db, obj_in=item)
        except Exception as e:
            return HTTPException(status_code=400, detail=e.__str__())
        after_created = hooks.get("after_created")
        if after_created:
            after_created(created_item, db)

        return created_item

    @router.put("/{item_id}", response_model=db_model)
    def update_item(
        item_id: int,
        item: update_schema,
        db: Session = Depends(get_db),
        token: str = Depends(oauth2_scheme),
    ):
        """
        Update item

        :param item_id: item id
        :param item: item
        :param db: database session
        :param token: token

        :return: updated item
        """
        before_updated = hooks.get("before_update")
        if before_updated:
            before_updated(item_id, item, db)

        db_item = crud.get(db=db, id=item_id)
        if db_item is None:
            return JSONResponse(status_code=404, content="Item not found")

        try:
            updated_item = crud.update(db=db, db_obj=db_item, obj_in=item)
        except Exception as e:
            return HTTPException(status_code=400, detail=e.__str__())

        after_update = hooks.get("after_update")
        if after_update:
            after_update(item_id, updated_item, db)
        return updated_item

    @router.delete("/{item_id}", response_model=db_model)
    def delete_item(
        item_id: int,
        db: Session = Depends(get_db),
        token: str = Depends(oauth2_scheme),
    ):
        """
        Delete item

        :param item_id: item id
        :param db: database session
        :param token: token

        :return: deleted item
        """
        before_delete = hooks.get("before_delete")
        if before_delete:
            before_delete(item_id, db)

        db_item = crud.get(db=db, id=item_id)
        if db_item is None:
            return JSONResponse(status_code=404, content="Item not found")

        try:
            removed_item = crud.remove(db=db, id=item_id)
        except Exception as e:
            return HTTPException(status_code=400, detail=e.__str__())

        after_delete = hooks.get("after_delete")
        if after_delete:
            after_delete(item_id, removed_item, db)
        return removed_item

    return router
