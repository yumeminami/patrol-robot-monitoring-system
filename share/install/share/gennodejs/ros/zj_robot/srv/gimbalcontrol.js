// Auto-generated. Do not edit!

// (in-package zj_robot.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class gimbalcontrolRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.dwPTZCommand = null;
      this.dwStop = null;
      this.dwSpeed = null;
    }
    else {
      if (initObj.hasOwnProperty('dwPTZCommand')) {
        this.dwPTZCommand = initObj.dwPTZCommand
      }
      else {
        this.dwPTZCommand = 0;
      }
      if (initObj.hasOwnProperty('dwStop')) {
        this.dwStop = initObj.dwStop
      }
      else {
        this.dwStop = 0;
      }
      if (initObj.hasOwnProperty('dwSpeed')) {
        this.dwSpeed = initObj.dwSpeed
      }
      else {
        this.dwSpeed = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type gimbalcontrolRequest
    // Serialize message field [dwPTZCommand]
    bufferOffset = _serializer.int32(obj.dwPTZCommand, buffer, bufferOffset);
    // Serialize message field [dwStop]
    bufferOffset = _serializer.int32(obj.dwStop, buffer, bufferOffset);
    // Serialize message field [dwSpeed]
    bufferOffset = _serializer.int32(obj.dwSpeed, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type gimbalcontrolRequest
    let len;
    let data = new gimbalcontrolRequest(null);
    // Deserialize message field [dwPTZCommand]
    data.dwPTZCommand = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [dwStop]
    data.dwStop = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [dwSpeed]
    data.dwSpeed = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'zj_robot/gimbalcontrolRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '696eb85cf5a060c2e0b25f83f6a572f3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # 客户端请求时发送的参数
    int32 dwPTZCommand
    int32 dwStop
    int32 dwSpeed
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new gimbalcontrolRequest(null);
    if (msg.dwPTZCommand !== undefined) {
      resolved.dwPTZCommand = msg.dwPTZCommand;
    }
    else {
      resolved.dwPTZCommand = 0
    }

    if (msg.dwStop !== undefined) {
      resolved.dwStop = msg.dwStop;
    }
    else {
      resolved.dwStop = 0
    }

    if (msg.dwSpeed !== undefined) {
      resolved.dwSpeed = msg.dwSpeed;
    }
    else {
      resolved.dwSpeed = 0
    }

    return resolved;
    }
};

class gimbalcontrolResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.result = null;
    }
    else {
      if (initObj.hasOwnProperty('result')) {
        this.result = initObj.result
      }
      else {
        this.result = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type gimbalcontrolResponse
    // Serialize message field [result]
    bufferOffset = _serializer.bool(obj.result, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type gimbalcontrolResponse
    let len;
    let data = new gimbalcontrolResponse(null);
    // Deserialize message field [result]
    data.result = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'zj_robot/gimbalcontrolResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'eb13ac1f1354ccecb7941ee8fa2192e8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # 云台控制结果
    bool result
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new gimbalcontrolResponse(null);
    if (msg.result !== undefined) {
      resolved.result = msg.result;
    }
    else {
      resolved.result = false
    }

    return resolved;
    }
};

module.exports = {
  Request: gimbalcontrolRequest,
  Response: gimbalcontrolResponse,
  md5sum() { return 'fab33b108f2f3c6bfa0c6a4faa410fd2'; },
  datatype() { return 'zj_robot/gimbalcontrol'; }
};
