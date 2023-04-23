from fastapi import APIRouter, Depends
from fastapi.responses import JSONResponse
from app.db.database import SessionLocal
from app.schemas.robots import RobotCreate, RobotUpdate, Robot
from app.crud.robots import robot as crud

router = APIRouter()


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


def customize_robot_response(robot):
    robot_data = robot.__dict__
    tasks = robot.tasks.all()
    if tasks:
        # TODO Make sure that the last task is the current task
        task = tasks[-1]
        robot_data['task_id'] = task.id
        robot_data['task_status'] = task.status
    return robot_data


@router.get("/", response_model=list[Robot])
async def read_robots(db: SessionLocal = Depends(get_db)):
    robots = await crud.get_multi(db=db)

    return [customize_robot_response(robot) for robot in robots]


@router.get("/{robot_id}", response_model=Robot)
async def read_robot(robot_id: int, db: SessionLocal = Depends(get_db)):
    db_robot = await crud.get(db=db, id=robot_id)
    if db_robot is None:
        return JSONResponse(status_code=404, content="Robot not found")
    # print(db_robot.sensors)
    return customize_robot_response(db_robot)


@router.post("/", response_model=Robot)
async def create_robots(robot: RobotCreate, db: SessionLocal = Depends(get_db)):
    return await crud.create(db=db, obj_in=robot)


@router.post("/{robot_id}", response_model=Robot)
async def update_robot(
        robot_id: int,
        robot: RobotUpdate,
        db: SessionLocal = Depends(get_db)):
    db_robot = await crud.get(db=db, id=robot_id)
    if db_robot is None:
        return JSONResponse(status_code=404, content="Robot not found")
    db_robot = await crud.update(db=db, db_obj=db_robot, obj_in=robot)
    return customize_robot_response(db_robot)


@router.delete("/{robot_id}", response_model=Robot)
async def delete_robot(robot_id: int, db: SessionLocal = Depends(get_db)):
    db_robot = await crud.get(db=db, id=robot_id)
    if db_robot is None:
        return JSONResponse(status_code=404, content="Robot not found")
    db_robot = await crud.remove(db=db, id=robot_id)
    return customize_robot_response(db_robot)
