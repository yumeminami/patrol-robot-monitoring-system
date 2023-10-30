; Auto-generated. Do not edit!


(cl:in-package common-srv)


;//! \htmlinclude RecordPosition-request.msg.html

(cl:defclass <RecordPosition-request> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type std_msgs-msg:UInt8MultiArray
    :initform (cl:make-instance 'std_msgs-msg:UInt8MultiArray)))
)

(cl:defclass RecordPosition-request (<RecordPosition-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RecordPosition-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RecordPosition-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<RecordPosition-request> is deprecated: use common-srv:RecordPosition-request instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <RecordPosition-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:data-val is deprecated.  Use common-srv:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RecordPosition-request>) ostream)
  "Serializes a message object of type '<RecordPosition-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'data) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RecordPosition-request>) istream)
  "Deserializes a message object of type '<RecordPosition-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'data) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RecordPosition-request>)))
  "Returns string type for a service object of type '<RecordPosition-request>"
  "common/RecordPositionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RecordPosition-request)))
  "Returns string type for a service object of type 'RecordPosition-request"
  "common/RecordPositionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RecordPosition-request>)))
  "Returns md5sum for a message object of type '<RecordPosition-request>"
  "7b0729f31458f38616908a68952d309b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RecordPosition-request)))
  "Returns md5sum for a message object of type 'RecordPosition-request"
  "7b0729f31458f38616908a68952d309b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RecordPosition-request>)))
  "Returns full string definition for message of type '<RecordPosition-request>"
  (cl:format cl:nil "std_msgs/UInt8MultiArray data~%~%================================================================================~%MSG: std_msgs/UInt8MultiArray~%# Please look at the MultiArrayLayout message definition for~%# documentation on all multiarrays.~%~%MultiArrayLayout  layout        # specification of data layout~%uint8[]           data          # array of data~%~%~%================================================================================~%MSG: std_msgs/MultiArrayLayout~%# The multiarray declares a generic multi-dimensional array of a~%# particular data type.  Dimensions are ordered from outer most~%# to inner most.~%~%MultiArrayDimension[] dim # Array of dimension properties~%uint32 data_offset        # padding elements at front of data~%~%# Accessors should ALWAYS be written in terms of dimension stride~%# and specified outer-most dimension first.~%# ~%# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]~%#~%# A standard, 3-channel 640x480 image with interleaved color channels~%# would be specified as:~%#~%# dim[0].label  = \"height\"~%# dim[0].size   = 480~%# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)~%# dim[1].label  = \"width\"~%# dim[1].size   = 640~%# dim[1].stride = 3*640 = 1920~%# dim[2].label  = \"channel\"~%# dim[2].size   = 3~%# dim[2].stride = 3~%#~%# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.~%~%================================================================================~%MSG: std_msgs/MultiArrayDimension~%string label   # label of given dimension~%uint32 size    # size of given dimension (in type units)~%uint32 stride  # stride of given dimension~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RecordPosition-request)))
  "Returns full string definition for message of type 'RecordPosition-request"
  (cl:format cl:nil "std_msgs/UInt8MultiArray data~%~%================================================================================~%MSG: std_msgs/UInt8MultiArray~%# Please look at the MultiArrayLayout message definition for~%# documentation on all multiarrays.~%~%MultiArrayLayout  layout        # specification of data layout~%uint8[]           data          # array of data~%~%~%================================================================================~%MSG: std_msgs/MultiArrayLayout~%# The multiarray declares a generic multi-dimensional array of a~%# particular data type.  Dimensions are ordered from outer most~%# to inner most.~%~%MultiArrayDimension[] dim # Array of dimension properties~%uint32 data_offset        # padding elements at front of data~%~%# Accessors should ALWAYS be written in terms of dimension stride~%# and specified outer-most dimension first.~%# ~%# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]~%#~%# A standard, 3-channel 640x480 image with interleaved color channels~%# would be specified as:~%#~%# dim[0].label  = \"height\"~%# dim[0].size   = 480~%# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)~%# dim[1].label  = \"width\"~%# dim[1].size   = 640~%# dim[1].stride = 3*640 = 1920~%# dim[2].label  = \"channel\"~%# dim[2].size   = 3~%# dim[2].stride = 3~%#~%# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.~%~%================================================================================~%MSG: std_msgs/MultiArrayDimension~%string label   # label of given dimension~%uint32 size    # size of given dimension (in type units)~%uint32 stride  # stride of given dimension~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RecordPosition-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'data))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RecordPosition-request>))
  "Converts a ROS message object to a list"
  (cl:list 'RecordPosition-request
    (cl:cons ':data (data msg))
))
;//! \htmlinclude RecordPosition-response.msg.html

(cl:defclass <RecordPosition-response> (roslisp-msg-protocol:ros-message)
  ((status_code
    :reader status_code
    :initarg :status_code
    :type cl:integer
    :initform 0))
)

(cl:defclass RecordPosition-response (<RecordPosition-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RecordPosition-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RecordPosition-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<RecordPosition-response> is deprecated: use common-srv:RecordPosition-response instead.")))

(cl:ensure-generic-function 'status_code-val :lambda-list '(m))
(cl:defmethod status_code-val ((m <RecordPosition-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:status_code-val is deprecated.  Use common-srv:status_code instead.")
  (status_code m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RecordPosition-response>) ostream)
  "Serializes a message object of type '<RecordPosition-response>"
  (cl:let* ((signed (cl:slot-value msg 'status_code)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RecordPosition-response>) istream)
  "Deserializes a message object of type '<RecordPosition-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status_code) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RecordPosition-response>)))
  "Returns string type for a service object of type '<RecordPosition-response>"
  "common/RecordPositionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RecordPosition-response)))
  "Returns string type for a service object of type 'RecordPosition-response"
  "common/RecordPositionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RecordPosition-response>)))
  "Returns md5sum for a message object of type '<RecordPosition-response>"
  "7b0729f31458f38616908a68952d309b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RecordPosition-response)))
  "Returns md5sum for a message object of type 'RecordPosition-response"
  "7b0729f31458f38616908a68952d309b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RecordPosition-response>)))
  "Returns full string definition for message of type '<RecordPosition-response>"
  (cl:format cl:nil "int32 status_code #0失败，1完成~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RecordPosition-response)))
  "Returns full string definition for message of type 'RecordPosition-response"
  (cl:format cl:nil "int32 status_code #0失败，1完成~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RecordPosition-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RecordPosition-response>))
  "Converts a ROS message object to a list"
  (cl:list 'RecordPosition-response
    (cl:cons ':status_code (status_code msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'RecordPosition)))
  'RecordPosition-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'RecordPosition)))
  'RecordPosition-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RecordPosition)))
  "Returns string type for a service object of type '<RecordPosition>"
  "common/RecordPosition")