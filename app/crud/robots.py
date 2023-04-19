from sqlalchemy.orm import Session
from typing import List

from app.crud.base import CRUDBase
from app.models.models import Robot
from app.schemas.schemas import RobotCreate, RobotUpdate


# class CRUDRobot(CRUDBase[Robot, RobotCreate, RobotUpdate]):
#     def get_multi_by_name(
#         self, db: Session, *, name: str, skip: int = 0, limit: int = 100
#     ) -> List[Robot]:
#         return (
#             db.query(self.model)
#             .filter(Robot.name == name)
#             .offset(skip)
#             .limit(limit)
#             .all()
#         )


# robot = CRUDRobot(Robot)

def get_robots(db: Session, skip: int = 0, limit: int = 100):
    return db.query(Robot).offset(skip).limit(limit).all()


def create_robot(db: Session, robot: RobotCreate):
    db_robot = Robot(**robot.dict())
    db.add(db_robot)
    db.commit()
    db.refresh(db_robot)
    return db_robot


def update_robot(db: Session, robot: RobotUpdate, robot_id: int):
    db_robot = db.query(Robot).filter(Robot.id == robot_id).first()
    for key, value in robot.dict().items():
        setattr(db_robot, key, value)
    db.commit()
    db.refresh(db_robot)
    return db_robot


def delete_robot(db: Session, robot_id: int):
    db_robot = db.query(Robot).filter(Robot.id == robot_id).first()
    db.delete(db_robot)
    db.commit()
    return db_robot
