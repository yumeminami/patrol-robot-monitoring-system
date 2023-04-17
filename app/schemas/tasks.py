from pydantic import BaseModel

class Task(BaseModel):
    id: int
    name: str
    class Config:
        orm_mode = True


class TaskCreate(BaseModel):
    name: str

class TaskUpdate(BaseModel):
    id : int
    name: str
