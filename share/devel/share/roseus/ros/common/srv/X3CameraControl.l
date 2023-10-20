;; Auto-generated. Do not edit!


(when (boundp 'common::X3CameraControl)
  (if (not (find-package "COMMON"))
    (make-package "COMMON"))
  (shadow 'X3CameraControl (find-package "COMMON")))
(unless (find-package "COMMON::X3CAMERACONTROL")
  (make-package "COMMON::X3CAMERACONTROL"))
(unless (find-package "COMMON::X3CAMERACONTROLREQUEST")
  (make-package "COMMON::X3CAMERACONTROLREQUEST"))
(unless (find-package "COMMON::X3CAMERACONTROLRESPONSE")
  (make-package "COMMON::X3CAMERACONTROLRESPONSE"))

(in-package "ROS")





(defclass common::X3CameraControlRequest
  :super ros::object
  :slots (_camera_command ))

(defmethod common::X3CameraControlRequest
  (:init
   (&key
    ((:camera_command __camera_command) 0)
    )
   (send-super :init)
   (setq _camera_command (round __camera_command))
   self)
  (:camera_command
   (&optional __camera_command)
   (if __camera_command (setq _camera_command __camera_command)) _camera_command)
  (:serialization-length
   ()
   (+
    ;; int32 _camera_command
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _camera_command
       (write-long _camera_command s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _camera_command
     (setq _camera_command (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass common::X3CameraControlResponse
  :super ros::object
  :slots (_status_code ))

(defmethod common::X3CameraControlResponse
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

(defclass common::X3CameraControl
  :super ros::object
  :slots ())

(setf (get common::X3CameraControl :md5sum-) "1197f65cafe4f6185711fff0c923b4bd")
(setf (get common::X3CameraControl :datatype-) "common/X3CameraControl")
(setf (get common::X3CameraControl :request) common::X3CameraControlRequest)
(setf (get common::X3CameraControl :response) common::X3CameraControlResponse)

(defmethod common::X3CameraControlRequest
  (:response () (instance common::X3CameraControlResponse :init)))

(setf (get common::X3CameraControlRequest :md5sum-) "1197f65cafe4f6185711fff0c923b4bd")
(setf (get common::X3CameraControlRequest :datatype-) "common/X3CameraControlRequest")
(setf (get common::X3CameraControlRequest :definition-)
      "int32 camera_command
# 相机命令：
# 0:停止录制
# 1:开始录制
---
int32 status_code #0失败，1完成


")

(setf (get common::X3CameraControlResponse :md5sum-) "1197f65cafe4f6185711fff0c923b4bd")
(setf (get common::X3CameraControlResponse :datatype-) "common/X3CameraControlResponse")
(setf (get common::X3CameraControlResponse :definition-)
      "int32 camera_command
# 相机命令：
# 0:停止录制
# 1:开始录制
---
int32 status_code #0失败，1完成


")



(provide :common/X3CameraControl "1197f65cafe4f6185711fff0c923b4bd")


