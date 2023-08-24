from app.api.api import create_generic_router
from app.crud.alarm_logs import alarm_log as crud
from app.schemas.alarm_logs import AlarmLog, AlarmLogUpdate

router = create_generic_router(
    crud=crud,
    create_schema=None,
    update_schema=AlarmLogUpdate,
    db_model=AlarmLog,
    db_model=AlarmLog,
)
