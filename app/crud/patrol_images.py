from datetime import datetime, timedelta
from typing import List

from sqlalchemy.orm import Session
from sqlalchemy.sql import text


from app.crud.base import CRUDBase
from app.models.models import PatrolImage
from app.schemas.patrol_images import PatrolImageCreate, PatrolImageUpdate


class CRUDPatrolImage(CRUDBase[PatrolImage, PatrolImageCreate, PatrolImageUpdate]):
    def get_by_task_id(self, db: Session, *, task_id: int) -> PatrolImage:
        return db.query(self.model).filter(PatrolImage.task_id == task_id).first()

    def get_by_checkpoint_id(self, db: Session, *, checkpoint_id: int) -> PatrolImage:
        return (
            db.query(self.model)
            .filter(PatrolImage.checkpoint_id == checkpoint_id)
            .first()
        )

    def get_by_task_log_id(self, db: Session, *, task_log_id: int) -> List[PatrolImage]:
        return db.query(self.model).filter(PatrolImage.task_log_id == task_log_id).all()

    def get_before_created_at(self, db: Session, *, day: int) -> List[PatrolImage]:
        interval = datetime.now() - timedelta(days=day)
        return (
            db.query(self.model)
            .filter(PatrolImage.created_at < interval)
            .filter(PatrolImage.alarm == False)
            .all()
        )


patrol_image = CRUDPatrolImage(PatrolImage)
