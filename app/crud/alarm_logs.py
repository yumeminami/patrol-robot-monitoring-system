

from app.crud.base import CRUDBase
from app.models.models import AlarmLog
from app.schemas.alarm_logs import AlarmLogCreate, AlarmLogUpdate


class CRUDAlarmLog(CRUDBase[AlarmLog, AlarmLogCreate, AlarmLogUpdate]):
    pass


alarm_log = CRUDAlarmLog(AlarmLog)
