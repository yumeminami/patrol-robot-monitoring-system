from pydantic import BaseModel
from typing import Optional


class SensorBase(BaseModel):
    name: str
    value: float = 0.0
    unit: str
    robot_id: int


class SensorCreate(SensorBase):
    pass


class SensorUpdate(SensorBase):
    pass


class Sensor(SensorBase):
    id: int

    class Config:
        orm_mode = True


class SensorForTask(Sensor):
    upper_limit: Optional[float]
    lower_limit: Optional[float]
