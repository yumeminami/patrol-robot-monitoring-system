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

class RobotRealTimeInfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.velocity = null;
      this.position = null;
      this.position_control_state = null;
      this.battery_state = null;
      this.battery_level = null;
    }
    else {
      if (initObj.hasOwnProperty('velocity')) {
        this.velocity = initObj.velocity
      }
      else {
        this.velocity = 0.0;
      }
      if (initObj.hasOwnProperty('position')) {
        this.position = initObj.position
      }
      else {
        this.position = 0.0;
      }
      if (initObj.hasOwnProperty('position_control_state')) {
        this.position_control_state = initObj.position_control_state
      }
      else {
        this.position_control_state = 0;
      }
      if (initObj.hasOwnProperty('battery_state')) {
        this.battery_state = initObj.battery_state
      }
      else {
        this.battery_state = 0;
      }
      if (initObj.hasOwnProperty('battery_level')) {
        this.battery_level = initObj.battery_level
      }
      else {
        this.battery_level = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RobotRealTimeInfo
    // Serialize message field [velocity]
    bufferOffset = _serializer.float32(obj.velocity, buffer, bufferOffset);
    // Serialize message field [position]
    bufferOffset = _serializer.float32(obj.position, buffer, bufferOffset);
    // Serialize message field [position_control_state]
    bufferOffset = _serializer.int32(obj.position_control_state, buffer, bufferOffset);
    // Serialize message field [battery_state]
    bufferOffset = _serializer.int32(obj.battery_state, buffer, bufferOffset);
    // Serialize message field [battery_level]
    bufferOffset = _serializer.int32(obj.battery_level, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RobotRealTimeInfo
    let len;
    let data = new RobotRealTimeInfo(null);
    // Deserialize message field [velocity]
    data.velocity = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [position]
    data.position = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [position_control_state]
    data.position_control_state = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [battery_state]
    data.battery_state = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [battery_level]
    data.battery_level = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'common/RobotRealTimeInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3b8aa7073ad1bc4871cf8c840555bf9c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 velocity                #运动速度
    float32 position                #当前位置
    int32 position_control_state    #位置控制状态：0 未完成 1 完成
    int32 battery_state             #电池充电状态：0 代表充电 1 代表未充电
    int32 battery_level             #电池电量(0-100)
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RobotRealTimeInfo(null);
    if (msg.velocity !== undefined) {
      resolved.velocity = msg.velocity;
    }
    else {
      resolved.velocity = 0.0
    }

    if (msg.position !== undefined) {
      resolved.position = msg.position;
    }
    else {
      resolved.position = 0.0
    }

    if (msg.position_control_state !== undefined) {
      resolved.position_control_state = msg.position_control_state;
    }
    else {
      resolved.position_control_state = 0
    }

    if (msg.battery_state !== undefined) {
      resolved.battery_state = msg.battery_state;
    }
    else {
      resolved.battery_state = 0
    }

    if (msg.battery_level !== undefined) {
      resolved.battery_level = msg.battery_level;
    }
    else {
      resolved.battery_level = 0
    }

    return resolved;
    }
};

module.exports = RobotRealTimeInfo;
