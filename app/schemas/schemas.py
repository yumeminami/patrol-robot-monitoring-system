from pydantic import BaseModel
from typing import List, Optional, Union


class Task(BaseModel):
    id: int
    type: int
    status: int
    robot_id: int

    class Config:
        orm_mode = True


class TaskCreate(BaseModel):
    type: int
    status: int
    robot_id: int


class TaskUpdate(BaseModel):
    type: int
    status: int
    robot_id: int


class Robot(BaseModel):
    id: int
    name: str
    battery: int
    task: List[Task] = []

    class Config:
        orm_mode = True


class RobotCreate(BaseModel):
    name: str
    battery: int = 100


class RobotUpdate(BaseModel):
    name: str
    battery: int
