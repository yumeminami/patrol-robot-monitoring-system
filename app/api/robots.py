from fastapi import APIRouter, Depends
from fastapi.responses import JSONResponse
from app.db.database import SessionLocal, engine
from app.crud.robots import robot as crud_robot
from app.schemas.robots import RobotCreate, RobotUpdate, Robot
from sqlalchemy.orm import Session
from app.models import robots
from fastapi.encoders import jsonable_encoder

robots.Base.metadata.create_all(bind=engine)

router = APIRouter()


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


@router.get("/", response_model=list[Robot])
def get_robots(db: Session = Depends(get_db)):
    robots = crud_robot.get_multi(db=db)
    if not robots:
        return JSONResponse(
            content={
                "message": "No robots found"},
            status_code=404)
    robots = jsonable_encoder(robots)
    return robots


@router.get("/{robot_id}", response_model=Robot)
def get_robot(robot_id: int, db: Session = Depends(get_db)):
    robot = crud_robot.get(db=db, id=robot_id)
    if not robot:
        return JSONResponse(
            content={
                "message": "No robot found"},
            status_code=404)
    robot = jsonable_encoder(robot)
    return robot


@router.post("/", response_model=Robot)
def create_robot(robot: RobotCreate, db: Session = Depends(get_db)):
    robot = crud_robot.create(db=db, obj_in=robot)
    return robot


@router.post("/{robot_id}", response_model=Robot)
def update_robot(
        robot_id: int,
        robot_update: RobotUpdate,
        db: Session = Depends(get_db)):
    robot = crud_robot.get(db=db, id=robot_id)
    if not robot:
        return JSONResponse(
            content={
                "message": "No robot found"},
            status_code=404)
    robot = crud_robot.update(db=db, db_obj=robot, obj_in=robot_update)
    return robot


@router.delete("/{robot_id}", response_model=Robot)
def delete_robot(robot_id: int, db: Session = Depends(get_db)):
    robot = crud_robot.get(db=db, id=robot_id)
    if not robot:
        return JSONResponse(
            content={
                "message": "No robot found"},
            status_code=404)
    robot = crud_robot.remove(db=db, id=robot_id)
    return robot
