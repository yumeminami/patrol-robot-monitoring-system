; Auto-generated. Do not edit!


(cl:in-package common-msg)


;//! \htmlinclude RobotRealTimeInfo.msg.html

(cl:defclass <RobotRealTimeInfo> (roslisp-msg-protocol:ros-message)
  ((velocity
    :reader velocity
    :initarg :velocity
    :type cl:float
    :initform 0.0)
   (position
    :reader position
    :initarg :position
    :type cl:float
    :initform 0.0)
   (position_control_state
    :reader position_control_state
    :initarg :position_control_state
    :type cl:integer
    :initform 0)
   (battery_state
    :reader battery_state
    :initarg :battery_state
    :type cl:integer
    :initform 0)
   (battery_level
    :reader battery_level
    :initarg :battery_level
    :type cl:integer
    :initform 0))
)

(cl:defclass RobotRealTimeInfo (<RobotRealTimeInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotRealTimeInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotRealTimeInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-msg:<RobotRealTimeInfo> is deprecated: use common-msg:RobotRealTimeInfo instead.")))

(cl:ensure-generic-function 'velocity-val :lambda-list '(m))
(cl:defmethod velocity-val ((m <RobotRealTimeInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-msg:velocity-val is deprecated.  Use common-msg:velocity instead.")
  (velocity m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <RobotRealTimeInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-msg:position-val is deprecated.  Use common-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'position_control_state-val :lambda-list '(m))
(cl:defmethod position_control_state-val ((m <RobotRealTimeInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-msg:position_control_state-val is deprecated.  Use common-msg:position_control_state instead.")
  (position_control_state m))

(cl:ensure-generic-function 'battery_state-val :lambda-list '(m))
(cl:defmethod battery_state-val ((m <RobotRealTimeInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-msg:battery_state-val is deprecated.  Use common-msg:battery_state instead.")
  (battery_state m))

(cl:ensure-generic-function 'battery_level-val :lambda-list '(m))
(cl:defmethod battery_level-val ((m <RobotRealTimeInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-msg:battery_level-val is deprecated.  Use common-msg:battery_level instead.")
  (battery_level m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotRealTimeInfo>) ostream)
  "Serializes a message object of type '<RobotRealTimeInfo>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'velocity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'position))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'position_control_state)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'battery_state)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'battery_level)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotRealTimeInfo>) istream)
  "Deserializes a message object of type '<RobotRealTimeInfo>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'velocity) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'position) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'position_control_state) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'battery_state) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'battery_level) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotRealTimeInfo>)))
  "Returns string type for a message object of type '<RobotRealTimeInfo>"
  "common/RobotRealTimeInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotRealTimeInfo)))
  "Returns string type for a message object of type 'RobotRealTimeInfo"
  "common/RobotRealTimeInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotRealTimeInfo>)))
  "Returns md5sum for a message object of type '<RobotRealTimeInfo>"
  "3b8aa7073ad1bc4871cf8c840555bf9c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotRealTimeInfo)))
  "Returns md5sum for a message object of type 'RobotRealTimeInfo"
  "3b8aa7073ad1bc4871cf8c840555bf9c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotRealTimeInfo>)))
  "Returns full string definition for message of type '<RobotRealTimeInfo>"
  (cl:format cl:nil "float32 velocity                #运动速度~%float32 position                #当前位置~%int32 position_control_state    #位置控制状态：0 未完成 1 完成~%int32 battery_state             #电池充电状态：0 代表充电 1 代表未充电~%int32 battery_level             #电池电量(0-100)~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotRealTimeInfo)))
  "Returns full string definition for message of type 'RobotRealTimeInfo"
  (cl:format cl:nil "float32 velocity                #运动速度~%float32 position                #当前位置~%int32 position_control_state    #位置控制状态：0 未完成 1 完成~%int32 battery_state             #电池充电状态：0 代表充电 1 代表未充电~%int32 battery_level             #电池电量(0-100)~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotRealTimeInfo>))
  (cl:+ 0
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotRealTimeInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotRealTimeInfo
    (cl:cons ':velocity (velocity msg))
    (cl:cons ':position (position msg))
    (cl:cons ':position_control_state (position_control_state msg))
    (cl:cons ':battery_state (battery_state msg))
    (cl:cons ':battery_level (battery_level msg))
))
