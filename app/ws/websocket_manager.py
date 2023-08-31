from fastapi import WebSocket, APIRouter
from starlette.websockets import WebSocketDisconnect
from typing import List
import asyncio


router = APIRouter()


class ConnectionManager:
    """
    Use this class to manage active connections, which are stored in a list.
    """

    def __init__(self):
        self.active_connections: List[WebSocket] = []

    """
    Use this method to add a new connection to the list of active connections.
    """

    async def connect(self, websocket: WebSocket):
        await websocket.accept()
        self.active_connections.append(websocket)

    """
    Use this method to remove a connection from the list of active connections.
    """

    def disconnect(self, websocket: WebSocket):
        self.active_connections.remove(websocket)

    """
    Send the data to all active connections except the one that sent the data.
    """

    async def send_signal_data(self, message: str, websocket: WebSocket):
        for connection in self.active_connections:
            if connection != websocket:
                await connection.send_text(message)


manager = ConnectionManager()


@router.websocket("/ws")
async def websocket_endpoint(websocket: WebSocket):
    await manager.connect(websocket)
    try:
        await websocket.send_json({"message": "Hello WebSocket"})
        while True:
            await websocket.send_json({"message": "Hello WebSocket"})
            # print(video_data["zj_robot"].get())
            # await websocket.send_bytes(video_data.get())
            # await websocket.send_bytes(video_data.get())
            await asyncio.sleep(3)  # 适当的间隔，避免过多的数据传输
    except WebSocketDisconnect:
        manager.disconnect(websocket)
