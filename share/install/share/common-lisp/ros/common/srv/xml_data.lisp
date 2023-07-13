; Auto-generated. Do not edit!


(cl:in-package common-srv)


;//! \htmlinclude xml_data-request.msg.html

(cl:defclass <xml_data-request> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type std_msgs-msg:ByteMultiArray
    :initform (cl:make-instance 'std_msgs-msg:ByteMultiArray)))
)

(cl:defclass xml_data-request (<xml_data-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <xml_data-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'xml_data-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<xml_data-request> is deprecated: use common-srv:xml_data-request instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <xml_data-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:data-val is deprecated.  Use common-srv:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <xml_data-request>) ostream)
  "Serializes a message object of type '<xml_data-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'data) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <xml_data-request>) istream)
  "Deserializes a message object of type '<xml_data-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'data) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<xml_data-request>)))
  "Returns string type for a service object of type '<xml_data-request>"
  "common/xml_dataRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'xml_data-request)))
  "Returns string type for a service object of type 'xml_data-request"
  "common/xml_dataRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<xml_data-request>)))
  "Returns md5sum for a message object of type '<xml_data-request>"
  "301e9cc7244d22b9d325571195eb0275")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'xml_data-request)))
  "Returns md5sum for a message object of type 'xml_data-request"
  "301e9cc7244d22b9d325571195eb0275")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<xml_data-request>)))
  "Returns full string definition for message of type '<xml_data-request>"
  (cl:format cl:nil "std_msgs/ByteMultiArray data~%~%================================================================================~%MSG: std_msgs/ByteMultiArray~%# Please look at the MultiArrayLayout message definition for~%# documentation on all multiarrays.~%~%MultiArrayLayout  layout        # specification of data layout~%byte[]            data          # array of data~%~%~%================================================================================~%MSG: std_msgs/MultiArrayLayout~%# The multiarray declares a generic multi-dimensional array of a~%# particular data type.  Dimensions are ordered from outer most~%# to inner most.~%~%MultiArrayDimension[] dim # Array of dimension properties~%uint32 data_offset        # padding elements at front of data~%~%# Accessors should ALWAYS be written in terms of dimension stride~%# and specified outer-most dimension first.~%# ~%# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]~%#~%# A standard, 3-channel 640x480 image with interleaved color channels~%# would be specified as:~%#~%# dim[0].label  = \"height\"~%# dim[0].size   = 480~%# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)~%# dim[1].label  = \"width\"~%# dim[1].size   = 640~%# dim[1].stride = 3*640 = 1920~%# dim[2].label  = \"channel\"~%# dim[2].size   = 3~%# dim[2].stride = 3~%#~%# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.~%~%================================================================================~%MSG: std_msgs/MultiArrayDimension~%string label   # label of given dimension~%uint32 size    # size of given dimension (in type units)~%uint32 stride  # stride of given dimension~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'xml_data-request)))
  "Returns full string definition for message of type 'xml_data-request"
  (cl:format cl:nil "std_msgs/ByteMultiArray data~%~%================================================================================~%MSG: std_msgs/ByteMultiArray~%# Please look at the MultiArrayLayout message definition for~%# documentation on all multiarrays.~%~%MultiArrayLayout  layout        # specification of data layout~%byte[]            data          # array of data~%~%~%================================================================================~%MSG: std_msgs/MultiArrayLayout~%# The multiarray declares a generic multi-dimensional array of a~%# particular data type.  Dimensions are ordered from outer most~%# to inner most.~%~%MultiArrayDimension[] dim # Array of dimension properties~%uint32 data_offset        # padding elements at front of data~%~%# Accessors should ALWAYS be written in terms of dimension stride~%# and specified outer-most dimension first.~%# ~%# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]~%#~%# A standard, 3-channel 640x480 image with interleaved color channels~%# would be specified as:~%#~%# dim[0].label  = \"height\"~%# dim[0].size   = 480~%# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)~%# dim[1].label  = \"width\"~%# dim[1].size   = 640~%# dim[1].stride = 3*640 = 1920~%# dim[2].label  = \"channel\"~%# dim[2].size   = 3~%# dim[2].stride = 3~%#~%# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.~%~%================================================================================~%MSG: std_msgs/MultiArrayDimension~%string label   # label of given dimension~%uint32 size    # size of given dimension (in type units)~%uint32 stride  # stride of given dimension~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <xml_data-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'data))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <xml_data-request>))
  "Converts a ROS message object to a list"
  (cl:list 'xml_data-request
    (cl:cons ':data (data msg))
))
;//! \htmlinclude xml_data-response.msg.html

(cl:defclass <xml_data-response> (roslisp-msg-protocol:ros-message)
  ((status_code
    :reader status_code
    :initarg :status_code
    :type cl:integer
    :initform 0))
)

(cl:defclass xml_data-response (<xml_data-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <xml_data-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'xml_data-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<xml_data-response> is deprecated: use common-srv:xml_data-response instead.")))

(cl:ensure-generic-function 'status_code-val :lambda-list '(m))
(cl:defmethod status_code-val ((m <xml_data-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:status_code-val is deprecated.  Use common-srv:status_code instead.")
  (status_code m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <xml_data-response>) ostream)
  "Serializes a message object of type '<xml_data-response>"
  (cl:let* ((signed (cl:slot-value msg 'status_code)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <xml_data-response>) istream)
  "Deserializes a message object of type '<xml_data-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status_code) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<xml_data-response>)))
  "Returns string type for a service object of type '<xml_data-response>"
  "common/xml_dataResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'xml_data-response)))
  "Returns string type for a service object of type 'xml_data-response"
  "common/xml_dataResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<xml_data-response>)))
  "Returns md5sum for a message object of type '<xml_data-response>"
  "301e9cc7244d22b9d325571195eb0275")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'xml_data-response)))
  "Returns md5sum for a message object of type 'xml_data-response"
  "301e9cc7244d22b9d325571195eb0275")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<xml_data-response>)))
  "Returns full string definition for message of type '<xml_data-response>"
  (cl:format cl:nil "int32 status_code #0失败，1完成~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'xml_data-response)))
  "Returns full string definition for message of type 'xml_data-response"
  (cl:format cl:nil "int32 status_code #0失败，1完成~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <xml_data-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <xml_data-response>))
  "Converts a ROS message object to a list"
  (cl:list 'xml_data-response
    (cl:cons ':status_code (status_code msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'xml_data)))
  'xml_data-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'xml_data)))
  'xml_data-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'xml_data)))
  "Returns string type for a service object of type '<xml_data>"
  "common/xml_data")