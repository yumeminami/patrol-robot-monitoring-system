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

class gimbal_control {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.command = null;
      this.preset_index = null;
    }
    else {
      if (initObj.hasOwnProperty('command')) {
        this.command = initObj.command
      }
      else {
        this.command = 0;
      }
      if (initObj.hasOwnProperty('preset_index')) {
        this.preset_index = initObj.preset_index
      }
      else {
        this.preset_index = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type gimbal_control
    // Serialize message field [command]
    bufferOffset = _serializer.int32(obj.command, buffer, bufferOffset);
    // Serialize message field [preset_index]
    bufferOffset = _serializer.int32(obj.preset_index, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type gimbal_control
    let len;
    let data = new gimbal_control(null);
    // Deserialize message field [command]
    data.command = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [preset_index]
    data.preset_index = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ros_interfaces/gimbal_control';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e9bd2fba3990c66b8df4336181b66716';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 command #云台预置点命令
    int32 preset_index #预置点编号
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new gimbal_control(null);
    if (msg.command !== undefined) {
      resolved.command = msg.command;
    }
    else {
      resolved.command = 0
    }

    if (msg.preset_index !== undefined) {
      resolved.preset_index = msg.preset_index;
    }
    else {
      resolved.preset_index = 0
    }

    return resolved;
    }
};

module.exports = gimbal_control;
