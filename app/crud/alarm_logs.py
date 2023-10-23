from app.crud.base import CRUDBase
from app.models.models import AlarmLog
from app.schemas.alarm_logs import AlarmLogCreate, AlarmLogUpdate


class CRUDAlarmLog(CRUDBase[AlarmLog, AlarmLogCreate, AlarmLogUpdate]):
    def get_alarm_logs_by_task_log_id_and_type(self, db, task_log_id, type):
        return (
            db.query(self.model)
            .filter(AlarmLog.task_log_id == task_log_id)
            .filter(AlarmLog.type == type)
            .all()
        )


alarm_log = CRUDAlarmLog(AlarmLog)
