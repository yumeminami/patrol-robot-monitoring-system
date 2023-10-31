#!/usr/bin/env python
import rospy
from common.srv import RecordPosition, RecordPositionRequest, RecordPositionResponse
import json


def record_position(request):
    data = request.data.data
    data = json.loads(data)
    file_name = "recorded_data_server.json"
    with open(file_name, "w") as json_file:
        json.dump(data, json_file, indent=4)
    res = RecordPositionResponse()
    res.status_code = 1
    return res  # 处理成功


def record_position_server():
    rospy.init_node("record_position_server",
                    xmlrpc_port=45171, tcpros_port=45172)
    s = rospy.Service("record_position", RecordPosition, record_position)
    rospy.loginfo("Ready to record position.")
    rospy.spin()


if __name__ == "__main__":
    record_position_server()
