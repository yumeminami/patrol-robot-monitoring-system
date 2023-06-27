;; Auto-generated. Do not edit!


(when (boundp 'common::PositionControl)
  (if (not (find-package "COMMON"))
    (make-package "COMMON"))
  (shadow 'PositionControl (find-package "COMMON")))
(unless (find-package "COMMON::POSITIONCONTROL")
  (make-package "COMMON::POSITIONCONTROL"))
(unless (find-package "COMMON::POSITIONCONTROLREQUEST")
  (make-package "COMMON::POSITIONCONTROLREQUEST"))
(unless (find-package "COMMON::POSITIONCONTROLRESPONSE")
  (make-package "COMMON::POSITIONCONTROLRESPONSE"))

(in-package "ROS")





(defclass common::PositionControlRequest
  :super ros::object
  :slots (_position_control_type _target_position_f _velocity_f ))

(defmethod common::PositionControlRequest
  (:init
   (&key
    ((:position_control_type __position_control_type) 0)
    ((:target_position_f __target_position_f) 0.0)
    ((:velocity_f __velocity_f) 0.0)
    )
   (send-super :init)
   (setq _position_control_type (round __position_control_type))
   (setq _target_position_f (float __target_position_f))
   (setq _velocity_f (float __velocity_f))
   self)
  (:position_control_type
   (&optional __position_control_type)
   (if __position_control_type (setq _position_control_type __position_control_type)) _position_control_type)
  (:target_position_f
   (&optional __target_position_f)
   (if __target_position_f (setq _target_position_f __target_position_f)) _target_position_f)
  (:velocity_f
   (&optional __velocity_f)
   (if __velocity_f (setq _velocity_f __velocity_f)) _velocity_f)
  (:serialization-length
   ()
   (+
    ;; int32 _position_control_type
    4
    ;; float32 _target_position_f
    4
    ;; float32 _velocity_f
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _position_control_type
       (write-long _position_control_type s)
     ;; float32 _target_position_f
       (sys::poke _target_position_f (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _velocity_f
       (sys::poke _velocity_f (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _position_control_type
     (setq _position_control_type (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _target_position_f
     (setq _target_position_f (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _velocity_f
     (setq _velocity_f (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass common::PositionControlResponse
  :super ros::object
  :slots (_status_code _err_msg ))

(defmethod common::PositionControlResponse
  (:init
   (&key
    ((:status_code __status_code) 0)
    ((:err_msg __err_msg) "")
    )
   (send-super :init)
   (setq _status_code (round __status_code))
   (setq _err_msg (string __err_msg))
   self)
  (:status_code
   (&optional __status_code)
   (if __status_code (setq _status_code __status_code)) _status_code)
  (:err_msg
   (&optional __err_msg)
   (if __err_msg (setq _err_msg __err_msg)) _err_msg)
  (:serialization-length
   ()
   (+
    ;; int32 _status_code
    4
    ;; string _err_msg
    4 (length _err_msg)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _status_code
       (write-long _status_code s)
     ;; string _err_msg
       (write-long (length _err_msg) s) (princ _err_msg s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _status_code
     (setq _status_code (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _err_msg
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _err_msg (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass common::PositionControl
  :super ros::object
  :slots ())

(setf (get common::PositionControl :md5sum-) "a9519dff92fdaba9780b7a4c059be1f8")
(setf (get common::PositionControl :datatype-) "common/PositionControl")
(setf (get common::PositionControl :request) common::PositionControlRequest)
(setf (get common::PositionControl :response) common::PositionControlResponse)

(defmethod common::PositionControlRequest
  (:response () (instance common::PositionControlResponse :init)))

(setf (get common::PositionControlRequest :md5sum-) "a9519dff92fdaba9780b7a4c059be1f8")
(setf (get common::PositionControlRequest :datatype-) "common/PositionControlRequest")
(setf (get common::PositionControlRequest :definition-)
      "int32 position_control_type #0表示绝对位置 1表示相对位置
float32 target_position_f #目标位置 单位：mm
float32 velocity_f #速度 单位mm/s
---
int32 status_code #0失败，1完成
string err_msg




")

(setf (get common::PositionControlResponse :md5sum-) "a9519dff92fdaba9780b7a4c059be1f8")
(setf (get common::PositionControlResponse :datatype-) "common/PositionControlResponse")
(setf (get common::PositionControlResponse :definition-)
      "int32 position_control_type #0表示绝对位置 1表示相对位置
float32 target_position_f #目标位置 单位：mm
float32 velocity_f #速度 单位mm/s
---
int32 status_code #0失败，1完成
string err_msg




")



(provide :common/PositionControl "a9519dff92fdaba9780b7a4c059be1f8")


