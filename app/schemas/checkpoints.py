from pydantic import BaseModel


class CheckPointBase(BaseModel):
    name: str
    position: int = 0
    speed: int = 0

    class Config:
        orm_mode = True


class CheckPointCreate(CheckPointBase):
    pass


class CheckPointUpdate(CheckPointBase):
    pass


class CheckPoint(CheckPointBase):
    id: int

    class Config:
        orm_mode = True
