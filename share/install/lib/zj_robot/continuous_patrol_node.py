#！/usr/bin/env python3.8

#continuous patrol

import rospy
import sys
from rospy.core import rospydebug
sys.path.append('../../../devel/lib/python3/dist-packages/')
import smach
import smach_ros
from common.msg import position_control
from common.srv import *
import threading
import time
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import cv2

import xml.dom.minidom


xml_str="""
<?xml version='1.0' encoding='utf-8'?>
<patrolsections Intro="226">
  <patrolsection index="1" startposition="2000" endposition="3000" velocity="300">
    <gimbalpoint index="7" presetpoint="1">
      <takepicture index="1" param="takepictureparam1" />
      <takevideo index="2" param="takevideoparam2" />
      <recordvoice index="3" param="recordvoiceparam3" />
    </gimbalpoint>
  </patrolsection>

  <patrolsection index="2" startposition="5000" endposition="6000" velocity="300">
    <gimbalpoint index="7" presetpoint="1">
      <takepicture index="1" param="takepictureparam1" />
      <takevideo index="2" param="takevideoparam2" />
      <recordvoice index="3" param="recordvoiceparam3" />
    </gimbalpoint>
  </patrolsection>

</patrolsections>
"""

global patrol_section_index

PATROL_STANDBY               = 0
PATROL_REQUEST               = 1
PATROLING                    = 2
CURRENT_GIMBAL_POSITION_DONE = 3
CURRENT_POSITION_DONE        = 4
PATROL_DONE                  = 5
ACTION_STANDBY = 0
ACTION_REQUEST               = 1
ACTION_ING                   = 2
ACTION_COMPLETED             = 3


# xml 路径
XMLPATH = "/home/zj/Project/zj-robot/src/zjrobot/test02.xml"


def clearparam(): 
    rospy.set_param("continuous_patrol_state",0)
    rospy.set_param("charge_state",0)
    rospy.set_param("target_position",0)
    rospy.set_param("target_velocity",0)

# 定义xml paser类
class XMLPaser:
    def __init__(self):
        self.docElement=None
        pass
    # 使用minidom解析器打开 XML 文档
    def openxml(self,xmlpath):
        DOMTree      = xml.dom.minidom.parse(xmlpath)
        patrolpoints = DOMTree.documentElement
        self.docElement=patrolpoints
        if patrolpoints.hasAttribute("Intro"): 
            rospy.logdebug("Root element : %s" % patrolpoints.getAttribute("Intro"))

        patrolpoints = patrolpoints.getElementsByTagName("patrolsection")
        return patrolpoints

    # 打印每个巡检点的详细信息
    def printpatrolpoints(self,patrolpoints):
        # for patrolpoint in patrolpoints: 
        #     rospy.logdebug ("*****patrol points*****")
        #     rospy.logdebug ("Index: %s" % patrolpoint.getAttribute("index"))
        #     rospy.logdebug ("target position 1: %s" % patrolpoint.getAttribute("position"))
        #     rospy.logdebug ("target velocity 1 : %s" % patrolpoint.getAttribute("velocity"))
        #     
        #     gimbalpoints = patrolpoint.getElementsByTagName("gimbalpoint")
        #     rospy.logdebug("number of gimbal points is %d" % len(gimbalpoints))
        #     for gimbalpoint in gimbalpoints: 
        #         rospy.logdebug("    *****gimbal points*****")
        #         rospy.logdebug ("    Index: %s" % gimbalpoint.getAttribute("index"))
        #         rospy.logdebug ("    target gimbal position 1: %s" % gimbalpoint.getAttribute("presetpoint"))
        #         # shootings = gimbalpoint.getElementsByTagName("shooting")
        #         # for shooting in shootings: 
        #         # alghrithm = shooting.getElementsByTagName('mvalghrithm')[0]
        #         #     print ("    alghrithm: %s" % alghrithm.childNodes[0].data)
        pass

    #获取巡检点数目
    def get_patrol_section_number(self,patrolpoints): 
        return len(patrolpoints)

    #获取任务名称
    def get_patrol_task_name(self):
        print("获取巡检任务名称")
        return self.docElement.getAttribute("Intro")

    def get_patrol_start_position(self,patrolpoints,n):
        return float(patrolpoints[n].getAttribute("startposition"))


    def get_patrol_end_position(self,patrolpoints,n):
        return float(patrolpoints[n].getAttribute("endposition"))
    
    def get_patrol_velocity(self,patrolpoints,n):
        return float(patrolpoints[n].getAttribute("velocity"))

    def get_gimbal_position(self,patrolpoints,n):
        return int(patrolpoints[n].getAttribute("gimbalpresetpoint"))


    def get_patrol_section_index(self,patrolpoints,n): 
        return int(patrolpoints[n].getAttribute("index"))




# 定义state Initial
# 功能需求：
# 1. 检测到 continuous_patrol_state = 1 时，判断为刚开始巡检，更新巡检参数序号，开始巡检
class Initial(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['initial_completed','initial_standby'])
    def execute(self, userdata):
        time.sleep(0.5)
        if rospy.get_param("continuous_patrol_state") == PATROL_REQUEST:
            rospy.set_param("continuous_patrol_state",PATROLING)
            return 'initial_completed'
        else:
            return 'initial_standby'


# 定义state Preparation
# 功能需求：
# 1. 更新巡检参数
class Preparation(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['preparation_completed'])

    def execute(self, userdata):

        xml_paser = XMLPaser()
        patrolpoints = xml_paser.openxml(XMLPATH)
        xml_paser.printpatrolpoints(patrolpoints)
        rospy.set_param("continuous_patrol_task_name",xml_paser.get_patrol_task_name())

        global patrol_section_index
        patrol_section_index=0
        return 'preparation_completed'


class Gimbal(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['gimbal_completed','gimbal_ing','gimbal_error'])

    def execute(self, userdata):
        global patrol_section_index
        xml_paser = XMLPaser()
        patrolpoints = xml_paser.openxml(XMLPATH)
        xml_paser.printpatrolpoints(patrolpoints)

        rospy.set_param("target_gimbal_position",xml_paser.get_gimbal_position(patrolpoints,patrol_section_index))
        if(rospy.get_param("gimbal_state")==0):
            rospy.set_param("gimbal_state",ACTION_REQUEST)
        rospy.logdebug('Executing state gimbal')
        if rospy.get_param("gimbal_state") == ACTION_COMPLETED:
            rospy.set_param("gimbal_state",ACTION_STANDBY)
            return 'gimbal_completed'
        else:
            return 'gimbal_ing'





# 定义state Motion
class Motion_start(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['motion_start_completed','motion_start_ing','motion_start_error'])
    def execute(self, userdata):


        global patrol_section_index
        xml_paser = XMLPaser()
        patrolpoints = xml_paser.openxml(XMLPATH)
        xml_paser.printpatrolpoints(patrolpoints)
        rospy.set_param("continuous_patrol_task_name",xml_paser.get_patrol_task_name())
        rospy.set_param("target_position",xml_paser.get_patrol_start_position(patrolpoints,patrol_section_index))
        # rospy.set_param("target_gimbal_position",xml_paser.getgimbalposition(patrolpoints,patrolpointindex,gimbalpointindex))
        rospy.set_param("target_velocity",xml_paser.get_patrol_velocity(patrolpoints,patrol_section_index))


        if(rospy.get_param("motion_state")==0):
            rospy.set_param("motion_state",ACTION_REQUEST)
        rospy.sleep(1)
        rospy.logdebug('Executing state motion')
        if rospy.get_param("motion_state") == ACTION_COMPLETED:    
            rospy.set_param("motion_state",ACTION_STANDBY)
            return 'motion_start_completed'
        else:
            return 'motion_start_ing'


# 定义state camera start
class Camera_start(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['camera_start_completed'])

    def execute(self, userdata):
        global patrolpointindex

        xml_paser = XMLPaser()
        patrolpoints = xml_paser.openxml(XMLPATH)
        xml_paser.printpatrolpoints(patrolpoints)
        client = rospy.ServiceProxy("camera_control",CameraControl)
        req = CameraControlRequest()
        req.camera_command=5# 2:彩色相机预览+保存

        resp=client.call(req)
        rospy.loginfo("相机服务调用结果:%d",resp.status_code)
        time.sleep(5)
        return 'camera_start_completed'


# 定义state Motion
class Motion_end(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['motion_end_completed','motion_end_ing','motion_end_error'])
    def execute(self, userdata):

        global patrol_section_index
        xml_paser = XMLPaser()
        patrolpoints = xml_paser.openxml(XMLPATH)
        xml_paser.printpatrolpoints(patrolpoints)
        rospy.set_param("continuous_patrol_task_name",xml_paser.get_patrol_task_name())
        rospy.set_param("target_position",xml_paser.get_patrol_end_position(patrolpoints,patrol_section_index))
        # rospy.set_param("target_gimbal_position",xml_paser.getgimbalposition(patrolpoints,patrolpointindex,gimbalpointindex))
        rospy.set_param("target_velocity",xml_paser.get_patrol_velocity(patrolpoints,patrol_section_index))

        if(rospy.get_param("motion_state")==0):
            rospy.set_param("motion_state",ACTION_REQUEST)


        rospy.sleep(1)
        rospy.logdebug('Executing state motion')
        if rospy.get_param("motion_state") == ACTION_COMPLETED:    
            rospy.set_param("motion_state",ACTION_STANDBY)
            return 'motion_end_completed'
        else:
            return 'motion_end_ing'



# 定义state camera start
class Camera_end(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['camera_end_completed'])

    def execute(self, userdata):
        time.sleep(4)
        global patrolpointindex

        xml_paser = XMLPaser()
        patrolpoints = xml_paser.openxml(XMLPATH)
        xml_paser.printpatrolpoints(patrolpoints)

        client = rospy.ServiceProxy("camera_control",CameraControl)
        req = CameraControlRequest()
        req.camera_command=0# 0:停止

        resp=client.call(req)
        rospy.loginfo("相机服务调用结果:%d",resp.status_code)



        #发送视频给后台
        client = rospy.ServiceProxy("video_data",VideoData)
        req = VideoDataRequest()

        req.patrol_task_name=rospy.get_param("continuous_patrol_task_name")
        req.patrol_section_index=xml_paser.get_patrol_section_index(patrolpoints,patrol_section_index)
        video_path =rospy.get_param("video_path")

        with open(video_path, 'rb') as f:
            video_data = f.read()

        req.video_data.data=list(video_data)
        try:
            resp = client.call(req)
            rospy.loginfo("响应结果:%d",resp.status_code)
            print("视频发送成功")
        except rospy.ServiceException:
            print("视频发送失败")

        return 'camera_end_completed'



# 定义state transition
# 功能：判断状态机流向
class Transition(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['more_patrol_section','nomore_patrol_section'])
    def execute(self, userdata):
        global patrol_section_index

        xml_paser = XMLPaser()
        patrolpoints = xml_paser.openxml(XMLPATH)
        xml_paser.printpatrolpoints(patrolpoints)

        if patrol_section_index < len(patrolpoints)-1:
            patrol_section_index = patrol_section_index + 1
            return 'more_patrol_section'
        elif patrol_section_index == len(patrolpoints)-1:
            return 'nomore_patrol_section'
        else:
            pass

# 定义state patrol_completed
class PatrolCompleted(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['patrol_completed'])

    def execute(self, userdata):
        #给运动节点发布消息让机器人回到初始位置

        server = rospy.ServiceProxy('position_command', PositionControl)

        # resp1 = server(1,500,100)
        resp1 = server(0,0,200)
        print("resp1.status_code")
        print(resp1.status_code)

        while(rospy.get_param("position_control_state")==1):
            print("机器刚启动")
            time.sleep(0.5)

        while(rospy.get_param("position_control_state")==0):
            print("机器运动中")
            time.sleep(0.5)


        clearparam()

        rospy.logdebug('Executing state patrol_completed')
        return 'patrol_completed'






def ros_spin_process():
    rospy.spin()

def receive_data(req):
    rospy.loginfo("收到xml数据")
    resp=ContinousXmlDataResponse()
    print(req.data)

    try:

        with open(XMLPATH, 'w') as f:
            f.write(req.data)
        rospy.loginfo("xml file received and saved successfully")

        # xml_paser = XMLPaser()
        # patrolpoints = xml_paser.openxml(XMLPATH)
        # xml_paser.printpatrolpoints(patrolpoints)

    except ioerror:
        rospy.logerr("failed to save xml file")
        resp.status_code=0
    else:
        resp.status_code=1

    return resp


def main():
    clearparam()

    rospy.loginfo("continuous patrol state machine start")
    # 创建一个状态机
    sm = smach.StateMachine(outcomes=['end','patrol_request','patrol_error'])
    # 打开状态机容器
    with sm:
        # 添加状态机
        smach.StateMachine.add('CONTINUOUS_INITIAL', Initial(), transitions={'initial_completed':'PREPARATION','initial_standby':'CONTINUOUS_INITIAL'})
        smach.StateMachine.add('PREPARATION', Preparation(), transitions={'preparation_completed':'GIMBAL'})
        smach.StateMachine.add('GIMBAL', Gimbal(), transitions={'gimbal_completed':'MOTION_START','gimbal_ing':'GIMBAL','gimbal_error':'GIMBAL'})
        smach.StateMachine.add('MOTION_START', Motion_start(), transitions={'motion_start_completed':'CAMERA_START','motion_start_ing':'MOTION_START','motion_start_error':'MOTION_START'})

        smach.StateMachine.add('CAMERA_START', Camera_start(), transitions={'camera_start_completed':'MOTION_END'})
        
        smach.StateMachine.add('MOTION_END', Motion_end(), transitions={'motion_end_completed':'CAMERA_END','motion_end_ing':'MOTION_END','motion_end_error':'MOTION_END'})

        smach.StateMachine.add('CAMERA_END', Camera_end(), transitions={'camera_end_completed':'TRANSITION'})
        smach.StateMachine.add('TRANSITION', Transition(), transitions={'more_patrol_section':'MOTION_START','nomore_patrol_section':'PATROL_COMPLETED'})
        smach.StateMachine.add('PATROL_COMPLETED', PatrolCompleted(), transitions={'patrol_completed':'CONTINUOUS_INITIAL'})

    # 创建一个状态机的协调者
    sis = smach_ros.IntrospectionServer('patrol_state_machine', sm, '/PATROL_SM')
    sis.start()
    # 执行状态机
    outcome = sm.execute()
    rospy.spin()
    sis.stop()


if __name__ == "__main__":
    rospy.init_node('continuous_patrol_state_machine')

    xml_paser = XMLPaser()
    patrolpoints = xml_paser.openxml(XMLPATH)
    xml_paser.printpatrolpoints(patrolpoints)

    server = rospy.Service("continuous_xml_data",ContinousXmlData,receive_data)














    ros_spin = threading.Thread(target=ros_spin_process)
    ros_spin.start() #启动线程
    rospy.loginfo("continuous patrol node start")

    main()
    ros_spin.join() #等待结束














    #jiazhige



















