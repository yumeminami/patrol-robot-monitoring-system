; Auto-generated. Do not edit!


(cl:in-package common-srv)


;//! \htmlinclude RecordPosition-request.msg.html

(cl:defclass <RecordPosition-request> (roslisp-msg-protocol:ros-message)
  ((robot_state
    :reader robot_state
    :initarg :robot_state
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (time
    :reader time
    :initarg :time
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (position
    :reader position
    :initarg :position
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass RecordPosition-request (<RecordPosition-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RecordPosition-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RecordPosition-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<RecordPosition-request> is deprecated: use common-srv:RecordPosition-request instead.")))

(cl:ensure-generic-function 'robot_state-val :lambda-list '(m))
(cl:defmethod robot_state-val ((m <RecordPosition-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:robot_state-val is deprecated.  Use common-srv:robot_state instead.")
  (robot_state m))

(cl:ensure-generic-function 'time-val :lambda-list '(m))
(cl:defmethod time-val ((m <RecordPosition-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:time-val is deprecated.  Use common-srv:time instead.")
  (time m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <RecordPosition-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:position-val is deprecated.  Use common-srv:position instead.")
  (position m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RecordPosition-request>) ostream)
  "Serializes a message object of type '<RecordPosition-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'robot_state))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'robot_state))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'time))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'position))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'position))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RecordPosition-request>) istream)
  "Deserializes a message object of type '<RecordPosition-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'robot_state) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'robot_state)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'time) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'time)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'position) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'position)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
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
  "7a611c192c7d0449dba995ec9bb64dc9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RecordPosition-request)))
  "Returns md5sum for a message object of type 'RecordPosition-request"
  "7a611c192c7d0449dba995ec9bb64dc9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RecordPosition-request>)))
  "Returns full string definition for message of type '<RecordPosition-request>"
  (cl:format cl:nil "int32[] robot_state~%float32[] time~%float32[] position~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RecordPosition-request)))
  "Returns full string definition for message of type 'RecordPosition-request"
  (cl:format cl:nil "int32[] robot_state~%float32[] time~%float32[] position~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RecordPosition-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'robot_state) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'time) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'position) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RecordPosition-request>))
  "Converts a ROS message object to a list"
  (cl:list 'RecordPosition-request
    (cl:cons ':robot_state (robot_state msg))
    (cl:cons ':time (time msg))
    (cl:cons ':position (position msg))
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
  "7a611c192c7d0449dba995ec9bb64dc9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RecordPosition-response)))
  "Returns md5sum for a message object of type 'RecordPosition-response"
  "7a611c192c7d0449dba995ec9bb64dc9")
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