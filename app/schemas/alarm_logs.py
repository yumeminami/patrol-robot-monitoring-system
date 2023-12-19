from datetime import datetime
from enum import Enum
from typing import Optional

from pydantic import BaseModel, validator

alarm_log_type_map = {
    "temperature": "温度",
    "humidity": "湿度",
    "light": "光照",
    "PM1_0": "PM1.0",
    "PM2_5": "PM2.5",
    "PM10": "PM10",
    "smoke1": "烟雾1",
    "smoke2": "烟雾2",
}


class AlarmLogLevel(Enum):
    WARNING = 0  # all sensors alarms level default are warning
    FATAL = 1  # all vision algorithms alarms level default are fatal


class AlarmLogStatus(Enum):
    UNPROCESSED = 0
    PROCESSED = 1


class AlarmLogBase(BaseModel):
    level: int
    task_id: Optional[int] = None
    task_log_id: Optional[int] = None
    type: str
    status: int = AlarmLogStatus.UNPROCESSED.value
    location: int
    img_url: Optional[str] = None
    video_url: Optional[str] = None
    detail: Optional[str] = None

    @validator("status")
    def status_validator(cls, v):
        if v not in range(0, 2):
            raise ValueError("status must be unprocessed(0) or processed(1)")
        return v


class AlarmLogCreate(AlarmLogBase):
    pass


class AlarmLogUpdate(BaseModel):
    status: int

    @validator("status")
    def status_validator(cls, v):
        if v not in range(0, 2):
            raise ValueError("status must be unprocessed(0) or processed(1)")
        return v


class AlarmLog(AlarmLogBase):
    id: int
    time: datetime
    created_at: datetime

    class Config:
        orm_mode = True
