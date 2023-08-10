from sqlalchemy import (
    JSON,
    Column,
    DateTime,
    Float,
    ForeignKey,
    Integer,
    String,
    Time,
)
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func

from app.db.database import Base, engine


class BaseModel(Base):
    __abstract__ = True

    id = Column(Integer, primary_key=True, index=True)
    created_at = Column(DateTime)
    updated_at = Column(DateTime)


class Robot(BaseModel):
    __tablename__ = "robots"

    name = Column(String(50), index=True, unique=True)
    battery = Column(Integer, default=100)
    battery_status = Column(Integer, default=0)
    status = Column(Integer, default=0)
    velocity = Column(Float, default=0.0)
    position = Column(Float, default=0.0)
    sensors = relationship(
        "Sensor",
        back_populates="robot",
        lazy="joined",
        cascade="all, delete-orphan",
    )


class Task(BaseModel):
    __tablename__ = "tasks"

    name = Column(String(50), index=True, unique=True)
    type = Column(Integer, default=0)
    robot_id = Column(Integer, ForeignKey("robots.id"))
    checkpoint_ids = Column(JSON, default=[])
    start_position = Column(Float, default=0)
    end_position = Column(Float, default=0)
    velocity = Column(Float, default=0)
    sensors = Column(JSON, default=[])
    vision_algorithms = Column(JSON, default=[])
    execution_times = Column(JSON, default=[Time])
    execution_frequency = Column(String(50))


class CheckPoint(BaseModel):
    __tablename__ = "checkpoints"

    name = Column(String(50), index=True)
    position = Column(Integer, default=0)
    velocity = Column(Integer, default=0)
    gimbal_points = Column(JSON, default=[Integer])


class Sensor(BaseModel):
    __tablename__ = "sensors"

    name = Column(String(50), index=True)
    value = Column(Float, default=0)
    unit = Column(String(50), nullable=False)
    robot_id = Column(Integer, ForeignKey("robots.id"))
    robot = relationship("Robot", back_populates="sensors")


class AlarmLog(BaseModel):
    __tablename__ = "alarm_logs"

    level = Column(Integer, default=0)
    task_id = Column(
        Integer, ForeignKey("tasks.id", ondelete="CASCADE"), nullable=False
    )
    type = Column(String(50), index=True)
    time = Column(DateTime, default=func.now())
    status = Column(Integer, default=0)
    location = Column(Integer, default=0)
    img_url = Column(String(100), default="")
    video_url = Column(String(100), default="")
    detail = Column(String(100), default="")


class RobotLog(BaseModel):
    __tablename__ = "robot_logs"

    robot_id = Column(
        Integer, ForeignKey("robots.id", ondelete="CASCADE"), nullable=False
    )
    robot_name = Column(String(50), index=True)
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
    execution_date = Column(JSON, default=[Time])
    type = Column(Integer, default=0)


class VisionAlgorithm(BaseModel):
    __tablename__ = "vision_algorithms"

    name = Column(String(50), index=True)
    sensitivity = Column(Float, default=0.5)


class GimbalPoint(BaseModel):
    __tablename__ = "gimbal_points"
    preset_index = Column(Integer, nullable=False, unique=True)


class PatrolImage(BaseModel):
    __tablename__ = "patrol_images"
    uuid = Column(String(50), index=True)
    image_url = Column(String(100), default="")
    task_id = Column(
        Integer, ForeignKey("tasks.id", ondelete="CASCADE"), nullable=False
    )
    checkpoint_id = Column(
        Integer,
        ForeignKey("checkpoints.id", ondelete="CASCADE"),
        nullable=False,
    )


Base.metadata.create_all(bind=engine)
