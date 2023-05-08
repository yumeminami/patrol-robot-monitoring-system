from pydantic import BaseModel, validator
from typing import Optional
from datetime import datetime
from enum import Enum


class AlarmLogLevel(Enum):
    WARNING = 0
    FATAL = 1


class AlarmLogStatus(Enum):
    UNPROCESSED = 0
    PROCESSED = 1


class AlarmLogType(Enum):
    DEVICE = 0
    TEMPERATURE = 1
    HUMIDITY = 2


class AlarmLogBase(BaseModel):
    level: int
    task_id: Optional[int] = None
    type: int
    status: int
    location: int
    img_url: Optional[str] = None
    video_url: Optional[str] = None

    @validator("status")
    def status_validator(cls, v):
        if v not in range(0, 2):
            raise ValueError("status must be unprocessed(0) or processed(1)")
        return v


class AlarmLogCreate(AlarmLogBase):
    pass


class AlarmLogUpdate(BaseModel):
    status: int


class AlarmLog(AlarmLogBase):
    id: int
    time: datetime

    class Config:
        orm_mode = True
