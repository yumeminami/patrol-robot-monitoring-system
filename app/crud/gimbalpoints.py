from sqlalchemy.orm import Session
from app.crud.base import CRUDBase
from app.models.models import GimbalPoint
from app.schemas.gimbalpoints import GimbalPointCreate, GimbalPointUpdate


class CRUDRobotLog(
    CRUDBase[GimbalPoint, GimbalPointCreate, GimbalPointUpdate]
):
    def get_by_preset_index(
        self, db: Session, *, preset_index: int
    ) -> GimbalPoint:
        return (
            db.query(GimbalPoint)
            .filter(GimbalPoint.preset_index == preset_index)
            .first()
        )

    def remove_by_preset_index(
        self, db: Session, *, preset_index: int
    ) -> None:
        db.query(GimbalPoint).filter_by(preset_index=preset_index).delete()
        db.commit()


gimbal_point = CRUDRobotLog(GimbalPoint)
