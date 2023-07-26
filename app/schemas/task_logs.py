from datetime import datetime
from typing import Optional

from pydantic import BaseModel


class TaskLogBase(BaseModel):
    task_id: Optional[int] = None
    robot_id: Optional[int] = None
    execution_time: Optional[str] = None
    type: int


class TaskLogCreate(TaskLogBase):
    pass


class TaskLogUpdate(BaseModel):
    task_id: Optional[int] = None
    robot_id: Optional[int] = None
    execution_time: Optional[str] = None
    type: int = 0


class TaskLog(TaskLogBase):
    id: int
    created_at: datetime
    updated_at: datetime

    class Config:
        orm_mode = True
