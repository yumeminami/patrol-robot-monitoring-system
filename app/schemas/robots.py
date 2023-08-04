from enum import Enum
from typing import List

from pydantic import BaseModel

from .sensors import Sensor


class RobotBatteryStatus(Enum):
    CHARGING = 0
    NOCHARGE = 1


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
    sensors: List[Sensor] = []

    class Config:
        orm_mode = True


class RobotCreate(BaseModel):
    name: str


class RobotUpdate(BaseModel):
    name: str = ""
    status: int = RobotStatus.OFFLINE.value
    velocity: float = 0.0
    position: float = 0.0
    battery: int = 100
    battery_status: int = RobotBatteryStatus.NOCHARGE.value
