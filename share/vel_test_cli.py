import sys
sys.path.append('../../../devel/lib/python3/dist-packages/')
import rospy
from common.msg import velocity_control
import time
import sys
import rospy
from common.srv import VelocityControl

if __name__ == "__main__":
    rospy.wait_for_service('velocity_command')
    try:
        add_two_ints = rospy.ServiceProxy('velocity_command', VelocityControl)
        resp1 = add_two_ints(100)
        print("resp1.status_code")
        print(resp1.status_code)
    except rospy.ServiceException as e:
        print("Service call failed: %s"%e)
