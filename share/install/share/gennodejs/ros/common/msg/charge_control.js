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

class charge_control {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.charge_command = null;
    }
    else {
      if (initObj.hasOwnProperty('charge_command')) {
        this.charge_command = initObj.charge_command
      }
      else {
        this.charge_command = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type charge_control
    // Serialize message field [charge_command]
    bufferOffset = _serializer.int32(obj.charge_command, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type charge_control
    let len;
    let data = new charge_control(null);
    // Deserialize message field [charge_command]
    data.charge_command = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'common/charge_control';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1a12fdc189808c4ee3918135e54264fc';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 charge_command
    # 充电命令：
    # 0:关闭充电模块
    # 1:·开启充电模块
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new charge_control(null);
    if (msg.charge_command !== undefined) {
      resolved.charge_command = msg.charge_command;
    }
    else {
      resolved.charge_command = 0
    }

    return resolved;
    }
};

module.exports = charge_control;
