;; Auto-generated. Do not edit!


(when (boundp 'zj_robot::gimbalcontrol)
  (if (not (find-package "ZJ_ROBOT"))
    (make-package "ZJ_ROBOT"))
  (shadow 'gimbalcontrol (find-package "ZJ_ROBOT")))
(unless (find-package "ZJ_ROBOT::GIMBALCONTROL")
  (make-package "ZJ_ROBOT::GIMBALCONTROL"))
(unless (find-package "ZJ_ROBOT::GIMBALCONTROLREQUEST")
  (make-package "ZJ_ROBOT::GIMBALCONTROLREQUEST"))
(unless (find-package "ZJ_ROBOT::GIMBALCONTROLRESPONSE")
  (make-package "ZJ_ROBOT::GIMBALCONTROLRESPONSE"))

(in-package "ROS")





(defclass zj_robot::gimbalcontrolRequest
  :super ros::object
  :slots (_dwPTZCommand _dwStop _dwSpeed ))

(defmethod zj_robot::gimbalcontrolRequest
  (:init
   (&key
    ((:dwPTZCommand __dwPTZCommand) 0)
    ((:dwStop __dwStop) 0)
    ((:dwSpeed __dwSpeed) 0)
    )
   (send-super :init)
   (setq _dwPTZCommand (round __dwPTZCommand))
   (setq _dwStop (round __dwStop))
   (setq _dwSpeed (round __dwSpeed))
   self)
  (:dwPTZCommand
   (&optional __dwPTZCommand)
   (if __dwPTZCommand (setq _dwPTZCommand __dwPTZCommand)) _dwPTZCommand)
  (:dwStop
   (&optional __dwStop)
   (if __dwStop (setq _dwStop __dwStop)) _dwStop)
  (:dwSpeed
   (&optional __dwSpeed)
   (if __dwSpeed (setq _dwSpeed __dwSpeed)) _dwSpeed)
  (:serialization-length
   ()
   (+
    ;; int32 _dwPTZCommand
    4
    ;; int32 _dwStop
    4
    ;; int32 _dwSpeed
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _dwPTZCommand
       (write-long _dwPTZCommand s)
     ;; int32 _dwStop
       (write-long _dwStop s)
     ;; int32 _dwSpeed
       (write-long _dwSpeed s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _dwPTZCommand
     (setq _dwPTZCommand (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _dwStop
     (setq _dwStop (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _dwSpeed
     (setq _dwSpeed (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass zj_robot::gimbalcontrolResponse
  :super ros::object
  :slots (_result ))

(defmethod zj_robot::gimbalcontrolResponse
  (:init
   (&key
    ((:result __result) nil)
    )
   (send-super :init)
   (setq _result __result)
   self)
  (:result
   (&optional (__result :null))
   (if (not (eq __result :null)) (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; bool _result
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _result
       (if _result (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _result
     (setq _result (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass zj_robot::gimbalcontrol
  :super ros::object
  :slots ())

(setf (get zj_robot::gimbalcontrol :md5sum-) "fab33b108f2f3c6bfa0c6a4faa410fd2")
(setf (get zj_robot::gimbalcontrol :datatype-) "zj_robot/gimbalcontrol")
(setf (get zj_robot::gimbalcontrol :request) zj_robot::gimbalcontrolRequest)
(setf (get zj_robot::gimbalcontrol :response) zj_robot::gimbalcontrolResponse)

(defmethod zj_robot::gimbalcontrolRequest
  (:response () (instance zj_robot::gimbalcontrolResponse :init)))

(setf (get zj_robot::gimbalcontrolRequest :md5sum-) "fab33b108f2f3c6bfa0c6a4faa410fd2")
(setf (get zj_robot::gimbalcontrolRequest :datatype-) "zj_robot/gimbalcontrolRequest")
(setf (get zj_robot::gimbalcontrolRequest :definition-)
      "# 客户端请求时发送的参数
int32 dwPTZCommand
int32 dwStop
int32 dwSpeed
---
# 云台控制结果
bool result
")

(setf (get zj_robot::gimbalcontrolResponse :md5sum-) "fab33b108f2f3c6bfa0c6a4faa410fd2")
(setf (get zj_robot::gimbalcontrolResponse :datatype-) "zj_robot/gimbalcontrolResponse")
(setf (get zj_robot::gimbalcontrolResponse :definition-)
      "# 客户端请求时发送的参数
int32 dwPTZCommand
int32 dwStop
int32 dwSpeed
---
# 云台控制结果
bool result
")



(provide :zj_robot/gimbalcontrol "fab33b108f2f3c6bfa0c6a4faa410fd2")


