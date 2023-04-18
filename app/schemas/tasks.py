from pydantic import BaseModel


class Task(BaseModel):
    id: int
    name: str
    robot: str
    status: int
    start_time: str

    class Config:
        orm_mode = True


class TaskCreate(BaseModel):
    name: str
    robot: str
    status: int
    start_time: str


class TaskUpdate(BaseModel):
    name: str
    robot: str
    status: int
    start_time: str
