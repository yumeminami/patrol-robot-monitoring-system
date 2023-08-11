; Auto-generated. Do not edit!


(cl:in-package common-srv)


;//! \htmlinclude ContinousXmlData-request.msg.html

(cl:defclass <ContinousXmlData-request> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type cl:string
    :initform ""))
)

(cl:defclass ContinousXmlData-request (<ContinousXmlData-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ContinousXmlData-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ContinousXmlData-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<ContinousXmlData-request> is deprecated: use common-srv:ContinousXmlData-request instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <ContinousXmlData-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:data-val is deprecated.  Use common-srv:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ContinousXmlData-request>) ostream)
  "Serializes a message object of type '<ContinousXmlData-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ContinousXmlData-request>) istream)
  "Deserializes a message object of type '<ContinousXmlData-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'data) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'data) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ContinousXmlData-request>)))
  "Returns string type for a service object of type '<ContinousXmlData-request>"
  "common/ContinousXmlDataRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ContinousXmlData-request)))
  "Returns string type for a service object of type 'ContinousXmlData-request"
  "common/ContinousXmlDataRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ContinousXmlData-request>)))
  "Returns md5sum for a message object of type '<ContinousXmlData-request>"
  "c5819519b16be731a77f3869f8987fe2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ContinousXmlData-request)))
  "Returns md5sum for a message object of type 'ContinousXmlData-request"
  "c5819519b16be731a77f3869f8987fe2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ContinousXmlData-request>)))
  "Returns full string definition for message of type '<ContinousXmlData-request>"
  (cl:format cl:nil "string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ContinousXmlData-request)))
  "Returns full string definition for message of type 'ContinousXmlData-request"
  (cl:format cl:nil "string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ContinousXmlData-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'data))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ContinousXmlData-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ContinousXmlData-request
    (cl:cons ':data (data msg))
))
;//! \htmlinclude ContinousXmlData-response.msg.html

(cl:defclass <ContinousXmlData-response> (roslisp-msg-protocol:ros-message)
  ((status_code
    :reader status_code
    :initarg :status_code
    :type cl:integer
    :initform 0))
)

(cl:defclass ContinousXmlData-response (<ContinousXmlData-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ContinousXmlData-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ContinousXmlData-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<ContinousXmlData-response> is deprecated: use common-srv:ContinousXmlData-response instead.")))

(cl:ensure-generic-function 'status_code-val :lambda-list '(m))
(cl:defmethod status_code-val ((m <ContinousXmlData-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:status_code-val is deprecated.  Use common-srv:status_code instead.")
  (status_code m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ContinousXmlData-response>) ostream)
  "Serializes a message object of type '<ContinousXmlData-response>"
  (cl:let* ((signed (cl:slot-value msg 'status_code)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ContinousXmlData-response>) istream)
  "Deserializes a message object of type '<ContinousXmlData-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status_code) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ContinousXmlData-response>)))
  "Returns string type for a service object of type '<ContinousXmlData-response>"
  "common/ContinousXmlDataResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ContinousXmlData-response)))
  "Returns string type for a service object of type 'ContinousXmlData-response"
  "common/ContinousXmlDataResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ContinousXmlData-response>)))
  "Returns md5sum for a message object of type '<ContinousXmlData-response>"
  "c5819519b16be731a77f3869f8987fe2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ContinousXmlData-response)))
  "Returns md5sum for a message object of type 'ContinousXmlData-response"
  "c5819519b16be731a77f3869f8987fe2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ContinousXmlData-response>)))
  "Returns full string definition for message of type '<ContinousXmlData-response>"
  (cl:format cl:nil "int32 status_code #0失败，1完成~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ContinousXmlData-response)))
  "Returns full string definition for message of type 'ContinousXmlData-response"
  (cl:format cl:nil "int32 status_code #0失败，1完成~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ContinousXmlData-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ContinousXmlData-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ContinousXmlData-response
    (cl:cons ':status_code (status_code msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ContinousXmlData)))
  'ContinousXmlData-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ContinousXmlData)))
  'ContinousXmlData-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ContinousXmlData)))
  "Returns string type for a service object of type '<ContinousXmlData>"
  "common/ContinousXmlData")