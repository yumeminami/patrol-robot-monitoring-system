from fastapi import APIRouter, Depends
from fastapi.responses import JSONResponse
from app.db.database import SessionLocal, engine
from app.models.models import Base
from app.schemas.schemas import RobotCreate, RobotUpdate, Robot
from app.crud import robots as crud

Base.metadata.create_all(bind=engine)
router = APIRouter()


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


@router.get("/", response_model=list[Robot])
def read_robots(
        skip: int = 0,
        limit: int = 100,
        db: SessionLocal = Depends(get_db)):
    robots = crud.get_robots(db, skip=skip, limit=limit)
    return robots


@router.post("/", response_model=Robot)
def create_robots(robot: RobotCreate, db: SessionLocal = Depends(get_db)):
    return crud.create_robot(db=db, robot=robot)
