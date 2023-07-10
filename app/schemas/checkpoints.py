from typing import List

from pydantic import BaseModel


class CheckPointBase(BaseModel):
    name: str
    position: int = 0
    velocity: int = 0
    gimbal_points: List[int] = []

    class Config:
        orm_mode = True


class CheckPointCreate(CheckPointBase):
    pass


class CheckPointUpdate(BaseModel):
    name: str = ""
    position: int = 0
    velocity: int = 0
    gimbal_points: List[int] = []


class CheckPoint(CheckPointBase):
    id: int

    class Config:
        orm_mode = True
