; Auto-generated. Do not edit!


(cl:in-package common-srv)


;//! \htmlinclude FirmwareUpdate-request.msg.html

(cl:defclass <FirmwareUpdate-request> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type cl:string
    :initform ""))
)

(cl:defclass FirmwareUpdate-request (<FirmwareUpdate-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FirmwareUpdate-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FirmwareUpdate-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<FirmwareUpdate-request> is deprecated: use common-srv:FirmwareUpdate-request instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <FirmwareUpdate-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:data-val is deprecated.  Use common-srv:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FirmwareUpdate-request>) ostream)
  "Serializes a message object of type '<FirmwareUpdate-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FirmwareUpdate-request>) istream)
  "Deserializes a message object of type '<FirmwareUpdate-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FirmwareUpdate-request>)))
  "Returns string type for a service object of type '<FirmwareUpdate-request>"
  "common/FirmwareUpdateRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FirmwareUpdate-request)))
  "Returns string type for a service object of type 'FirmwareUpdate-request"
  "common/FirmwareUpdateRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FirmwareUpdate-request>)))
  "Returns md5sum for a message object of type '<FirmwareUpdate-request>"
  "c5819519b16be731a77f3869f8987fe2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FirmwareUpdate-request)))
  "Returns md5sum for a message object of type 'FirmwareUpdate-request"
  "c5819519b16be731a77f3869f8987fe2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FirmwareUpdate-request>)))
  "Returns full string definition for message of type '<FirmwareUpdate-request>"
  (cl:format cl:nil "string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FirmwareUpdate-request)))
  "Returns full string definition for message of type 'FirmwareUpdate-request"
  (cl:format cl:nil "string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FirmwareUpdate-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'data))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FirmwareUpdate-request>))
  "Converts a ROS message object to a list"
  (cl:list 'FirmwareUpdate-request
    (cl:cons ':data (data msg))
))
;//! \htmlinclude FirmwareUpdate-response.msg.html

(cl:defclass <FirmwareUpdate-response> (roslisp-msg-protocol:ros-message)
  ((status_code
    :reader status_code
    :initarg :status_code
    :type cl:integer
    :initform 0))
)

(cl:defclass FirmwareUpdate-response (<FirmwareUpdate-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FirmwareUpdate-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FirmwareUpdate-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<FirmwareUpdate-response> is deprecated: use common-srv:FirmwareUpdate-response instead.")))

(cl:ensure-generic-function 'status_code-val :lambda-list '(m))
(cl:defmethod status_code-val ((m <FirmwareUpdate-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:status_code-val is deprecated.  Use common-srv:status_code instead.")
  (status_code m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FirmwareUpdate-response>) ostream)
  "Serializes a message object of type '<FirmwareUpdate-response>"
  (cl:let* ((signed (cl:slot-value msg 'status_code)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FirmwareUpdate-response>) istream)
  "Deserializes a message object of type '<FirmwareUpdate-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status_code) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FirmwareUpdate-response>)))
  "Returns string type for a service object of type '<FirmwareUpdate-response>"
  "common/FirmwareUpdateResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FirmwareUpdate-response)))
  "Returns string type for a service object of type 'FirmwareUpdate-response"
  "common/FirmwareUpdateResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FirmwareUpdate-response>)))
  "Returns md5sum for a message object of type '<FirmwareUpdate-response>"
  "c5819519b16be731a77f3869f8987fe2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FirmwareUpdate-response)))
  "Returns md5sum for a message object of type 'FirmwareUpdate-response"
  "c5819519b16be731a77f3869f8987fe2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FirmwareUpdate-response>)))
  "Returns full string definition for message of type '<FirmwareUpdate-response>"
  (cl:format cl:nil "int32 status_code #0失败，1完成~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FirmwareUpdate-response)))
  "Returns full string definition for message of type 'FirmwareUpdate-response"
  (cl:format cl:nil "int32 status_code #0失败，1完成~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FirmwareUpdate-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FirmwareUpdate-response>))
  "Converts a ROS message object to a list"
  (cl:list 'FirmwareUpdate-response
    (cl:cons ':status_code (status_code msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'FirmwareUpdate)))
  'FirmwareUpdate-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'FirmwareUpdate)))
  'FirmwareUpdate-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FirmwareUpdate)))
  "Returns string type for a service object of type '<FirmwareUpdate>"
  "common/FirmwareUpdate")