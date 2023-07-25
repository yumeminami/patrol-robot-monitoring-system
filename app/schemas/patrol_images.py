from pydantic import BaseModel


class PatrolImageBase(BaseModel):
    image_url: str
    task_id: int
    checkpoint_id: int
    uuid: str


class PatrolImageCreate(PatrolImageBase):
    pass


class PatrolImageUpdate(PatrolImageBase):
    pass


class PatrolImage(PatrolImageBase):
    id: int

    class Config:
        orm_mode = True
