from pydantic import BaseModel
from typing import Optional


class SensorBase(BaseModel):
    name: str
    value: float = 0.0
    robot_id: int
    upper_limit: Optional[float]
    lower_limit: Optional[float]


class SensorCreate(SensorBase):
    pass


class SensorUpdate(SensorBase):
    pass


class Sensor(SensorBase):
    id: int

    class Config:
        orm_mode = True
