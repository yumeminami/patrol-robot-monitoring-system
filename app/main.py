import uvicorn
from fastapi.middleware.cors import CORSMiddleware
from fastapi import FastAPI
import sys
import os
from pyfiglet import Figlet

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from app.api.deps import router as deps_router
from app.api.router import router as api_router
from app.utils.log import logger

from app.ros.ros import initialize_all_robots_corresponding_nodes


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

    return app


app = create_app()

f = Figlet(font="speed")
logger.info(f.renderText("\nPatrol Robot System"))
logger.info("Server Start...")
initialize_all_robots_corresponding_nodes()

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)  # type: ignore
