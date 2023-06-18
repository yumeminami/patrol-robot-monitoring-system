from fastapi import APIRouter, HTTPException
from fastapi.responses import FileResponse

import httpx

router = APIRouter()


@router.get("/task")
async def export_tasks():
    url = "http://localhost:8000/api/tasks"
    headers = {
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJyb290IiwiZXhwIjoxNjg1MTI1MjIyfQ.Hkt-ptLsKkRrZ8UdT6AoVAf0gPaUuHA24OjqDH4QzRc"
    }

    params = {"export": True}

    async with httpx.AsyncClient() as client:
        r = await client.get(url, headers=headers, params=params)

    if r.status_code == 200:
        file_name = "tasks.xlsx"
        with open(file_name, "wb") as f:
            f.write(r.content)

        return FileResponse(
            file_name,
            media_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
            filename=file_name,
        )

    else:
        raise HTTPException(status_code=400, detail="Unable to fetch tasks")


@router.get("/robot")
async def export_robots():
    url = "http://localhost:8000/api/robots"
    headers = {
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJyb290IiwiZXhwIjoxNjg1MTI1MjIyfQ.Hkt-ptLsKkRrZ8UdT6AoVAf0gPaUuHA24OjqDH4QzRc"
    }

    params = {"export": True}

    async with httpx.AsyncClient() as client:
        r = await client.get(url, headers=headers, params=params)

    if r.status_code == 200:
        file_name = "robots.xlsx"
        with open(file_name, "wb") as f:
            f.write(r.content)

        return FileResponse(
            file_name,
            media_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
            filename=file_name,
        )

    else:
        raise HTTPException(status_code=400, detail="Unable to fetch tasks")


@router.get("/alarm_log")
async def export_alarm_logs():
    url = "http://localhost:8000/api/alarm_logs"
    headers = {
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJyb290IiwiZXhwIjoxNjg1MTI1MjIyfQ.Hkt-ptLsKkRrZ8UdT6AoVAf0gPaUuHA24OjqDH4QzRc"
    }

    params = {"export": True}

    async with httpx.AsyncClient() as client:
        r = await client.get(url, headers=headers, params=params)

    if r.status_code == 200:
        file_name = "alarm_logs.xlsx"
        with open(file_name, "wb") as f:
            f.write(r.content)

        return FileResponse(
            file_name,
            media_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
            filename=file_name,
        )

    else:
        raise HTTPException(
            status_code=400, detail="Unable to fetch alarm_logs"
        )
