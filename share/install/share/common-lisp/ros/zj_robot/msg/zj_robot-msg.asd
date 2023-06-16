
(cl:in-package :asdf)

(defsystem "zj_robot-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :actionlib_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "motion_controlAction" :depends-on ("_package_motion_controlAction"))
    (:file "_package_motion_controlAction" :depends-on ("_package"))
    (:file "motion_controlActionFeedback" :depends-on ("_package_motion_controlActionFeedback"))
    (:file "_package_motion_controlActionFeedback" :depends-on ("_package"))
    (:file "motion_controlActionGoal" :depends-on ("_package_motion_controlActionGoal"))
    (:file "_package_motion_controlActionGoal" :depends-on ("_package"))
    (:file "motion_controlActionResult" :depends-on ("_package_motion_controlActionResult"))
    (:file "_package_motion_controlActionResult" :depends-on ("_package"))
    (:file "motion_controlFeedback" :depends-on ("_package_motion_controlFeedback"))
    (:file "_package_motion_controlFeedback" :depends-on ("_package"))
    (:file "motion_controlGoal" :depends-on ("_package_motion_controlGoal"))
    (:file "_package_motion_controlGoal" :depends-on ("_package"))
    (:file "motion_controlResult" :depends-on ("_package_motion_controlResult"))
    (:file "_package_motion_controlResult" :depends-on ("_package"))
  ))