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


@router.get("/{id}", response_model=list[Task])
def get_task(id: int, db: Session = Depends(get_db)):
    tasks = crud_task.task.get(db, id=id)
    tasks = jsonable_encoder(tasks)
    return JSONResponse(content=tasks, status_code=200)


@router.post("/", response_model=Task)
def create_task(task: TaskCreate, db: Session = Depends(get_db)):
    return crud_task.task.create(db=db, obj_in=task)


@router.post("/{id}", response_model=Task)
def update_task(id: int, task: TaskUpdate, db: Session = Depends(get_db)):
    return crud_task.task.update(
        db=db, db_obj=crud_task.task.get(
            db=db, id=id), obj_in=task)


@router.delete("/{id}", response_model=Task)
def delete_task(id: int, db: Session = Depends(get_db)):
    return crud_task.task.remove(db=db, id=id)
