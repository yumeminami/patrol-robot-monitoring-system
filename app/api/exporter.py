import httpx
from fastapi import APIRouter, HTTPException
from fastapi.responses import FileResponse

from app.utils.excel import write_excel

router = APIRouter()


@router.get("/task")
async def export_tasks():
    url = "http://localhost:8000/api/zh/tasks"
    headers = {
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJyb290IiwiZXhwIjoxNjg1MTI1MjIyfQ.Hkt-ptLsKkRrZ8UdT6AoVAf0gPaUuHA24OjqDH4QzRc"
    }

    async with httpx.AsyncClient() as client:
        r = await client.get(url, headers=headers)

    if r.status_code == 200:
        file_name = "tasks.xlsx"

        data = r.json()
        write_excel(data, file_name)

        return FileResponse(
            file_name,
            media_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
            filename=file_name,
        )

    else:
        raise HTTPException(status_code=400, detail="Unable to fetch tasks")


@router.get("/task_logs")
async def export_task_logs():
    url = "http://localhost:8000/api/zh/task_logs"
    headers = {
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJyb290IiwiZXhwIjoxNjg1MTI1MjIyfQ.Hkt-ptLsKkRrZ8UdT6AoVAf0gPaUuHA24OjqDH4QzRc"
    }

    async with httpx.AsyncClient() as client:
        r = await client.get(url, headers=headers)

    if r.status_code == 200:
        file_name = "task_logs.xlsx"

        data = r.json()
        write_excel(data, file_name)

        return FileResponse(
            file_name,
            media_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
            filename=file_name,
        )

    else:
        raise HTTPException(status_code=400, detail="Unable to fetch tasks")


@router.get("/robot")
async def export_robots():
    url = "http://localhost:8000/api/zh/robots"
    headers = {
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJyb290IiwiZXhwIjoxNjg1MTI1MjIyfQ.Hkt-ptLsKkRrZ8UdT6AoVAf0gPaUuHA24OjqDH4QzRc"
    }

    async with httpx.AsyncClient() as client:
        r = await client.get(url, headers=headers)

    if r.status_code == 200:
        file_name = "robots.xlsx"

        data = r.json()
        write_excel(data, file_name)

        return FileResponse(
            file_name,
            media_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
            filename=file_name,
        )

    else:
        print(r)
        raise HTTPException(status_code=400, detail="Unable to fetch robots")


@router.get("/alarm_log")
async def export_alarm_logs():
    url = "http://localhost:8000/api/zh/alarm_logs"
    headers = {
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJyb290IiwiZXhwIjoxNjg1MTI1MjIyfQ.Hkt-ptLsKkRrZ8UdT6AoVAf0gPaUuHA24OjqDH4QzRc"
    }

    async with httpx.AsyncClient() as client:
        r = await client.get(url, headers=headers)

    if r.status_code == 200:
        file_name = "alarm_logs.xlsx"

        data = r.json()
        write_excel(data, file_name)

        return FileResponse(
            file_name,
            media_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
            filename=file_name,
        )

    else:
        raise HTTPException(
            status_code=400, detail="Unable to fetch alarm_logs"
        )
