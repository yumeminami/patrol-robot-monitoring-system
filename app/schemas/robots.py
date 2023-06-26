from pydantic import BaseModel
from typing import List
from .sensors import Sensor
from enum import Enum


class RobotBatteryStatus(Enum):
    NOCHARGE = 0
    CHARGING = 1


class RobotStatus(Enum):
    ONLINE = 0
    OFFLINE = 1


class Robot(BaseModel):
    id: int
    name: str
    battery: int = 100
    battery_status: int = RobotBatteryStatus.NOCHARGE.value
    status: int = RobotStatus.OFFLINE.value
    velocity: float = 0.0
    position: float = 0.0
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
    battery: int
    battery_status: int
