#视频驱动的v2版本
import cv2
import queue
import time
import sys
import threading
import ctypes
sys.path.append('../../../devel/lib/python3/dist-packages/')
import rospy
from common.srv import *
import multiprocessing
from cv_bridge import CvBridge, CvBridgeError
from sensor_msgs.msg import Image
from datetime import  datetime

camera_cmd = multiprocessing.Manager().Value(ctypes.c_int, 0)
camera_cmd_2 = multiprocessing.Manager().Value(ctypes.c_int, 0)
camera_cmd.value=1
camera_cmd_2.value=0

# # 自定义无缓存读视频类
# class VideoCapture:
#     """Customized VideoCapture, always read latest frame"""
#     
#     def __init__(self, name):
#         self.cap = cv2.VideoCapture(name)
#         self.q = queue.Queue(maxsize=3)
#         self.stop_threads = False    # to gracefully close sub-thread
#         th = threading.Thread(target=self._reader)
#         th.daemon = True             # 设置工作线程为后台运行
#         th.start()
#
#     # 实时读帧，只保存最后一帧
#     def _reader(self):
#         while not self.stop_threads:
#             ret, frame = self.cap.read()
#             if not ret:
#                 break
#             if not self.q.empty():
#                 try:
#                     self.q.get_nowait() 
#                 except queue.Empty:
#                     pass
#             self.q.put(frame)
#
#     def read(self):
#         return self.q.get()
#     
#     def terminate(self):
#         self.stop_threads = True
#         self.cap.release()
#


def camera_control_callback(req):
    global camera_cmd
    rospy.loginfo("I heard:%s",req.camera_command)
    lock=multiprocessing.Lock()
    resp=CameraControlResponse()
    with lock:
        camera_cmd.value=req.camera_command
        camera_cmd_2.value=req.camera_command
    resp.status_code=1
    return resp

#预览
def camera_realplay_process_func(camera_cmd,img_pub):
    cap=None
    url=""
    while True:
        print("正在运行")
        time.sleep(1)
        if camera_cmd.value!=0:
            if camera_cmd.value==1 or camera_cmd.value==2 or camera_cmd.value==5:
                # 彩色预览
                url="rtsp://admin:zj123456@10.92.36.1/MPEG-4/ch1/main/av_stream"
                print("彩色预览")
            else:
                # 红外预览
                url="rtsp://admin:zj123456@10.92.36.1/MPEG-4/ch2/main/av_stream"
                print("红外预览")
            #使用自定义类进行预览，减少延迟
            cap = cv2.VideoCapture(url)
            fourcc = cv2.VideoWriter_fourcc(*'XVID')
            fps = cap.get(cv2.CAP_PROP_FPS)
            # fps = 10
            x=0.25
            #缩小后的size
            size = (int(cap.get(cv2.CAP_PROP_FRAME_WIDTH)*x),int(cap.get(cv2.CAP_PROP_FRAME_HEIGHT)*x))
            print(size)

            time_now=str(datetime.now()).replace(" ","")
            video_name='/home/zj/script/video/video_'+time_now+'.avi'
            rospy.set_param("video_path",video_name)
            out = cv2.VideoWriter(video_name,fourcc ,fps, size)
            num=0
            if camera_cmd.value==5 or camera_cmd.value==6:
                while True:
                    ret,frame = cap.read()
                    if camera_cmd.value==0:
                        cap.release()
                        out.release()
                        break
                    if ret==True:
                        image_new=cv2.resize(frame,size)#如果图片太大会影响写入速度,导致后半段没有写入
                        out.write(image_new)
            else:
                while True:
                    ret,frame = cap.read()
                    # x,y=frame.shape[0:2]
                    #image_new=cv2.resize(frame,(int(y/5),int(x/5)))
                    image_new=cv2.resize(frame,(640,480))
                    # print(x,y)
                    # # 显示处理后的视频帧
                    bridge = CvBridge()
                    img_msg=bridge.cv2_to_imgmsg(image_new,"bgr8")

                    # num+=1
                    # if num % 2 ==0:
                    #     img_pub.publish(img_msg)
                    #     num=0

                    img_pub.publish(img_msg)

                    if camera_cmd.value==0:
                        cap.release()
                        out.release()
                        break
                    #保存
                    if camera_cmd.value==2 or camera_cmd.value==4:
                        if ret==True:
                            out.write(frame)

            cv2.destroyAllWindows()



def ros_spin_process():
    rospy.spin()

if __name__ == "__main__":
    time.sleep(3)
    rospy.init_node("camear_control_srv")
    server = rospy.Service("camera_control",CameraControl,camera_control_callback)
    img_pub = rospy.Publisher("video_stream",Image,queue_size=10)

    ros_spin = multiprocessing.Process(target=ros_spin_process)

    ros_spin.start() #启动线程
    camera_realplay_process_func(camera_cmd,img_pub)
    ros_spin.join() #等待结束

