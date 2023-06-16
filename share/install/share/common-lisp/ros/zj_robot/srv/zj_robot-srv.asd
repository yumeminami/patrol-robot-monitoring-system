
(cl:in-package :asdf)

(defsystem "zj_robot-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "gimbalcontrol" :depends-on ("_package_gimbalcontrol"))
    (:file "_package_gimbalcontrol" :depends-on ("_package"))
  ))