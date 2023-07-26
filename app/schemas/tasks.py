from enum import Enum
from typing import List

from pydantic import BaseModel, root_validator, validator

from .sensors import SensorForTask


class TaskType(Enum):
    AUTO = 0
    MANUAL = 1


class TaskBase(BaseModel):
    type: int
    robot_id: int
    checkpoint_ids: List[int] = []
    start_position: float = 0
    end_position: float = 0
    velocity: float = 0
    sensors: List[SensorForTask] = []
    vision_algorithms: List[int] = []
    execution_time: List[str]

    @root_validator(pre=True)
    def type_validator(cls, values):
        type = values.get("type")
        start_position = values.get("start_position")
        end_position = values.get("end_position")
        velocity = values.get("velocity")
        checkpoint_ids = values.get("checkpoint_ids")

        if type not in range(0, 2):
            raise ValueError("type must be auto(0) or maunal(1)")

        if type == TaskType.AUTO.value:
            if not start_position or not end_position:
                raise ValueError(
                    "start_position and end_position must be provided when type is auto"
                )
            if start_position < 0 or end_position < 0:
                raise ValueError(
                    "start_position and end_position could not smaller than 0"
                )
            if start_position >= end_position:
                raise ValueError(
                    "start_position must be smaller than end_position"
                )
            if velocity == 0:
                raise ValueError("velocity must be provided when type is auto")
            if checkpoint_ids:
                raise ValueError(
                    "auto type task could not contain checkpoints"
                )
        elif type == TaskType.MANUAL.value:
            if not checkpoint_ids:
                raise ValueError(
                    "checkpoint_ids must be provided when type is manual"
                )

        return values

    @validator("sensors")
    def sensors_validator(cls, v, values):
        if v:
            for sensor in v:
                if values["robot_id"]:
                    if sensor.robot_id != values["robot_id"]:
                        raise ValueError(
                            "sensor must belong to the robot that the task belongs to"
                        )
        return v

    @validator("execution_time")
    def execution_time_validator(cls, v):
        if v:
            for time in v:
                try:
                    time = time.split(":")
                    if len(time) == 2:
                        if int(time[0]) not in range(0, 24) or int(
                            time[1]
                        ) not in range(0, 60):
                            raise ValueError(
                                "execution_time must be a valid time"
                            )
                    elif len(time) == 3:
                        if (
                            int(time[0]) not in range(0, 24)
                            or int(time[1]) not in range(0, 60)
                            or int(time[2]) not in range(0, 60)
                        ):
                            raise ValueError(
                                "execution_time must be a valid time"
                            )
                        time = time[0] + ":" + time[1] + ":" + time[2]
                    else:
                        raise ValueError("execution_time must be a valid time")
                except:
                    raise ValueError("execution_time must be a valid time")
        else:
            raise ValueError("execution_time must be provided")
        return v


class Task(TaskBase):
    id: int

    class Config:
        orm_mode = True


class TaskCreate(TaskBase):
    pass


class TaskUpdate(BaseModel):
    pass
