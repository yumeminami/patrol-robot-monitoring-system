import rospy
from std_msgs.msg import String


def xml_transmit_pub():
    # rospy.init_node("xml_transmit_pub", xmlrpc_port=45177, tcpros_port=45178)
    rospy.init_node("xml_transmit_pub")
    publisher = rospy.Publisher(
        "/zj_robot/xml_transmit_pub", String, queue_size=10
    )
    rate = rospy.Rate(1)
    while not rospy.is_shutdown():
        file_path = "output.xml"
        xml_str = None
        with open(file_path, "r") as f:
            xml_str = f.read()
        publisher.publish(xml_str)
        rate.sleep()
    rospy.spin()


if __name__ == "__main__":
    xml_transmit_pub()
