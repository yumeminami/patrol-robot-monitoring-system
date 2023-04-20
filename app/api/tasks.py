from fastapi import APIRouter, Depends
from fastapi.responses import JSONResponse
from app.db.database import SessionLocal
from app.schemas.tasks import TaskCreate, TaskUpdate, Task
# from app.crud import tasks as crud
from app.crud.tasks import task as crud

router = APIRouter()


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


@router.get("/", response_model=list[Task])
def read_tasks(db: SessionLocal = Depends(get_db)):
    tasks = crud.get_multi(db=db)
    return tasks


@router.get("/{task_id}", response_model=Task)
def read_task(task_id: int, db: SessionLocal = Depends(get_db)):
    db_task = crud.get(db=db, id=task_id)
    if db_task is None:
        return JSONResponse(status_code=404, content="Task not found")
    return db_task


@router.post("/", response_model=Task)
def create_tasks(task: TaskCreate, db: SessionLocal = Depends(get_db)):
    return crud.create(db=db, obj_in=task)


@router.post("/{task_id}", response_model=Task)
def update_task(
        task_id: int,
        task: TaskUpdate,
        db: SessionLocal = Depends(get_db)):
    db_task = crud.get(db=db, id=task_id)
    if db_task is None:
        return JSONResponse(status_code=404, content="Task not found")
    return crud.update(db=db, db_obj=db_task, obj_in=task)


@router.delete("/{task_id}", response_model=Task)
def delete_task(task_id: int, db: SessionLocal = Depends(get_db)):
    db_task = crud.get(db=db, id=task_id)
    if db_task is None:
        return JSONResponse(status_code=404, content="Task not found")
    return crud.remove(db=db, id=task_id)
