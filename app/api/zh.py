from fastapi import APIRouter, Depends
from fastapi.responses import JSONResponse
import httpx

from .deps import oauth2_scheme

router = APIRouter()


def robot_zh_key(key: str) -> str:
    translation_mapping = {
        "id": "编号",
        "name": "名称",
        "battery": "电池",
        "battery_status": "电池状态",
        "status": "状态",
        "velocity": "速度",
        "position": "位置",
        "task_id": "任务编号",
        "task_status": "任务状态",
        "sensors": "传感器",
        "value": "数值",
        "unit": "单位",
        "robot_id": "机器人编号",
        "light": "光照",
        "humidity": "湿度",
        "temperature": "温度",
    }
    # Return the translated key if found in the mapping, otherwise return the original key
    return translation_mapping.get(key, key)


def robot_enum_to_literally(enum_key: str, value: int) -> str:
    robot_battery_status_mapping = {
        0: "充电中",
        1: "未充电",
    }

    robot_status_mapping = {
        0: "在线",
        1: "离线",
    }

    # Check if the enum key exists in the translation mapping and return the translated value
    if enum_key == "battery_status" and value in robot_battery_status_mapping:
        return robot_battery_status_mapping[value]
    elif enum_key == "status" and value in robot_status_mapping:
        return robot_status_mapping[value]

    # Return the original value if no translation is found
    return str(value)


@router.get("/robots")
async def get_robots(token: str = Depends(oauth2_scheme)):
    url = "http://localhost:8000/api/robots"
    headers = {
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJyb290IiwiZXhwIjoxNjg1MTI1MjIyfQ.Hkt-ptLsKkRrZ8UdT6AoVAf0gPaUuHA24OjqDH4QzRc"
    }

    async with httpx.AsyncClient() as client:
        try:
            response = await client.get(url, headers=headers)
            response.raise_for_status()
            data = response.json()

            # Convert keys and enum types to Chinese
            translated_data = []
            for item in data:
                translated_item = {}
                for key, value in item.items():
                    translated_key = robot_zh_key(key)
                    translated_value = value

                    # Convert enum values to literal meanings
                    if isinstance(value, int) and key in [
                        "battery_status",
                        "status",
                    ]:
                        translated_value = robot_enum_to_literally(key, value)

                    translated_item[translated_key] = translated_value

                translated_data.append(translated_item)

            return translated_data
            return data
        except httpx.HTTPError as e:
            return JSONResponse(
                status_code=e.response.status_code, content=str(e)
            )


def task_zh_key(key: str) -> str:
    translation_mapping = {
        "type": "任务类型",
        "status": "任务状态",
        "robot_id": "机器人ID",
        "checkpoint_ids": "检查点ID列表",
        "start_position": "起始位置",
        "end_position": "结束位置",
        "velocity": "速度",
        "sensors": "传感器列表",
        "vision_algorithms": "视觉算法列表",
        "execution_time": "执行时间列表",
        "is_everyday": "每天执行",
        "id": "任务ID",
    }
    # Return the translated key if found in the mapping, otherwise return the original key
    return translation_mapping.get(key, key)


def task_enum_to_literally(enum_key: str, value: int) -> str:
    task_status_mapping = {
        0: "未执行",
        1: "执行中",
        2: "待执行",
        3: "已完成",
    }

    task_type_mapping = {
        0: "自动巡检",
        1: "常规巡检",
    }

    # Check if the enum key exists in the translation mapping and return the translated value
    if enum_key == "status" and value in task_status_mapping:
        return task_status_mapping[value]

    if enum_key == "type" and value in task_type_mapping:
        return task_type_mapping[value]

    # Return the original value if no translation is found
    return str(value)


@router.get("/tasks")
async def get_tasks(token: str = Depends(oauth2_scheme)):
    url = "http://localhost:8000/api/tasks"
    headers = {
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJyb290IiwiZXhwIjoxNjg1MTI1MjIyfQ.Hkt-ptLsKkRrZ8UdT6AoVAf0gPaUuHA24OjqDH4QzRc"
    }

    async with httpx.AsyncClient() as client:
        try:
            response = await client.get(url, headers=headers)
            response.raise_for_status()
            data = response.json()

            # Convert keys and enum types to Chinese
            translated_data = []
            for item in data:
                translated_item = {}
                for key, value in item.items():
                    translated_key = task_zh_key(key)
                    translated_value = value

                    # Convert enum values to literal meanings
                    if isinstance(value, int) and key in [
                        "type",
                        "status",
                    ]:
                        translated_value = task_enum_to_literally(key, value)

                    translated_item[translated_key] = translated_value

                translated_data.append(translated_item)

            return translated_data
            return data
        except httpx.HTTPError as e:
            return JSONResponse(
                status_code=e.response.status_code, content=str(e)
            )


def alarm_zh_key(key: str) -> str:
    translation_mapping = {
        "level": "告警级别",
        "task_id": "任务ID",
        "type": "告警类型",
        "status": "告警状态",
        "location": "位置",
        "img_url": "图片URL",
        "video_url": "视频URL",
        "id": "告警日志ID",
        "time": "时间",
    }
    # Return the translated key if found in the mapping, otherwise return the original key
    return translation_mapping.get(key, key)


def alarm_enum_to_literally(enum_key: str, value: int) -> str:
    alarm_log_level_mapping = {
        0: "警告",
        1: "严重",
    }

    alarm_log_status_mapping = {
        0: "未处理",
        1: "已处理",
    }

    alarm_log_type_mapping = {
        0: "设备",
        1: "温度",
        2: "湿度",
        3: "光照",
        4: "PM1.0",
        5: "PM2.5",
        6: "PM10",
        7: "烟雾1",
        8: "烟雾2",
    }

    # Check if the enum key exists in the translation mapping and return the translated value
    if enum_key == "level" and value in alarm_log_level_mapping:
        return alarm_log_level_mapping[value]

    if enum_key == "status" and value in alarm_log_status_mapping:
        return alarm_log_status_mapping[value]

    if enum_key == "type" and value in alarm_log_type_mapping:
        return alarm_log_type_mapping[value]

    # Return the original value if no translation is found
    return str(value)


@router.get("/alarm_logs")
async def get_alarm_logs(token: str = Depends(oauth2_scheme)):
    url = "http://localhost:8000/api/alarm_logs"
    headers = {
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJyb290IiwiZXhwIjoxNjg1MTI1MjIyfQ.Hkt-ptLsKkRrZ8UdT6AoVAf0gPaUuHA24OjqDH4QzRc"
    }

    async with httpx.AsyncClient() as client:
        try:
            response = await client.get(url, headers=headers)
            response.raise_for_status()
            data = response.json()

            # Convert keys and enum types to Chinese
            translated_data = []
            for item in data:
                translated_item = {}
                for key, value in item.items():
                    translated_key = alarm_zh_key(key)
                    translated_value = value

                    # Convert enum values to literal meanings
                    if isinstance(value, int) and key in [
                        "level",
                        "status",
                        "type",
                    ]:
                        translated_value = alarm_enum_to_literally(key, value)

                    translated_item[translated_key] = translated_value

                translated_data.append(translated_item)

            return translated_data
            return data
        except httpx.HTTPError as e:
            return JSONResponse(
                status_code=e.response.status_code, content=str(e)
            )
