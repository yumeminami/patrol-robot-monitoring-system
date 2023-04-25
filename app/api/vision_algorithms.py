from app.api.api import create_generic_router

from app.schemas.vision_algorithms import VisionAlgorithm, VisionAlgorithmCreate, VisionAlgorithmUpdate
from app.crud.vision_algorithms import vision_algorithm as crud

router = create_generic_router(
    crud,
    VisionAlgorithmCreate,
    VisionAlgorithmUpdate,
    VisionAlgorithm)
