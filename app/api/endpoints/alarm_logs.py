from app.api.api import create_generic_router
from app.crud.alarm_logs import alarm_log as crud
from app.schemas.alarm_logs import AlarmLog, AlarmLogCreate, AlarmLogUpdate

router = create_generic_router(crud, AlarmLogCreate, AlarmLogUpdate, AlarmLog)
