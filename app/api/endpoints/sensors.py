from app.schemas.sensors import Sensor, SensorCreate, SensorUpdate
from app.crud.sensors import sensor as crud

from app.api.api import create_generic_router

router = create_generic_router(crud, SensorCreate, SensorUpdate, Sensor)
