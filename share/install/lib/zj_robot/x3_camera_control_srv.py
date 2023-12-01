#!/usr/bin/env python3
#coding:utf-8
# import rospy
import sys
sys.path.append('../../../devel/lib/python3/dist-packages/')
import rospy
from common.srv import *
import sys
import os

import subprocess
import time
import threading
import json



"""

发送文件

状态:开始移动
开始位置:

状态:停止移动
停止位置:
"""




process = subprocess.Popen(["/home/zj/depends/LinuxSDK20230621/cameradk_linux_20220909/bin/CameraSDKTest"], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True, universal_newlines=True)
url1=""
url2=""
delete_flag=False
ns=""

record_flag=False
download_flag=False


def camera_control_callback(req):
    global process,ns,download_flag
    if req.camera_command==0:
        stop_recording(process)
        download_flag=True



    else:
        start_recording(process)

    resp=X3CameraControlResponse()
    resp.status_code=1
    return resp





def main_thread(process):
    global url1,url2,delete_flag
    # 启动命令行进程
    
    i=0
    while True:
        # 获取命令的输出
        try:
            output_line = process.stdout.readline()
            if output_line!="":
                print(output_line)
                pass
            import re
            ix = re.compile(r'^url:(.*)')

            r = re.search(ix, output_line)
            if r!=None:
                print(r.group(0))       # 完整正则匹配
                print(r.group(1))       # 第1个分组之间的取值 就是url
                if i==0:
                    url1=r.group(1)
                    print("匹配成功，url为:",url1)
                    i+=1
                else:
                    url2=r.group(1)
                    print("匹配成功，url为:",url2)
                    i=0


            ix = re.compile(r'^Deletion')

            r = re.search(ix, output_line)
            if r!=None:
                delete_flag=True
                print("删除成功:",delete_flag)


        except Exception:
            print("error")
            continue


            # # 如果输出中包含特定条件，例如 "Enter yes or no"，则发送 "yes" 给命令
            # if output_line.startswith("please enter index:"):
            #     print("okokok")
                # cmd=input("number?")
                # process.stdin.write("cmd\n")
                # process.stdin.flush()

        # if "please enter index:" in output_line:
        #     process.stdin.write("yes\n")
        #     process.stdin.flush()
        # elif "Another prompt" in output_line:
        #     process.stdin.write("no\n")
        #     process.stdin.flush()
            

    # 关闭子进程的标准输入，等待子进程结束
    process.stdin.close()
    process.wait()

    # 获取命令的返回码
    return_code = process.returncode
    print("Return Code:", return_code)



def start_recording(process):
    global record_flag
    process.stdin.write("6\n")
    process.stdin.flush()
    time.sleep(3)
    record_flag=True
    print("开始录制")


def stop_recording(process):
    global record_flag
    process.stdin.write("7\n")
    process.stdin.flush()
    time.sleep(4)
    record_flag=False
    print("结束录制")


def delv(process):
    print("发送4")
    process.stdin.write("4\n")
    process.stdin.flush()
    time.sleep(1)

    print("发送url")
    process.stdin.write("/DCIM/Camera01/IMG_20230922_062050_00_001.insp\n")
    process.stdin.flush()
    time.sleep(1)
    print("delv结束")



def delete_video(process):
    print("开始删除")
    global url1,url2,delete_flag
    process.stdin.write("4\n")
    process.stdin.flush()
    time.sleep(3)
    process.stdin.write(url1+"\n")
    process.stdin.flush()
    while(delete_flag!=True and not rospy.is_shutdown()):
        print(delete_flag)
        time.sleep(1)
        print("未删除")
    delete_flag=False
    print("删除完第一个视频")


    process.stdin.write("4\n")
    process.stdin.flush()
    time.sleep(3)
    process.stdin.write(url2+"\n")
    process.stdin.flush()
    while(delete_flag!=True and not rospy.is_shutdown()):
        time.sleep(1)
        print("未删除")
    delete_flag=False
    print("删除完第二个视频")
    print("删除完成")



def download_video(process):
    global url1,url2
    print("url1,url2:",url1,url2)
    download_url="http://localhost:9099"+url1
    print("download url:",download_url)
    os.system("cd /home/zj/Project/zj-robot/insta360_video && wget "+download_url)

    download_url="http://localhost:9099"+url2
    print("download url:",download_url)
    os.system("cd /home/zj/Project/zj-robot/insta360_video && wget "+download_url)
    print("视频发送成功")
    #删除视频
    delete_video(process)


    print("开始视频转换")
    input1=url1.split("/")[-1]
    input2=url2.split("/")[-1]
    #暂时注释
    os.system("cd /home/zj/Project/zj-robot/insta360_video && /home/zj/depends/LinuxSDK20230621/MediaSDK20230621/MediaSDK/bin/stitcherSDKDemo -inputs {0} {1} -output {2}".format(input1,input2,"a.mp4"))
    #删除
    #还没编写删除相机上的视频的程序
    os.system("cd /home/zj/Project/zj-robot/insta360_video && rm -rf {0} && rm -rf {1}".format(input1,input2))
    print("结束")

#开始移动秒数
#停止移动秒数

def record_thread():
    global record_flag,ns
    while not rospy.is_shutdown():
        if record_flag==True:
            #开始录制
            print("开始录制")
            record_list=[]
            start_time=time.time()
            last_state=rospy.get_param(ns+"position_control_state")
            last_pos=rospy.get_param(ns+"current_position")
            num=0
            while record_flag==True:
                num+=1
                this_state=rospy.get_param(ns+"position_control_state")
                if this_state==1 and last_state==0:
                    #运动停止0
                    print("运动停止")
                    this_time=time.time()
                    s=this_time-start_time
                    pos=rospy.get_param(ns+"current_position")
                    record_list.append((0,s,pos))
                    print("秒数",s)
                    last_pos=pos
                if this_state==0 and last_state==1:
                    #运动开始1
                    print("运动开始")
                    this_time=time.time()
                    s=this_time-start_time
                    if num==1:
                        pos=rospy.get_param(ns+"current_position")
                    else:
                        num=100#防止溢出
                        pos=last_pos
                    record_list.append((1,s,pos))
                    print("秒数",s)
                last_state=this_state
                time.sleep(0.01)
            #发送数组
            print("====================")
            print("录制结果")
            print(record_list)
            robot_state=[i[0] for i in record_list]
            position_time=[i[1] for i in record_list]
            position=[i[2] for i in record_list]
            data={}
            data["robot_state"]=robot_state
            data["time"]=position_time
            data["position"]=position
            with open("/home/zj/Project/zj-robot/src/zjrobot/record_position.json","w") as json_file:
                json.dump(data,json_file)

        time.sleep(0.1)


def download_thread():
    global download_flag,ns,process
    while not rospy.is_shutdown():
        if download_flag==True:
            rospy.set_param("video_conversion_state",1)
            download_video(process)
            time.sleep(1)
            rospy.set_param(ns+"panoramic_video_url","http://192.168.3.47:8000/a.mp4")
            # client = rospy.ServiceProxy(ns+"panoramic_video_url",PanoramicVideoUrl)
            # req = PanoramicVideoUrlRequest()
            # req.panoramic_video_url="http://192.168.3.47:8000/a.mp4"
            # try:
            #     client.call(req)
            #     print("视频发送成功")
            # except rospy.ServiceException:
            #     print("视频发送失败")


            #发送json文件表明文件已经传输成功
            client = rospy.ServiceProxy(ns+"record_position",RecordPosition)
            req = RecordPositionRequest()
            with open("/home/zj/Project/zj-robot/src/zjrobot/record_position.json", 'rb') as f:
                json_data = f.read()

            req.data.data=list(json_data)
            try:
                resp=client.call(req)
                rospy.loginfo("录制服务调用结果:%d",resp.status_code)
            except rospy.ServiceException:
                #服务调用失败
                print("服务调用失败")
            download_flag=False
            rospy.set_param("video_conversion_state",0)#转换完毕
        time.sleep(1)







if __name__ == "__main__":
    rospy.init_node("x3_camera_control_srv")
    ns=rospy.get_namespace()
    rospy.set_param("video_conversion_state",0)#视频转换状态0结束，1转换中
    ns="/zj_robot/"
    os.system("sudo chmod 666 /dev/bus/usb/001/00*")
    os.system("sudo chmod 666 /dev/bus/usb/002/00*")
    time.sleep(1)
    server = rospy.Service(ns+"x3_camera_control",X3CameraControl,camera_control_callback)
    os.system("cd /home/zj/Project/zj-robot/insta360_video &&   python3 -m http.server 8000 &")

    t=threading.Thread(target=main_thread,args=(process,))
    t2=threading.Thread(target=record_thread)
    t3=threading.Thread(target=download_thread)
    t.start()
    t2.start()
    t3.start()
    # time.sleep(5)
    # os.system('mpg123 /home/zj/Project/zj-robot/audio/任务完成.mp3')
    # time.sleep(3)
    # start_recording(process)
    # time.sleep(60)
    # stop_recording(process)
    # os.system('mpg123 /home/zj/Project/zj-robot/audio/任务完成.mp3')
    # download_video(process)

    rospy.spin()
    t.join()

