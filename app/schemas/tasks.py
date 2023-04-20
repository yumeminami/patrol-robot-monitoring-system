from pydantic import BaseModel, validator, ValidationError
from typing import List, Optional, Union


class TaskBase(BaseModel):
    type: int
    status: int
    robot_id: int

    @validator('type')
    def type_must_be_in_range(cls, v):
        if v not in range(0, 2):
            raise ValueError('type must be maunal(0) or auto(1)')
        return v

    @validator('status')
    def status_must_be_in_range(cls, v):
        if v not in range(0, 4):
            raise ValueError(
                'status must be not started(0), in progress(1), paused(2), or completed(3)')
        return v


class Task(TaskBase):
    id: int

    class Config:
        orm_mode = True


class TaskCreate(TaskBase):
    pass


class TaskUpdate(TaskBase):
    pass
