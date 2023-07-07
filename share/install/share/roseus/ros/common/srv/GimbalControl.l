;; Auto-generated. Do not edit!


(when (boundp 'common::GimbalControl)
  (if (not (find-package "COMMON"))
    (make-package "COMMON"))
  (shadow 'GimbalControl (find-package "COMMON")))
(unless (find-package "COMMON::GIMBALCONTROL")
  (make-package "COMMON::GIMBALCONTROL"))
(unless (find-package "COMMON::GIMBALCONTROLREQUEST")
  (make-package "COMMON::GIMBALCONTROLREQUEST"))
(unless (find-package "COMMON::GIMBALCONTROLRESPONSE")
  (make-package "COMMON::GIMBALCONTROLRESPONSE"))

(in-package "ROS")





(defclass common::GimbalControlRequest
  :super ros::object
  :slots (_command _preset_index ))

(defmethod common::GimbalControlRequest
  (:init
   (&key
    ((:command __command) 0)
    ((:preset_index __preset_index) 0)
    )
   (send-super :init)
   (setq _command (round __command))
   (setq _preset_index (round __preset_index))
   self)
  (:command
   (&optional __command)
   (if __command (setq _command __command)) _command)
  (:preset_index
   (&optional __preset_index)
   (if __preset_index (setq _preset_index __preset_index)) _preset_index)
  (:serialization-length
   ()
   (+
    ;; int32 _command
    4
    ;; int32 _preset_index
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _command
       (write-long _command s)
     ;; int32 _preset_index
       (write-long _preset_index s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _command
     (setq _command (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _preset_index
     (setq _preset_index (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass common::GimbalControlResponse
  :super ros::object
  :slots (_status_code ))

(defmethod common::GimbalControlResponse
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

(defclass common::GimbalControl
  :super ros::object
  :slots ())

(setf (get common::GimbalControl :md5sum-) "d0c48081341d4177031e0d1e7e86365a")
(setf (get common::GimbalControl :datatype-) "common/GimbalControl")
(setf (get common::GimbalControl :request) common::GimbalControlRequest)
(setf (get common::GimbalControl :response) common::GimbalControlResponse)

(defmethod common::GimbalControlRequest
  (:response () (instance common::GimbalControlResponse :init)))

(setf (get common::GimbalControlRequest :md5sum-) "d0c48081341d4177031e0d1e7e86365a")
(setf (get common::GimbalControlRequest :datatype-) "common/GimbalControlRequest")
(setf (get common::GimbalControlRequest :definition-)
      "int32 command #云台预置点命令 
#1:GOTO_PRESET移动到预置点
#2:SET_PRESET 设置预置点
#3:CLE_PRESET 清除预置点

int32 preset_index #预置点编号
#去下面的网络界面设置预置点，移动好之后选择某个预置点按下设置符号即可设置
#http://10.92.36.1/doc/page/config.asp
---
int32 status_code #0失败，1完成







")

(setf (get common::GimbalControlResponse :md5sum-) "d0c48081341d4177031e0d1e7e86365a")
(setf (get common::GimbalControlResponse :datatype-) "common/GimbalControlResponse")
(setf (get common::GimbalControlResponse :definition-)
      "int32 command #云台预置点命令 
#1:GOTO_PRESET移动到预置点
#2:SET_PRESET 设置预置点
#3:CLE_PRESET 清除预置点

int32 preset_index #预置点编号
#去下面的网络界面设置预置点，移动好之后选择某个预置点按下设置符号即可设置
#http://10.92.36.1/doc/page/config.asp
---
int32 status_code #0失败，1完成







")



(provide :common/GimbalControl "d0c48081341d4177031e0d1e7e86365a")


