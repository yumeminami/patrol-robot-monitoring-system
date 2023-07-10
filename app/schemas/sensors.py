from typing import Optional

from pydantic import BaseModel


class SensorBase(BaseModel):
    name: str
    value: float = 0.0
    unit: str = ""
    robot_id: int


class SensorCreate(SensorBase):
    pass


class SensorUpdate(BaseModel):
    name: str = ""
    value: float = 0.0
    unit: str = ""
    robot_id: int = 0


class Sensor(SensorBase):
    id: int

    class Config:
        orm_mode = True


class SensorForTask(Sensor):
    upper_limit: Optional[float]
    lower_limit: Optional[float]
