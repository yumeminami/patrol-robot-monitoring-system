;; Auto-generated. Do not edit!


(when (boundp 'common::camera_control)
  (if (not (find-package "COMMON"))
    (make-package "COMMON"))
  (shadow 'camera_control (find-package "COMMON")))
(unless (find-package "COMMON::CAMERA_CONTROL")
  (make-package "COMMON::CAMERA_CONTROL"))

(in-package "ROS")
;;//! \htmlinclude camera_control.msg.html


(defclass common::camera_control
  :super ros::object
  :slots (_camera_command ))

(defmethod common::camera_control
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

(setf (get common::camera_control :md5sum-) "a705f3ae2c77fa51379c4dc7f4a2e7ec")
(setf (get common::camera_control :datatype-) "common/camera_control")
(setf (get common::camera_control :definition-)
      "int32 camera_command
# 相机命令：
# 0:停止预览
# 1:彩色相机预览
# 2:彩色相机预览+保存
# 3:红外相机预览
# 4:预览+保存

")



(provide :common/camera_control "a705f3ae2c77fa51379c4dc7f4a2e7ec")


