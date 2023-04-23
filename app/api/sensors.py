from fastapi import APIRouter, Depends
from fastapi.responses import JSONResponse
from app.db.database import SessionLocal
from app.schemas.sensors import Sensor, SensorCreate, SensorUpdate
from app.crud.sensors import sensor as crud

router = APIRouter()


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


@router.get("/", response_model=list[Sensor])
async def read_sensors(db: SessionLocal = Depends(get_db)):
    return await crud.get_multi(db=db)


@router.get("/{sensor_id}", response_model=Sensor)
async def read_sensor(sensor_id: int, db: SessionLocal = Depends(get_db)):
    db_sensor = await crud.get(db=db, id=sensor_id)
    if db_sensor is None:
        return JSONResponse(status_code=404, content="Sensor not found")
    return db_sensor


@router.post("/", response_model=Sensor)
async def create_sensor(sensor: SensorCreate, db: SessionLocal = Depends(get_db)):
    return await crud.create(db=db, obj_in=sensor)


@router.post("/{sensor_id}", response_model=Sensor)
async def update_sensor(
        sensor_id: int,
        sensor: SensorUpdate,
        db: SessionLocal = Depends(get_db)):
    db_sensor = await crud.get(db=db, id=sensor_id)
    if db_sensor is None:
        return JSONResponse(status_code=404, content="Sensor not found")
    db_sensor = await crud.update(db=db, db_obj=db_sensor, obj_in=sensor)
    return db_sensor


@router.delete("/{sensor_id}", response_model=Sensor)
async def delete_sensor(sensor_id: int, db: SessionLocal = Depends(get_db)):
    db_sensor = await crud.get(db=db, id=sensor_id)
    if db_sensor is None:
        return JSONResponse(status_code=404, content="Sensor not found")
    db_sensor = await crud.remove(db=db, id=sensor_id)
    return db_sensor
