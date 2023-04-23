from sqlalchemy import Boolean, Column, ForeignKey, Integer, String, Table, JSON
from sqlalchemy.orm import relationship
from app.db.database import engine

from app.db.database import Base


class Robot(Base):
    __tablename__ = "robots"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String(50), index=True)
    battery = Column(Integer, default=100)
    status = Column(Integer, default=0)
    speed = Column(Integer, default=0)
    position = Column(Integer, default=0)
    tasks = relationship("Task", back_populates="robot", lazy="dynamic")
    sensors = relationship("Sensor", back_populates="robot", lazy='joined')


class Task(Base):
    __tablename__ = "tasks"

    id = Column(Integer, primary_key=True, index=True)
    type = Column(Integer, default=0)
    status = Column(Integer, default=0)
    robot_id = Column(Integer, ForeignKey("robots.id"))
    checkpoint_ids = Column(JSON, default=[])
    robot = relationship("Robot", back_populates="tasks")


class CheckPoint(Base):
    __tablename__ = "checkpoints"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String(50), index=True)
    position = Column(Integer, default=0)
    speed = Column(Integer, default=0)


class Sensor(Base):
    __tablename__ = 'sensors'

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String(50), index=True)
    value = Column(String(50), default=None)
    robot_id = Column(Integer, ForeignKey("robots.id"))
    robot = relationship("Robot", back_populates="sensors")


Base.metadata.create_all(bind=engine)
