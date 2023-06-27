;; Auto-generated. Do not edit!


(when (boundp 'common::StopControl)
  (if (not (find-package "COMMON"))
    (make-package "COMMON"))
  (shadow 'StopControl (find-package "COMMON")))
(unless (find-package "COMMON::STOPCONTROL")
  (make-package "COMMON::STOPCONTROL"))
(unless (find-package "COMMON::STOPCONTROLREQUEST")
  (make-package "COMMON::STOPCONTROLREQUEST"))
(unless (find-package "COMMON::STOPCONTROLRESPONSE")
  (make-package "COMMON::STOPCONTROLRESPONSE"))

(in-package "ROS")





(defclass common::StopControlRequest
  :super ros::object
  :slots (_stop_type ))

(defmethod common::StopControlRequest
  (:init
   (&key
    ((:stop_type __stop_type) 0)
    )
   (send-super :init)
   (setq _stop_type (round __stop_type))
   self)
  (:stop_type
   (&optional __stop_type)
   (if __stop_type (setq _stop_type __stop_type)) _stop_type)
  (:serialization-length
   ()
   (+
    ;; int32 _stop_type
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _stop_type
       (write-long _stop_type s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _stop_type
     (setq _stop_type (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass common::StopControlResponse
  :super ros::object
  :slots (_status_code _err_msg ))

(defmethod common::StopControlResponse
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

(defclass common::StopControl
  :super ros::object
  :slots ())

(setf (get common::StopControl :md5sum-) "13e671c4ccd3de8f6fad86254c69924f")
(setf (get common::StopControl :datatype-) "common/StopControl")
(setf (get common::StopControl :request) common::StopControlRequest)
(setf (get common::StopControl :response) common::StopControlResponse)

(defmethod common::StopControlRequest
  (:response () (instance common::StopControlResponse :init)))

(setf (get common::StopControlRequest :md5sum-) "13e671c4ccd3de8f6fad86254c69924f")
(setf (get common::StopControlRequest :datatype-) "common/StopControlRequest")
(setf (get common::StopControlRequest :definition-)
      "int32 stop_type #0 stop 1 stop 2 kill
---
int32 status_code #0失败，1完成
string err_msg




")

(setf (get common::StopControlResponse :md5sum-) "13e671c4ccd3de8f6fad86254c69924f")
(setf (get common::StopControlResponse :datatype-) "common/StopControlResponse")
(setf (get common::StopControlResponse :definition-)
      "int32 stop_type #0 stop 1 stop 2 kill
---
int32 status_code #0失败，1完成
string err_msg




")



(provide :common/StopControl "13e671c4ccd3de8f6fad86254c69924f")


