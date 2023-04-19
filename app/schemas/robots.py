from pydantic import BaseModel
from .tasks import Task
from typing import List, Optional, Union


class Robot(BaseModel):
    id: int
    name: str
    battery: int
    task: List[Task] = []

    class Config:
        orm_mode = True


class RobotCreate(BaseModel):
    name: str
    battery: int = 100


class RobotUpdate(BaseModel):
    name: str
    battery: int
