import sys
sys.path.append('../../../devel/lib/python3/dist-packages/')
import rospy
import time
import sys
import rospy
from common.srv import StopControl

if __name__ == "__main__":
    rospy.wait_for_service('stop_command')
    try:
        server = rospy.ServiceProxy('stop_command', StopControl)
        resp1 = server(0)
        print("resp1.status_code")
        print(resp1.status_code)
    except rospy.ServiceException as e:
        print("Service call failed: %s"%e)
