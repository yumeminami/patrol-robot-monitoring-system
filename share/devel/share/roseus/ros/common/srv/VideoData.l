;; Auto-generated. Do not edit!


(when (boundp 'common::VideoData)
  (if (not (find-package "COMMON"))
    (make-package "COMMON"))
  (shadow 'VideoData (find-package "COMMON")))
(unless (find-package "COMMON::VIDEODATA")
  (make-package "COMMON::VIDEODATA"))
(unless (find-package "COMMON::VIDEODATAREQUEST")
  (make-package "COMMON::VIDEODATAREQUEST"))
(unless (find-package "COMMON::VIDEODATARESPONSE")
  (make-package "COMMON::VIDEODATARESPONSE"))

(in-package "ROS")

(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))




(defclass common::VideoDataRequest
  :super ros::object
  :slots (_patrol_task_name _patrol_section_index _video_data ))

(defmethod common::VideoDataRequest
  (:init
   (&key
    ((:patrol_task_name __patrol_task_name) "")
    ((:patrol_section_index __patrol_section_index) 0)
    ((:video_data __video_data) (instance std_msgs::UInt8MultiArray :init))
    )
   (send-super :init)
   (setq _patrol_task_name (string __patrol_task_name))
   (setq _patrol_section_index (round __patrol_section_index))
   (setq _video_data __video_data)
   self)
  (:patrol_task_name
   (&optional __patrol_task_name)
   (if __patrol_task_name (setq _patrol_task_name __patrol_task_name)) _patrol_task_name)
  (:patrol_section_index
   (&optional __patrol_section_index)
   (if __patrol_section_index (setq _patrol_section_index __patrol_section_index)) _patrol_section_index)
  (:video_data
   (&rest __video_data)
   (if (keywordp (car __video_data))
       (send* _video_data __video_data)
     (progn
       (if __video_data (setq _video_data (car __video_data)))
       _video_data)))
  (:serialization-length
   ()
   (+
    ;; string _patrol_task_name
    4 (length _patrol_task_name)
    ;; int32 _patrol_section_index
    4
    ;; std_msgs/UInt8MultiArray _video_data
    (send _video_data :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _patrol_task_name
       (write-long (length _patrol_task_name) s) (princ _patrol_task_name s)
     ;; int32 _patrol_section_index
       (write-long _patrol_section_index s)
     ;; std_msgs/UInt8MultiArray _video_data
       (send _video_data :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _patrol_task_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _patrol_task_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _patrol_section_index
     (setq _patrol_section_index (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; std_msgs/UInt8MultiArray _video_data
     (send _video_data :deserialize buf ptr-) (incf ptr- (send _video_data :serialization-length))
   ;;
   self)
  )

(defclass common::VideoDataResponse
  :super ros::object
  :slots (_status_code ))

(defmethod common::VideoDataResponse
  (:init
   (&key
    ((:status_code __status_code) 0)
    )
   (send-super :init)
   (setq _status_code (round __status_code))
   self)
  (:status_code
   (&optional __status_code)
   (if __status_code (setq _status_code __status_code)) _status_code)
  (:serialization-length
   ()
   (+
    ;; int32 _status_code
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _status_code
       (write-long _status_code s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _status_code
     (setq _status_code (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass common::VideoData
  :super ros::object
  :slots ())

(setf (get common::VideoData :md5sum-) "baa99bb834c12c1333deff1c3344d500")
(setf (get common::VideoData :datatype-) "common/VideoData")
(setf (get common::VideoData :request) common::VideoDataRequest)
(setf (get common::VideoData :response) common::VideoDataResponse)

(defmethod common::VideoDataRequest
  (:response () (instance common::VideoDataResponse :init)))

(setf (get common::VideoDataRequest :md5sum-) "baa99bb834c12c1333deff1c3344d500")
(setf (get common::VideoDataRequest :datatype-) "common/VideoDataRequest")
(setf (get common::VideoDataRequest :definition-)
      "string patrol_task_name     #连续巡检任务名称 写在patrolsections节点的Intro
int32 patrol_section_index
std_msgs/UInt8MultiArray video_data

================================================================================
MSG: std_msgs/UInt8MultiArray
# Please look at the MultiArrayLayout message definition for
# documentation on all multiarrays.

MultiArrayLayout  layout        # specification of data layout
uint8[]           data          # array of data


================================================================================
MSG: std_msgs/MultiArrayLayout
# The multiarray declares a generic multi-dimensional array of a
# particular data type.  Dimensions are ordered from outer most
# to inner most.

MultiArrayDimension[] dim # Array of dimension properties
uint32 data_offset        # padding elements at front of data

# Accessors should ALWAYS be written in terms of dimension stride
# and specified outer-most dimension first.
# 
# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]
#
# A standard, 3-channel 640x480 image with interleaved color channels
# would be specified as:
#
# dim[0].label  = \"height\"
# dim[0].size   = 480
# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)
# dim[1].label  = \"width\"
# dim[1].size   = 640
# dim[1].stride = 3*640 = 1920
# dim[2].label  = \"channel\"
# dim[2].size   = 3
# dim[2].stride = 3
#
# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.

================================================================================
MSG: std_msgs/MultiArrayDimension
string label   # label of given dimension
uint32 size    # size of given dimension (in type units)
---
int32 status_code #0失败，1完成


")

(setf (get common::VideoDataResponse :md5sum-) "baa99bb834c12c1333deff1c3344d500")
(setf (get common::VideoDataResponse :datatype-) "common/VideoDataResponse")
(setf (get common::VideoDataResponse :definition-)
      "string patrol_task_name     #连续巡检任务名称 写在patrolsections节点的Intro
int32 patrol_section_index
std_msgs/UInt8MultiArray video_data

================================================================================
MSG: std_msgs/UInt8MultiArray
# Please look at the MultiArrayLayout message definition for
# documentation on all multiarrays.

MultiArrayLayout  layout        # specification of data layout
uint8[]           data          # array of data


================================================================================
MSG: std_msgs/MultiArrayLayout
# The multiarray declares a generic multi-dimensional array of a
# particular data type.  Dimensions are ordered from outer most
# to inner most.

MultiArrayDimension[] dim # Array of dimension properties
uint32 data_offset        # padding elements at front of data

# Accessors should ALWAYS be written in terms of dimension stride
# and specified outer-most dimension first.
# 
# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]
#
# A standard, 3-channel 640x480 image with interleaved color channels
# would be specified as:
#
# dim[0].label  = \"height\"
# dim[0].size   = 480
# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)
# dim[1].label  = \"width\"
# dim[1].size   = 640
# dim[1].stride = 3*640 = 1920
# dim[2].label  = \"channel\"
# dim[2].size   = 3
# dim[2].stride = 3
#
# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.

================================================================================
MSG: std_msgs/MultiArrayDimension
string label   # label of given dimension
uint32 size    # size of given dimension (in type units)
---
int32 status_code #0失败，1完成


")



(provide :common/VideoData "baa99bb834c12c1333deff1c3344d500")


