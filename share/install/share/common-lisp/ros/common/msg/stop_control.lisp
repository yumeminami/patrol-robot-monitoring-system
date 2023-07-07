; Auto-generated. Do not edit!


(cl:in-package common-msg)


;//! \htmlinclude stop_control.msg.html

(cl:defclass <stop_control> (roslisp-msg-protocol:ros-message)
  ((stop_type
    :reader stop_type
    :initarg :stop_type
    :type cl:integer
    :initform 0))
)

(cl:defclass stop_control (<stop_control>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <stop_control>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'stop_control)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-msg:<stop_control> is deprecated: use common-msg:stop_control instead.")))

(cl:ensure-generic-function 'stop_type-val :lambda-list '(m))
(cl:defmethod stop_type-val ((m <stop_control>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-msg:stop_type-val is deprecated.  Use common-msg:stop_type instead.")
  (stop_type m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <stop_control>) ostream)
  "Serializes a message object of type '<stop_control>"
  (cl:let* ((signed (cl:slot-value msg 'stop_type)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <stop_control>) istream)
  "Deserializes a message object of type '<stop_control>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'stop_type) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<stop_control>)))
  "Returns string type for a message object of type '<stop_control>"
  "common/stop_control")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'stop_control)))
  "Returns string type for a message object of type 'stop_control"
  "common/stop_control")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<stop_control>)))
  "Returns md5sum for a message object of type '<stop_control>"
  "1b6fac8d08de0982f05ab0aa2f3aa6b5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'stop_control)))
  "Returns md5sum for a message object of type 'stop_control"
  "1b6fac8d08de0982f05ab0aa2f3aa6b5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<stop_control>)))
  "Returns full string definition for message of type '<stop_control>"
  (cl:format cl:nil "int32 stop_type #0 stop 1 stop 2 自由停止~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'stop_control)))
  "Returns full string definition for message of type 'stop_control"
  (cl:format cl:nil "int32 stop_type #0 stop 1 stop 2 自由停止~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <stop_control>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <stop_control>))
  "Converts a ROS message object to a list"
  (cl:list 'stop_control
    (cl:cons ':stop_type (stop_type msg))
))
