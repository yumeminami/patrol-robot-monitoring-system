import rospy
from std_msgs.msg import UInt8MultiArray
import pyaudio
stream=None

def audio_callback(data):
    # 在接收到音频数据时触发的回调函数
    audio_data = bytes(data.data)
    # 播放音频数据
    stream.write(audio_data)

if __name__ == '__main__':
    rospy.init_node('audio_subscriber')  # 初始化ROS节点

    p = pyaudio.PyAudio()  # 创建PyAudio对象

    # 打开音频流
    stream = p.open(format=pyaudio.paInt16,
                    channels=1,
                    rate=16000,
                    input_device_index=1,#指定录音设备
                    output=True)

    rospy.Subscriber('audio_topic', UInt8MultiArray, audio_callback)  # 创建ROS订阅者，指定话题名为'audio_topic'，回调函数为audio_callback

    rospy.spin()
    # 关闭音频流
    stream.stop_stream()
    stream.close()
    p.terminate()
