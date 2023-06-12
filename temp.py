import rospy


rospy.init_node("temp")

topics = rospy.get_published_topics()
print(topics)
