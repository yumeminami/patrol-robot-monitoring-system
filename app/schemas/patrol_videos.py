from datetime import datetime

from pydantic import BaseModel


class PatrolVideoBase(BaseModel):
    video_url: str
    uuid: str
    task_id: int
    task_log_id: int
    start_position: float = 0
    end_position: float = 0
    velocity: float = 0
    alarm: bool = False


class PatrolVideoCreate(PatrolVideoBase):
    pass


class PatrolVideoUpdate(PatrolVideoBase):
    pass


class PatrolVideo(PatrolVideoBase):
    id: int
    created_at: datetime

    class Config:
        orm_mode = True
