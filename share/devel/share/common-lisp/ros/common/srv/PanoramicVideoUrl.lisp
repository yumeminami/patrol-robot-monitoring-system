; Auto-generated. Do not edit!


(cl:in-package common-srv)


;//! \htmlinclude PanoramicVideoUrl-request.msg.html

(cl:defclass <PanoramicVideoUrl-request> (roslisp-msg-protocol:ros-message)
  ((panoramic_video_url
    :reader panoramic_video_url
    :initarg :panoramic_video_url
    :type cl:string
    :initform ""))
)

(cl:defclass PanoramicVideoUrl-request (<PanoramicVideoUrl-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PanoramicVideoUrl-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PanoramicVideoUrl-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<PanoramicVideoUrl-request> is deprecated: use common-srv:PanoramicVideoUrl-request instead.")))

(cl:ensure-generic-function 'panoramic_video_url-val :lambda-list '(m))
(cl:defmethod panoramic_video_url-val ((m <PanoramicVideoUrl-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common-srv:panoramic_video_url-val is deprecated.  Use common-srv:panoramic_video_url instead.")
  (panoramic_video_url m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PanoramicVideoUrl-request>) ostream)
  "Serializes a message object of type '<PanoramicVideoUrl-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'panoramic_video_url))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'panoramic_video_url))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PanoramicVideoUrl-request>) istream)
  "Deserializes a message object of type '<PanoramicVideoUrl-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'panoramic_video_url) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'panoramic_video_url) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PanoramicVideoUrl-request>)))
  "Returns string type for a service object of type '<PanoramicVideoUrl-request>"
  "common/PanoramicVideoUrlRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PanoramicVideoUrl-request)))
  "Returns string type for a service object of type 'PanoramicVideoUrl-request"
  "common/PanoramicVideoUrlRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PanoramicVideoUrl-request>)))
  "Returns md5sum for a message object of type '<PanoramicVideoUrl-request>"
  "ba607c1e80b486a09f8e68edd373cea1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PanoramicVideoUrl-request)))
  "Returns md5sum for a message object of type 'PanoramicVideoUrl-request"
  "ba607c1e80b486a09f8e68edd373cea1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PanoramicVideoUrl-request>)))
  "Returns full string definition for message of type '<PanoramicVideoUrl-request>"
  (cl:format cl:nil "string panoramic_video_url~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PanoramicVideoUrl-request)))
  "Returns full string definition for message of type 'PanoramicVideoUrl-request"
  (cl:format cl:nil "string panoramic_video_url~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PanoramicVideoUrl-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'panoramic_video_url))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PanoramicVideoUrl-request>))
  "Converts a ROS message object to a list"
  (cl:list 'PanoramicVideoUrl-request
    (cl:cons ':panoramic_video_url (panoramic_video_url msg))
))
;//! \htmlinclude PanoramicVideoUrl-response.msg.html

(cl:defclass <PanoramicVideoUrl-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass PanoramicVideoUrl-response (<PanoramicVideoUrl-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PanoramicVideoUrl-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PanoramicVideoUrl-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common-srv:<PanoramicVideoUrl-response> is deprecated: use common-srv:PanoramicVideoUrl-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PanoramicVideoUrl-response>) ostream)
  "Serializes a message object of type '<PanoramicVideoUrl-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PanoramicVideoUrl-response>) istream)
  "Deserializes a message object of type '<PanoramicVideoUrl-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PanoramicVideoUrl-response>)))
  "Returns string type for a service object of type '<PanoramicVideoUrl-response>"
  "common/PanoramicVideoUrlResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PanoramicVideoUrl-response)))
  "Returns string type for a service object of type 'PanoramicVideoUrl-response"
  "common/PanoramicVideoUrlResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PanoramicVideoUrl-response>)))
  "Returns md5sum for a message object of type '<PanoramicVideoUrl-response>"
  "ba607c1e80b486a09f8e68edd373cea1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PanoramicVideoUrl-response)))
  "Returns md5sum for a message object of type 'PanoramicVideoUrl-response"
  "ba607c1e80b486a09f8e68edd373cea1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PanoramicVideoUrl-response>)))
  "Returns full string definition for message of type '<PanoramicVideoUrl-response>"
  (cl:format cl:nil "~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PanoramicVideoUrl-response)))
  "Returns full string definition for message of type 'PanoramicVideoUrl-response"
  (cl:format cl:nil "~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PanoramicVideoUrl-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PanoramicVideoUrl-response>))
  "Converts a ROS message object to a list"
  (cl:list 'PanoramicVideoUrl-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'PanoramicVideoUrl)))
  'PanoramicVideoUrl-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'PanoramicVideoUrl)))
  'PanoramicVideoUrl-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PanoramicVideoUrl)))
  "Returns string type for a service object of type '<PanoramicVideoUrl>"
  "common/PanoramicVideoUrl")