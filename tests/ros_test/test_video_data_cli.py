import rospy
from common.srv import *
from cv_bridge import CvBridge
import cv2


def video_client():
    try:
        rospy.wait_for_service("/zj_robot/video_data", timeout=1)
        client = rospy.ServiceProxy("/zj_robot/video_data", VideoData)

        req = VideoDataRequest()

        path = "/app/hat.mp4"

        with open(path, "rb") as f:
            vide_data = f.read()

        req.video_data.data = list(vide_data)
        req.patrol_task_name = "14"

        resp = client.call(req)
    except Exception as e:
        print("error: %s" % e)


if __name__ == "__main__":
    video_client()
