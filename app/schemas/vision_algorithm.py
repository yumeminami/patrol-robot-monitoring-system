from pydantic import BaseModel


class VisionAlgorithm(BaseModel):
    name: str
    sensitivity: int
