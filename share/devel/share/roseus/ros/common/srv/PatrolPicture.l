;; Auto-generated. Do not edit!


(when (boundp 'common::PatrolPicture)
  (if (not (find-package "COMMON"))
    (make-package "COMMON"))
  (shadow 'PatrolPicture (find-package "COMMON")))
(unless (find-package "COMMON::PATROLPICTURE")
  (make-package "COMMON::PATROLPICTURE"))
(unless (find-package "COMMON::PATROLPICTUREREQUEST")
  (make-package "COMMON::PATROLPICTUREREQUEST"))
(unless (find-package "COMMON::PATROLPICTURERESPONSE")
  (make-package "COMMON::PATROLPICTURERESPONSE"))

(in-package "ROS")

(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))




(defclass common::PatrolPictureRequest
  :super ros::object
  :slots (_patrol_task_name _patrol_point_index _gimbal_point_index _img ))

(defmethod common::PatrolPictureRequest
  (:init
   (&key
    ((:patrol_task_name __patrol_task_name) "")
    ((:patrol_point_index __patrol_point_index) 0)
    ((:gimbal_point_index __gimbal_point_index) 0)
    ((:img __img) (instance sensor_msgs::Image :init))
    )
   (send-super :init)
   (setq _patrol_task_name (string __patrol_task_name))
   (setq _patrol_point_index (round __patrol_point_index))
   (setq _gimbal_point_index (round __gimbal_point_index))
   (setq _img __img)
   self)
  (:patrol_task_name
   (&optional __patrol_task_name)
   (if __patrol_task_name (setq _patrol_task_name __patrol_task_name)) _patrol_task_name)
  (:patrol_point_index
   (&optional __patrol_point_index)
   (if __patrol_point_index (setq _patrol_point_index __patrol_point_index)) _patrol_point_index)
  (:gimbal_point_index
   (&optional __gimbal_point_index)
   (if __gimbal_point_index (setq _gimbal_point_index __gimbal_point_index)) _gimbal_point_index)
  (:img
   (&rest __img)
   (if (keywordp (car __img))
       (send* _img __img)
     (progn
       (if __img (setq _img (car __img)))
       _img)))
  (:serialization-length
   ()
   (+
    ;; string _patrol_task_name
    4 (length _patrol_task_name)
    ;; int32 _patrol_point_index
    4
    ;; int32 _gimbal_point_index
    4
    ;; sensor_msgs/Image _img
    (send _img :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _patrol_task_name
       (write-long (length _patrol_task_name) s) (princ _patrol_task_name s)
     ;; int32 _patrol_point_index
       (write-long _patrol_point_index s)
     ;; int32 _gimbal_point_index
       (write-long _gimbal_point_index s)
     ;; sensor_msgs/Image _img
       (send _img :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _patrol_task_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _patrol_task_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _patrol_point_index
     (setq _patrol_point_index (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _gimbal_point_index
     (setq _gimbal_point_index (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; sensor_msgs/Image _img
     (send _img :deserialize buf ptr-) (incf ptr- (send _img :serialization-length))
   ;;
   self)
  )

(defclass common::PatrolPictureResponse
  :super ros::object
  :slots (_status_code ))

(defmethod common::PatrolPictureResponse
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

(defclass common::PatrolPicture
  :super ros::object
  :slots ())

(setf (get common::PatrolPicture :md5sum-) "4b0c8b5f306638a944f76a5bcfd0a606")
(setf (get common::PatrolPicture :datatype-) "common/PatrolPicture")
(setf (get common::PatrolPicture :request) common::PatrolPictureRequest)
(setf (get common::PatrolPicture :response) common::PatrolPictureResponse)

(defmethod common::PatrolPictureRequest
  (:response () (instance common::PatrolPictureResponse :init)))

(setf (get common::PatrolPictureRequest :md5sum-) "4b0c8b5f306638a944f76a5bcfd0a606")
(setf (get common::PatrolPictureRequest :datatype-) "common/PatrolPictureRequest")
(setf (get common::PatrolPictureRequest :definition-)
      "string patrol_task_name     #巡检任务名称 写在patrolpoints节点的Intro
int32 patrol_point_index    #巡检点索引
int32 gimbal_point_index    #云台运动预制点索引
sensor_msgs/Image img       #图片

================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id
---
int32 status_code #0失败 1完成

")

(setf (get common::PatrolPictureResponse :md5sum-) "4b0c8b5f306638a944f76a5bcfd0a606")
(setf (get common::PatrolPictureResponse :datatype-) "common/PatrolPictureResponse")
(setf (get common::PatrolPictureResponse :definition-)
      "string patrol_task_name     #巡检任务名称 写在patrolpoints节点的Intro
int32 patrol_point_index    #巡检点索引
int32 gimbal_point_index    #云台运动预制点索引
sensor_msgs/Image img       #图片

================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id
---
int32 status_code #0失败 1完成

")



(provide :common/PatrolPicture "4b0c8b5f306638a944f76a5bcfd0a606")


