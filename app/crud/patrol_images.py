from sqlalchemy.orm import Session

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


patrol_image = CRUDPatrolImage(PatrolImage)
