#! /usr/bin/env python3.8
# 功能需求：
# 自动充电功能

# 引用
import rospy
import sys
from rospy.core import rospydebug
sys.path.append('../../../devel/lib/python3/dist-packages/')
sys.path.append('/home/zj/Project/zj-robot/src/zjrobot/scripts')

import smach
import smach_ros
from common.msg import *
from common.srv import *
import threading
import time
from sensor_msgs.msg import Image
import xml.dom.minidom
import os


from motion import move_to_target_position,move
from motion import *


# 定义全局变量
global xml_paser 

global goal_position
global docking_position
global current_position

docking_position=[2859]

xml_paser=None

CHARGE_STANDBY               = 0
CHARGE_REQUEST               = 1
CHARGEING                    = 2
CURRENT_GIMBAL_POSITION_DONE = 3
CURRENT_POSITION_DONE        = 4
PATROL_DONE                  = 5
ACTION_STANDBY = 0
ACTION_REQUEST               = 1
ACTION_ING                   = 2
ACTION_COMPLETED             = 3

# xml 路径
XMLPATH = "/home/zj/Project/zj-robot/src/zjrobot/test01.xml"
rospy.set_param("stop_charge_flag",0)

def clearparam(): 
    rospy.set_param("charge_state",0)


# # 机器人运动直到结束
# def move_to_target_position(control_type,target_position,target_velocity):
#     pos_ctrl_cli = rospy.ServiceProxy('position_command', PositionControl)
#     resp1 = pos_ctrl_cli(control_type,target_position,target_velocity)
#     current_pos=rospy.get_param("current_position")#防止机器人静止的问题
#     position_error=current_pos-target_position
#     print("position_error:",position_error)
#     while(rospy.get_param("position_control_state")==1):
#         current_pos=rospy.get_param("current_position")
#         position_error=current_pos-target_position
#         print("机器刚启动")
#         print("position_error:",abs(position_error))
#         if abs(position_error)<20:
#             break
#         time.sleep(0.5)
#
#     while(rospy.get_param("position_control_state")==0):
#         print("机器运动中")
#         time.sleep(0.5)
#
#     print("机器运动结束")
#


# 定义state Initial
# 功能需求：
# 1. 检测到patrol_state = 1 时，判断为刚开始巡检，更新巡检参数序号，开始巡检
# 2. 检测到patrol_state = 2 时，判断为上次巡检未完成，不更新巡检参数序号，继续上次巡检
class ChargePreparation(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['charge_preparation_completed','charge_preparation_standby'])
    def execute(self, userdata):
        global current_position
        current_position=rospy.get_param("current_position")
        time.sleep(0.5)
        if rospy.get_param("charge_state") == CHARGE_REQUEST:
            rospy.set_param("charge_state",CHARGEING)
            os.system('mpg123 /home/zj/Project/zj-robot/audio/进入自动充电模式.mp3')
            #关闭状态机节点
            client = rospy.ServiceProxy("patrol_control",PatrolControl)
            req = PatrolControlRequest()
            req.patrol_command=0
            resp = client.call(req)


            #关闭连续巡检节点
            client = rospy.ServiceProxy("patrol_control",PatrolControl)
            req = PatrolControlRequest()
            req.patrol_command=5
            resp = client.call(req)

            #重新读取充电桩位置


            return 'charge_preparation_completed'
        else:
            return 'charge_preparation_standby'

class SearchDockingPosition(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['search_completed'])
    def execute(self, userdata):
        global goal_position
        map_data=read_json_file("/home/zj/Project/zj-robot/src/zjrobot/mapdata.json")

        #查找最近充电桩
        docking_position=[v for k,v in map_data["charging_station"].items()]
        cur_pos=rospy.get_param("current_position")
        distance=[abs(charge_station-cur_pos) for charge_station in docking_position]
        ind=distance.index(min(distance))
        goal_position=docking_position[ind]-100

        return 'search_completed'


class MoveToDockingPosition(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['move_to_docking_position_completed'])
    def execute(self, userdata):
        # if(rospy.get_param("motion_state")==0):
            #运动填充参数
            # rospy.set_param("target_position",goal_position)
            # rospy.set_param("target_velocity",200)
            # rospy.set_param("motion_state",ACTION_REQUEST)


        # move_to_target_position(0,goal_position,200)

        move(goal_position,200)
        # pos_ctrl_cli = rospy.ServiceProxy('position_command', PositionControl)
        # resp1 = pos_ctrl_cli(0,goal_position,200)
        #
        # while(rospy.get_param("position_control_state")==1):
        #     print("机器刚启动")
        #     time.sleep(0.5)
        #
        # while(rospy.get_param("position_control_state")==0):
        #     print("机器运动中")
        #     time.sleep(0.5)
        #
        # print("机器运动结束")
        return 'move_to_docking_position_completed'


class Dock(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['dock_completed','dock_ing'])
    def execute(self, userdata):
        print("往前走")
        pos_ctrl_cli = rospy.ServiceProxy('position_command', PositionControl)
        resp1 = pos_ctrl_cli(1,500,50)
        rospy.sleep(1)
        print("往前走中")
        while(rospy.get_param("position_control_state")==1):
            time.sleep(0.5)
            print("机器刚启动")
            pass

        print("机器运动中")
        while(rospy.get_param("position_control_state")==0):
            if rospy.get_param("metal_sensor_state1")==0:
                print("检测到金属传感器")
                print("停止")
                stop_ctrl_cli = rospy.ServiceProxy('stop_command', StopControl)
                resp = stop_ctrl_cli(2)
                os.system('mpg123 /home/zj/Project/zj-robot/audio/检测到金属传感器.mp3')
                return 'dock_completed'

        print("往后走")
        pos_ctrl_cli = rospy.ServiceProxy('position_command', PositionControl)
        resp1 = pos_ctrl_cli(1,-500,50)
        rospy.sleep(1)
        print("往前走中")
        while(rospy.get_param("position_control_state")==1):
            time.sleep(0.5)
            print("机器刚启动")
            pass

        print("机器运动中")
        while(rospy.get_param("position_control_state")==0):
            if rospy.get_param("metal_sensor_state1")==0:
                print("检测到金属传感器")
                print("停止")
                stop_ctrl_cli = rospy.ServiceProxy('stop_command', StopControl)
                resp = stop_ctrl_cli(2)
                os.system('mpg123 /home/zj/Project/zj-robot/audio/检测到金属传感器.mp3')
                return 'dock_completed'
        else:
            return 'dock_ing'

def charge_control_func(cmd):#1开启充电，0关闭充电
    charge_pub = rospy.Publisher("charge_command",charge_control,queue_size=10)
    msg = charge_control()  #创建 msg 对象
    num=0
    if cmd==1:
        msg.charge_command=1
        charge_pub.publish(msg)
        print("启动充电")
        time.sleep(1)
        while not rospy.is_shutdown() and num<10:
            num+=1
            #检测中
            print("检测中")
            battery_state=rospy.get_param("battery_state")
            if battery_state==0:
                print("确定启动充电")
                os.system('mpg123 /home/zj/Project/zj-robot/audio/开始充电.mp3')
                break
            charge_pub.publish(msg)
            time.sleep(10)
        if num==10:
            return False
        else:
            return True
    else:
        msg.charge_command=2
        charge_pub.publish(msg)
        print("关闭充电")
        time.sleep(1)
        while not rospy.is_shutdown() and num<10:
            num+=1
            #检测中
            print("检测中")
            battery_state=rospy.get_param("/zj_robot/battery_state")
            print(battery_state)

            if battery_state==1:
                print("确定关闭充电")
                os.system('mpg123 /home/zj/Project/zj-robot/audio/结束充电.mp3')
                break
            time.sleep(20)
            charge_pub.publish(msg)
        if num==10:
            return False
        else:
            return True
        


class StartCharging(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['start_charging_completed'])

    def execute(self, userdata):

        # charge_pub = rospy.Publisher("charge_command",charge_control,queue_size=10)
        # msg = charge_control()  #创建 msg 对象
        # msg.charge_command=1
        # charge_pub.publish(msg)
        # print("启动充电")
        # time.sleep(1)
        # while not rospy.is_shutdown():
        #     #检测中
        #     print("检测中")
        #     battery_state=rospy.get_param("battery_state")
        #     if battery_state==0:
        #         print("确定启动充电")
        #         os.system('mpg123 /home/zj/Project/zj-robot/audio/开始充电.mp3')
        #         return "start_charging_completed"
        #     charge_pub.publish(msg)
        #     time.sleep(10)
        #
        r=retry_and_report_error(charge_control_func,(1,),1,5,"无法开启充电","/home/zj/Project/zj-robot/audio/故障警报，无法开启充电.mp3")
        while r==False:
            r=retry_and_report_error(charge_control_func,(1,),1,5,"无法开启充电","/home/zj/Project/zj-robot/audio/故障警报，无法开启充电.mp3")
        return "start_charging_completed"



# class EndCharging(smach.State):
#     def __init__(self):
#         smach.State.__init__(self, outcomes=['end_charging_completed'])
#
#     def execute(self, userdata):
#         charge_pub = rospy.Publisher("charge_command",charge_control,queue_size=10)
#         msg = charge_control()  #创建 msg 对象
#         msg.charge_command=0
#         charge_pub.publish(msg)
#         print("结束充电")
#         time.sleep(1)
#         while True:
#             #检测中
#             print("检测中")
#             battery_state=rospy.get_param("battery_state")
#             if battery_state==1:
#                 print("确定结束充电")
#                 return "start_charging_completed"
#             charge_pub.publish(msg)
#             time.sleep(1)
#



class WaitForCharging(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['wait_for_charging_completed'])
    def execute(self, userdata):
        print("等待充电")
        i=1
        while rospy.get_param("battery_level")<90 and rospy.get_param("stop_charge_flag")==0:
            if rospy.is_shutdown():
                break
            i+=1
            time.sleep(1)
            if i%30==0:
                i=0
                os.system('mpg123 /home/zj/Project/zj-robot/audio/机器人当前电量为.mp3')
                bl=rospy.get_param("battery_level")
                play_number(str(bl))




        #充电结束按钮

        # charge_pub = rospy.Publisher("charge_command",charge_control,queue_size=10)
        # msg = charge_control()  #创建 msg 对象
        # # # #
        # msg.charge_command=2
        # charge_pub.publish(msg)
        # print("关闭充电")
        # time.sleep(1)
        # while not rospy.is_shutdown():
        #     #检测中
        #     print("检测中")
        #     battery_state=rospy.get_param("/zj_robot/battery_state")
        #     print(battery_state)
        #
        #     if battery_state==1:
        #         print("确定关闭充电")
        #         os.system('mpg123 /home/zj/Project/zj-robot/audio/结束充电.mp3')
        #         break
        #     time.sleep(20)
        #     charge_pub.publish(msg)
        r=retry_and_report_error(charge_control_func,(0,),1,6,"无法关闭充电","/home/zj/Project/zj-robot/audio/故障警报，无法关闭充电.mp3")
        while r==False:
            r=retry_and_report_error(charge_control_func,(0,),1,6,"无法关闭充电","/home/zj/Project/zj-robot/audio/故障警报，无法关闭充电.mp3")
        
        time.sleep(1)#必须加一秒，不然运动会失败
        rospy.set_param("charge_state",CHARGE_STANDBY)
        time.sleep(2)
        rospy.set_param("stop_charge_flag",0)
        return "wait_for_charging_completed"


class BackToWork(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['back_to_work_completed'])
    def execute(self, userdata):
        global current_position
        target_position=0
        if rospy.get_param("patrol_state")==0 and rospy.get_param("continuous_patrol_state")==0:
            print("回到原点待命")
            target_position=0
        else:
            print("回到工作位置")
            target_position=current_position

        move(target_position,200)
        print("回到工作位置")
        time.sleep(2)
        #恢复连续巡检节点
        client = rospy.ServiceProxy("patrol_control",PatrolControl)
        req = PatrolControlRequest()
        req.patrol_command=4
        resp = client.call(req)
        #恢复正常巡检节点
        client = rospy.ServiceProxy("patrol_control",PatrolControl)
        req = PatrolControlRequest()
        req.patrol_command=2
        resp = client.call(req)

        time.sleep(5)
        print("重启结束")
        print("重启结束")
        print("重启结束")
        print("重启结束")
        print("重启结束")
        print("重启结束")
        print("重启结束")
        clearparam()
        return "back_to_work_completed"


def main():

    rospy.loginfo("charge state machine start")
    # 创建一个状态机
    sm = smach.StateMachine(outcomes=['end','charge_request','charge_error'])
    clearparam()
    # 打开状态机容器
    with sm:
        # 添加状态机
        smach.StateMachine.add('ChargePreparation', ChargePreparation(), transitions={'charge_preparation_completed':'SearchDockingPosition','charge_preparation_standby':'ChargePreparation'})
        smach.StateMachine.add('SearchDockingPosition', SearchDockingPosition(), transitions={'search_completed':'MoveToDockingPosition'})
        smach.StateMachine.add('MoveToDockingPosition', MoveToDockingPosition(), transitions={'move_to_docking_position_completed':'Dock'})

        smach.StateMachine.add('Dock', Dock(), transitions={'dock_completed':'StartCharging','dock_ing':'Dock'})
        smach.StateMachine.add('StartCharging', StartCharging(), transitions={'start_charging_completed':'WaitForCharging'})
        smach.StateMachine.add('WaitForCharging', WaitForCharging(), transitions={'wait_for_charging_completed':'BackToWork'})

        # smach.StateMachine.add('EndCharging', EndCharging(), transitions={'end_charging_completed':'BackToWork'})

        smach.StateMachine.add('BackToWork', BackToWork(), transitions={'back_to_work_completed':'ChargePreparation'})

    # 创建一个状态机的协调者
    sis = smach_ros.IntrospectionServer('charge_state_machine', sm, '/CHARGE_SM')
    sis.start()
    # 执行状态机
    outcome = sm.execute()
    rospy.spin()
    sis.stop()

def ros_spin_process():
    rospy.spin()

# def receive_data(req):
#     global xml_paser
#     rospy.loginfo("收到xml数据")
#     resp=XmlDataResponse()
#     print(req.data)
#
#     try:
#
#         with open(XMLPATH, 'w') as f:
#             f.write(req.data)
#         rospy.loginfo("xml file received and saved successfully")
#
#         # xml_paser = XMLPaser()
#         # patrolpoints = xml_paser.openxml(XMLPATH)
#         # xml_paser.printpatrolpoints(patrolpoints)
#
#     except ioerror:
#         rospy.logerr("failed to save xml file")
#         resp.status_code=0
#     else:
#         resp.status_code=1
#
#     return resp


#函数入口
if __name__ =="__main__":
    rospy.init_node('charge_state_machine')
    # server = rospy.Service("xml_data",XmlData,receive_data)

    # ros_spin = multiprocessing.Process(target=ros_spin_process)

    ros_spin = threading.Thread(target=ros_spin_process)
    ros_spin.start() #启动线程
    
    print("charge node start")

    main()
    ros_spin.join() #等待结束





