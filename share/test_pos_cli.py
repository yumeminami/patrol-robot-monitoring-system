import sys
sys.path.append('../../../devel/lib/python3/dist-packages/')
import rospy
import time
import sys
import rospy
from common.srv import PositionControl

if __name__ == "__main__":
    rospy.wait_for_service('position_command')
    try:
        server = rospy.ServiceProxy('position_command', PositionControl)
        resp1 = server(1,1000,200)
        print("resp1.status_code")
        print(resp1.status_code)
    except rospy.ServiceException as e:
        print("Service call failed: %s"%e)
