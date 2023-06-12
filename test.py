import rospy

from std_msgs.msg import String

rospy.init_node("test_node", xmlrpc_port=45161, tcpros_port=45162)

pub = rospy.Publisher("topic1", String, queue_size=10) 
pub2 = rospy.Publisher("topic2", String, queue_size=10)

rate = rospy.Rate(10) # 10hz

while not rospy.is_shutdown():
    hello_str = "hello world %s" % rospy.get_name()
    pub.publish(hello_str)
    pub2.publish(hello_str)
    rate.sleep()