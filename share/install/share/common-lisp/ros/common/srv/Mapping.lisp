; Auto-generated. Do not edit!


(cl:in-package common-srv)


;//! \htmlinclude Mapping-request.msg.html

(cl:defclass <Mapping-request> (roslisp-msg-protocol:ros-message)
  ((mapping_cmd
    :reader mapping_cmd
    :initarg :mapping_cmd
    :type cl:integer
    :initform 0))
)

(cl:defclass Mapping-request (<Mapping-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Mapping-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Mapping-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<Mapping-request> is deprecated: use common-srv:Mapping-request instead.")))

(cl:ensure-generic-function 'mapping_cmd-val :lambda-list '(m))
(cl:defmethod mapping_cmd-val ((m <Mapping-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:mapping_cmd-val is deprecated.  Use common-srv:mapping_cmd instead.")
  (mapping_cmd m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Mapping-request>) ostream)
  "Serializes a message object of type '<Mapping-request>"
  (cl:let* ((signed (cl:slot-value msg 'mapping_cmd)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Mapping-request>) istream)
  "Deserializes a message object of type '<Mapping-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mapping_cmd) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Mapping-request>)))
  "Returns string type for a service object of type '<Mapping-request>"
  "common/MappingRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Mapping-request)))
  "Returns string type for a service object of type 'Mapping-request"
  "common/MappingRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Mapping-request>)))
  "Returns md5sum for a message object of type '<Mapping-request>"
  "15e6a864f16c73d6aacfe9af1cbf92ef")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Mapping-request)))
  "Returns md5sum for a message object of type 'Mapping-request"
  "15e6a864f16c73d6aacfe9af1cbf92ef")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Mapping-request>)))
  "Returns full string definition for message of type '<Mapping-request>"
  (cl:format cl:nil "int32 mapping_cmd~%#1开始~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Mapping-request)))
  "Returns full string definition for message of type 'Mapping-request"
  (cl:format cl:nil "int32 mapping_cmd~%#1开始~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Mapping-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Mapping-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Mapping-request
    (cl:cons ':mapping_cmd (mapping_cmd msg))
))
;//! \htmlinclude Mapping-response.msg.html

(cl:defclass <Mapping-response> (roslisp-msg-protocol:ros-message)
  ((status_code
    :reader status_code
    :initarg :status_code
    :type cl:integer
    :initform 0))
)

(cl:defclass Mapping-response (<Mapping-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Mapping-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Mapping-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<Mapping-response> is deprecated: use common-srv:Mapping-response instead.")))

(cl:ensure-generic-function 'status_code-val :lambda-list '(m))
(cl:defmethod status_code-val ((m <Mapping-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:status_code-val is deprecated.  Use common-srv:status_code instead.")
  (status_code m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Mapping-response>) ostream)
  "Serializes a message object of type '<Mapping-response>"
  (cl:let* ((signed (cl:slot-value msg 'status_code)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Mapping-response>) istream)
  "Deserializes a message object of type '<Mapping-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status_code) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Mapping-response>)))
  "Returns string type for a service object of type '<Mapping-response>"
  "common/MappingResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Mapping-response)))
  "Returns string type for a service object of type 'Mapping-response"
  "common/MappingResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Mapping-response>)))
  "Returns md5sum for a message object of type '<Mapping-response>"
  "15e6a864f16c73d6aacfe9af1cbf92ef")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Mapping-response)))
  "Returns md5sum for a message object of type 'Mapping-response"
  "15e6a864f16c73d6aacfe9af1cbf92ef")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Mapping-response>)))
  "Returns full string definition for message of type '<Mapping-response>"
  (cl:format cl:nil "int32 status_code #0失败，1完成~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Mapping-response)))
  "Returns full string definition for message of type 'Mapping-response"
  (cl:format cl:nil "int32 status_code #0失败，1完成~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Mapping-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Mapping-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Mapping-response
    (cl:cons ':status_code (status_code msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Mapping)))
  'Mapping-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Mapping)))
  'Mapping-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Mapping)))
  "Returns string type for a service object of type '<Mapping>"
  "common/Mapping")