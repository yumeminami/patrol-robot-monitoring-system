from pydantic import BaseModel


class Robot(BaseModel):
    id: int
    name: str
    battery: str
    task: str

    class Config:
        orm_mode = True


class RobotCreate(BaseModel):
    name: str
    battery: str
    task: str


class RobotUpdate(BaseModel):
    name: str
    battery: str
    task: str
