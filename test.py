from app.services.task_service import create_task_xml
from app.db.database import SessionLocal
from app.schemas.tasks import TaskCreate
import asyncio


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


task_create = {
    "type": 1,
    "status": 0,
    "robot_id": 1,
    "checkpoint_ids": [2],
    "start_position": "",
    "end_position": "",
    "speed": 0,
    "sensors": [
        {
            "name": "temperature",
            "value": 0,
            "robot_id": 1,
            "upper_limit": 0,
            "lower_limit": 0,
            "id": 1,
        }
    ],
    "vision_algorithms": [{"name": "test", "sensitivity": 0, "id": 1}],
    "execution_time": ["10:00:00"],
    "is_everyday": False,
}

task_create = TaskCreate(**task_create)

# create_task_xml(task_create=task_create,db=SessionLocal())

# async def get_task():
#     task = await crud.get_multi(db=SessionLocal(),skip=0,limit=10)
#     print(task)
asyncio.run(create_task_xml(task_create, SessionLocal()))
