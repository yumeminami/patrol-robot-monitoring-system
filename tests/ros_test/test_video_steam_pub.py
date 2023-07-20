import rospy
from cv_bridge import CvBridge
import cv2
from sensor_msgs.msg import Image


def take_pic_server():
    rospy.init_node("video_streamer", xmlrpc_port=45177, tcpros_port=45178)
    publisher = rospy.Publisher("/zj_robot/video_stream", Image, queue_size=10)
    rate = rospy.Rate(1)
    while not rospy.is_shutdown():
        bridge = CvBridge()
        img = cv2.imread("tests/ayanami.jpg")
        img_msg = bridge.cv2_to_imgmsg(img, "bgr8")
        publisher.publish(img_msg)
        rate.sleep()
    rospy.spin()


if __name__ == "__main__":
    take_pic_server()
