from pydantic import BaseModel


class GimbalPointBase(BaseModel):
    robot_id: int
    preset_index: int = 0
    pan: float = 0.0
    tilt: float = 0.0
    zoom: float = 0.0

    class Config:
        orm_mode = True


class GimbalPointCreate(GimbalPointBase):
    pass


class GimbalPointUpdate(GimbalPointBase):
    pass


class GimbalPoint(GimbalPointBase):
    id: int

    class Config:
        orm_mode = True
