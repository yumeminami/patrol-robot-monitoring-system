# import rospy

# from std_msgs.msg import String

# rospy.init_node("test_node", xmlrpc_port=45161, tcpros_port=45162)

# pub = rospy.Publisher("robot/temperature", String, queue_size=10)

# rate = rospy.Rate(10)  # 10hz

# while not rospy.is_shutdown():
#     hello_str = "1"
#     pub.publish(hello_str)
#     rate.sleep()
# import datetime

# # print(datetime.datetime.now().astimezone())
# print(datetime.datetime.now())
# current_date = datetime.datetime.now().date()
# print(current_date)
from cv_bridge import CvBridge
import cv2

img = cv2.imread("hat.jpg")
bridge = CvBridge()
img_msg = bridge.cv2_to_imgmsg(img, "bgr8")
from app.services.task_service import image_detection

# image_detection.delay(img_msg, 227, 13)
image_detection(img_msg, 230, 13)
