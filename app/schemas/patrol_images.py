from datetime import datetime

from pydantic import BaseModel


class PatrolImageBase(BaseModel):
    image_url: str
    task_id: int
    task_log_id: int
    checkpoint_id: int
    position: float
    uuid: str
    alarm: bool


class PatrolImageCreate(PatrolImageBase):
    pass


class PatrolImageUpdate(PatrolImageBase):
    pass


class PatrolImage(PatrolImageBase):
    id: int
    created_at: datetime

    class Config:
        orm_mode = True
