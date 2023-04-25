from app.api.api import create_generic_router

from app.schemas.task_logs import TaskLog, TaskLogCreate, TaskLogUpdate
from app.crud.task_logs import task_log as crud

router = create_generic_router(crud, TaskLogCreate, TaskLogUpdate, TaskLog)
