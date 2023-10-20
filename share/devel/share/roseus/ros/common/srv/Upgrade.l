;; Auto-generated. Do not edit!


(when (boundp 'common::Upgrade)
  (if (not (find-package "COMMON"))
    (make-package "COMMON"))
  (shadow 'Upgrade (find-package "COMMON")))
(unless (find-package "COMMON::UPGRADE")
  (make-package "COMMON::UPGRADE"))
(unless (find-package "COMMON::UPGRADEREQUEST")
  (make-package "COMMON::UPGRADEREQUEST"))
(unless (find-package "COMMON::UPGRADERESPONSE")
  (make-package "COMMON::UPGRADERESPONSE"))

(in-package "ROS")

(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))




(defclass common::UpgradeRequest
  :super ros::object
  :slots (_board_type _upgrade_file ))

(defmethod common::UpgradeRequest
  (:init
   (&key
    ((:board_type __board_type) 0)
    ((:upgrade_file __upgrade_file) (instance std_msgs::UInt8MultiArray :init))
    )
   (send-super :init)
   (setq _board_type (round __board_type))
   (setq _upgrade_file __upgrade_file)
   self)
  (:board_type
   (&optional __board_type)
   (if __board_type (setq _board_type __board_type)) _board_type)
  (:upgrade_file
   (&rest __upgrade_file)
   (if (keywordp (car __upgrade_file))
       (send* _upgrade_file __upgrade_file)
     (progn
       (if __upgrade_file (setq _upgrade_file (car __upgrade_file)))
       _upgrade_file)))
  (:serialization-length
   ()
   (+
    ;; int32 _board_type
    4
    ;; std_msgs/UInt8MultiArray _upgrade_file
    (send _upgrade_file :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _board_type
       (write-long _board_type s)
     ;; std_msgs/UInt8MultiArray _upgrade_file
       (send _upgrade_file :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _board_type
     (setq _board_type (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; std_msgs/UInt8MultiArray _upgrade_file
     (send _upgrade_file :deserialize buf ptr-) (incf ptr- (send _upgrade_file :serialization-length))
   ;;
   self)
  )

(defclass common::UpgradeResponse
  :super ros::object
  :slots (_status_code ))

(defmethod common::UpgradeResponse
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

(defclass common::Upgrade
  :super ros::object
  :slots ())

(setf (get common::Upgrade :md5sum-) "d1a7d02d9af64b80a87fb39b34004f24")
(setf (get common::Upgrade :datatype-) "common/Upgrade")
(setf (get common::Upgrade :request) common::UpgradeRequest)
(setf (get common::Upgrade :response) common::UpgradeResponse)

(defmethod common::UpgradeRequest
  (:response () (instance common::UpgradeResponse :init)))

(setf (get common::UpgradeRequest :md5sum-) "d1a7d02d9af64b80a87fb39b34004f24")
(setf (get common::UpgradeRequest :datatype-) "common/UpgradeRequest")
(setf (get common::UpgradeRequest :definition-)
      "int32 board_type
#0运动控制板
#1传感器板
std_msgs/UInt8MultiArray upgrade_file

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

(setf (get common::UpgradeResponse :md5sum-) "d1a7d02d9af64b80a87fb39b34004f24")
(setf (get common::UpgradeResponse :datatype-) "common/UpgradeResponse")
(setf (get common::UpgradeResponse :definition-)
      "int32 board_type
#0运动控制板
#1传感器板
std_msgs/UInt8MultiArray upgrade_file

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



(provide :common/Upgrade "d1a7d02d9af64b80a87fb39b34004f24")


