from pydantic import BaseModel


class SensorBase(BaseModel):
    name: str
    value: str = ""
    robot_id: int


class SensorCreate(SensorBase):
    pass


class SensorUpdate(SensorBase):
    pass


class Sensor(SensorBase):
    id: int

    class Config:
        orm_mode = True
