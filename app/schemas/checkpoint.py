from pydantic import BaseModel
from .gimbalpoint import GimbalPoint
from typing import List


class Checkpoint(BaseModel):
    id: int
    position: str
    speed: int
    gimbalpoints: List[GimbalPoint]
