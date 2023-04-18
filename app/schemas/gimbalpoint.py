from pydantic import BaseModel, Field


class GimbalPoint(BaseModel):
    id: int = Field(...)
    takepicture: str = Field(...)
    takevideo: str = Field(...)
    recordvoice: str = Field(...)
