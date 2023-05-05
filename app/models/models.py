from sqlalchemy import (
    Column,
    DateTime,
    ForeignKey,
    Integer,
    JSON,
    String,
    Boolean,
)
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func
from app.db.database import engine

from app.db.database import Base


class BaseModel(Base):
    __abstract__ = True

    id = Column(Integer, primary_key=True, index=True)
    created_at = Column(DateTime)
    updated_at = Column(DateTime)


class Robot(BaseModel):
    __tablename__ = "robots"

    name = Column(String(50), index=True)
    battery = Column(Integer, default=100)
    status = Column(Integer, default=0)
    speed = Column(Integer, default=0)
    position = Column(Integer, default=0)
    tasks = relationship(
        "Task",
        back_populates="robot",
        lazy="dynamic",
        cascade="all, delete-orphan",
    )
    sensors = relationship(
        "Sensor",
        back_populates="robot",
        lazy="joined",
        cascade="all, delete-orphan",
    )


class Task(BaseModel):
    __tablename__ = "tasks"

    type = Column(Integer, default=0)
    status = Column(Integer, default=0)
    robot_id = Column(Integer, ForeignKey("robots.id"))
    checkpoint_ids = Column(JSON, default=[])
    start_position = Column(String(50), default="")
    end_position = Column(String(50), default="")
    speed = Column(Integer, default=0)
    sensors = Column(JSON, default=[])
    vision_algorithms = Column(JSON, default=[])
    execution_time = Column(DateTime)
    is_everyday = Column(Boolean, default=False)
    robot = relationship("Robot", back_populates="tasks")


class CheckPoint(BaseModel):
    __tablename__ = "checkpoints"

    name = Column(String(50), index=True)
    position = Column(Integer, default=0)
    speed = Column(Integer, default=0)


class Sensor(BaseModel):
    __tablename__ = "sensors"

    name = Column(String(50), index=True)
    value = Column(String(50), default=None)
    robot_id = Column(Integer, ForeignKey("robots.id"))
    robot = relationship("Robot", back_populates="sensors")


class AlarmLog(BaseModel):
    __tablename__ = "alarm_logs"

    level = Column(Integer, default=0)
    task_id = Column(
        Integer, ForeignKey("tasks.id", ondelete="CASCADE"), nullable=False
    )
    type = Column(Integer, default=0)
    time = Column(DateTime, default=func.now())
    status = Column(Integer, default=0)
    location = Column(Integer, default=0)
    img_url = Column(String(100), default="")
    video_url = Column(String(100), default="")


class RobotLog(BaseModel):
    __tablename__ = "robot_logs"

    robot_id = Column(
        Integer, ForeignKey("robots.id", ondelete="CASCADE"), nullable=False
    )
    total_task_executed = Column(Integer, default=0)
    total_distance = Column(Integer, default=0)
    total_alarm_raised = Column(Integer, default=0)


class TaskLog(BaseModel):
    __tablename__ = "task_logs"

    task_id = Column(
        Integer, ForeignKey("tasks.id", ondelete="CASCADE"), nullable=False
    )
    robot_id = Column(
        Integer, ForeignKey("robots.id", ondelete="CASCADE"), nullable=False
    )
    type = Column(Integer, default=0)


class VisionAlgorithm(BaseModel):
    __tablename__ = "vision_algorithms"

    name = Column(String(50), index=True)


Base.metadata.create_all(bind=engine)
