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

class setposition_control {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.target_position_f = null;
    }
    else {
      if (initObj.hasOwnProperty('target_position_f')) {
        this.target_position_f = initObj.target_position_f
      }
      else {
        this.target_position_f = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type setposition_control
    // Serialize message field [target_position_f]
    bufferOffset = _serializer.float32(obj.target_position_f, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type setposition_control
    let len;
    let data = new setposition_control(null);
    // Deserialize message field [target_position_f]
    data.target_position_f = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'common/setposition_control';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f2e6bf020ed2049abd8afb50018d662c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # 设置位置
    float32 target_position_f #目标位置 单位：mm
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new setposition_control(null);
    if (msg.target_position_f !== undefined) {
      resolved.target_position_f = msg.target_position_f;
    }
    else {
      resolved.target_position_f = 0.0
    }

    return resolved;
    }
};

module.exports = setposition_control;
