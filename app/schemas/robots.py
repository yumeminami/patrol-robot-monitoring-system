from pydantic import BaseModel

class Robot(BaseModel):
    id: int
    name: str
    class Config:
        orm_mode = True


class RobotCreate(BaseModel):
    name: str

class RobotUpdate(BaseModel):
    id : int
    name: str
