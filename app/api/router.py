from fastapi import APIRouter

from .robots import router as robots_router
from .tasks import router as tasks_router
from .checkpoints import router as checkpoints_router
from .sensors import router as sensors_router
from .alarm_logs import router as alarm_logs_router

router = APIRouter()
router.include_router(robots_router, prefix="/robots", tags=["robots"])
router.include_router(tasks_router, prefix="/tasks", tags=["tasks"])
router.include_router(
    checkpoints_router,
    prefix="/checkpoints",
    tags=["checkpoints"])
router.include_router(sensors_router, prefix="/sensors", tags=["sensors"])
router.include_router(alarm_logs_router, prefix="/alarm_logs", tags=["alarm_logs"])