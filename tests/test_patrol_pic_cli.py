import rospy
from common.srv import *
from cv_bridge import CvBridge
import cv2


def patrol_pic_client():
    try:
        rospy.wait_for_service("/zj_robot/patrol_picture", timeout=1)
        patrol_picture = rospy.ServiceProxy(
            "/zj_robot/patrol_picture", PatrolPicture
        )
        request = PatrolPictureRequest()
        request.patrol_task_name = "1"
        request.patrol_point_index = 100
        request.gimbal_point_index = 1
        bridge = CvBridge()
        img = cv2.imread("tests/test.png")
        img_msg = bridge.cv2_to_imgmsg(img, "bgr8")
        request.img = img_msg
        patrol_picture(request)
    except Exception as e:
        print("error: %s" % e)


if __name__ == "__main__":
    patrol_pic_client()
