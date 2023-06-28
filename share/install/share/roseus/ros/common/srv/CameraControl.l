;; Auto-generated. Do not edit!


(when (boundp 'common::CameraControl)
  (if (not (find-package "COMMON"))
    (make-package "COMMON"))
  (shadow 'CameraControl (find-package "COMMON")))
(unless (find-package "COMMON::CAMERACONTROL")
  (make-package "COMMON::CAMERACONTROL"))
(unless (find-package "COMMON::CAMERACONTROLREQUEST")
  (make-package "COMMON::CAMERACONTROLREQUEST"))
(unless (find-package "COMMON::CAMERACONTROLRESPONSE")
  (make-package "COMMON::CAMERACONTROLRESPONSE"))

(in-package "ROS")





(defclass common::CameraControlRequest
  :super ros::object
  :slots (_camera_command ))

(defmethod common::CameraControlRequest
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

(defclass common::CameraControlResponse
  :super ros::object
  :slots (_status_code ))

(defmethod common::CameraControlResponse
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

(defclass common::CameraControl
  :super ros::object
  :slots ())

(setf (get common::CameraControl :md5sum-) "1197f65cafe4f6185711fff0c923b4bd")
(setf (get common::CameraControl :datatype-) "common/CameraControl")
(setf (get common::CameraControl :request) common::CameraControlRequest)
(setf (get common::CameraControl :response) common::CameraControlResponse)

(defmethod common::CameraControlRequest
  (:response () (instance common::CameraControlResponse :init)))

(setf (get common::CameraControlRequest :md5sum-) "1197f65cafe4f6185711fff0c923b4bd")
(setf (get common::CameraControlRequest :datatype-) "common/CameraControlRequest")
(setf (get common::CameraControlRequest :definition-)
      "int32 camera_command
# 相机命令：
# 0:停止预览
# 1:彩色相机预览
# 2:彩色相机预览+保存
# 3:红外相机预览
# 4:预览+保存
---
int32 status_code #0失败，1完成


")

(setf (get common::CameraControlResponse :md5sum-) "1197f65cafe4f6185711fff0c923b4bd")
(setf (get common::CameraControlResponse :datatype-) "common/CameraControlResponse")
(setf (get common::CameraControlResponse :definition-)
      "int32 camera_command
# 相机命令：
# 0:停止预览
# 1:彩色相机预览
# 2:彩色相机预览+保存
# 3:红外相机预览
# 4:预览+保存
---
int32 status_code #0失败，1完成


")



(provide :common/CameraControl "1197f65cafe4f6185711fff0c923b4bd")


