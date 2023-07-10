from typing import List

from app.crud.base import CRUDBase
from app.models.models import Sensor
from app.schemas.sensors import SensorCreate, SensorUpdate


class CRUDSensor(CRUDBase[Sensor, SensorCreate, SensorUpdate]):
    def get_multi_by_robot_id(self, db, *, robot_id: int) -> List[Sensor]:
        return db.query(Sensor).filter(Sensor.robot_id == robot_id).all()


sensor = CRUDSensor(Sensor)
