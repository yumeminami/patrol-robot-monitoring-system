from app.crud.base import CRUDBase
from app.models.models import GimbalPoint
from app.schemas.gimbalpoints import GimbalPointCreate, GimbalPointUpdate


class CRUDRobotLog(
    CRUDBase[GimbalPoint, GimbalPointCreate, GimbalPointUpdate]
):
    def get_by_preset_index(self, db, *, preset_index: int):
        return (
            db.query(GimbalPoint)
            .filter(GimbalPoint.preset_index == preset_index)
            .first()
        )


gimbal_point = CRUDRobotLog(GimbalPoint)
