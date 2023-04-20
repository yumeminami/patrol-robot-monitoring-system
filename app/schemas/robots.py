from pydantic import BaseModel
from .tasks import Task
from typing import List, Optional, Union


class Robot(BaseModel):
    id: int
    name: str
    battery: int = 100
    status: int = 0
    speed: int = 0
    position: int = 0
    tasks: List[Task] = []

    class Config:
        orm_mode = True


class RobotCreate(BaseModel):
    name: str


class RobotUpdate(BaseModel):
    name: str
    status: int
    speed: int
    position: int
