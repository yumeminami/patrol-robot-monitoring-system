from ros_interfaces.msg import SensorData

import rospy


rospy.init_node("robot", xmlrpc_port=45161, tcpros_port=45162)

pub = rospy.Publisher("robot/temperature", SensorData, queue_size=10)

rate = rospy.Rate(10)  # 10hz

while not rospy.is_shutdown():
    sensor_data = SensorData()
    # sensor_data.sensor_name = "temperature"
    sensor_data.value = 37
    pub.publish(sensor_data)
    rate.sleep()


print(SensorData)
print(SensorData.__slots__)
