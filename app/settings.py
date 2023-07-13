import os

from app.config import Config

ENVIRONMENT = os.environ.get("ENV", "default")
config = Config.from_ini_file("settings.ini", ENVIRONMENT)
