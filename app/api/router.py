from fastapi import APIRouter

from .endpoints.alarm_logs import router as alarm_logs_router
from .endpoints.checkpoints import router as checkpoints_router
from .endpoints.gimbalpoints import router as gimbalpoints_router
from .endpoints.patrol_images import router as patrol_images_router
from .endpoints.patrol_videos import router as patrol_videos_router
from .endpoints.robot_logs import router as robot_logs_router
from .endpoints.robots import router as robots_router
from .endpoints.sensors import router as sensors_router
from .endpoints.task_logs import router as task_logs_router
from .endpoints.tasks import router as tasks_router
from .endpoints.vision_algorithms import router as vision_algorithms_router
from .exporter import router as exporter_router
from .endpoints.panorama_video import router as panorama_video_router

router = APIRouter()

# CRUD routers
router.include_router(robots_router, prefix="/robots", tags=["robots"])
router.include_router(tasks_router, prefix="/tasks", tags=["tasks"])
router.include_router(
    checkpoints_router, prefix="/checkpoints", tags=["checkpoints"]
)
router.include_router(sensors_router, prefix="/sensors", tags=["sensors"])
router.include_router(
    robot_logs_router, prefix="/robot_logs", tags=["robot_logs"]
)
router.include_router(
    task_logs_router, prefix="/task_logs", tags=["task_logs"]
)
router.include_router(
    alarm_logs_router, prefix="/alarm_logs", tags=["alarm_logs"]
)

router.include_router(
    vision_algorithms_router,
    prefix="/vision_algorithms",
    tags=["vision_algorithms"],
)

router.include_router(
    gimbalpoints_router,
    prefix="/gimbalpoints",
    tags=["gimbal_points"],
)

router.include_router(
    patrol_images_router,
    prefix="/patrol_images",
    tags=["patrol_images"],
)

router.include_router(
    patrol_videos_router,
    prefix="/patrol_videos",
    tags=["patrol_videos"],
)

# Exporter router
router.include_router(exporter_router, prefix="/exporter", tags=["exporter"])

router.include_router(
    panorama_video_router, prefix="/panorama_video", tags=["panorama_video"]
)
