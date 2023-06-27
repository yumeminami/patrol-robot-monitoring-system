#！/usr/bin/env python3.8

# 功能需求：
# 1. 巡检过程能够被打断恢复

# 功能描述
# 1. 节点启动时读取巡检参数xml文档,获取巡检参数
# 2. 循环中持续读取参数个数刷新参数服务器，判断是否要更新参数服务器

# 引用
import rospy
import smach
import smach_ros
from common.msg import position_control
import xml.dom.minidom

# 定义全局变量
global xml_paser 
global patrolpoints 
global patrolpointindex
global gimbalpointindex

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
XMLPATH = "/home/zj/Project/zj-robot/src/zjrobot/patrolparam.xml"

def clearparam(): 
    rospy.set_param("patrol_state",0)
    rospy.set_param("target_position",0)
    rospy.set_param("target_velocity",0)
    rospy.set_param("target_gimbal_position",0)
    rospy.set_param("gimbal_point_index",0)
    rospy.set_param("patrol_point_index",0)

# 定义xml paser类
class XMLPaser:
    def __init__(self):
        pass
    # 使用minidom解析器打开 XML 文档
    def openxml(self,xmlpath):
        DOMTree      = xml.dom.minidom.parse(xmlpath)
        patrolpoints = DOMTree.documentElement
        if patrolpoints.hasAttribute("Intro"): 
            rospy.logdebug("Root element : %s" % patrolpoints.getAttribute("Intro"))
        # 在集合中获取所有巡检点
        patrolpoints = patrolpoints.getElementsByTagName("patrolpoint")
        rospy.logdebug("number of patrol points is %d" % len(patrolpoints))
        return patrolpoints

    # 打印每个巡检点的详细信息
    def printpatrolpoints(self,patrolpoints):
        for patrolpoint in patrolpoints: 
            rospy.logdebug ("*****patrol points*****")
            rospy.logdebug ("Index: %s" % patrolpoint.getAttribute("index"))
            rospy.logdebug ("target position 1: %s" % patrolpoint.getAttribute("position"))
            rospy.logdebug ("target velocity 1 : %s" % patrolpoint.getAttribute("velocity"))
            
            gimbalpoints = patrolpoint.getElementsByTagName("gimbalpoint")
            rospy.logdebug("number of gimbal points is %d" % len(gimbalpoints))
            for gimbalpoint in gimbalpoints: 
                rospy.logdebug("    *****gimbal points*****")
                rospy.logdebug ("    Index: %s" % gimbalpoint.getAttribute("index"))
                rospy.logdebug ("    target gimbal position 1: %s" % gimbalpoint.getAttribute("presetpoint"))
                # shootings = gimbalpoint.getElementsByTagName("shooting")
                # for shooting in shootings: 
                # alghrithm = shooting.getElementsByTagName('mvalghrithm')[0]
                #     print ("    alghrithm: %s" % alghrithm.childNodes[0].data)

    #获取巡检点数目
    def getpatrolpositionnumber(self,patrolpoints): 
        return len(patrolpoints)

    #获取第n个巡检点云台位置数目
    def getgimbalpositionnumber(self,patrolpoints,n): 
        return len(patrolpoints[n].getElementsByTagName("gimbalpoint"))

    #获取指定位置的patrol position巡检参数
    def getpatrolposition(self,patrolpoints,n): 
        return float(patrolpoints[n].getAttribute("position"))

    #获取指定位置的patrol velocity参数
    def getpatrolvelocity(self,patrolpoints,n): 
        return float(patrolpoints[n].getAttribute("velocity"))

    #获取指定的gimbal位置参数
    def getgimbalposition(self,patrolpoints,a,b): 
        gp = patrolpoints[a].getElementsByTagName("gimbalpoint")
        return int(gp[b].getAttribute("presetpoint"))

    # 更新参数服务器
    def updateparam(self,patrolpoints,n,m):
        rospy.set_param("patrol_point_index",0)
        rospy.set_param("gimbal_point_index",0)
        rospy.set_param("target_position",self.getpatrolposition(patrolpoints,n))
        rospy.set_param("target_velocity",self.getpatrolvelocity(patrolpoints,n))
        rospy.set_param("target_gimbal_position",self.getgimbalposition(patrolpoints,n,m))

    def clearparam(): 
        rospy.set_param("target_position",0)
        rospy.set_param("target_velocity",0)
        rospy.set_param("target_gimbal_position",0)
        rospy.set_param("gimbal_point_index",0)
        rospy.set_param("patrol_point_index",0)

# 定义state Initial
# 功能需求：
# 1. 检测到patrol_state = 1 时，判断为刚开始巡检，更新巡检参数序号，开始巡检
# 2. 检测到patrol_state = 2 时，判断为上次巡检未完成，不更新巡检参数序号，继续上次巡检
class Initial(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['initial_completed','initial_standby'])
    def execute(self, userdata):
        if rospy.get_param("patrol_state") == PATROL_REQUEST:
            rospy.set_param("patrol_state",PATROLING)
            global patrolpointindex
            global gimbalpointindex
            patrolpointindex = rospy.get_param("patrol_point_index")
            gimbalpointindex = rospy.get_param("gimbal_point_index")
            rospy.logdebug("patrolpointindex is %d" % patrolpointindex)
            rospy.logdebug("gimbalpointindex is %d" % gimbalpointindex)
            return 'initial_completed'
        elif rospy.get_param("patrol_state") == PATROLING:
            # 判断为上次巡检未完成，继续上次巡检
            rospy.logdebug("Continue last patrol")
            patrolpointindex = rospy.get_param("patrol_point_index")
            gimbalpointindex = rospy.get_param("gimbal_point_index")
            rospy.logdebug("patrolpointindex is %d" % patrolpointindex)
            rospy.logdebug("gimbalpointindex is %d" % gimbalpointindex)
            return 'initial_completed'
        elif rospy.get_param("patrol_state") == PATROL_STANDBY:
            return 'initial_standby'

# 定义state Preparation
# 功能需求：
# 1. 更新巡检参数
class Preparation(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['preparation_completed'])

    def execute(self, userdata):
        rospy.logdebug('STATE MACHINE: Executing state preparation')
        global patrolpointindex
        global gimbalpointindex
        rospy.set_param("target_position",xml_paser.getpatrolposition(patrolpoints,patrolpointindex))
        rospy.set_param("target_gimbal_position",xml_paser.getgimbalposition(patrolpoints,patrolpointindex,gimbalpointindex))
        rospy.set_param("target_velocity",xml_paser.getpatrolvelocity(patrolpoints,patrolpointindex))
        rospy.logdebug("target_position is %f" % rospy.get_param("target_position"))
        rospy.logdebug("target_gimbal_position is %d" % rospy.get_param("target_gimbal_position"))
        rospy.logdebug("target_velocity is %f" % rospy.get_param("target_velocity"))
        return 'preparation_completed'

# 定义state Motion
class Motion(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['motion_completed','motion_ing','motion_error'])
    def execute(self, userdata):
        if(rospy.get_param("motion_state")==0):
            rospy.set_param("motion_state",ACTION_REQUEST)
        rospy.sleep(1)
        rospy.logdebug('Executing state motion')
        if rospy.get_param("motion_state") == ACTION_COMPLETED:    
            rospy.set_param("motion_state",ACTION_STANDBY)
            return 'motion_completed'
        else:
            return 'motion_ing'

# 定义state gimbal
class Gimbal(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['gimbal_completed','gimbal_ing','gimbal_error'])

    def execute(self, userdata):
        if(rospy.get_param("gimbal_state")==0):
            rospy.set_param("gimbal_state",ACTION_REQUEST)
        rospy.logdebug('Executing state gimbal')
        if rospy.get_param("gimbal_state") == ACTION_COMPLETED:
            rospy.set_param("gimbal_state",ACTION_STANDBY)
            return 'gimbal_completed'
        else:
            return 'gimbal_ing'

# 定义state camera
class Camera(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['camera_completed','camera_ing','camera_error'])

    def execute(self, userdata):
        if(rospy.get_param("camera_state")==0):
            rospy.set_param("camera_state",ACTION_REQUEST)
        rospy.logdebug('Executing state camera')
        if rospy.get_param("camera_state") == ACTION_COMPLETED:
            rospy.set_param("camera_state",ACTION_STANDBY)
            return 'camera_completed'
        else:
            return 'camera_ing'

# 定义state detection
class Detection(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['detection_completed','detection_ing','detection_error'])

    def execute(self, userdata):
        if(rospy.get_param("detection_state")==0):
            rospy.set_param("detection_state",ACTION_REQUEST)
        rospy.logdebug('Executing state detection')
        if rospy.get_param("detection_state") == ACTION_COMPLETED:
            rospy.set_param("detection_state",ACTION_STANDBY)
            return 'detection_completed'
        else:
            return 'detection_ing'
    
# 定义state transition
# 功能：判断状态机流向
class Transition(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['more_gimbal_position','more_patrol_postion','nomore_patrol_point','more_patrol'])
    def execute(self, userdata):
        global patrolpointindex
        global gimbalpointindex
        if gimbalpointindex < xml_paser.getgimbalpositionnumber(patrolpoints,patrolpointindex)-1: 
            gimbalpointindex = gimbalpointindex + 1
            rospy.set_param("gimbal_point_index",gimbalpointindex)
            rospy.set_param("target_gimbal_position",xml_paser.getgimbalposition(patrolpoints,patrolpointindex,gimbalpointindex))
            return 'more_gimbal_position'
        elif gimbalpointindex == xml_paser.getgimbalpositionnumber(patrolpoints,patrolpointindex)-1 and patrolpointindex < len(patrolpoints)-1:
            patrolpointindex = patrolpointindex + 1
            gimbalpointindex = 0
            rospy.set_param("patrol_point_index",patrolpointindex)
            rospy.set_param("gimbal_point_index",gimbalpointindex)
            rospy.set_param("target_position",xml_paser.getpatrolposition(patrolpoints,patrolpointindex))
            rospy.set_param("target_velocity",xml_paser.getpatrolvelocity(patrolpoints,patrolpointindex))
            rospy.set_param("target_gimbal_position",xml_paser.getgimbalposition(patrolpoints,patrolpointindex,gimbalpointindex))
            return 'more_patrol_postion'
        elif patrolpointindex == len(patrolpoints)-1:
            if rospy.get_param("demo_mode")== 1:
                clearparam()
                rospy.set_param("patrol_state",PATROL_REQUEST)
                rospy.set_param("demo_mode",1)
                return 'more_patrol'
            return 'nomore_patrol_point'
        else:
            pass

# 定义state patrol_completed
class PatrolCompleted(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['patrol_completed'])

    def execute(self, userdata):
        #给运动节点发布消息让机器人回到初始位置
        pub = rospy.Publisher("position_command",position_control,queue_size=10)
        p = position_control()
        p.position_control_type = 0
        p.target_position_f = 0
        p.velocity_f = 400
        pub.publish(p)
        rospy.sleep(1)
        pub.publish(p)
        clearparam()

        rospy.logdebug('Executing state patrol_completed')
        return 'patrol_completed'

def main():
    rospy.init_node('normal_patrol_state_machine')
    rospy.loginfo("patrol state machine start")
    # 创建一个状态机
    sm = smach.StateMachine(outcomes=['end','patrol_request','patrol_error'])
    # 打开状态机容器
    with sm:
        # 添加状态机
        smach.StateMachine.add('INITIAL', Initial(), transitions={'initial_completed':'PREPARATION','initial_standby':'INITIAL'})
        smach.StateMachine.add('PREPARATION', Preparation(), transitions={'preparation_completed':'MOTION'})
        smach.StateMachine.add('MOTION', Motion(), transitions={'motion_completed':'GIMBAL','motion_ing':'MOTION','motion_error':'MOTION'})
        smach.StateMachine.add('GIMBAL', Gimbal(), transitions={'gimbal_completed':'CAMERA','gimbal_ing':'GIMBAL','gimbal_error':'GIMBAL'})
        smach.StateMachine.add('CAMERA', Camera(), transitions={'camera_completed':'DETECTION','camera_ing':'CAMERA','camera_error':'CAMERA'})
        smach.StateMachine.add('DETECTION', Detection(), transitions={'detection_completed':'TRANSITION','detection_ing':'DETECTION','detection_error':'patrol_error'})
        smach.StateMachine.add('TRANSITION', Transition(), transitions={'more_gimbal_position':'GIMBAL','more_patrol_postion':'MOTION','nomore_patrol_point':'PATROL_COMPLETED','more_patrol':'INITIAL'})
        smach.StateMachine.add('PATROL_COMPLETED', PatrolCompleted(), transitions={'patrol_completed':'end'})

    # 创建一个状态机的协调者
    sis = smach_ros.IntrospectionServer('patrol_state_machine', sm, '/PATROL_SM')
    sis.start()
    # 执行状态机
    outcome = sm.execute()
    rospy.spin()
    sis.stop()

#函数入口
if __name__ =="__main__":
    #延迟5s，等待log等级设置完成
    # rospy.sleep(3)
    #初始化节点
    rospy.loginfo("Normal patrol node start")

    xml_paser = XMLPaser()

    patrolpoints = xml_paser.openxml(XMLPATH)
    xml_paser.printpatrolpoints(patrolpoints)

    main()
