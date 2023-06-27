; Auto-generated. Do not edit!


(cl:in-package common-srv)


;//! \htmlinclude TakePicture-request.msg.html

(cl:defclass <TakePicture-request> (roslisp-msg-protocol:ros-message)
  ((take_picture
    :reader take_picture
    :initarg :take_picture
    :type cl:string
    :initform ""))
)

(cl:defclass TakePicture-request (<TakePicture-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TakePicture-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TakePicture-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<TakePicture-request> is deprecated: use common-srv:TakePicture-request instead.")))

(cl:ensure-generic-function 'take_picture-val :lambda-list '(m))
(cl:defmethod take_picture-val ((m <TakePicture-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:take_picture-val is deprecated.  Use common-srv:take_picture instead.")
  (take_picture m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TakePicture-request>) ostream)
  "Serializes a message object of type '<TakePicture-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'take_picture))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'take_picture))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TakePicture-request>) istream)
  "Deserializes a message object of type '<TakePicture-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'take_picture) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'take_picture) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TakePicture-request>)))
  "Returns string type for a service object of type '<TakePicture-request>"
  "common/TakePictureRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TakePicture-request)))
  "Returns string type for a service object of type 'TakePicture-request"
  "common/TakePictureRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TakePicture-request>)))
  "Returns md5sum for a message object of type '<TakePicture-request>"
  "5810510cbe479584b13b0db4c9da21a6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TakePicture-request)))
  "Returns md5sum for a message object of type 'TakePicture-request"
  "5810510cbe479584b13b0db4c9da21a6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TakePicture-request>)))
  "Returns full string definition for message of type '<TakePicture-request>"
  (cl:format cl:nil "string take_picture~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TakePicture-request)))
  "Returns full string definition for message of type 'TakePicture-request"
  (cl:format cl:nil "string take_picture~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TakePicture-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'take_picture))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TakePicture-request>))
  "Converts a ROS message object to a list"
  (cl:list 'TakePicture-request
    (cl:cons ':take_picture (take_picture msg))
))
;//! \htmlinclude TakePicture-response.msg.html

(cl:defclass <TakePicture-response> (roslisp-msg-protocol:ros-message)
  ((img
    :reader img
    :initarg :img
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image))
   (status_code
    :reader status_code
    :initarg :status_code
    :type cl:integer
    :initform 0)
   (err_msg
    :reader err_msg
    :initarg :err_msg
    :type cl:string
    :initform ""))
)

(cl:defclass TakePicture-response (<TakePicture-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TakePicture-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TakePicture-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<TakePicture-response> is deprecated: use common-srv:TakePicture-response instead.")))

(cl:ensure-generic-function 'img-val :lambda-list '(m))
(cl:defmethod img-val ((m <TakePicture-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:img-val is deprecated.  Use common-srv:img instead.")
  (img m))

(cl:ensure-generic-function 'status_code-val :lambda-list '(m))
(cl:defmethod status_code-val ((m <TakePicture-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:status_code-val is deprecated.  Use common-srv:status_code instead.")
  (status_code m))

(cl:ensure-generic-function 'err_msg-val :lambda-list '(m))
(cl:defmethod err_msg-val ((m <TakePicture-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:err_msg-val is deprecated.  Use common-srv:err_msg instead.")
  (err_msg m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TakePicture-response>) ostream)
  "Serializes a message object of type '<TakePicture-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'img) ostream)
  (cl:let* ((signed (cl:slot-value msg 'status_code)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'err_msg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'err_msg))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TakePicture-response>) istream)
  "Deserializes a message object of type '<TakePicture-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'img) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status_code) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'err_msg) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'err_msg) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TakePicture-response>)))
  "Returns string type for a service object of type '<TakePicture-response>"
  "common/TakePictureResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TakePicture-response)))
  "Returns string type for a service object of type 'TakePicture-response"
  "common/TakePictureResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TakePicture-response>)))
  "Returns md5sum for a message object of type '<TakePicture-response>"
  "5810510cbe479584b13b0db4c9da21a6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TakePicture-response)))
  "Returns md5sum for a message object of type 'TakePicture-response"
  "5810510cbe479584b13b0db4c9da21a6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TakePicture-response>)))
  "Returns full string definition for message of type '<TakePicture-response>"
  (cl:format cl:nil "sensor_msgs/Image img~%int32 status_code #0失败，1完成~%string err_msg~%~%~%~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TakePicture-response)))
  "Returns full string definition for message of type 'TakePicture-response"
  (cl:format cl:nil "sensor_msgs/Image img~%int32 status_code #0失败，1完成~%string err_msg~%~%~%~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TakePicture-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'img))
     4
     4 (cl:length (cl:slot-value msg 'err_msg))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TakePicture-response>))
  "Converts a ROS message object to a list"
  (cl:list 'TakePicture-response
    (cl:cons ':img (img msg))
    (cl:cons ':status_code (status_code msg))
    (cl:cons ':err_msg (err_msg msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'TakePicture)))
  'TakePicture-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'TakePicture)))
  'TakePicture-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TakePicture)))
  "Returns string type for a service object of type '<TakePicture>"
  "common/TakePicture")