from sqlalchemy.orm import Session

from app.crud.base import CRUDBase
from app.models.models import TaskLog
from app.schemas.task_logs import TaskLogCreate, TaskLogUpdate


class CRUDTaskLog(CRUDBase[TaskLog, TaskLogCreate, TaskLogUpdate]):
    pass


task_log = CRUDTaskLog(TaskLog)
