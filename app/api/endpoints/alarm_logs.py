from app.api.api import create_generic_router
from app.crud.alarm_logs import alarm_log as crud
from app.schemas.alarm_logs import AlarmLog, AlarmLogUpdate


def after_read(alarm_logs):
    return alarm_logs[::-1]


hooks = {"after_read": after_read}

router = create_generic_router(
    crud=crud,
    create_schema=None,
    update_schema=AlarmLogUpdate,
    db_model=AlarmLog,
    hooks=hooks,
)
