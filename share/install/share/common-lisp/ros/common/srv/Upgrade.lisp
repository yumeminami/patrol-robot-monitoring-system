; Auto-generated. Do not edit!


(cl:in-package common-srv)


;//! \htmlinclude Upgrade-request.msg.html

(cl:defclass <Upgrade-request> (roslisp-msg-protocol:ros-message)
  ((board_type
    :reader board_type
    :initarg :board_type
    :type cl:integer
    :initform 0)
   (upgrade_file
    :reader upgrade_file
    :initarg :upgrade_file
    :type std_msgs-msg:UInt8MultiArray
    :initform (cl:make-instance 'std_msgs-msg:UInt8MultiArray)))
)

(cl:defclass Upgrade-request (<Upgrade-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Upgrade-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Upgrade-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<Upgrade-request> is deprecated: use common-srv:Upgrade-request instead.")))

(cl:ensure-generic-function 'board_type-val :lambda-list '(m))
(cl:defmethod board_type-val ((m <Upgrade-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:board_type-val is deprecated.  Use common-srv:board_type instead.")
  (board_type m))

(cl:ensure-generic-function 'upgrade_file-val :lambda-list '(m))
(cl:defmethod upgrade_file-val ((m <Upgrade-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:upgrade_file-val is deprecated.  Use common-srv:upgrade_file instead.")
  (upgrade_file m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Upgrade-request>) ostream)
  "Serializes a message object of type '<Upgrade-request>"
  (cl:let* ((signed (cl:slot-value msg 'board_type)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'upgrade_file) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Upgrade-request>) istream)
  "Deserializes a message object of type '<Upgrade-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'board_type) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'upgrade_file) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Upgrade-request>)))
  "Returns string type for a service object of type '<Upgrade-request>"
  "common/UpgradeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Upgrade-request)))
  "Returns string type for a service object of type 'Upgrade-request"
  "common/UpgradeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Upgrade-request>)))
  "Returns md5sum for a message object of type '<Upgrade-request>"
  "d1a7d02d9af64b80a87fb39b34004f24")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Upgrade-request)))
  "Returns md5sum for a message object of type 'Upgrade-request"
  "d1a7d02d9af64b80a87fb39b34004f24")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Upgrade-request>)))
  "Returns full string definition for message of type '<Upgrade-request>"
  (cl:format cl:nil "int32 board_type~%#0运动控制板~%#1传感器板~%std_msgs/UInt8MultiArray upgrade_file~%~%================================================================================~%MSG: std_msgs/UInt8MultiArray~%# Please look at the MultiArrayLayout message definition for~%# documentation on all multiarrays.~%~%MultiArrayLayout  layout        # specification of data layout~%uint8[]           data          # array of data~%~%~%================================================================================~%MSG: std_msgs/MultiArrayLayout~%# The multiarray declares a generic multi-dimensional array of a~%# particular data type.  Dimensions are ordered from outer most~%# to inner most.~%~%MultiArrayDimension[] dim # Array of dimension properties~%uint32 data_offset        # padding elements at front of data~%~%# Accessors should ALWAYS be written in terms of dimension stride~%# and specified outer-most dimension first.~%# ~%# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]~%#~%# A standard, 3-channel 640x480 image with interleaved color channels~%# would be specified as:~%#~%# dim[0].label  = \"height\"~%# dim[0].size   = 480~%# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)~%# dim[1].label  = \"width\"~%# dim[1].size   = 640~%# dim[1].stride = 3*640 = 1920~%# dim[2].label  = \"channel\"~%# dim[2].size   = 3~%# dim[2].stride = 3~%#~%# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.~%~%================================================================================~%MSG: std_msgs/MultiArrayDimension~%string label   # label of given dimension~%uint32 size    # size of given dimension (in type units)~%uint32 stride  # stride of given dimension~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Upgrade-request)))
  "Returns full string definition for message of type 'Upgrade-request"
  (cl:format cl:nil "int32 board_type~%#0运动控制板~%#1传感器板~%std_msgs/UInt8MultiArray upgrade_file~%~%================================================================================~%MSG: std_msgs/UInt8MultiArray~%# Please look at the MultiArrayLayout message definition for~%# documentation on all multiarrays.~%~%MultiArrayLayout  layout        # specification of data layout~%uint8[]           data          # array of data~%~%~%================================================================================~%MSG: std_msgs/MultiArrayLayout~%# The multiarray declares a generic multi-dimensional array of a~%# particular data type.  Dimensions are ordered from outer most~%# to inner most.~%~%MultiArrayDimension[] dim # Array of dimension properties~%uint32 data_offset        # padding elements at front of data~%~%# Accessors should ALWAYS be written in terms of dimension stride~%# and specified outer-most dimension first.~%# ~%# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]~%#~%# A standard, 3-channel 640x480 image with interleaved color channels~%# would be specified as:~%#~%# dim[0].label  = \"height\"~%# dim[0].size   = 480~%# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)~%# dim[1].label  = \"width\"~%# dim[1].size   = 640~%# dim[1].stride = 3*640 = 1920~%# dim[2].label  = \"channel\"~%# dim[2].size   = 3~%# dim[2].stride = 3~%#~%# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.~%~%================================================================================~%MSG: std_msgs/MultiArrayDimension~%string label   # label of given dimension~%uint32 size    # size of given dimension (in type units)~%uint32 stride  # stride of given dimension~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Upgrade-request>))
  (cl:+ 0
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'upgrade_file))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Upgrade-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Upgrade-request
    (cl:cons ':board_type (board_type msg))
    (cl:cons ':upgrade_file (upgrade_file msg))
))
;//! \htmlinclude Upgrade-response.msg.html

(cl:defclass <Upgrade-response> (roslisp-msg-protocol:ros-message)
  ((status_code
    :reader status_code
    :initarg :status_code
    :type cl:integer
    :initform 0))
)

(cl:defclass Upgrade-response (<Upgrade-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Upgrade-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Upgrade-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<Upgrade-response> is deprecated: use common-srv:Upgrade-response instead.")))

(cl:ensure-generic-function 'status_code-val :lambda-list '(m))
(cl:defmethod status_code-val ((m <Upgrade-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:status_code-val is deprecated.  Use common-srv:status_code instead.")
  (status_code m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Upgrade-response>) ostream)
  "Serializes a message object of type '<Upgrade-response>"
  (cl:let* ((signed (cl:slot-value msg 'status_code)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Upgrade-response>) istream)
  "Deserializes a message object of type '<Upgrade-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status_code) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Upgrade-response>)))
  "Returns string type for a service object of type '<Upgrade-response>"
  "common/UpgradeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Upgrade-response)))
  "Returns string type for a service object of type 'Upgrade-response"
  "common/UpgradeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Upgrade-response>)))
  "Returns md5sum for a message object of type '<Upgrade-response>"
  "d1a7d02d9af64b80a87fb39b34004f24")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Upgrade-response)))
  "Returns md5sum for a message object of type 'Upgrade-response"
  "d1a7d02d9af64b80a87fb39b34004f24")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Upgrade-response>)))
  "Returns full string definition for message of type '<Upgrade-response>"
  (cl:format cl:nil "int32 status_code #0失败，1完成~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Upgrade-response)))
  "Returns full string definition for message of type 'Upgrade-response"
  (cl:format cl:nil "int32 status_code #0失败，1完成~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Upgrade-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Upgrade-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Upgrade-response
    (cl:cons ':status_code (status_code msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Upgrade)))
  'Upgrade-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Upgrade)))
  'Upgrade-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Upgrade)))
  "Returns string type for a service object of type '<Upgrade>"
  "common/Upgrade")