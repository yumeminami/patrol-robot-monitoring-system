from sqlalchemy.orm import Session

from app.crud.base import CRUDBase
from app.models.models import PatrolVideo
from app.schemas.patrol_videos import PatrolVideoCreate, PatrolVideoUpdate


class CRUDPatrolVideo(CRUDBase[PatrolVideo, PatrolVideoCreate, PatrolVideoUpdate]):
    def get_by_task_id(self, db: Session, *, task_id: int) -> PatrolVideo:
        return db.query(self.model).filter(PatrolVideo.task_id == task_id).first()

    def get_by_uuid(self, db: Session, *, uuid: str) -> PatrolVideo:
        return db.query(self.model).filter(PatrolVideo.uuid == uuid).first()


patrol_video = CRUDPatrolVideo(PatrolVideo)
