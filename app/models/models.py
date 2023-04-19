from sqlalchemy import Boolean, Column, ForeignKey, Integer, String
from sqlalchemy.orm import relationship

from ..db.database import Base


class Robot(Base):
    __tablename__ = "robots"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String(50), index=True)
    battery = Column(Integer, default=100)
    task = relationship("Task", back_populates="robot")


class Task(Base):
    __tablename__ = "tasks"

    id = Column(Integer, primary_key=True, index=True)
    type = Column(Integer, default=0)
    status = Column(Integer, default=0)
    robot_id = Column(Integer, ForeignKey("robots.id"))
    robot = relationship("Robot", back_populates="task")