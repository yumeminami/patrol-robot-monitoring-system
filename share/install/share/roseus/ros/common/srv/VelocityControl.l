;; Auto-generated. Do not edit!


(when (boundp 'common::VelocityControl)
  (if (not (find-package "COMMON"))
    (make-package "COMMON"))
  (shadow 'VelocityControl (find-package "COMMON")))
(unless (find-package "COMMON::VELOCITYCONTROL")
  (make-package "COMMON::VELOCITYCONTROL"))
(unless (find-package "COMMON::VELOCITYCONTROLREQUEST")
  (make-package "COMMON::VELOCITYCONTROLREQUEST"))
(unless (find-package "COMMON::VELOCITYCONTROLRESPONSE")
  (make-package "COMMON::VELOCITYCONTROLRESPONSE"))

(in-package "ROS")





(defclass common::VelocityControlRequest
  :super ros::object
  :slots (_velocity_f ))

(defmethod common::VelocityControlRequest
  (:init
   (&key
    ((:velocity_f __velocity_f) 0.0)
    )
   (send-super :init)
   (setq _velocity_f (float __velocity_f))
   self)
  (:velocity_f
   (&optional __velocity_f)
   (if __velocity_f (setq _velocity_f __velocity_f)) _velocity_f)
  (:serialization-length
   ()
   (+
    ;; float32 _velocity_f
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _velocity_f
       (sys::poke _velocity_f (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _velocity_f
     (setq _velocity_f (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass common::VelocityControlResponse
  :super ros::object
  :slots (_status_code _err_msg ))

(defmethod common::VelocityControlResponse
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

(defclass common::VelocityControl
  :super ros::object
  :slots ())

(setf (get common::VelocityControl :md5sum-) "c2220f86ebacca2a046f47fb48d0d40f")
(setf (get common::VelocityControl :datatype-) "common/VelocityControl")
(setf (get common::VelocityControl :request) common::VelocityControlRequest)
(setf (get common::VelocityControl :response) common::VelocityControlResponse)

(defmethod common::VelocityControlRequest
  (:response () (instance common::VelocityControlResponse :init)))

(setf (get common::VelocityControlRequest :md5sum-) "c2220f86ebacca2a046f47fb48d0d40f")
(setf (get common::VelocityControlRequest :datatype-) "common/VelocityControlRequest")
(setf (get common::VelocityControlRequest :definition-)
      "float32 velocity_f #速度控制
---
int32 status_code #0失败，1完成
string err_msg




")

(setf (get common::VelocityControlResponse :md5sum-) "c2220f86ebacca2a046f47fb48d0d40f")
(setf (get common::VelocityControlResponse :datatype-) "common/VelocityControlResponse")
(setf (get common::VelocityControlResponse :definition-)
      "float32 velocity_f #速度控制
---
int32 status_code #0失败，1完成
string err_msg




")



(provide :common/VelocityControl "c2220f86ebacca2a046f47fb48d0d40f")


