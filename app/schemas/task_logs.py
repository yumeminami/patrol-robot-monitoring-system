from pydantic import BaseModel
from datetime import datetime
from typing import Optional


class TaskLogBase(BaseModel):
    task_id: Optional[int] = None
    robot_id: Optional[int] = None
    type: int


class TaskLogCreate(TaskLogBase):
    pass


class TaskLogUpdate(TaskLogBase):
    pass


class TaskLog(TaskLogBase):
    id: int
    created_at: datetime
    updated_at: datetime

    class Config:
        orm_mode = True
