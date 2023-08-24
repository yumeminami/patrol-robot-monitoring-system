from enum import Enum

from pydantic import BaseModel


class VisionAlgorithmType(Enum):
    IMAGE_DETECTION = 0
    VIDEO_DETECTION = 1
    VOICE_DETECTION = 2


class VisionAlgorithmBase(BaseModel):
    name: str = ""
    type: int = VisionAlgorithmType.IMAGE_DETECTION.value
    sensitivity: float = 0.5


class VisionAlgorithmCreate(VisionAlgorithmBase):
    pass


class VisionAlgorithmUpdate(VisionAlgorithmBase):
    pass


class VisionAlgorithm(VisionAlgorithmBase):
    id: int

    class Config:
        orm_mode = True
