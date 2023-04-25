

from app.crud.base import CRUDBase
from app.models.models import Sensor
from app.schemas.sensors import SensorCreate, SensorUpdate


class CRUDSensor(CRUDBase[Sensor, SensorCreate, SensorUpdate]):
    pass


sensor = CRUDSensor(Sensor)
