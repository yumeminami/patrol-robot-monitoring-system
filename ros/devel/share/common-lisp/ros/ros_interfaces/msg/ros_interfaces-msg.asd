
(cl:in-package :asdf)

(defsystem "ros_interfaces-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "gimbal_control" :depends-on ("_package_gimbal_control"))
    (:file "_package_gimbal_control" :depends-on ("_package"))
    (:file "position_command" :depends-on ("_package_position_command"))
    (:file "_package_position_command" :depends-on ("_package"))
    (:file "stop_command" :depends-on ("_package_stop_command"))
    (:file "_package_stop_command" :depends-on ("_package"))
    (:file "velocity_command" :depends-on ("_package_velocity_command"))
    (:file "_package_velocity_command" :depends-on ("_package"))
  ))