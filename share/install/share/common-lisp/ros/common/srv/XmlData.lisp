; Auto-generated. Do not edit!


(cl:in-package common-srv)


;//! \htmlinclude XmlData-request.msg.html

(cl:defclass <XmlData-request> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type cl:string
    :initform ""))
)

(cl:defclass XmlData-request (<XmlData-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <XmlData-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'XmlData-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<XmlData-request> is deprecated: use common-srv:XmlData-request instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <XmlData-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:data-val is deprecated.  Use common-srv:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <XmlData-request>) ostream)
  "Serializes a message object of type '<XmlData-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <XmlData-request>) istream)
  "Deserializes a message object of type '<XmlData-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<XmlData-request>)))
  "Returns string type for a service object of type '<XmlData-request>"
  "common/XmlDataRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'XmlData-request)))
  "Returns string type for a service object of type 'XmlData-request"
  "common/XmlDataRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<XmlData-request>)))
  "Returns md5sum for a message object of type '<XmlData-request>"
  "c5819519b16be731a77f3869f8987fe2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'XmlData-request)))
  "Returns md5sum for a message object of type 'XmlData-request"
  "c5819519b16be731a77f3869f8987fe2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<XmlData-request>)))
  "Returns full string definition for message of type '<XmlData-request>"
  (cl:format cl:nil "string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'XmlData-request)))
  "Returns full string definition for message of type 'XmlData-request"
  (cl:format cl:nil "string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <XmlData-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'data))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <XmlData-request>))
  "Converts a ROS message object to a list"
  (cl:list 'XmlData-request
    (cl:cons ':data (data msg))
))
;//! \htmlinclude XmlData-response.msg.html

(cl:defclass <XmlData-response> (roslisp-msg-protocol:ros-message)
  ((status_code
    :reader status_code
    :initarg :status_code
    :type cl:integer
    :initform 0))
)

(cl:defclass XmlData-response (<XmlData-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <XmlData-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'XmlData-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<XmlData-response> is deprecated: use common-srv:XmlData-response instead.")))

(cl:ensure-generic-function 'status_code-val :lambda-list '(m))
(cl:defmethod status_code-val ((m <XmlData-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:status_code-val is deprecated.  Use common-srv:status_code instead.")
  (status_code m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <XmlData-response>) ostream)
  "Serializes a message object of type '<XmlData-response>"
  (cl:let* ((signed (cl:slot-value msg 'status_code)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <XmlData-response>) istream)
  "Deserializes a message object of type '<XmlData-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status_code) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<XmlData-response>)))
  "Returns string type for a service object of type '<XmlData-response>"
  "common/XmlDataResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'XmlData-response)))
  "Returns string type for a service object of type 'XmlData-response"
  "common/XmlDataResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<XmlData-response>)))
  "Returns md5sum for a message object of type '<XmlData-response>"
  "c5819519b16be731a77f3869f8987fe2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'XmlData-response)))
  "Returns md5sum for a message object of type 'XmlData-response"
  "c5819519b16be731a77f3869f8987fe2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<XmlData-response>)))
  "Returns full string definition for message of type '<XmlData-response>"
  (cl:format cl:nil "int32 status_code #0失败，1完成~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'XmlData-response)))
  "Returns full string definition for message of type 'XmlData-response"
  (cl:format cl:nil "int32 status_code #0失败，1完成~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <XmlData-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <XmlData-response>))
  "Converts a ROS message object to a list"
  (cl:list 'XmlData-response
    (cl:cons ':status_code (status_code msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'XmlData)))
  'XmlData-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'XmlData)))
  'XmlData-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'XmlData)))
  "Returns string type for a service object of type '<XmlData>"
  "common/XmlData")