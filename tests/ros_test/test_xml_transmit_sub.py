import rospy
from std_msgs.msg import String


def callback(data):
    file_name = "output_recieved.xml"
    msg = str(data.data)
    print(msg)
    with open(file_name, "w") as f:
        f.write(msg)


def xml_transmit_sub():
    rospy.init_node("xml_transmit_sub")
    rospy.Subscriber("/zj_robot/xml_transmit_pub", String, callback)
    while not rospy.is_shutdown():
        rospy.spin()


if __name__ == "__main__":
    xml_transmit_sub()
