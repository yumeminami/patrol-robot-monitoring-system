// Auto-generated. Do not edit!

// (in-package common.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let sensor_msgs = _finder('sensor_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class PatrolPictureRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.patrol_task_name = null;
      this.patrol_point_index = null;
      this.gimbal_point_index = null;
      this.img = null;
    }
    else {
      if (initObj.hasOwnProperty('patrol_task_name')) {
        this.patrol_task_name = initObj.patrol_task_name
      }
      else {
        this.patrol_task_name = '';
      }
      if (initObj.hasOwnProperty('patrol_point_index')) {
        this.patrol_point_index = initObj.patrol_point_index
      }
      else {
        this.patrol_point_index = 0;
      }
      if (initObj.hasOwnProperty('gimbal_point_index')) {
        this.gimbal_point_index = initObj.gimbal_point_index
      }
      else {
        this.gimbal_point_index = 0;
      }
      if (initObj.hasOwnProperty('img')) {
        this.img = initObj.img
      }
      else {
        this.img = new sensor_msgs.msg.Image();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PatrolPictureRequest
    // Serialize message field [patrol_task_name]
    bufferOffset = _serializer.string(obj.patrol_task_name, buffer, bufferOffset);
    // Serialize message field [patrol_point_index]
    bufferOffset = _serializer.int32(obj.patrol_point_index, buffer, bufferOffset);
    // Serialize message field [gimbal_point_index]
    bufferOffset = _serializer.int32(obj.gimbal_point_index, buffer, bufferOffset);
    // Serialize message field [img]
    bufferOffset = sensor_msgs.msg.Image.serialize(obj.img, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PatrolPictureRequest
    let len;
    let data = new PatrolPictureRequest(null);
    // Deserialize message field [patrol_task_name]
    data.patrol_task_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [patrol_point_index]
    data.patrol_point_index = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [gimbal_point_index]
    data.gimbal_point_index = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [img]
    data.img = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.patrol_task_name);
    length += sensor_msgs.msg.Image.getMessageSize(object.img);
    return length + 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'common/PatrolPictureRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'da494d891b7912e64dd9f9564a5f9b00';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string patrol_task_name
    int32 patrol_point_index
    int32 gimbal_point_index
    sensor_msgs/Image img
    
    ================================================================================
    MSG: sensor_msgs/Image
    # This message contains an uncompressed image
    # (0, 0) is at top-left corner of image
    #
    
    Header header        # Header timestamp should be acquisition time of image
                         # Header frame_id should be optical frame of camera
                         # origin of frame should be optical center of camera
                         # +x should point to the right in the image
                         # +y should point down in the image
                         # +z should point into to plane of the image
                         # If the frame_id here and the frame_id of the CameraInfo
                         # message associated with the image conflict
                         # the behavior is undefined
    
    uint32 height         # image height, that is, number of rows
    uint32 width          # image width, that is, number of columns
    
    # The legal values for encoding are in file src/image_encodings.cpp
    # If you want to standardize a new string format, join
    # ros-users@lists.sourceforge.net and send an email proposing a new encoding.
    
    string encoding       # Encoding of pixels -- channel meaning, ordering, size
                          # taken from the list of strings in include/sensor_msgs/image_encodings.h
    
    uint8 is_bigendian    # is this data bigendian?
    uint32 step           # Full row length in bytes
    uint8[] data          # actual matrix data, size is (step * rows)
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PatrolPictureRequest(null);
    if (msg.patrol_task_name !== undefined) {
      resolved.patrol_task_name = msg.patrol_task_name;
    }
    else {
      resolved.patrol_task_name = ''
    }

    if (msg.patrol_point_index !== undefined) {
      resolved.patrol_point_index = msg.patrol_point_index;
    }
    else {
      resolved.patrol_point_index = 0
    }

    if (msg.gimbal_point_index !== undefined) {
      resolved.gimbal_point_index = msg.gimbal_point_index;
    }
    else {
      resolved.gimbal_point_index = 0
    }

    if (msg.img !== undefined) {
      resolved.img = sensor_msgs.msg.Image.Resolve(msg.img)
    }
    else {
      resolved.img = new sensor_msgs.msg.Image()
    }

    return resolved;
    }
};

class PatrolPictureResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.status_code = null;
    }
    else {
      if (initObj.hasOwnProperty('status_code')) {
        this.status_code = initObj.status_code
      }
      else {
        this.status_code = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PatrolPictureResponse
    // Serialize message field [status_code]
    bufferOffset = _serializer.int32(obj.status_code, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PatrolPictureResponse
    let len;
    let data = new PatrolPictureResponse(null);
    // Deserialize message field [status_code]
    data.status_code = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'common/PatrolPictureResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7714e81371f09d2d15e163f37002ef48';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 status_code #0失败 1完成
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PatrolPictureResponse(null);
    if (msg.status_code !== undefined) {
      resolved.status_code = msg.status_code;
    }
    else {
      resolved.status_code = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: PatrolPictureRequest,
  Response: PatrolPictureResponse,
  md5sum() { return '4b0c8b5f306638a944f76a5bcfd0a606'; },
  datatype() { return 'common/PatrolPicture'; }
};
