from pydantic import BaseModel


class PatrolImage(BaseModel):
    image_url: str
    task_id: int
    uuid: str

    class Config:
        orm_mode = True


class PatrolImageCreate(BaseModel):
    image_url: str
    task_id: int
    uuid: str


class PatrolImageUpdate(BaseModel):
    image_url: str
    task_id: int
    uuid: str
