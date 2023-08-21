import configparser
from typing import Dict


class Config:
    def __init__(self, settings: Dict[str, str]):
        self.DATABASE_URL = settings["database_url"]
        self.IMAGE_DIR = settings["image_dir"]
        self.VIDEO_DIR = settings["video_dir"]

    @classmethod
    def from_ini_file(cls, ini_file: str, section: str):
        config = configparser.ConfigParser()
        config.read(ini_file)
        settings = dict(config.items(section))
        return cls(settings)
