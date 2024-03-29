from enum import Enum
from typing import List

from pydantic import BaseModel, root_validator, validator

from .sensors import SensorForTask


class TaskType(Enum):
    AUTO = 0
    MANUAL = 1


class TimeType(Enum):
    DAY = 0
    WEEK = 1
    MONTH = 2
    QUATER = 3
    YEAR = 4


class TaskStatus(Enum):
    IN_PROGRESS = 1
    PENDING = 2
    STOPPED = 3


class TaskBase(BaseModel):
    name: str = ""
    type: int = TaskType.AUTO.value
    status: int = TaskStatus.PENDING.value
    robot_id: int = 0
    checkpoint_ids: List[int] = []
    start_position: float = 0
    end_position: float = 0
    velocity: float = 0
    gimbal_point: int = 0
    sensors: List[SensorForTask] = []
    vision_algorithms: List[int] = []
    execution_times: List[str] = []
    execution_frequency: str = ""


class Task(TaskBase):
    id: int

    class Config:
        orm_mode = True


class TaskCreate(TaskBase):
    @root_validator(pre=True)
    def type_validator(cls, values):
        type = values.get("type")
        velocity = values.get("velocity")
        gimbal_point = values.get("gimbal_point")
        checkpoint_ids = values.get("checkpoint_ids")

        if type not in [TaskType.AUTO.value, TaskType.MANUAL.value]:
            raise ValueError("type must be auto or manual")

        if type == TaskType.AUTO.value:
            if velocity == 0:
                raise ValueError("velocity must be provided when type is auto")
            if gimbal_point == 0:
                raise ValueError("gimbal_point must be provided when type is auto")
            if checkpoint_ids:
                raise ValueError("auto type task could not contain checkpoints")
        elif type == TaskType.MANUAL.value:
            if not checkpoint_ids:
                raise ValueError("checkpoint_ids must be provided when type is manual")

        return values

    @validator("status")
    def status_validator(cls, v):
        if v not in [
            TaskStatus.IN_PROGRESS.value,
            TaskStatus.PENDING.value,
            TaskStatus.STOPPED.value,
        ]:
            raise ValueError("status must be in progress, pending or stopped")
        return v

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

    @validator("execution_times")
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
                                "execution_time must be a valid time like 24:00"
                            )
                    elif len(time) == 3:
                        raise ValueError(
                            "execution_time must be a valid time like 24:00"
                        )
                except Exception:
                    raise ValueError("execution_time must be a valid time like 24:00")
        else:
            raise ValueError("execution_time must be provided")
        return v

    @validator("execution_frequency", pre=True, always=True)
    def validate_execution_frequency(cls, v):
        parts = v.split(" ")

        if len(parts) != 2:
            raise ValueError(
                "execution_frequency should be in the format '[type] [interval]'"
            )

        interval, time_type = parts
        if time_type not in TimeType._member_names_:
            raise ValueError(
                f"Invalid time type: {time_type}. Allowed values are: {', '.join(TimeType._member_names_)}"
            )

        if not interval.isdigit():
            raise ValueError(
                f"Invalid interval: {interval}. It should be a positive integer."
            )

        return v


class TaskUpdate(TaskBase):
    pass
