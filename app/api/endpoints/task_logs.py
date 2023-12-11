from app.api.api import create_generic_router
from app.crud.task_logs import task_log as crud
from app.schemas.task_logs import TaskLog, TaskLogUpdate


def after_read(task_logs):
    return task_logs[::-1]


hooks = {"after_read": after_read}

router = create_generic_router(
    crud=crud,
    create_schema=None,
    update_schema=TaskLogUpdate,
    db_model=TaskLog,
    hooks=hooks,
)
