from fastapi import APIRouter

from .robots import router as robots_router
from .tasks import router as tasks_router
from .checkpoints import router as checkpoints_router
from .sensors import router as sensors_router
from .alarm_logs import router as alarm_logs_router
from .robot_logs import router as robot_logs_router
from .task_logs import router as task_logs_router
from .vision_algorithms import router as vision_algorithms_router

router = APIRouter()

# CRUD routers
router.include_router(robots_router, prefix="/robots", tags=["robots"])
router.include_router(tasks_router, prefix="/tasks", tags=["tasks"])
router.include_router(
    checkpoints_router,
    prefix="/checkpoints",
    tags=["checkpoints"])
router.include_router(sensors_router, prefix="/sensors", tags=["sensors"])
router.include_router(
    robot_logs_router,
    prefix="/robot_logs",
    tags=["robot_logs"])
router.include_router(
    task_logs_router,
    prefix="/task_logs",
    tags=["task_logs"])
router.include_router(
    alarm_logs_router,
    prefix="/alarm_logs",
    tags=["alarm_logs"])

router.include_router(
    vision_algorithms_router,
    prefix="/vision_algorithms",
    tags=["vision_algorithms"])
