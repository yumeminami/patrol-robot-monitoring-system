;; Auto-generated. Do not edit!


(when (boundp 'common::TakePicture)
  (if (not (find-package "COMMON"))
    (make-package "COMMON"))
  (shadow 'TakePicture (find-package "COMMON")))
(unless (find-package "COMMON::TAKEPICTURE")
  (make-package "COMMON::TAKEPICTURE"))
(unless (find-package "COMMON::TAKEPICTUREREQUEST")
  (make-package "COMMON::TAKEPICTUREREQUEST"))
(unless (find-package "COMMON::TAKEPICTURERESPONSE")
  (make-package "COMMON::TAKEPICTURERESPONSE"))

(in-package "ROS")



(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))


(defclass common::TakePictureRequest
  :super ros::object
  :slots (_take_picture ))

(defmethod common::TakePictureRequest
  (:init
   (&key
    ((:take_picture __take_picture) "")
    )
   (send-super :init)
   (setq _take_picture (string __take_picture))
   self)
  (:take_picture
   (&optional __take_picture)
   (if __take_picture (setq _take_picture __take_picture)) _take_picture)
  (:serialization-length
   ()
   (+
    ;; string _take_picture
    4 (length _take_picture)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _take_picture
       (write-long (length _take_picture) s) (princ _take_picture s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _take_picture
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _take_picture (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass common::TakePictureResponse
  :super ros::object
  :slots (_img _status_code _err_msg ))

(defmethod common::TakePictureResponse
  (:init
   (&key
    ((:img __img) (instance sensor_msgs::Image :init))
    ((:status_code __status_code) 0)
    ((:err_msg __err_msg) "")
    )
   (send-super :init)
   (setq _img __img)
   (setq _status_code (round __status_code))
   (setq _err_msg (string __err_msg))
   self)
  (:img
   (&rest __img)
   (if (keywordp (car __img))
       (send* _img __img)
     (progn
       (if __img (setq _img (car __img)))
       _img)))
  (:status_code
   (&optional __status_code)
   (if __status_code (setq _status_code __status_code)) _status_code)
  (:err_msg
   (&optional __err_msg)
   (if __err_msg (setq _err_msg __err_msg)) _err_msg)
  (:serialization-length
   ()
   (+
    ;; sensor_msgs/Image _img
    (send _img :serialization-length)
    ;; int32 _status_code
    4
    ;; string _err_msg
    4 (length _err_msg)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; sensor_msgs/Image _img
       (send _img :serialize s)
     ;; int32 _status_code
       (write-long _status_code s)
     ;; string _err_msg
       (write-long (length _err_msg) s) (princ _err_msg s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; sensor_msgs/Image _img
     (send _img :deserialize buf ptr-) (incf ptr- (send _img :serialization-length))
   ;; int32 _status_code
     (setq _status_code (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _err_msg
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _err_msg (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass common::TakePicture
  :super ros::object
  :slots ())

(setf (get common::TakePicture :md5sum-) "5810510cbe479584b13b0db4c9da21a6")
(setf (get common::TakePicture :datatype-) "common/TakePicture")
(setf (get common::TakePicture :request) common::TakePictureRequest)
(setf (get common::TakePicture :response) common::TakePictureResponse)

(defmethod common::TakePictureRequest
  (:response () (instance common::TakePictureResponse :init)))

(setf (get common::TakePictureRequest :md5sum-) "5810510cbe479584b13b0db4c9da21a6")
(setf (get common::TakePictureRequest :datatype-) "common/TakePictureRequest")
(setf (get common::TakePictureRequest :definition-)
      "string take_picture
---
sensor_msgs/Image img
int32 status_code #0失败，1完成
string err_msg




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
")

(setf (get common::TakePictureResponse :md5sum-) "5810510cbe479584b13b0db4c9da21a6")
(setf (get common::TakePictureResponse :datatype-) "common/TakePictureResponse")
(setf (get common::TakePictureResponse :definition-)
      "string take_picture
---
sensor_msgs/Image img
int32 status_code #0失败，1完成
string err_msg




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
")



(provide :common/TakePicture "5810510cbe479584b13b0db4c9da21a6")


