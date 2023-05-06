from pydantic import BaseModel


class GimbalPointBase(BaseModel):
    preset_point: int = 0

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
