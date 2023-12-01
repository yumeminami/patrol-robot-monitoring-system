;; Auto-generated. Do not edit!


(when (boundp 'common::LedControl)
  (if (not (find-package "COMMON"))
    (make-package "COMMON"))
  (shadow 'LedControl (find-package "COMMON")))
(unless (find-package "COMMON::LEDCONTROL")
  (make-package "COMMON::LEDCONTROL"))
(unless (find-package "COMMON::LEDCONTROLREQUEST")
  (make-package "COMMON::LEDCONTROLREQUEST"))
(unless (find-package "COMMON::LEDCONTROLRESPONSE")
  (make-package "COMMON::LEDCONTROLRESPONSE"))

(in-package "ROS")





(defclass common::LedControlRequest
  :super ros::object
  :slots (_num _R _G _B ))

(defmethod common::LedControlRequest
  (:init
   (&key
    ((:num __num) 0)
    ((:R __R) (make-array 0 :initial-element 0 :element-type :integer))
    ((:G __G) (make-array 0 :initial-element 0 :element-type :integer))
    ((:B __B) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _num (round __num))
   (setq _R __R)
   (setq _G __G)
   (setq _B __B)
   self)
  (:num
   (&optional __num)
   (if __num (setq _num __num)) _num)
  (:R
   (&optional __R)
   (if __R (setq _R __R)) _R)
  (:G
   (&optional __G)
   (if __G (setq _G __G)) _G)
  (:B
   (&optional __B)
   (if __B (setq _B __B)) _B)
  (:serialization-length
   ()
   (+
    ;; int32 _num
    4
    ;; int32[] _R
    (* 4    (length _R)) 4
    ;; int32[] _G
    (* 4    (length _G)) 4
    ;; int32[] _B
    (* 4    (length _B)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _num
       (write-long _num s)
     ;; int32[] _R
     (write-long (length _R) s)
     (dotimes (i (length _R))
       (write-long (elt _R i) s)
       )
     ;; int32[] _G
     (write-long (length _G) s)
     (dotimes (i (length _G))
       (write-long (elt _G i) s)
       )
     ;; int32[] _B
     (write-long (length _B) s)
     (dotimes (i (length _B))
       (write-long (elt _B i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _num
     (setq _num (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32[] _R
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _R (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _R i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _G
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _G (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _G i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _B
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _B (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _B i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass common::LedControlResponse
  :super ros::object
  :slots (_status_code ))

(defmethod common::LedControlResponse
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

(defclass common::LedControl
  :super ros::object
  :slots ())

(setf (get common::LedControl :md5sum-) "b489cd436df01b887c57cc1f419161c1")
(setf (get common::LedControl :datatype-) "common/LedControl")
(setf (get common::LedControl :request) common::LedControlRequest)
(setf (get common::LedControl :response) common::LedControlResponse)

(defmethod common::LedControlRequest
  (:response () (instance common::LedControlResponse :init)))

(setf (get common::LedControlRequest :md5sum-) "b489cd436df01b887c57cc1f419161c1")
(setf (get common::LedControlRequest :datatype-) "common/LedControlRequest")
(setf (get common::LedControlRequest :definition-)
      "#灯带控制 num表示灯的数量
int32 num
int32[] R
int32[] G
int32[] B
---
int32 status_code #0失败，1完成

")

(setf (get common::LedControlResponse :md5sum-) "b489cd436df01b887c57cc1f419161c1")
(setf (get common::LedControlResponse :datatype-) "common/LedControlResponse")
(setf (get common::LedControlResponse :definition-)
      "#灯带控制 num表示灯的数量
int32 num
int32[] R
int32[] G
int32[] B
---
int32 status_code #0失败，1完成

")



(provide :common/LedControl "b489cd436df01b887c57cc1f419161c1")


