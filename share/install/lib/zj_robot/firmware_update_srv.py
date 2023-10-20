#!/usr/bin/env python3
#固件更新服务，调用通知服务并将bin存入文件
import rospy
import sys
sys.path.append('../../../devel/lib/python3/dist-packages/')
from common.srv import *
import subprocess
import time
import os

ns=""

def SentFileToSTM32(serial_port,file_path):
    cmd="/home/zj/depends/SerialPortYmodem_V2/build-SerialPortYmodem-Desktop-Debug/SerialPortYmodem {0} {1}".format(serial_port,file_path)
    print(cmd)
    process=subprocess.Popen(cmd,stdout=subprocess.PIPE,shell=True,universal_newlines=True)
    #循环读取输出
    while True:
        output=process.stdout.readline()
        if not output:
            break
        print(output,end="")

        if "文件发送成功" in output:
            print("终止进程")
            process.terminate()
            process.wait()
            return 1

        if "文件发送失败" in output:
            print("终止进程")
            process.terminate()
            process.wait()
            return 0

def upgrade_file_callback(req):
    print("received upgrade file")
    #写入文件
    upgrade_bin = bytes(req.upgrade_file.data)
    file_path="/home/zj/Project/zj-robot/src/zjrobot/zj_robot.bin"
    with open(file_path, 'wb') as f:
        f.write(upgrade_bin)

    serial_port=""
    topic_name=""
    node_name=""
    launch_cmd=""
    if req.board_type==0:
        #运动控制板
        print("运动控制板")
        serial_port="/dev/ttyS0"
        topic_name="firmware_update_motion"
        node_name="motion_control_node"
        launch_cmd="roslaunch zj_robot  motion.launch &"

    else:
        #传感器板
        print("传感器板")
        serial_port="/dev/ttyS1"
        topic_name="firmware_update_sensor"
        node_name="sensor_node"
        launch_cmd="roslaunch zj_robot  sensor.launch &"


    firmware_update_client = rospy.ServiceProxy(topic_name, FirmwareUpdate)
    r=firmware_update_client("update")
    print("固件更新通知消息发送是否成功：",r.status_code)
    resp=UpgradeResponse()
    time.sleep(2)
    if r.status_code==1:
        if SentFileToSTM32(serial_port,file_path)==1:
            print("固件更新成功")
            print("重启节点中")
            os.system("rosnode kill "+ns+node_name)
            time.sleep(5)
            os.system(launch_cmd)
            resp.status_code=1

        else:
            resp.status_code=0
            print("固件更新失败")
    else:
        print("通知发送失败")
        resp.status_code=0
        print("固件更新失败")

    return resp


if __name__ == '__main__':
    rospy.init_node("firmware_update_srv")
    ns=rospy.get_namespace()
    server = rospy.Service("upgrade",Upgrade,upgrade_file_callback)
    rospy.spin()

