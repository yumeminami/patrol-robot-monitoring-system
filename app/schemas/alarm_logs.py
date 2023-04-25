from pydantic import BaseModel
from typing import Optional
from datetime import datetime


class AlarmLogBase(BaseModel):
    level: int
    task_id: int
    type: int
    status: int
    location: int
    img_url: Optional[str] = None
    video_url: Optional[str] = None


class AlarmLogCreate(AlarmLogBase):
    pass


class AlarmLogUpdate(BaseModel):
    status: int


class AlarmLog(AlarmLogBase):
    id: int
    time: datetime

    class Config:
        orm_mode = True
