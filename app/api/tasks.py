from fastapi import APIRouter, Depends
from fastapi.responses import JSONResponse
from app.db.database import SessionLocal, engine
from app.models.models import Base
from app.schemas.schemas import TaskCreate, TaskUpdate, Task
from app.crud import tasks as crud

Base.metadata.create_all(bind=engine)
router = APIRouter()


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


@router.get("/", response_model=list[Task])
def read_tasks(
        skip: int = 0,
        limit: int = 100,
        db: SessionLocal = Depends(get_db)):
    tasks = crud.get_tasks(db, skip=skip, limit=limit)
    return tasks


@router.post("/", response_model=Task)
def create_tasks(task: TaskCreate, db: SessionLocal = Depends(get_db)):
    return crud.create_task(db=db, task=task)


@router.get("/{task_id}", response_model=Task)
def read_task(task_id: int, db: SessionLocal = Depends(get_db)):
    db_task = crud.get_task(db, task_id=task_id)
    if db_task is None:
        raise HTTPException(status_code=404, detail="Task not found")
    return db_task


@router.delete("/{task_id}", response_model=Task)
def delete_task(task_id: int, db: SessionLocal = Depends(get_db)):
    db_task = crud.get_task(db, task_id=task_id)
    if db_task is None:
        raise HTTPException(status_code=404, detail="Task not found")
    return crud.delete_task(db=db, task_id=task_id)
