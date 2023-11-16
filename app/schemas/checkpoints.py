from typing import List

from pydantic import BaseModel


class CheckPointBase(BaseModel):
    name: str = ""
    robot_id: int = 1
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
