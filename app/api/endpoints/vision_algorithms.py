from app.api.api import create_generic_router
from app.crud.vision_algorithms import vision_algorithm as crud
from app.schemas.vision_algorithms import (
    VisionAlgorithm,
    VisionAlgorithmCreate,
    VisionAlgorithmUpdate,
    VisionAlgorithmType,
)

from app.vision_algorithm.vision_algorithm import vision_algorithm as vs


def after_reads(vision_algorithms):
    cn_vision_algorithm = []
    for vision_algorithm in vision_algorithms:
        vision_algorithm = VisionAlgorithm.from_orm(vision_algorithm)
        if vision_algorithm.type == VisionAlgorithmType.VIDEO_DETECTION.value:
            vision_algorithm_cn_name = vs.video_algorithm_dict.get(
                vision_algorithm.name
            )
        elif vision_algorithm.type == VisionAlgorithmType.IMAGE_DETECTION.value:
            vision_algorithm_cn_name = vs.img_algorithm_dict.get(vision_algorithm.name)
        else:
            vision_algorithm_cn_name = None
        if vision_algorithm_cn_name:
            vision_algorithm.name = vision_algorithm_cn_name

        cn_vision_algorithm.append(vision_algorithm)
    return cn_vision_algorithm


hooks = {"after_reads": after_reads}
router = create_generic_router(
    crud,
    VisionAlgorithmCreate,
    VisionAlgorithmUpdate,
    VisionAlgorithm,
    hooks=hooks,
)
