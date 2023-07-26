from typing import List

from sqlalchemy.orm import Session

from app.crud.base import CRUDBase
from app.models.models import Task
from app.schemas.tasks import TaskCreate, TaskUpdate


class CRUDTask(CRUDBase[Task, TaskCreate, TaskUpdate]):
    def get_multi_by_name(
        self, db: Session, *, name: str, skip: int = 0, limit: int = 100
    ) -> List[Task]:
        return (
            db.query(self.model)
            .filter(Task.name == name)
            .offset(skip)
            .limit(limit)
            .all()
        )

    def get_all(
        self,
        db: Session,
    ) -> List[Task]:
        return db.query(self.model).all()


task = CRUDTask(Task)
