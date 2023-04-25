from sqlalchemy import Boolean, Column, ForeignKey, Integer, String, Table, JSON, TIMESTAMP, TIME, DateTime
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
    tasks = relationship("Task", back_populates="robot", lazy="dynamic")
    sensors = relationship("Sensor", back_populates="robot", lazy='joined')


class Task(BaseModel):
    __tablename__ = "tasks"

    type = Column(Integer, default=0)
    status = Column(Integer, default=0)
    robot_id = Column(Integer, ForeignKey("robots.id"))
    checkpoint_ids = Column(JSON, default=[])
    robot = relationship("Robot", back_populates="tasks")


class CheckPoint(BaseModel):
    __tablename__ = "checkpoints"

    name = Column(String(50), index=True)
    position = Column(Integer, default=0)
    speed = Column(Integer, default=0)


class Sensor(BaseModel):
    __tablename__ = 'sensors'

    name = Column(String(50), index=True)
    value = Column(String(50), default=None)
    robot_id = Column(Integer, ForeignKey("robots.id"))
    robot = relationship("Robot", back_populates="sensors")


class AlarmLog(BaseModel):
    __tablename__ = 'alarm_logs'

    level = Column(Integer, default=0)
    task_id = Column(Integer, ForeignKey("tasks.id"), nullable=False)
    type = Column(Integer, default=0)
    time = Column(DateTime, default=func.now())
    status = Column(Integer, default=0)
    location = Column(Integer, default=0)
    img_url = Column(String(100), default="")
    video_url = Column(String(100), default="")


Base.metadata.create_all(bind=engine)
