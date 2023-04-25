from fastapi import APIRouter
from fastapi.responses import JSONResponse

router = APIRouter()


# control the gimbal
@router.put("/gimbals/{gimbal_id}")
async def control_gimbal(gimbal_id: int):
    # TODO: implement gimbal control
    return JSONResponse(
        status_code=200,
        content="Gimbal control not implemented yet")
