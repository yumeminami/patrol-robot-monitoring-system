from typing import List

from sqlalchemy.orm import Session

from app.crud.base import CRUDBase
from app.models.models import CheckPoint
from app.schemas.checkpoints import CheckPointCreate, CheckPointUpdate


class CRUDCheckPoint(CRUDBase[CheckPoint, CheckPointCreate, CheckPointUpdate]):
    def get_multi_by_name(
        self, db: Session, *, name: str, skip: int = 0, limit: int = 100
    ) -> List[CheckPoint]:
        return (
            db.query(self.model)
            .filter(CheckPoint.name == name)
            .offset(skip)
            .limit(limit)
            .all()
        )


checkpoint = CRUDCheckPoint(CheckPoint)
