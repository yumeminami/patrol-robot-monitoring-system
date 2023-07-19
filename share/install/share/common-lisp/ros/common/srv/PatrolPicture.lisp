; Auto-generated. Do not edit!


(cl:in-package common-srv)


;//! \htmlinclude PatrolPicture-request.msg.html

(cl:defclass <PatrolPicture-request> (roslisp-msg-protocol:ros-message)
  ((patrol_task_name
    :reader patrol_task_name
    :initarg :patrol_task_name
    :type cl:string
    :initform "")
   (patrol_point_index
    :reader patrol_point_index
    :initarg :patrol_point_index
    :type cl:integer
    :initform 0)
   (gimbal_point_index
    :reader gimbal_point_index
    :initarg :gimbal_point_index
    :type cl:integer
    :initform 0)
   (img
    :reader img
    :initarg :img
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image)))
)

(cl:defclass PatrolPicture-request (<PatrolPicture-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PatrolPicture-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PatrolPicture-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<PatrolPicture-request> is deprecated: use common-srv:PatrolPicture-request instead.")))

(cl:ensure-generic-function 'patrol_task_name-val :lambda-list '(m))
(cl:defmethod patrol_task_name-val ((m <PatrolPicture-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:patrol_task_name-val is deprecated.  Use common-srv:patrol_task_name instead.")
  (patrol_task_name m))

(cl:ensure-generic-function 'patrol_point_index-val :lambda-list '(m))
(cl:defmethod patrol_point_index-val ((m <PatrolPicture-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:patrol_point_index-val is deprecated.  Use common-srv:patrol_point_index instead.")
  (patrol_point_index m))

(cl:ensure-generic-function 'gimbal_point_index-val :lambda-list '(m))
(cl:defmethod gimbal_point_index-val ((m <PatrolPicture-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:gimbal_point_index-val is deprecated.  Use common-srv:gimbal_point_index instead.")
  (gimbal_point_index m))

(cl:ensure-generic-function 'img-val :lambda-list '(m))
(cl:defmethod img-val ((m <PatrolPicture-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:img-val is deprecated.  Use common-srv:img instead.")
  (img m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PatrolPicture-request>) ostream)
  "Serializes a message object of type '<PatrolPicture-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'patrol_task_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'patrol_task_name))
  (cl:let* ((signed (cl:slot-value msg 'patrol_point_index)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'gimbal_point_index)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'img) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PatrolPicture-request>) istream)
  "Deserializes a message object of type '<PatrolPicture-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'patrol_task_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'patrol_task_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'patrol_point_index) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gimbal_point_index) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'img) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PatrolPicture-request>)))
  "Returns string type for a service object of type '<PatrolPicture-request>"
  "common/PatrolPictureRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PatrolPicture-request)))
  "Returns string type for a service object of type 'PatrolPicture-request"
  "common/PatrolPictureRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PatrolPicture-request>)))
  "Returns md5sum for a message object of type '<PatrolPicture-request>"
  "4b0c8b5f306638a944f76a5bcfd0a606")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PatrolPicture-request)))
  "Returns md5sum for a message object of type 'PatrolPicture-request"
  "4b0c8b5f306638a944f76a5bcfd0a606")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PatrolPicture-request>)))
  "Returns full string definition for message of type '<PatrolPicture-request>"
  (cl:format cl:nil "string patrol_task_name~%int32 patrol_point_index~%int32 gimbal_point_index~%sensor_msgs/Image img~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PatrolPicture-request)))
  "Returns full string definition for message of type 'PatrolPicture-request"
  (cl:format cl:nil "string patrol_task_name~%int32 patrol_point_index~%int32 gimbal_point_index~%sensor_msgs/Image img~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PatrolPicture-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'patrol_task_name))
     4
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'img))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PatrolPicture-request>))
  "Converts a ROS message object to a list"
  (cl:list 'PatrolPicture-request
    (cl:cons ':patrol_task_name (patrol_task_name msg))
    (cl:cons ':patrol_point_index (patrol_point_index msg))
    (cl:cons ':gimbal_point_index (gimbal_point_index msg))
    (cl:cons ':img (img msg))
))
;//! \htmlinclude PatrolPicture-response.msg.html

(cl:defclass <PatrolPicture-response> (roslisp-msg-protocol:ros-message)
  ((status_code
    :reader status_code
    :initarg :status_code
    :type cl:integer
    :initform 0))
)

(cl:defclass PatrolPicture-response (<PatrolPicture-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PatrolPicture-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PatrolPicture-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<PatrolPicture-response> is deprecated: use common-srv:PatrolPicture-response instead.")))

(cl:ensure-generic-function 'status_code-val :lambda-list '(m))
(cl:defmethod status_code-val ((m <PatrolPicture-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:status_code-val is deprecated.  Use common-srv:status_code instead.")
  (status_code m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PatrolPicture-response>) ostream)
  "Serializes a message object of type '<PatrolPicture-response>"
  (cl:let* ((signed (cl:slot-value msg 'status_code)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PatrolPicture-response>) istream)
  "Deserializes a message object of type '<PatrolPicture-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status_code) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PatrolPicture-response>)))
  "Returns string type for a service object of type '<PatrolPicture-response>"
  "common/PatrolPictureResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PatrolPicture-response)))
  "Returns string type for a service object of type 'PatrolPicture-response"
  "common/PatrolPictureResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PatrolPicture-response>)))
  "Returns md5sum for a message object of type '<PatrolPicture-response>"
  "4b0c8b5f306638a944f76a5bcfd0a606")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PatrolPicture-response)))
  "Returns md5sum for a message object of type 'PatrolPicture-response"
  "4b0c8b5f306638a944f76a5bcfd0a606")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PatrolPicture-response>)))
  "Returns full string definition for message of type '<PatrolPicture-response>"
  (cl:format cl:nil "int32 status_code #0失败 1完成~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PatrolPicture-response)))
  "Returns full string definition for message of type 'PatrolPicture-response"
  (cl:format cl:nil "int32 status_code #0失败 1完成~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PatrolPicture-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PatrolPicture-response>))
  "Converts a ROS message object to a list"
  (cl:list 'PatrolPicture-response
    (cl:cons ':status_code (status_code msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'PatrolPicture)))
  'PatrolPicture-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'PatrolPicture)))
  'PatrolPicture-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PatrolPicture)))
  "Returns string type for a service object of type '<PatrolPicture>"
  "common/PatrolPicture")