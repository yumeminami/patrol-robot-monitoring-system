from pydantic import BaseModel, validator
from typing import List, Union
from datetime import datetime


class TaskBase(BaseModel):
    type: int
    status: int
    robot_id: int
    checkpoint_ids: List[int] = []
    start_position: str = ""
    end_position: str = ""
    speed : int = 0
    sensors : List[int] = []
    vision_algorithms : List[int] = []
    execution_time: Union[str,datetime]
    interval: int = 0
    is_everyday: bool = False

    @validator("type")
    def type_must_be_in_range(cls, v):
        if v not in range(0, 2):
            raise ValueError("type must be maunal(0) or auto(1)")
        return v

    @validator("status")
    def status_must_be_in_range(cls, v):
        if v not in range(0, 4):
            raise ValueError(
                "status must be not started(0), in progress(1), paused(2), or completed(3)"
            )
        return v


class Task(TaskBase):
    id: int

    class Config:
        orm_mode = True


class TaskCreate(TaskBase):
    pass


class TaskUpdate(TaskBase):
    pass
