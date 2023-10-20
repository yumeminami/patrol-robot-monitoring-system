;; Auto-generated. Do not edit!


(when (boundp 'common::ReportError)
  (if (not (find-package "COMMON"))
    (make-package "COMMON"))
  (shadow 'ReportError (find-package "COMMON")))
(unless (find-package "COMMON::REPORTERROR")
  (make-package "COMMON::REPORTERROR"))
(unless (find-package "COMMON::REPORTERRORREQUEST")
  (make-package "COMMON::REPORTERRORREQUEST"))
(unless (find-package "COMMON::REPORTERRORRESPONSE")
  (make-package "COMMON::REPORTERRORRESPONSE"))

(in-package "ROS")





(defclass common::ReportErrorRequest
  :super ros::object
  :slots (_error_code _error_string ))

(defmethod common::ReportErrorRequest
  (:init
   (&key
    ((:error_code __error_code) 0)
    ((:error_string __error_string) "")
    )
   (send-super :init)
   (setq _error_code (round __error_code))
   (setq _error_string (string __error_string))
   self)
  (:error_code
   (&optional __error_code)
   (if __error_code (setq _error_code __error_code)) _error_code)
  (:error_string
   (&optional __error_string)
   (if __error_string (setq _error_string __error_string)) _error_string)
  (:serialization-length
   ()
   (+
    ;; int32 _error_code
    4
    ;; string _error_string
    4 (length _error_string)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _error_code
       (write-long _error_code s)
     ;; string _error_string
       (write-long (length _error_string) s) (princ _error_string s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _error_code
     (setq _error_code (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _error_string
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _error_string (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass common::ReportErrorResponse
  :super ros::object
  :slots (_status_code ))

(defmethod common::ReportErrorResponse
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

(defclass common::ReportError
  :super ros::object
  :slots ())

(setf (get common::ReportError :md5sum-) "0fc660883a6c87f1be5fe7a1f9fb2b19")
(setf (get common::ReportError :datatype-) "common/ReportError")
(setf (get common::ReportError :request) common::ReportErrorRequest)
(setf (get common::ReportError :response) common::ReportErrorResponse)

(defmethod common::ReportErrorRequest
  (:response () (instance common::ReportErrorResponse :init)))

(setf (get common::ReportErrorRequest :md5sum-) "0fc660883a6c87f1be5fe7a1f9fb2b19")
(setf (get common::ReportErrorRequest :datatype-) "common/ReportErrorRequest")
(setf (get common::ReportErrorRequest :definition-)
      "int32 error_code
string error_string
# 1 无法对齐防火门金属传感器
# 2 无法对齐充电金属传感器
# 3 无法打开防火门
# 4 无法关闭防火门
# 5 无法开启充电
# 6 无法关闭充电
---
int32 status_code #0失败，1完成



")

(setf (get common::ReportErrorResponse :md5sum-) "0fc660883a6c87f1be5fe7a1f9fb2b19")
(setf (get common::ReportErrorResponse :datatype-) "common/ReportErrorResponse")
(setf (get common::ReportErrorResponse :definition-)
      "int32 error_code
string error_string
# 1 无法对齐防火门金属传感器
# 2 无法对齐充电金属传感器
# 3 无法打开防火门
# 4 无法关闭防火门
# 5 无法开启充电
# 6 无法关闭充电
---
int32 status_code #0失败，1完成



")



(provide :common/ReportError "0fc660883a6c87f1be5fe7a1f9fb2b19")


