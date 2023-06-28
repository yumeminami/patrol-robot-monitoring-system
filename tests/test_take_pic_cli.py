import rospy
from common.srv import *
from cv_bridge import CvBridge, CvBridgeError
import cv2


def take_pic_client():
    try:
        rospy.wait_for_service("take_picture", timeout=1)
        take_picture = rospy.ServiceProxy("take_picture", TakePicture)
        request = TakePictureRequest()
        response = take_picture(request)
        if response.status_code == 1 and response.img is not None:
            print("take pic success")
            bridge = CvBridge()
            img = bridge.imgmsg_to_cv2(response.img, "bgr8")
            cv2.imwrite("tests/ayanami_1.jpg", img)

    except Exception as e:
        print("error: %s" % e)


if __name__ == "__main__":
    take_pic_client()
