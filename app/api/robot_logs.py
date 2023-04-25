from app.api.api import create_generic_router

from app.crud.robot_logs import robot_log as crud
from app.schemas.robot_logs import RobotLogCreate, RobotLogUpdate, RobotLog

router = create_generic_router(crud, RobotLogCreate, RobotLogUpdate, RobotLog)
