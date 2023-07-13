;; Auto-generated. Do not edit!


(when (boundp 'common::PatrolControl)
  (if (not (find-package "COMMON"))
    (make-package "COMMON"))
  (shadow 'PatrolControl (find-package "COMMON")))
(unless (find-package "COMMON::PATROLCONTROL")
  (make-package "COMMON::PATROLCONTROL"))
(unless (find-package "COMMON::PATROLCONTROLREQUEST")
  (make-package "COMMON::PATROLCONTROLREQUEST"))
(unless (find-package "COMMON::PATROLCONTROLRESPONSE")
  (make-package "COMMON::PATROLCONTROLRESPONSE"))

(in-package "ROS")





(defclass common::PatrolControlRequest
  :super ros::object
  :slots (_patrol_command _xml_data ))

(defmethod common::PatrolControlRequest
  (:init
   (&key
    ((:patrol_command __patrol_command) 0)
    ((:xml_data __xml_data) "")
    )
   (send-super :init)
   (setq _patrol_command (round __patrol_command))
   (setq _xml_data (string __xml_data))
   self)
  (:patrol_command
   (&optional __patrol_command)
   (if __patrol_command (setq _patrol_command __patrol_command)) _patrol_command)
  (:xml_data
   (&optional __xml_data)
   (if __xml_data (setq _xml_data __xml_data)) _xml_data)
  (:serialization-length
   ()
   (+
    ;; int32 _patrol_command
    4
    ;; string _xml_data
    4 (length _xml_data)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _patrol_command
       (write-long _patrol_command s)
     ;; string _xml_data
       (write-long (length _xml_data) s) (princ _xml_data s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _patrol_command
     (setq _patrol_command (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _xml_data
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _xml_data (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass common::PatrolControlResponse
  :super ros::object
  :slots (_status_code ))

(defmethod common::PatrolControlResponse
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

(defclass common::PatrolControl
  :super ros::object
  :slots ())

(setf (get common::PatrolControl :md5sum-) "fabfef9b528c8f61881ef7f060cb0b13")
(setf (get common::PatrolControl :datatype-) "common/PatrolControl")
(setf (get common::PatrolControl :request) common::PatrolControlRequest)
(setf (get common::PatrolControl :response) common::PatrolControlResponse)

(defmethod common::PatrolControlRequest
  (:response () (instance common::PatrolControlResponse :init)))

(setf (get common::PatrolControlRequest :md5sum-) "fabfef9b528c8f61881ef7f060cb0b13")
(setf (get common::PatrolControlRequest :datatype-) "common/PatrolControlRequest")
(setf (get common::PatrolControlRequest :definition-)
      "int32 patrol_command 
#0结束巡检节点 1开启巡检节点+更新任务xml文件
#任务进行过程中 patrol_state为2代表巡检任务正在执行
#               patrol_state为0代表节点处于待命状态，可以随时开启巡检
string xml_data
---
int32 status_code #0失败，1完成



")

(setf (get common::PatrolControlResponse :md5sum-) "fabfef9b528c8f61881ef7f060cb0b13")
(setf (get common::PatrolControlResponse :datatype-) "common/PatrolControlResponse")
(setf (get common::PatrolControlResponse :definition-)
      "int32 patrol_command 
#0结束巡检节点 1开启巡检节点+更新任务xml文件
#任务进行过程中 patrol_state为2代表巡检任务正在执行
#               patrol_state为0代表节点处于待命状态，可以随时开启巡检
string xml_data
---
int32 status_code #0失败，1完成



")



(provide :common/PatrolControl "fabfef9b528c8f61881ef7f060cb0b13")


