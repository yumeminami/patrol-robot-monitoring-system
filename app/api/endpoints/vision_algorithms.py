from app.api.api import create_generic_router
from app.crud.vision_algorithms import vision_algorithm as crud
from app.schemas.vision_algorithms import (
    VisionAlgorithm,
    VisionAlgorithmCreate,
    VisionAlgorithmUpdate,
    VisionAlgorithmType,
)

from app.vision_algorithm.vision_algorithm import vision_algorithm as vs


def after_read(vision_algorithm):
    vision_algorithm = VisionAlgorithm.from_orm(vision_algorithm)
    if vision_algorithm.type == VisionAlgorithmType.VIDEO_DETECTION.value:
        vision_algorithm_cn_name = vs.video_algorithm_dict.get(vision_algorithm.name)
    elif vision_algorithm.type == VisionAlgorithmType.IMAGE_DETECTION.value:
        vision_algorithm_cn_name = vs.img_algorithm_dict.get(vision_algorithm.name)
    else:
        vision_algorithm_cn_name = None
    if vision_algorithm_cn_name:
        vision_algorithm.name = vision_algorithm_cn_name
    return vision_algorithm


hooks = {"after_read": after_read}
router = create_generic_router(
    crud,
    VisionAlgorithmCreate,
    VisionAlgorithmUpdate,
    VisionAlgorithm,
    hooks=hooks,
)
