import rospy
from common.srv import *
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import cv2


def hanlde_take_pic(req):
    bridge = CvBridge()
    img = cv2.imread("tests/ayanami.jpg")

    img_msg = bridge.cv2_to_imgmsg(img, "bgr8")
    response = TakePictureResponse()
    response.img = img_msg
    response.status_code = 1
    return response


def take_pic_server():
    rospy.init_node(
        "take_picture_server", xmlrpc_port=45175, tcpros_port=45176
    )
    s = rospy.Service("take_picture", TakePicture, hanlde_take_pic)
    rospy.spin()


if __name__ == "__main__":
    take_pic_server()
