; Auto-generated. Do not edit!


(cl:in-package common-srv)


;//! \htmlinclude VideoData-request.msg.html

(cl:defclass <VideoData-request> (roslisp-msg-protocol:ros-message)
  ((patrol_task_name
    :reader patrol_task_name
    :initarg :patrol_task_name
    :type cl:string
    :initform "")
   (patrol_section_index
    :reader patrol_section_index
    :initarg :patrol_section_index
    :type cl:integer
    :initform 0)
   (video_data
    :reader video_data
    :initarg :video_data
    :type std_msgs-msg:UInt8MultiArray
    :initform (cl:make-instance 'std_msgs-msg:UInt8MultiArray)))
)

(cl:defclass VideoData-request (<VideoData-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VideoData-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VideoData-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<VideoData-request> is deprecated: use common-srv:VideoData-request instead.")))

(cl:ensure-generic-function 'patrol_task_name-val :lambda-list '(m))
(cl:defmethod patrol_task_name-val ((m <VideoData-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:patrol_task_name-val is deprecated.  Use common-srv:patrol_task_name instead.")
  (patrol_task_name m))

(cl:ensure-generic-function 'patrol_section_index-val :lambda-list '(m))
(cl:defmethod patrol_section_index-val ((m <VideoData-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:patrol_section_index-val is deprecated.  Use common-srv:patrol_section_index instead.")
  (patrol_section_index m))

(cl:ensure-generic-function 'video_data-val :lambda-list '(m))
(cl:defmethod video_data-val ((m <VideoData-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:video_data-val is deprecated.  Use common-srv:video_data instead.")
  (video_data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VideoData-request>) ostream)
  "Serializes a message object of type '<VideoData-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'patrol_task_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'patrol_task_name))
  (cl:let* ((signed (cl:slot-value msg 'patrol_section_index)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'video_data) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VideoData-request>) istream)
  "Deserializes a message object of type '<VideoData-request>"
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
      (cl:setf (cl:slot-value msg 'patrol_section_index) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'video_data) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VideoData-request>)))
  "Returns string type for a service object of type '<VideoData-request>"
  "common/VideoDataRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VideoData-request)))
  "Returns string type for a service object of type 'VideoData-request"
  "common/VideoDataRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VideoData-request>)))
  "Returns md5sum for a message object of type '<VideoData-request>"
  "baa99bb834c12c1333deff1c3344d500")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VideoData-request)))
  "Returns md5sum for a message object of type 'VideoData-request"
  "baa99bb834c12c1333deff1c3344d500")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VideoData-request>)))
  "Returns full string definition for message of type '<VideoData-request>"
  (cl:format cl:nil "string patrol_task_name     #连续巡检任务名称 写在patrolsections节点的Intro~%int32 patrol_section_index~%std_msgs/UInt8MultiArray video_data~%~%================================================================================~%MSG: std_msgs/UInt8MultiArray~%# Please look at the MultiArrayLayout message definition for~%# documentation on all multiarrays.~%~%MultiArrayLayout  layout        # specification of data layout~%uint8[]           data          # array of data~%~%~%================================================================================~%MSG: std_msgs/MultiArrayLayout~%# The multiarray declares a generic multi-dimensional array of a~%# particular data type.  Dimensions are ordered from outer most~%# to inner most.~%~%MultiArrayDimension[] dim # Array of dimension properties~%uint32 data_offset        # padding elements at front of data~%~%# Accessors should ALWAYS be written in terms of dimension stride~%# and specified outer-most dimension first.~%# ~%# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]~%#~%# A standard, 3-channel 640x480 image with interleaved color channels~%# would be specified as:~%#~%# dim[0].label  = \"height\"~%# dim[0].size   = 480~%# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)~%# dim[1].label  = \"width\"~%# dim[1].size   = 640~%# dim[1].stride = 3*640 = 1920~%# dim[2].label  = \"channel\"~%# dim[2].size   = 3~%# dim[2].stride = 3~%#~%# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.~%~%================================================================================~%MSG: std_msgs/MultiArrayDimension~%string label   # label of given dimension~%uint32 size    # size of given dimension (in type units)~%uint32 stride  # stride of given dimension~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VideoData-request)))
  "Returns full string definition for message of type 'VideoData-request"
  (cl:format cl:nil "string patrol_task_name     #连续巡检任务名称 写在patrolsections节点的Intro~%int32 patrol_section_index~%std_msgs/UInt8MultiArray video_data~%~%================================================================================~%MSG: std_msgs/UInt8MultiArray~%# Please look at the MultiArrayLayout message definition for~%# documentation on all multiarrays.~%~%MultiArrayLayout  layout        # specification of data layout~%uint8[]           data          # array of data~%~%~%================================================================================~%MSG: std_msgs/MultiArrayLayout~%# The multiarray declares a generic multi-dimensional array of a~%# particular data type.  Dimensions are ordered from outer most~%# to inner most.~%~%MultiArrayDimension[] dim # Array of dimension properties~%uint32 data_offset        # padding elements at front of data~%~%# Accessors should ALWAYS be written in terms of dimension stride~%# and specified outer-most dimension first.~%# ~%# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]~%#~%# A standard, 3-channel 640x480 image with interleaved color channels~%# would be specified as:~%#~%# dim[0].label  = \"height\"~%# dim[0].size   = 480~%# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)~%# dim[1].label  = \"width\"~%# dim[1].size   = 640~%# dim[1].stride = 3*640 = 1920~%# dim[2].label  = \"channel\"~%# dim[2].size   = 3~%# dim[2].stride = 3~%#~%# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.~%~%================================================================================~%MSG: std_msgs/MultiArrayDimension~%string label   # label of given dimension~%uint32 size    # size of given dimension (in type units)~%uint32 stride  # stride of given dimension~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VideoData-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'patrol_task_name))
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'video_data))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VideoData-request>))
  "Converts a ROS message object to a list"
  (cl:list 'VideoData-request
    (cl:cons ':patrol_task_name (patrol_task_name msg))
    (cl:cons ':patrol_section_index (patrol_section_index msg))
    (cl:cons ':video_data (video_data msg))
))
;//! \htmlinclude VideoData-response.msg.html

(cl:defclass <VideoData-response> (roslisp-msg-protocol:ros-message)
  ((status_code
    :reader status_code
    :initarg :status_code
    :type cl:integer
    :initform 0))
)

(cl:defclass VideoData-response (<VideoData-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VideoData-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VideoData-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<VideoData-response> is deprecated: use common-srv:VideoData-response instead.")))

(cl:ensure-generic-function 'status_code-val :lambda-list '(m))
(cl:defmethod status_code-val ((m <VideoData-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:status_code-val is deprecated.  Use common-srv:status_code instead.")
  (status_code m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VideoData-response>) ostream)
  "Serializes a message object of type '<VideoData-response>"
  (cl:let* ((signed (cl:slot-value msg 'status_code)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VideoData-response>) istream)
  "Deserializes a message object of type '<VideoData-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status_code) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VideoData-response>)))
  "Returns string type for a service object of type '<VideoData-response>"
  "common/VideoDataResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VideoData-response)))
  "Returns string type for a service object of type 'VideoData-response"
  "common/VideoDataResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VideoData-response>)))
  "Returns md5sum for a message object of type '<VideoData-response>"
  "baa99bb834c12c1333deff1c3344d500")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VideoData-response)))
  "Returns md5sum for a message object of type 'VideoData-response"
  "baa99bb834c12c1333deff1c3344d500")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VideoData-response>)))
  "Returns full string definition for message of type '<VideoData-response>"
  (cl:format cl:nil "int32 status_code #0失败，1完成~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VideoData-response)))
  "Returns full string definition for message of type 'VideoData-response"
  (cl:format cl:nil "int32 status_code #0失败，1完成~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VideoData-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VideoData-response>))
  "Converts a ROS message object to a list"
  (cl:list 'VideoData-response
    (cl:cons ':status_code (status_code msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'VideoData)))
  'VideoData-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'VideoData)))
  'VideoData-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VideoData)))
  "Returns string type for a service object of type '<VideoData>"
  "common/VideoData")