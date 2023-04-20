from sqlalchemy.orm import Session
from typing import List

from app.crud.base import CRUDBase
from app.models.models import Robot
from app.schemas.robots import RobotCreate, RobotUpdate


class CRUDRobot(CRUDBase[Robot, RobotCreate, RobotUpdate]):
    def get_multi_by_name(
        self, db: Session, *, name: str, skip: int = 0, limit: int = 100
    ) -> List[Robot]:
        return (
            db.query(self.model)
            .filter(Robot.name == name)
            .offset(skip)
            .limit(limit)
            .all()
        )


robot = CRUDRobot(Robot)
