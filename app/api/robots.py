from fastapi import APIRouter, Depends
from fastapi.responses import JSONResponse
from app.db.database import SessionLocal, engine
from app.models.models import Base
from app.schemas.schemas import RobotCreate, RobotUpdate, Robot
# from app.crud import robots as crud
from app.crud.robots import robot as crud

Base.metadata.create_all(bind=engine)
router = APIRouter()


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


@router.get("/", response_model=list[Robot])
def read_robots(db: SessionLocal = Depends(get_db)):
    robots = crud.get_multi(db=db)
    return robots


@router.get("/{robot_id}", response_model=Robot)
def read_robot(robot_id: int, db: SessionLocal = Depends(get_db)):
    db_robot = crud.get(db=db, id=robot_id)
    if db_robot is None:
        return JSONResponse(status_code=404, content="Robot not found")
    return db_robot


@router.post("/", response_model=Robot)
def create_robots(robot: RobotCreate, db: SessionLocal = Depends(get_db)):
    return crud.create(db=db, obj_in=robot)


@router.post("/{robot_id}", response_model=Robot)
def update_robot(
        robot_id: int,
        robot: RobotUpdate,
        db: SessionLocal = Depends(get_db)):
    db_robot = crud.get(db=db, id=robot_id)
    if db_robot is None:
        return JSONResponse(status_code=404, content="Robot not found")
    return crud.update(db=db, db_obj=db_robot, obj_in=robot)


@router.delete("/{robot_id}", response_model=Robot)
def delete_robot(robot_id: int, db: SessionLocal = Depends(get_db)):
    db_robot = crud.get(db=db, id=robot_id)
    if db_robot is None:
        return JSONResponse(status_code=404, content="Robot not found")
    return crud.remove(db=db, id=robot_id)
