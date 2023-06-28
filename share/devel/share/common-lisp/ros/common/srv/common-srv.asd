
(cl:in-package :asdf)

(defsystem "common-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
)
  :components ((:file "_package")
    (:file "CameraControl" :depends-on ("_package_CameraControl"))
    (:file "_package_CameraControl" :depends-on ("_package"))
    (:file "PositionControl" :depends-on ("_package_PositionControl"))
    (:file "_package_PositionControl" :depends-on ("_package"))
    (:file "StopControl" :depends-on ("_package_StopControl"))
    (:file "_package_StopControl" :depends-on ("_package"))
    (:file "TakePicture" :depends-on ("_package_TakePicture"))
    (:file "_package_TakePicture" :depends-on ("_package"))
    (:file "VelocityControl" :depends-on ("_package_VelocityControl"))
    (:file "_package_VelocityControl" :depends-on ("_package"))
  ))