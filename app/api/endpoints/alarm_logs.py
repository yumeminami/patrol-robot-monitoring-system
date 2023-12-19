from app.api.api import create_generic_router
from app.crud.alarm_logs import alarm_log as crud
from app.schemas.alarm_logs import AlarmLog, AlarmLogUpdate, alarm_log_type_map


def after_reads(alarm_logs):
    for alarm_log in alarm_logs:
        alarm_log.type = alarm_log_type_map.get(alarm_log.type, alarm_log.type)
    return alarm_logs[::-1]


hooks = {"after_reads": after_reads}

router = create_generic_router(
    crud=crud,
    create_schema=None,
    update_schema=AlarmLogUpdate,
    db_model=AlarmLog,
    hooks=hooks,
)
