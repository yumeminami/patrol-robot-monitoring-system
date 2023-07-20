import base64
import argparse
from uuid import uuid4

import requests
import httpx


def test_hat(sensitivity: float = 0.1):
        url = "http://192.168.2.41:5209/hatPhoto/"
        image_id = str(uuid4())
        image_url = "tests/vision_algorithm_test/hat_images/1-detected.jpg"
        image_data = None
        with open(image_url, "rb") as f:
            image_data = f.read()
        image_base64 = base64.b64encode(image_data).decode()

        params = {"img_id": image_id, "image_base": image_base64, "sensitivity": sensitivity}
        print(params)
        response = requests.get(url, json=params)
        print(response.json())
        receive_data = response.json()
        receive_image_base64 = receive_data["data"]["img"]
        receive_image_data = base64.b64decode(receive_image_base64)


        with open("tests/vision_algorithm_test/hat_images/1-detected.jpg", "wb") as f:
            f.write(receive_image_data)


ap = argparse.ArgumentParser()
ap.add_argument("-s", "--sensitivity", type=int, default=0.1, help="sensitivity")

args = vars(ap.parse_args())

if __name__ == "__main__":
    test_hat(args["sensitivity"])
    