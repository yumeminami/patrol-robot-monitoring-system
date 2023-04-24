from fastapi import APIRouter, Depends
from fastapi.responses import JSONResponse
from app.db.database import SessionLocal
from app.schemas.alarm_logs import AlarmLogCreate, AlarmLogUpdate,AlarmLog
from app.crud.alarm_logs import alarm_log as crud


router = APIRouter()

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


@router.get("/", response_model=list[AlarmLog])
async def read_alarm_logs(db: SessionLocal = Depends(get_db)):
    alarm_logs = await crud.get_multi(db=db)
    return alarm_logs


@router.get("/{alarm_log_id}", response_model=AlarmLog)
async def read_alarm_log(alarm_log_id: int, db: SessionLocal = Depends(get_db)):
    db_alarm_log = await crud.get(db=db, id=alarm_log_id)
    if db_alarm_log is None:
        return JSONResponse(status_code=404, content="AlarmLog not found")
    return db_alarm_log

@router.post("/", response_model=AlarmLog)
async def create_alarm_logs(alarm_log: AlarmLogCreate, db: SessionLocal = Depends(get_db)):
    return await crud.create(db=db, obj_in=alarm_log)

@router.post("/{alarm_log_id}", response_model=AlarmLog)
async def update_alarm_log(
        alarm_log_id: int,
        alarm_log: AlarmLogUpdate,
        db: SessionLocal = Depends(get_db)):
    db_alarm_log = await crud.get(db=db, id=alarm_log_id)
    if db_alarm_log is None:
        return JSONResponse(status_code=404, content="AlarmLog not found")
    return await crud.update(db=db, db_obj=db_alarm_log, obj_in=alarm_log)


@router.delete("/{alarm_log_id}", response_model=AlarmLog)
async def delete_alarm_log(alarm_log_id: int, db: SessionLocal = Depends(get_db)):
    db_alarm_log = await crud.get(db=db, id=alarm_log_id)
    if db_alarm_log is None:
        return JSONResponse(status_code=404, content="AlarmLog not found")
    return await crud.remove(db=db, id=alarm_log_id)
