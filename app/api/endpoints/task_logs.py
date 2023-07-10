from app.api.api import create_generic_router
from app.crud.task_logs import task_log as crud
from app.schemas.task_logs import TaskLog, TaskLogCreate, TaskLogUpdate

router = create_generic_router(crud, TaskLogCreate, TaskLogUpdate, TaskLog)
