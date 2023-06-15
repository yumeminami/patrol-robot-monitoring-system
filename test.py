# import rospy

# from std_msgs.msg import String

# rospy.init_node("test_node", xmlrpc_port=45161, tcpros_port=45162)

# pub = rospy.Publisher("robot/temperature", String, queue_size=10)

# rate = rospy.Rate(10)  # 10hz

# while not rospy.is_shutdown():
#     hello_str = "1"
#     pub.publish(hello_str)
#     rate.sleep()
import datetime

# print(datetime.datetime.now().astimezone())
print(datetime.datetime.now())
current_date = datetime.datetime.now().date()
print(current_date)
