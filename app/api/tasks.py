from fastapi import APIRouter, Depends
from fastapi.responses import JSONResponse
from ..db.database import SessionLocal, engine
from app.crud import tasks as crud_task
from app.schemas.tasks import TaskCreate, TaskUpdate, Task
from sqlalchemy.orm import Session
from app.models import tasks
from fastapi.encoders import jsonable_encoder

tasks.Base.metadata.create_all(bind=engine)

router = APIRouter()


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


@router.get("/{id}", response_model=Task)
def get_task(id: int, db: Session = Depends(get_db)):
    tasks = crud_task.task.get(db, id=id)
    if not tasks:
        return JSONResponse(
            content={
                "message": "No tasks found"},
            status_code=404)
    return tasks

@router.get("/", response_model=list[Task])
def get_tasks(db: Session = Depends(get_db)):
    tasks = crud_task.task.get_multi(db=db)
    if not tasks:
        return JSONResponse(
            content={
                "message": "No tasks found"},
            status_code=404)
    tasks = jsonable_encoder(tasks)
    return tasks

@router.post("/", response_model=Task)
def create_task(task: TaskCreate, db: Session = Depends(get_db)):
    task = crud_task.task.create(db=db, obj_in=task)
    return task


@router.post("/{id}", response_model=Task)
def update_task(
        id: int,
        task_update: TaskUpdate,
        db: Session = Depends(get_db)):
    task = crud_task.task.get(db=db, id=id)
    if not task:
        return JSONResponse(
            content={
                "message": "No task found"},
            status_code=404)
    task = crud_task.task.update(db=db, db_obj=task, obj_in=task_update)
    return task


@router.delete("/{id}", response_model=Task)
def delete_task(id: int, db: Session = Depends(get_db)):
    task = crud_task.task.get(db=db, id=id)
    if not task:
        return JSONResponse(
            content={
                "message": "No task found"},
            status_code=404)
    task = crud_task.task.remove(db=db, id=id)
    return task
