from fastapi import APIRouter

from .robots import router as robots_router
from .tasks import router as tasks_router

router = APIRouter()
router.include_router(robots_router, prefix="/robots", tags=["robots"])
router.include_router(tasks_router, prefix="/tasks", tags=["tasks"])
