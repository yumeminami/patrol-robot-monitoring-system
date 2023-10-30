;; Auto-generated. Do not edit!


(when (boundp 'common::RecordPosition)
  (if (not (find-package "COMMON"))
    (make-package "COMMON"))
  (shadow 'RecordPosition (find-package "COMMON")))
(unless (find-package "COMMON::RECORDPOSITION")
  (make-package "COMMON::RECORDPOSITION"))
(unless (find-package "COMMON::RECORDPOSITIONREQUEST")
  (make-package "COMMON::RECORDPOSITIONREQUEST"))
(unless (find-package "COMMON::RECORDPOSITIONRESPONSE")
  (make-package "COMMON::RECORDPOSITIONRESPONSE"))

(in-package "ROS")

(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))




(defclass common::RecordPositionRequest
  :super ros::object
  :slots (_data ))

(defmethod common::RecordPositionRequest
  (:init
   (&key
    ((:data __data) (instance std_msgs::UInt8MultiArray :init))
    )
   (send-super :init)
   (setq _data __data)
   self)
  (:data
   (&rest __data)
   (if (keywordp (car __data))
       (send* _data __data)
     (progn
       (if __data (setq _data (car __data)))
       _data)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/UInt8MultiArray _data
    (send _data :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/UInt8MultiArray _data
       (send _data :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/UInt8MultiArray _data
     (send _data :deserialize buf ptr-) (incf ptr- (send _data :serialization-length))
   ;;
   self)
  )

(defclass common::RecordPositionResponse
  :super ros::object
  :slots (_status_code ))

(defmethod common::RecordPositionResponse
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

(defclass common::RecordPosition
  :super ros::object
  :slots ())

(setf (get common::RecordPosition :md5sum-) "7b0729f31458f38616908a68952d309b")
(setf (get common::RecordPosition :datatype-) "common/RecordPosition")
(setf (get common::RecordPosition :request) common::RecordPositionRequest)
(setf (get common::RecordPosition :response) common::RecordPositionResponse)

(defmethod common::RecordPositionRequest
  (:response () (instance common::RecordPositionResponse :init)))

(setf (get common::RecordPositionRequest :md5sum-) "7b0729f31458f38616908a68952d309b")
(setf (get common::RecordPositionRequest :datatype-) "common/RecordPositionRequest")
(setf (get common::RecordPositionRequest :definition-)
      "std_msgs/UInt8MultiArray data

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

(setf (get common::RecordPositionResponse :md5sum-) "7b0729f31458f38616908a68952d309b")
(setf (get common::RecordPositionResponse :datatype-) "common/RecordPositionResponse")
(setf (get common::RecordPositionResponse :definition-)
      "std_msgs/UInt8MultiArray data

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



(provide :common/RecordPosition "7b0729f31458f38616908a68952d309b")


