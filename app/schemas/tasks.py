from pydantic import BaseModel, validator
from typing import List
from datetime import time
from .sensors import SensorForTask
from .vision_algorithms import VisionAlgorithmForTask
from enum import Enum


class TaskType(Enum):
    AUTO = 0
    MANUAL = 1


class TaskStatus(Enum):
    NOT_STARTED = 0
    IN_PROGRESS = 1
    PENDING = 2
    COMPLETED = 3


class TaskBase(BaseModel):
    type: int
    status: int
    robot_id: int
    checkpoint_ids: List[int] = []
    start_position: str = ""
    end_position: str = ""
    speed: int = 0
    sensors: List[SensorForTask] = []
    vision_algorithms: List[VisionAlgorithmForTask] = []
    execution_time: List[str]
    is_everyday: bool = False

    @validator("type")
    def type_validator(cls, v):
        if v not in range(0, 2):
            raise ValueError("type must be auto(0) or maunal(1)")
        return v

    @validator("status")
    def status_validator(cls, v):
        if v not in range(0, 4):
            raise ValueError(
                "status must be not started(0), in progress(1), pending(2) or completed(3)"
            )
        return v

    @validator("sensors")
    def sensors_validator(cls, v, values):
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
