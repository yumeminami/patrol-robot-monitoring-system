from app.schemas.alarm_logs import AlarmLogCreate, AlarmLogUpdate, AlarmLog
from app.crud.alarm_logs import alarm_log as crud
from app.api.api import create_generic_router

router = create_generic_router(crud, AlarmLogCreate, AlarmLogUpdate, AlarmLog)
