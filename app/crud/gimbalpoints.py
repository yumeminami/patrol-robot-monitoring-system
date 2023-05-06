from app.crud.base import CRUDBase
from app.models.models import GimbalPoint
from app.schemas.gimbalpoints import GimbalPointCreate,GimbalPointUpdate


class CRUDRobotLog(CRUDBase[GimbalPoint, GimbalPointCreate, GimbalPointUpdate]):
    pass


gimbal_point = CRUDRobotLog(GimbalPoint)