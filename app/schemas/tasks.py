from pydantic import BaseModel, validator
from typing import List
from datetime import datetime
from .checkpoints import CheckPoint
from .sensors import Sensor
from .vision_algorithms import VisionAlgorithm


class TaskBase(BaseModel):
    type: int
    status: int
    robot_id: int
    checkpoint_ids: List[CheckPoint] = []
    start_position: str = ""
    end_position: str = ""
    speed: int = 0
    sensors: List[Sensor] = []
    vision_algorithms: List[VisionAlgorithm] = []
    execution_time: List[datetime]
    is_everyday: bool = False

    @validator("type")
    def type_must_be_in_range(cls, v):
        if v not in range(0, 2):
            raise ValueError("type must be maunal(0) or auto(1)")
        return v

    @validator("status")
    def status_must_be_in_range(cls, v):
        if v not in range(0, 4):
            raise ValueError(
                "status must be not started(0), in progress(1), paused(2), or completed(3)"
            )
        return v

    @validator("sensors")
    def sensors_must_belong_to_robot(cls, v, values):
        if v:
            for sensor in v:
                if sensor.robot_id != values["robot_id"]:
                    raise ValueError(
                        "sensor must belong to the robot that the task belongs to"
                    )
        return v


class Task(TaskBase):
    id: int

    class Config:
        orm_mode = True


class TaskCreate(TaskBase):
    pass


class TaskUpdate(TaskBase):
    pass
