; Auto-generated. Do not edit!


(cl:in-package common-srv)


;//! \htmlinclude ReportError-request.msg.html

(cl:defclass <ReportError-request> (roslisp-msg-protocol:ros-message)
  ((error_code
    :reader error_code
    :initarg :error_code
    :type cl:integer
    :initform 0)
   (error_string
    :reader error_string
    :initarg :error_string
    :type cl:string
    :initform ""))
)

(cl:defclass ReportError-request (<ReportError-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ReportError-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ReportError-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<ReportError-request> is deprecated: use common-srv:ReportError-request instead.")))

(cl:ensure-generic-function 'error_code-val :lambda-list '(m))
(cl:defmethod error_code-val ((m <ReportError-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:error_code-val is deprecated.  Use common-srv:error_code instead.")
  (error_code m))

(cl:ensure-generic-function 'error_string-val :lambda-list '(m))
(cl:defmethod error_string-val ((m <ReportError-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:error_string-val is deprecated.  Use common-srv:error_string instead.")
  (error_string m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ReportError-request>) ostream)
  "Serializes a message object of type '<ReportError-request>"
  (cl:let* ((signed (cl:slot-value msg 'error_code)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'error_string))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'error_string))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ReportError-request>) istream)
  "Deserializes a message object of type '<ReportError-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'error_code) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'error_string) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'error_string) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ReportError-request>)))
  "Returns string type for a service object of type '<ReportError-request>"
  "common/ReportErrorRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ReportError-request)))
  "Returns string type for a service object of type 'ReportError-request"
  "common/ReportErrorRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ReportError-request>)))
  "Returns md5sum for a message object of type '<ReportError-request>"
  "0fc660883a6c87f1be5fe7a1f9fb2b19")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ReportError-request)))
  "Returns md5sum for a message object of type 'ReportError-request"
  "0fc660883a6c87f1be5fe7a1f9fb2b19")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ReportError-request>)))
  "Returns full string definition for message of type '<ReportError-request>"
  (cl:format cl:nil "int32 error_code~%string error_string~%# 1 无法对齐防火门金属传感器~%# 2 无法对齐充电金属传感器~%# 3 无法打开防火门~%# 4 无法关闭防火门~%# 5 无法开启充电~%# 6 无法关闭充电~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ReportError-request)))
  "Returns full string definition for message of type 'ReportError-request"
  (cl:format cl:nil "int32 error_code~%string error_string~%# 1 无法对齐防火门金属传感器~%# 2 无法对齐充电金属传感器~%# 3 无法打开防火门~%# 4 无法关闭防火门~%# 5 无法开启充电~%# 6 无法关闭充电~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ReportError-request>))
  (cl:+ 0
     4
     4 (cl:length (cl:slot-value msg 'error_string))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ReportError-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ReportError-request
    (cl:cons ':error_code (error_code msg))
    (cl:cons ':error_string (error_string msg))
))
;//! \htmlinclude ReportError-response.msg.html

(cl:defclass <ReportError-response> (roslisp-msg-protocol:ros-message)
  ((status_code
    :reader status_code
    :initarg :status_code
    :type cl:integer
    :initform 0))
)

(cl:defclass ReportError-response (<ReportError-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ReportError-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ReportError-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<ReportError-response> is deprecated: use common-srv:ReportError-response instead.")))

(cl:ensure-generic-function 'status_code-val :lambda-list '(m))
(cl:defmethod status_code-val ((m <ReportError-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:status_code-val is deprecated.  Use common-srv:status_code instead.")
  (status_code m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ReportError-response>) ostream)
  "Serializes a message object of type '<ReportError-response>"
  (cl:let* ((signed (cl:slot-value msg 'status_code)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ReportError-response>) istream)
  "Deserializes a message object of type '<ReportError-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status_code) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ReportError-response>)))
  "Returns string type for a service object of type '<ReportError-response>"
  "common/ReportErrorResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ReportError-response)))
  "Returns string type for a service object of type 'ReportError-response"
  "common/ReportErrorResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ReportError-response>)))
  "Returns md5sum for a message object of type '<ReportError-response>"
  "0fc660883a6c87f1be5fe7a1f9fb2b19")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ReportError-response)))
  "Returns md5sum for a message object of type 'ReportError-response"
  "0fc660883a6c87f1be5fe7a1f9fb2b19")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ReportError-response>)))
  "Returns full string definition for message of type '<ReportError-response>"
  (cl:format cl:nil "int32 status_code #0失败，1完成~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ReportError-response)))
  "Returns full string definition for message of type 'ReportError-response"
  (cl:format cl:nil "int32 status_code #0失败，1完成~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ReportError-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ReportError-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ReportError-response
    (cl:cons ':status_code (status_code msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ReportError)))
  'ReportError-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ReportError)))
  'ReportError-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ReportError)))
  "Returns string type for a service object of type '<ReportError>"
  "common/ReportError")