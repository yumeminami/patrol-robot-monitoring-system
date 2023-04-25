from pydantic import BaseModel


class VisionAlgorithmBase(BaseModel):
    name: str


class VisionAlgorithmCreate(VisionAlgorithmBase):
    pass


class VisionAlgorithmUpdate(VisionAlgorithmBase):
    pass


class VisionAlgorithm(VisionAlgorithmBase):
    id: int

    class Config:
        orm_mode = True
