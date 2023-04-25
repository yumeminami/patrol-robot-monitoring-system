
from app.crud.base import CRUDBase
from app.models.models import VisionAlgorithm
from app.schemas.vision_algorithms import VisionAlgorithmCreate, VisionAlgorithmUpdate


class CRUDVisionAlgorithm(
        CRUDBase[VisionAlgorithm, VisionAlgorithmCreate, VisionAlgorithmUpdate]):
    pass


vision_algorithm = CRUDVisionAlgorithm(VisionAlgorithm)
