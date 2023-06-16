; Auto-generated. Do not edit!


(cl:in-package common-msg)


;//! \htmlinclude sensor_data.msg.html

(cl:defclass <sensor_data> (roslisp-msg-protocol:ros-message)
  ((temperature
    :reader temperature
    :initarg :temperature
    :type cl:float
    :initform 0.0)
   (humidity
    :reader humidity
    :initarg :humidity
    :type cl:float
    :initform 0.0)
   (light
    :reader light
    :initarg :light
    :type cl:float
    :initform 0.0)
   (PM1_0
    :reader PM1_0
    :initarg :PM1_0
    :type cl:integer
    :initform 0)
   (PM2_5
    :reader PM2_5
    :initarg :PM2_5
    :type cl:integer
    :initform 0)
   (PM10
    :reader PM10
    :initarg :PM10
    :type cl:integer
    :initform 0)
   (smoke1
    :reader smoke1
    :initarg :smoke1
    :type cl:integer
    :initform 0)
   (smoke2
    :reader smoke2
    :initarg :smoke2
    :type cl:integer
    :initform 0))
)

(cl:defclass sensor_data (<sensor_data>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <sensor_data>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'sensor_data)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-msg:<sensor_data> is deprecated: use common-msg:sensor_data instead.")))

(cl:ensure-generic-function 'temperature-val :lambda-list '(m))
(cl:defmethod temperature-val ((m <sensor_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-msg:temperature-val is deprecated.  Use common-msg:temperature instead.")
  (temperature m))

(cl:ensure-generic-function 'humidity-val :lambda-list '(m))
(cl:defmethod humidity-val ((m <sensor_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-msg:humidity-val is deprecated.  Use common-msg:humidity instead.")
  (humidity m))

(cl:ensure-generic-function 'light-val :lambda-list '(m))
(cl:defmethod light-val ((m <sensor_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-msg:light-val is deprecated.  Use common-msg:light instead.")
  (light m))

(cl:ensure-generic-function 'PM1_0-val :lambda-list '(m))
(cl:defmethod PM1_0-val ((m <sensor_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-msg:PM1_0-val is deprecated.  Use common-msg:PM1_0 instead.")
  (PM1_0 m))

(cl:ensure-generic-function 'PM2_5-val :lambda-list '(m))
(cl:defmethod PM2_5-val ((m <sensor_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-msg:PM2_5-val is deprecated.  Use common-msg:PM2_5 instead.")
  (PM2_5 m))

(cl:ensure-generic-function 'PM10-val :lambda-list '(m))
(cl:defmethod PM10-val ((m <sensor_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-msg:PM10-val is deprecated.  Use common-msg:PM10 instead.")
  (PM10 m))

(cl:ensure-generic-function 'smoke1-val :lambda-list '(m))
(cl:defmethod smoke1-val ((m <sensor_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-msg:smoke1-val is deprecated.  Use common-msg:smoke1 instead.")
  (smoke1 m))

(cl:ensure-generic-function 'smoke2-val :lambda-list '(m))
(cl:defmethod smoke2-val ((m <sensor_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-msg:smoke2-val is deprecated.  Use common-msg:smoke2 instead.")
  (smoke2 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <sensor_data>) ostream)
  "Serializes a message object of type '<sensor_data>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'temperature))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'humidity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'light))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'PM1_0)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'PM2_5)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'PM10)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'smoke1)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'smoke2)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <sensor_data>) istream)
  "Deserializes a message object of type '<sensor_data>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'temperature) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'humidity) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'light) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'PM1_0) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'PM2_5) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'PM10) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'smoke1) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'smoke2) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<sensor_data>)))
  "Returns string type for a message object of type '<sensor_data>"
  "common/sensor_data")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'sensor_data)))
  "Returns string type for a message object of type 'sensor_data"
  "common/sensor_data")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<sensor_data>)))
  "Returns md5sum for a message object of type '<sensor_data>"
  "2514f8bdc76a9a175afe9b9b60de1304")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'sensor_data)))
  "Returns md5sum for a message object of type 'sensor_data"
  "2514f8bdc76a9a175afe9b9b60de1304")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<sensor_data>)))
  "Returns full string definition for message of type '<sensor_data>"
  (cl:format cl:nil "float32 temperature~%float32 humidity~%~%float32 light~%int32 PM1_0~%int32 PM2_5~%int32 PM10~%int32 smoke1~%int32 smoke2~%~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'sensor_data)))
  "Returns full string definition for message of type 'sensor_data"
  (cl:format cl:nil "float32 temperature~%float32 humidity~%~%float32 light~%int32 PM1_0~%int32 PM2_5~%int32 PM10~%int32 smoke1~%int32 smoke2~%~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <sensor_data>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <sensor_data>))
  "Converts a ROS message object to a list"
  (cl:list 'sensor_data
    (cl:cons ':temperature (temperature msg))
    (cl:cons ':humidity (humidity msg))
    (cl:cons ':light (light msg))
    (cl:cons ':PM1_0 (PM1_0 msg))
    (cl:cons ':PM2_5 (PM2_5 msg))
    (cl:cons ':PM10 (PM10 msg))
    (cl:cons ':smoke1 (smoke1 msg))
    (cl:cons ':smoke2 (smoke2 msg))
))
