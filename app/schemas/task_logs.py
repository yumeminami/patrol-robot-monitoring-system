from pydantic import BaseModel
from datetime import datetime


class TaskLogBase(BaseModel):
    task_id: int
    robot_id: int
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
