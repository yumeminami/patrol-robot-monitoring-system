from datetime import datetime
from enum import Enum
from typing import Optional

from pydantic import BaseModel


class TaskLogStatus(Enum):
    FINISHED = 0
    IN_PROGRESS = 1
    FAILED = 2


class TaskLogBase(BaseModel):
    task_id: Optional[int] = None
    robot_id: Optional[int] = None
    execution_date: Optional[str] = None
    type: int
    status: int = TaskLogStatus.IN_PROGRESS.value
    detail: Optional[str] = None


class TaskLogCreate(TaskLogBase):
    pass


class TaskLogUpdate(BaseModel):
    task_id: Optional[int] = None
    robot_id: Optional[int] = None
    execution_date: Optional[str] = None
    type: int = 0
    status: int = TaskLogStatus.IN_PROGRESS.value
    detail: Optional[str] = None


class TaskLog(TaskLogBase):
    id: int
    patrol_images: list = []
    patrol_videos: list = []
    created_at: datetime
    updated_at: datetime

    class Config:
        orm_mode = True
