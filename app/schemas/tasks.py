# from pydantic import BaseModel, Field
# from typing import List, Optional, Union, Any
# from .sensor import Sensor
# from .vision_algorithm import VisionAlgorithm
# from .checkpoint import Checkpoint
# import uuid
# from bson import ObjectId


# class PyObjectId(ObjectId):
#     @classmethod
#     def __get_validators__(cls):
#         yield cls.validate

#     @classmethod
#     def validate(cls, v):
#         if not ObjectId.is_valid(v):
#             raise ValueError("Invalid objectid")
#         return ObjectId(v)

#     @classmethod
#     def __modify_schema__(cls, field_schema):
#         field_schema.update(type="string")


# class Task(BaseModel):
#     id: PyObjectId = Field(default_factory=PyObjectId, alias="_id")
#     type: int = Field(...)
#     checkpoint: Union[List[Checkpoint], None] = Field(...)
#     start_poisition: Union[str, None] = Field(...)
#     end_position: Union[str, None] = Field(...)
#     speed: Union[int, None] = Field(...)
#     status: int = Field(...)
#     robot_id: int = Field(...)
#     sensors: List[Sensor] = Field(...)
#     vision_algorithms: List[VisionAlgorithm] = Field(...)
#     start_time: str = Field(...)
#     is_everyday: bool = Field(...)

#     class Config:
#         allow_population_by_field_name = True
#         arbitrary_types_allowed = True
#         json_encoders = {ObjectId: str}
#         schema_extra = {
#             "example": {
#                 "type": 1,
#                 "checkpoint": [
#                     {
#                         "id": 1,
#                         "position": '1',
#                         "speed": 1,
#                         "gimbalpoints": [
#                             {
#                                 "id": 1,
#                                 "takepicture": '1',
#                                 "takevideo": '1',
#                                 "recordvoice": '1'
#                             },
#                         ]
#                     },
#                     {
#                         "id": 2,
#                         "position": '2',
#                         "speed": 2,
#                         "gimbalpoints": [
#                             {
#                                 "id": 2,
#                                 "takepicture": '2',
#                                 "takevideo": '2',
#                                 "recordvoice": '2'
#                             },
#                         ]
#                     }
#                 ],
#                 "start_poisition": "",
#                 "end_position": "",
#                 "speed": 0,
#                 "status": 1,
#                 "robot_id": 1,
#                 "sensors": [
#                     {
#                         "name": '1',
#                         "low_threshold": 1,
#                         "upper_threshold": 1
#                     },
#                     {
#                         "name": '2',
#                         "low_threshold": 2,
#                         "upper_threshold": 2
#                     }
#                 ],
#                 "vision_algorithms": [
#                     {
#                         "name": '1',
#                         "sensitivity": 1
#                     },
#                     {
#                         "name": '2',
#                         "sensitivity": 2
#                     }
#                 ],
#                 "start_time": '2021-01-01 00:00:00',
#                 "is_everyday": True
#             }
#         }

from pydantic import BaseModel


class Task(BaseModel):
    id: int
    type: int
    status: int
    robot_id: int

    class Config:
        orm_mode = True


class TaskCreate(BaseModel):
    type: int
    status: int
    robot_id: int


class TaskUpdate(BaseModel):
    type: int
    status: int
    robot_id: int
