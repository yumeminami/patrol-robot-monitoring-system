import rospy
from std_msgs.msg import UInt8MultiArray
import pyaudio
import wave

def audio_capture():
    CHUNK = 1024  # 音频块大小
    FORMAT = pyaudio.paInt16  # 音频格式
    CHANNELS = 1  # 声道数
    RATE = 16000  # 采样率

    p = pyaudio.PyAudio()  # 创建PyAudio对象

    # 打开音频流
    stream = p.open(format=FORMAT,
                    channels=CHANNELS,
                    rate=RATE,
                    input=True,
                    input_device_index=1,#指定录音设备
                    frames_per_buffer=CHUNK)

    print("开始录制音频...")

    while not rospy.is_shutdown():
        # 从音频流中读取数据
        data = stream.read(CHUNK)
        # 将数据发布到ROS话题上
        print(data)
        print(type(data))
        print("==========================================")

        # 创建一个UInt8MultiArray消息对象
        msg = UInt8MultiArray()
        # 将bytes数据转换为无符号8位整数数组
        msg.data = list(data)
        # 发布消息到ROS话题
        pub.publish(msg)


    stream.stop_stream()
    stream.close()
    p.terminate()

if __name__ == '__main__':
    rospy.init_node('audio_publisher')  # 初始化ROS节点
    pub = rospy.Publisher('audio_topic', UInt8MultiArray, queue_size=10)  # 创建ROS发布者，指定话题名为'audio_topic'

    try:
        audio_capture()
    except rospy.ROSInterruptException:
        pass

