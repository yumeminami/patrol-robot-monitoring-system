import numpy as np
from sensor_msgs.msg import Image
from cv_bridge import CvBridge

# ROS Image to cv2
def ROS_Image_to_cv2(image: Image):
    bridge = CvBridge()
    image_cv = bridge.imgmsg_to_cv2(image, desired_encoding="passthrough")
    return image_cv

# cv2 to ROS Image
def cv2_to_ROS_Image(image_cv: np.ndarray, encoding="bgr8"):
    bridge = CvBridge()
    image = bridge.cv2_to_imgmsg(image_cv, encoding)
    return image