// Auto-generated. Do not edit!

// (in-package common.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class gimbal_motion_control {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.command = null;
    }
    else {
      if (initObj.hasOwnProperty('command')) {
        this.command = initObj.command
      }
      else {
        this.command = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type gimbal_motion_control
    // Serialize message field [command]
    bufferOffset = _serializer.int32(obj.command, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type gimbal_motion_control
    let len;
    let data = new gimbal_motion_control(null);
    // Deserialize message field [command]
    data.command = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'common/gimbal_motion_control';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3a54bc0c5f4abe9ad44d29292ec0800d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 command 
    #   云台运动命令及对应编号
    #--------------------------------
    # UP_LEFT   TILT_UP    UP_RIGHT
    # PAN_LEFT             PAN_RIGHT
    # DOWN_LEFT TILT_DOWN  DOWN_RIGHT
    #--------------------------------
    #   1         2          3
    #   4                    6
    #   7         8          9
    #--------------------------------
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new gimbal_motion_control(null);
    if (msg.command !== undefined) {
      resolved.command = msg.command;
    }
    else {
      resolved.command = 0
    }

    return resolved;
    }
};

module.exports = gimbal_motion_control;
