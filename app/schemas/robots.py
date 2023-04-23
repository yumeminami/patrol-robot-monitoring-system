from pydantic import BaseModel
from typing import List, Optional, Union
from .sensors import Sensor


class Robot(BaseModel):
    id: int
    name: str
    battery: int = 100
    status: int = 0
    speed: int = 0
    position: int = 0
    task_id: int = 0
    task_status: int = 0
    sensors: List[Sensor] = []

    class Config:
        orm_mode = True


class RobotCreate(BaseModel):
    name: str


class RobotUpdate(BaseModel):
    name: str
    status: int
    speed: int
    position: int
