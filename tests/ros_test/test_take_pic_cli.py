import rospy
from common.srv import *
from cv_bridge import CvBridge, CvBridgeError
import cv2


def take_pic_client():
    try:
        rospy.wait_for_service("/zj_robot/take_picture", timeout=1)
        take_picture = rospy.ServiceProxy(
            "/zj_robot/take_picture", TakePicture
        )
        request = TakePictureRequest()
        response = take_picture(request)
        if response.status_code == 1 and response.img is not None:
            print("take pic success")
            bridge = CvBridge()
            try:
                img = bridge.imgmsg_to_cv2(response.img, "bgr8")
            except CvBridgeError as e:
                print("Could not convert image: %s" % e)
                return
            try:
                cv2.imwrite("tests/ayanami_1.jpg", img)
            except Exception as e:
                print("Could not save image: %s" % e)
                return
        else:
            print("Did not receive valid image")
    except Exception as e:
        print("error: %s" % e)


if __name__ == "__main__":
    take_pic_client()
