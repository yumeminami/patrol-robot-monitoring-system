;; Auto-generated. Do not edit!


(when (boundp 'common::PTZControl)
  (if (not (find-package "COMMON"))
    (make-package "COMMON"))
  (shadow 'PTZControl (find-package "COMMON")))
(unless (find-package "COMMON::PTZCONTROL")
  (make-package "COMMON::PTZCONTROL"))
(unless (find-package "COMMON::PTZCONTROLREQUEST")
  (make-package "COMMON::PTZCONTROLREQUEST"))
(unless (find-package "COMMON::PTZCONTROLRESPONSE")
  (make-package "COMMON::PTZCONTROLRESPONSE"))

(in-package "ROS")





(defclass common::PTZControlRequest
  :super ros::object
  :slots (_P _T _Z ))

(defmethod common::PTZControlRequest
  (:init
   (&key
    ((:P __P) 0)
    ((:T __T) 0)
    ((:Z __Z) 0)
    )
   (send-super :init)
   (setq _P (round __P))
   (setq _T (round __T))
   (setq _Z (round __Z))
   self)
  (:P
   (&optional __P)
   (if __P (setq _P __P)) _P)
  (:T
   (&optional __T)
   (if __T (setq _T __T)) _T)
  (:Z
   (&optional __Z)
   (if __Z (setq _Z __Z)) _Z)
  (:serialization-length
   ()
   (+
    ;; int32 _P
    4
    ;; int32 _T
    4
    ;; int32 _Z
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _P
       (write-long _P s)
     ;; int32 _T
       (write-long _T s)
     ;; int32 _Z
       (write-long _Z s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _P
     (setq _P (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _T
     (setq _T (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _Z
     (setq _Z (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass common::PTZControlResponse
  :super ros::object
  :slots (_status_code ))

(defmethod common::PTZControlResponse
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

(defclass common::PTZControl
  :super ros::object
  :slots ())

(setf (get common::PTZControl :md5sum-) "a267aab3f4294d8ab764debe91952069")
(setf (get common::PTZControl :datatype-) "common/PTZControl")
(setf (get common::PTZControl :request) common::PTZControlRequest)
(setf (get common::PTZControl :response) common::PTZControlResponse)

(defmethod common::PTZControlRequest
  (:response () (instance common::PTZControlResponse :init)))

(setf (get common::PTZControlRequest :md5sum-) "a267aab3f4294d8ab764debe91952069")
(setf (get common::PTZControlRequest :datatype-) "common/PTZControlRequest")
(setf (get common::PTZControlRequest :definition-)
      "int32 P
int32 T
int32 Z
---
int32 status_code #0失败，1完成

")

(setf (get common::PTZControlResponse :md5sum-) "a267aab3f4294d8ab764debe91952069")
(setf (get common::PTZControlResponse :datatype-) "common/PTZControlResponse")
(setf (get common::PTZControlResponse :definition-)
      "int32 P
int32 T
int32 Z
---
int32 status_code #0失败，1完成

")



(provide :common/PTZControl "a267aab3f4294d8ab764debe91952069")


