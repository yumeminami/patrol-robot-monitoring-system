// Auto-generated. Do not edit!

// (in-package ros_interfaces.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class position_command {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.position_control_type = null;
      this.target_position_f = null;
      this.velocity_f = null;
    }
    else {
      if (initObj.hasOwnProperty('position_control_type')) {
        this.position_control_type = initObj.position_control_type
      }
      else {
        this.position_control_type = 0;
      }
      if (initObj.hasOwnProperty('target_position_f')) {
        this.target_position_f = initObj.target_position_f
      }
      else {
        this.target_position_f = 0.0;
      }
      if (initObj.hasOwnProperty('velocity_f')) {
        this.velocity_f = initObj.velocity_f
      }
      else {
        this.velocity_f = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type position_command
    // Serialize message field [position_control_type]
    bufferOffset = _serializer.int32(obj.position_control_type, buffer, bufferOffset);
    // Serialize message field [target_position_f]
    bufferOffset = _serializer.float32(obj.target_position_f, buffer, bufferOffset);
    // Serialize message field [velocity_f]
    bufferOffset = _serializer.float32(obj.velocity_f, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type position_command
    let len;
    let data = new position_command(null);
    // Deserialize message field [position_control_type]
    data.position_control_type = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [target_position_f]
    data.target_position_f = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [velocity_f]
    data.velocity_f = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ros_interfaces/position_command';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4b361bcfd5b1a1843f6bad475de30172';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 position_control_type #0表示绝对位置 1表示相对位置
    float32 target_position_f #目标位置 单位：mm
    float32 velocity_f #速度 单位mm/s
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new position_command(null);
    if (msg.position_control_type !== undefined) {
      resolved.position_control_type = msg.position_control_type;
    }
    else {
      resolved.position_control_type = 0
    }

    if (msg.target_position_f !== undefined) {
      resolved.target_position_f = msg.target_position_f;
    }
    else {
      resolved.target_position_f = 0.0
    }

    if (msg.velocity_f !== undefined) {
      resolved.velocity_f = msg.velocity_f;
    }
    else {
      resolved.velocity_f = 0.0
    }

    return resolved;
    }
};

module.exports = position_command;
