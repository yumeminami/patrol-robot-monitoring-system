from pydantic import BaseModel


class VisionAlgorithmBase(BaseModel):
    name: str = ""
    sensitivity: float = 0.5


class VisionAlgorithmCreate(VisionAlgorithmBase):
    pass


class VisionAlgorithmUpdate(VisionAlgorithmBase):
    pass


class VisionAlgorithm(VisionAlgorithmBase):
    id: int

    class Config:
        orm_mode = True
