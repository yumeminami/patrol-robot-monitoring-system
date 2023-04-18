from pydantic import BaseModel


class Sensor(BaseModel):
    name: str
    low_threshold: float
    upper_threshold: float
