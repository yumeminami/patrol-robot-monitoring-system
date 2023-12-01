;; Auto-generated. Do not edit!


(when (boundp 'common::PID)
  (if (not (find-package "COMMON"))
    (make-package "COMMON"))
  (shadow 'PID (find-package "COMMON")))
(unless (find-package "COMMON::PID")
  (make-package "COMMON::PID"))
(unless (find-package "COMMON::PIDREQUEST")
  (make-package "COMMON::PIDREQUEST"))
(unless (find-package "COMMON::PIDRESPONSE")
  (make-package "COMMON::PIDRESPONSE"))

(in-package "ROS")





(defclass common::PIDRequest
  :super ros::object
  :slots (_kp _ki _kd ))

(defmethod common::PIDRequest
  (:init
   (&key
    ((:kp __kp) 0.0)
    ((:ki __ki) 0.0)
    ((:kd __kd) 0.0)
    )
   (send-super :init)
   (setq _kp (float __kp))
   (setq _ki (float __ki))
   (setq _kd (float __kd))
   self)
  (:kp
   (&optional __kp)
   (if __kp (setq _kp __kp)) _kp)
  (:ki
   (&optional __ki)
   (if __ki (setq _ki __ki)) _ki)
  (:kd
   (&optional __kd)
   (if __kd (setq _kd __kd)) _kd)
  (:serialization-length
   ()
   (+
    ;; float32 _kp
    4
    ;; float32 _ki
    4
    ;; float32 _kd
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _kp
       (sys::poke _kp (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _ki
       (sys::poke _ki (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _kd
       (sys::poke _kd (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _kp
     (setq _kp (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _ki
     (setq _ki (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _kd
     (setq _kd (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass common::PIDResponse
  :super ros::object
  :slots (_status_code ))

(defmethod common::PIDResponse
  (:init
   (&key
    ((:status_code __status_code) 0)
    )
   (send-super :init)
   (setq _status_code (round __status_code))
   self)
  (:status_code
   (&optional __status_code)
   (if __status_code (setq _status_code __status_code)) _status_code)
  (:serialization-length
   ()
   (+
    ;; int32 _status_code
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _status_code
       (write-long _status_code s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _status_code
     (setq _status_code (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass common::PID
  :super ros::object
  :slots ())

(setf (get common::PID :md5sum-) "a6078b1c1836292d943f376c320c591d")
(setf (get common::PID :datatype-) "common/PID")
(setf (get common::PID :request) common::PIDRequest)
(setf (get common::PID :response) common::PIDResponse)

(defmethod common::PIDRequest
  (:response () (instance common::PIDResponse :init)))

(setf (get common::PIDRequest :md5sum-) "a6078b1c1836292d943f376c320c591d")
(setf (get common::PIDRequest :datatype-) "common/PIDRequest")
(setf (get common::PIDRequest :definition-)
      "float32 kp
float32 ki
float32 kd
---
int32 status_code #0失败，1完成


")

(setf (get common::PIDResponse :md5sum-) "a6078b1c1836292d943f376c320c591d")
(setf (get common::PIDResponse :datatype-) "common/PIDResponse")
(setf (get common::PIDResponse :definition-)
      "float32 kp
float32 ki
float32 kd
---
int32 status_code #0失败，1完成


")



(provide :common/PID "a6078b1c1836292d943f376c320c591d")


