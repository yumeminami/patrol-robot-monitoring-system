import json
import os

import requests

from app.utils.log import logger

CONFIG_PATH = "app/vision_algorithm/config.json"


class VisionAlgorithm:
    def __init__(self):
        with open(CONFIG_PATH, "r") as f:
            self.config = json.load(f)

    def detect(
        self,
        image_id: str,
        image_base64: str,
        algorithm: str,
        sensitivity: float,
    ):
        vision_algorithm_api_url = os.environ.get("VISION_ALGORITHM_API_URL")
        if vision_algorithm_api_url is None:
            raise Exception("VISION_ALGORITHM_API_URL is not set")

        url = f"{vision_algorithm_api_url}/{algorithm}/"

        params = {
            "img_id": image_id,
            "image_base": image_base64,
            "sensitivity": sensitivity,
        }

        try:
            response = requests.get(url, json=params)
            receive_data = response.json()
        except Exception as e:
            logger.error(f"vision_algorithm detect error: {e}")
            return None
        print(receive_data["data"]["counts"])
        counts = receive_data["data"]["counts"]
        alarms = self.config[algorithm]["alarms"]
        detected_alarm = []

        try:
            for alarm in alarms:
                if counts[alarm] > 0:
                    detected_alarm.append(alarm)
        except Exception as e:
            logger.error(f"vision_algorithm detect error: {e}")
        finally:
            return detected_alarm

    def merge(self, image_id, image_base64):
        vision_algorithm_api_url = os.environ.get("VISION_ALGORITHM_API_URL")
        if vision_algorithm_api_url is None:
            raise Exception("VISION_ALGORITHM_API_URL is not set")

        url = f"{vision_algorithm_api_url}/merge/"
        params = {
            "img_id": image_id,
            "image_base": image_base64,
        }
        image_data = None
        try:
            response = requests.get(url, json=params)
            image_data = response.json()["data"]["img"]
            print(response.json().keys())
        except KeyError as e:
            logger.error(f"image data is None: {e}")
        except Exception as e:
            logger.error(f"vision_algorithm merge error: {e}")
        finally:
            return image_data


vision_algorithm = VisionAlgorithm()
