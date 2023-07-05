from pydantic import BaseModel
from typing import List


class CheckPointBase(BaseModel):
    name: str
    position: int = 0
    velocity: int = 0
    gimbal_points: List[int] = []

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
