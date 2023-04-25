from pydantic import BaseModel
from typing import List


class ItemBase(BaseModel):
    title: str
    description: str | None = None


class ItemCreate(ItemBase):
    owner_id: int


class Item(ItemBase):
    id: int
    owner_id: int

    class Config:
        orm_mode = True


class UserBase(BaseModel):
    email: str


class UserCreate(UserBase):
    password: str


class User(UserBase):
    id: int
    is_active: bool
    items: list[Item] = []

    class Config:
        orm_mode = True


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
