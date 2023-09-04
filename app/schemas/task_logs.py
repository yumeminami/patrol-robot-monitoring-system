from datetime import datetime
from enum import Enum
from typing import Optional

from pydantic import BaseModel


class TaskLogStatus(Enum):
    FINISHED = 0
    STOPPED = 1


class TaskLogBase(BaseModel):
    task_id: Optional[int] = None
    robot_id: Optional[int] = None
    execution_date: Optional[str] = None
    type: int
    status: int = TaskLogStatus.FINISHED.value


class TaskLogCreate(TaskLogBase):
    pass


class TaskLogUpdate(BaseModel):
    task_id: Optional[int] = None
    robot_id: Optional[int] = None
    execution_date: Optional[str] = None
    type: int = 0
    status: int = TaskLogStatus.FINISHED.value


class TaskLog(TaskLogBase):
    id: int
    created_at: datetime
    updated_at: datetime

    class Config:
        orm_mode = True
