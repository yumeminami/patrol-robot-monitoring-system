from pydantic import BaseModel

class Checkpoint(BaseModel):
    id: int
    position: str
    speed : int