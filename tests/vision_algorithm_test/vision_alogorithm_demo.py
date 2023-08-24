from app.vision_algorithm.vision_algorithm import vision_algorithm as vs
import os
import base64
import argparse
from uuid import uuid4

# PLEASE SET PYTHONPATH MANUALLY BEFORE RUN THIS SCRIPT
# export PYTHONPATH=~/patrol-robot-monitoring-system
os.environ.setdefault(
    "PYTHONPATH", "/home/ubuntu/patrol-robot-monitoring-system"
)
os.environ.setdefault("VISION_ALGORITHM_API_URL", "http://192.168.2.41:5209")
# print(os.environ.get("PYTHONPATH"))
# print(os.environ.get("VISION_ALGORITHM_API_URL"))

ap = argparse.ArgumentParser()
ap.add_argument(
    "-s", "--sensitivity", type=float, default=0.1, help="sensitivity"
)

ap.add_argument("-a", "--algorithm", type=str, required=True, help="algorithm")

ap.add_argument("-i", "--image", type=str, help="image file path")

ap.add_argument("-v", "--video", type=str, help="video file path")

args = vars(ap.parse_args())

# due to the algorithm amount is much, we don't check is it exist
if __name__ == "__main__":
    if args["image"]:
        image_id = str(uuid4())
        if not os.path.exists(args["image"]):
            print("image file not exist")
            exit(1)
        with open(args["image"], "rb") as f:
            image_data = f.read()
        image_base64 = base64.b64encode(image_data).decode()
        print(
            vs.detect(
                image_id, image_base64, args["algorithm"], args["sensitivity"]
            )
        )

        merge_image_base64 = vs.merge(image_id, image_base64)
        if merge_image_base64 is None:
            print("merge image error")
            exit(1)
        merge_image_data = base64.b64decode(merge_image_base64)
        with open(
            f"app/static/images/{image_id}.jpg",
            "wb",
        ) as f:
            f.write(merge_image_data)

    if args["video"]:
        id = str(uuid4())
        if not os.path.exists(args["video"]):
            print("video file not exist")
            exit(1)
        with open(args["video"], "rb") as f:
            video_data = f.read()
        vs.video_detect(
            video_id=id,
            video_data=video_data,
            algorithm=args["algorithm"],
            sensitivity=args["sensitivity"],
        )

    
