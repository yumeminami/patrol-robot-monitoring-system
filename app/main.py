import os
import sys

import uvicorn
from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles
from fastapi.middleware.cors import CORSMiddleware
from pyfiglet import Figlet

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from app.db.database import init_db
from app.api.deps import router as deps_router
from app.api.router import router as api_router
from app.ros.ros import initialize_all_robots_corresponding_nodes
from app.utils.log import logger, UVICORN_LOGGING_CONFIG
from app.ws.websocket_manager import router as ws_router


def create_app():
    app = FastAPI()
    # Set up middleware, routes, etc.
    app.add_middleware(
        CORSMiddleware,
        allow_origins=["*"],
        allow_credentials=True,
        allow_methods=["*"],
        allow_headers=["*"],
    )

    app.include_router(deps_router, tags=["token"])
    app.include_router(api_router, prefix="/api")
    app.include_router(ws_router, tags="websocket")

    return app


init_db()
app = create_app()
app.mount("/static", StaticFiles(directory="app/static"), name="static")

f = Figlet(font="speed")
logger.info(f.renderText("\nPatrol Robot System"))
logger.info("Server Start...")
process_list = initialize_all_robots_corresponding_nodes()

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000, log_config=UVICORN_LOGGING_CONFIG)  # type: ignore
    for process in process_list:
        process.terminate()
    logger.info(f.renderText("\nBye!"))
