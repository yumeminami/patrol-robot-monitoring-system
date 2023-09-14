;; Auto-generated. Do not edit!


(when (boundp 'common::FirmwareUpdate)
  (if (not (find-package "COMMON"))
    (make-package "COMMON"))
  (shadow 'FirmwareUpdate (find-package "COMMON")))
(unless (find-package "COMMON::FIRMWAREUPDATE")
  (make-package "COMMON::FIRMWAREUPDATE"))
(unless (find-package "COMMON::FIRMWAREUPDATEREQUEST")
  (make-package "COMMON::FIRMWAREUPDATEREQUEST"))
(unless (find-package "COMMON::FIRMWAREUPDATERESPONSE")
  (make-package "COMMON::FIRMWAREUPDATERESPONSE"))

(in-package "ROS")





(defclass common::FirmwareUpdateRequest
  :super ros::object
  :slots (_data ))

(defmethod common::FirmwareUpdateRequest
  (:init
   (&key
    ((:data __data) "")
    )
   (send-super :init)
   (setq _data (string __data))
   self)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; string _data
    4 (length _data)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _data
       (write-long (length _data) s) (princ _data s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _data
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _data (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass common::FirmwareUpdateResponse
  :super ros::object
  :slots (_status_code ))

(defmethod common::FirmwareUpdateResponse
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

(defclass common::FirmwareUpdate
  :super ros::object
  :slots ())

(setf (get common::FirmwareUpdate :md5sum-) "c5819519b16be731a77f3869f8987fe2")
(setf (get common::FirmwareUpdate :datatype-) "common/FirmwareUpdate")
(setf (get common::FirmwareUpdate :request) common::FirmwareUpdateRequest)
(setf (get common::FirmwareUpdate :response) common::FirmwareUpdateResponse)

(defmethod common::FirmwareUpdateRequest
  (:response () (instance common::FirmwareUpdateResponse :init)))

(setf (get common::FirmwareUpdateRequest :md5sum-) "c5819519b16be731a77f3869f8987fe2")
(setf (get common::FirmwareUpdateRequest :datatype-) "common/FirmwareUpdateRequest")
(setf (get common::FirmwareUpdateRequest :definition-)
      "string data
---
int32 status_code #0失败，1完成



")

(setf (get common::FirmwareUpdateResponse :md5sum-) "c5819519b16be731a77f3869f8987fe2")
(setf (get common::FirmwareUpdateResponse :datatype-) "common/FirmwareUpdateResponse")
(setf (get common::FirmwareUpdateResponse :definition-)
      "string data
---
int32 status_code #0失败，1完成



")



(provide :common/FirmwareUpdate "c5819519b16be731a77f3869f8987fe2")


