import rospy

from common.msg import sensor_data
from common.msg import robot_real_time_info

# print(sensor_data)
# print(sensor_data.__slots__)

rospy.init_node("zj_robot", xmlrpc_port=45167, tcpros_port=45168)

pub = rospy.Publisher(
    "{robot}/sensor_data".format(robot="zj_robot"), sensor_data, queue_size=10
)

pub2 = rospy.Publisher(
    "{robot}/robot_real_time_info".format(robot="zj_robot"),
    robot_real_time_info,
    queue_size=10,
)


msg = sensor_data()
msg.temperature = 30.0
msg.humidity = 50
msg.light = 50
msg.PM1_0 = 4
msg.PM2_5 = 10
msg.PM10 = 20
msg.smoke1 = 0
msg.smoke2 = 0

# print(msg.temperature)

msg2 = robot_real_time_info()
msg2.position = 0
msg2.velocity = 0
msg2.position_control_state = 0
msg2.battery_state = 1
msg2.battery_level = 100


rate = rospy.Rate(1)
while not rospy.is_shutdown():
    pub.publish(msg)
    pub2.publish(msg2)
    rate.sleep()
    # print(msg)
