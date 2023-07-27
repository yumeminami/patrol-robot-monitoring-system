from app.crud.base import CRUDBase
from app.models.models import TaskLog
from app.schemas.task_logs import TaskLogCreate, TaskLogUpdate
from sqlalchemy.orm import Session


class CRUDTaskLog(CRUDBase[TaskLog, TaskLogCreate, TaskLogUpdate]):
    def get_the_latest_task_log(self, db: Session, *, task_id: int) -> TaskLog:
        return (
            db.query(self.model)
            .filter(TaskLog.task_id == task_id)
            .order_by(TaskLog.execution_date.desc())
            .first()
        )


task_log = CRUDTaskLog(TaskLog)
