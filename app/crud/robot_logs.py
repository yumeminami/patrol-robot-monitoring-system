
from app.crud.base import CRUDBase
from app.models.models import RobotLog
from app.schemas.robot_logs import RobotLogCreate, RobotLogUpdate


class CRUDRobotLog(CRUDBase[RobotLog, RobotLogCreate, RobotLogUpdate]):
    pass


robot_log = CRUDRobotLog(RobotLog)
