import io
import json
import os

import requests

from app.utils.log import logger

IMG_ALGORITHM_CONFIG_PATH = "app/vision_algorithm/img_algorithm_config.json"
VIDEO_ALGORITHM_CONFIG_PATH = (
    "app/vision_algorithm/video_algorithm_config.json"
)


class VisionAlgorithm:
    def __init__(self):
        with open(IMG_ALGORITHM_CONFIG_PATH, "r") as f:
            self.img_algorithm_config = json.load(f)
        with open(VIDEO_ALGORITHM_CONFIG_PATH, "r") as f:
            self.video_algorithm_config = json.load(f)
        self.vision_algorithm_api_url = os.environ.get(
            "VISION_ALGORITHM_API_URL", None
        )

    def img_detect(
        self,
        image_id: str,
        image_base64: str,
        algorithm: str,
        sensitivity: float,
    ):
        if self.vision_algorithm_api_url is None:
            raise Exception("VISION_ALGORITHM_API_URL is not set")
        if algorithm not in self.img_algorithm_config.keys():
            print(self.img_algorithm_config.keys())
            raise KeyError("algorithm not found")

        url = f"{self.vision_algorithm_api_url}/{algorithm}/"

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
            return None, None
        print(receive_data["data"]["counts"])
        counts = receive_data["data"]["counts"]
        img = receive_data["data"]["img"]
        alarms = self.img_algorithm_config[algorithm]["alarms"]
        detected_alarm = []

        try:
            for alarm in alarms:
                if counts[alarm] > 0:
                    detected_alarm.append(alarm)
        except Exception as e:
            logger.error(f"vision_algorithm detect error: {e}")
        finally:
            return detected_alarm, img

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
        except KeyError as e:
            logger.error(f"image data is None: {e}")
        except Exception as e:
            logger.error(f"vision_algorithm merge error: {e}")
        finally:
            return image_data

    def video_detect(self, video_id, video_data, algorithm, sensitivity):
        if self.vision_algorithm_api_url is None:
            raise Exception("VISION_ALGORITHM_API_URL is not set")
        if algorithm not in self.video_algorithm_config.keys():
            raise KeyError("algorithm not found")

        url = f"{self.vision_algorithm_api_url}/video/{algorithm}/{video_id}/{sensitivity}"

        try:
            response = requests.post(url, files={"file": video_data})
            print(response.status_code)
            vid = response.headers.get("x-video-metadata")
            if vid == "" or vid is None:
                logger.error(f"vision_algorithm detect error: {response.text}")

            detected_video_data = io.BytesIO()
            for chunk in response.iter_content(chunk_size=1024):
                if chunk:
                    detected_video_data.write(chunk)
            return detected_video_data.getvalue()

        except Exception as e:
            raise e


vision_algorithm = VisionAlgorithm()
