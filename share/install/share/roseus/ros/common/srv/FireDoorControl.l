;; Auto-generated. Do not edit!


(when (boundp 'common::FireDoorControl)
  (if (not (find-package "COMMON"))
    (make-package "COMMON"))
  (shadow 'FireDoorControl (find-package "COMMON")))
(unless (find-package "COMMON::FIREDOORCONTROL")
  (make-package "COMMON::FIREDOORCONTROL"))
(unless (find-package "COMMON::FIREDOORCONTROLREQUEST")
  (make-package "COMMON::FIREDOORCONTROLREQUEST"))
(unless (find-package "COMMON::FIREDOORCONTROLRESPONSE")
  (make-package "COMMON::FIREDOORCONTROLRESPONSE"))

(in-package "ROS")





(defclass common::FireDoorControlRequest
  :super ros::object
  :slots (_command ))

(defmethod common::FireDoorControlRequest
  (:init
   (&key
    ((:command __command) 0)
    )
   (send-super :init)
   (setq _command (round __command))
   self)
  (:command
   (&optional __command)
   (if __command (setq _command __command)) _command)
  (:serialization-length
   ()
   (+
    ;; int32 _command
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _command
       (write-long _command s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _command
     (setq _command (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass common::FireDoorControlResponse
  :super ros::object
  :slots (_status_code ))

(defmethod common::FireDoorControlResponse
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

(defclass common::FireDoorControl
  :super ros::object
  :slots ())

(setf (get common::FireDoorControl :md5sum-) "26b9aeb0208f157943a22b6e6a605823")
(setf (get common::FireDoorControl :datatype-) "common/FireDoorControl")
(setf (get common::FireDoorControl :request) common::FireDoorControlRequest)
(setf (get common::FireDoorControl :response) common::FireDoorControlResponse)

(defmethod common::FireDoorControlRequest
  (:response () (instance common::FireDoorControlResponse :init)))

(setf (get common::FireDoorControlRequest :md5sum-) "26b9aeb0208f157943a22b6e6a605823")
(setf (get common::FireDoorControlRequest :datatype-) "common/FireDoorControlRequest")
(setf (get common::FireDoorControlRequest :definition-)
      "int32 command 
# 0关闭 1开启
---
int32 status_code #0失败，1完成





")

(setf (get common::FireDoorControlResponse :md5sum-) "26b9aeb0208f157943a22b6e6a605823")
(setf (get common::FireDoorControlResponse :datatype-) "common/FireDoorControlResponse")
(setf (get common::FireDoorControlResponse :definition-)
      "int32 command 
# 0关闭 1开启
---
int32 status_code #0失败，1完成





")



(provide :common/FireDoorControl "26b9aeb0208f157943a22b6e6a605823")


