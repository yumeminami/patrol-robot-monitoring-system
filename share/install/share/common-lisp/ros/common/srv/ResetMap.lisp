; Auto-generated. Do not edit!


(cl:in-package common-srv)


;//! \htmlinclude ResetMap-request.msg.html

(cl:defclass <ResetMap-request> (roslisp-msg-protocol:ros-message)
  ((reset_map
    :reader reset_map
    :initarg :reset_map
    :type cl:string
    :initform ""))
)

(cl:defclass ResetMap-request (<ResetMap-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ResetMap-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ResetMap-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<ResetMap-request> is deprecated: use common-srv:ResetMap-request instead.")))

(cl:ensure-generic-function 'reset_map-val :lambda-list '(m))
(cl:defmethod reset_map-val ((m <ResetMap-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:reset_map-val is deprecated.  Use common-srv:reset_map instead.")
  (reset_map m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ResetMap-request>) ostream)
  "Serializes a message object of type '<ResetMap-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'reset_map))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'reset_map))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ResetMap-request>) istream)
  "Deserializes a message object of type '<ResetMap-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'reset_map) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'reset_map) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ResetMap-request>)))
  "Returns string type for a service object of type '<ResetMap-request>"
  "common/ResetMapRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ResetMap-request)))
  "Returns string type for a service object of type 'ResetMap-request"
  "common/ResetMapRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ResetMap-request>)))
  "Returns md5sum for a message object of type '<ResetMap-request>"
  "9fabf1eaf267dccbe2dae60c58619584")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ResetMap-request)))
  "Returns md5sum for a message object of type 'ResetMap-request"
  "9fabf1eaf267dccbe2dae60c58619584")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ResetMap-request>)))
  "Returns full string definition for message of type '<ResetMap-request>"
  (cl:format cl:nil "string reset_map~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ResetMap-request)))
  "Returns full string definition for message of type 'ResetMap-request"
  (cl:format cl:nil "string reset_map~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ResetMap-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'reset_map))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ResetMap-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ResetMap-request
    (cl:cons ':reset_map (reset_map msg))
))
;//! \htmlinclude ResetMap-response.msg.html

(cl:defclass <ResetMap-response> (roslisp-msg-protocol:ros-message)
  ((status_code
    :reader status_code
    :initarg :status_code
    :type cl:integer
    :initform 0))
)

(cl:defclass ResetMap-response (<ResetMap-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ResetMap-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ResetMap-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<ResetMap-response> is deprecated: use common-srv:ResetMap-response instead.")))

(cl:ensure-generic-function 'status_code-val :lambda-list '(m))
(cl:defmethod status_code-val ((m <ResetMap-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:status_code-val is deprecated.  Use common-srv:status_code instead.")
  (status_code m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ResetMap-response>) ostream)
  "Serializes a message object of type '<ResetMap-response>"
  (cl:let* ((signed (cl:slot-value msg 'status_code)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ResetMap-response>) istream)
  "Deserializes a message object of type '<ResetMap-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status_code) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ResetMap-response>)))
  "Returns string type for a service object of type '<ResetMap-response>"
  "common/ResetMapResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ResetMap-response)))
  "Returns string type for a service object of type 'ResetMap-response"
  "common/ResetMapResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ResetMap-response>)))
  "Returns md5sum for a message object of type '<ResetMap-response>"
  "9fabf1eaf267dccbe2dae60c58619584")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ResetMap-response)))
  "Returns md5sum for a message object of type 'ResetMap-response"
  "9fabf1eaf267dccbe2dae60c58619584")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ResetMap-response>)))
  "Returns full string definition for message of type '<ResetMap-response>"
  (cl:format cl:nil "int32 status_code #0失败，1完成~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ResetMap-response)))
  "Returns full string definition for message of type 'ResetMap-response"
  (cl:format cl:nil "int32 status_code #0失败，1完成~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ResetMap-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ResetMap-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ResetMap-response
    (cl:cons ':status_code (status_code msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ResetMap)))
  'ResetMap-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ResetMap)))
  'ResetMap-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ResetMap)))
  "Returns string type for a service object of type '<ResetMap>"
  "common/ResetMap")