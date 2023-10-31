#!/usr/bin/env python
import rospy
from common.srv import RecordPosition, RecordPositionRequest, RecordPositionResponse
import json


def record_position_client(data_file):
    rospy.wait_for_service("/zj_robot/record_position")
    try:
        record_position = rospy.ServiceProxy(
            "/zj_robot/record_position", RecordPosition)

        with open(data_file, "rb") as json_file:
            data = json_file.read()

        req = RecordPositionRequest()
        req.data.data = data
        resp = record_position(req)
        rospy.loginfo(f"Response: {resp.status_code}")
    except rospy.ServiceException as e:
        rospy.logerr(f"Service call failed: {e}")


if __name__ == "__main__":
    rospy.init_node("record_position_client",
                    xmlrpc_port=45167, tcpros_port=45168)
    data_file = "recorded_data_cli.json"  # 指定包含数据的JSON文件
    record_position_client(data_file)
