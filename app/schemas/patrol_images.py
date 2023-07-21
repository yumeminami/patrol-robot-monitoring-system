from pydantic import BaseModel


class PatrolImage(BaseModel):
    id: int
    image_url: str
    task_id: int
    uuid: str

    class Config:
        orm_mode = True


class PatrolImageCreate(PatrolImage):
    pass


class PatrolImageUpdate(PatrolImage):
    pass
