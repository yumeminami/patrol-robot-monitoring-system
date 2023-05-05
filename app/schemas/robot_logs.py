from pydantic import BaseModel
from typing import Optional


class RobotLogBase(BaseModel):
    robot_id: Optional[int] = None
    total_distance: int = 0
    total_task_executed: int = 0
    total_alarm_raised: int = 0


class RobotLogCreate(RobotLogBase):
    pass


class RobotLogUpdate(RobotLogBase):
    pass


class RobotLog(RobotLogBase):
    id: int

    class Config:
        orm_mode = True
