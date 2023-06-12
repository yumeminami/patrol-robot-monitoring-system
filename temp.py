import rospy

from std_msgs.msg import String

rospy.init_node("temp")

topics = rospy.get_published_topics()
print(topics)