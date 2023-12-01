// Auto-generated. Do not edit!

// (in-package common.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class PTZControlRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.P = null;
      this.T = null;
      this.Z = null;
    }
    else {
      if (initObj.hasOwnProperty('P')) {
        this.P = initObj.P
      }
      else {
        this.P = 0;
      }
      if (initObj.hasOwnProperty('T')) {
        this.T = initObj.T
      }
      else {
        this.T = 0;
      }
      if (initObj.hasOwnProperty('Z')) {
        this.Z = initObj.Z
      }
      else {
        this.Z = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PTZControlRequest
    // Serialize message field [P]
    bufferOffset = _serializer.int32(obj.P, buffer, bufferOffset);
    // Serialize message field [T]
    bufferOffset = _serializer.int32(obj.T, buffer, bufferOffset);
    // Serialize message field [Z]
    bufferOffset = _serializer.int32(obj.Z, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PTZControlRequest
    let len;
    let data = new PTZControlRequest(null);
    // Deserialize message field [P]
    data.P = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [T]
    data.T = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [Z]
    data.Z = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'common/PTZControlRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '370f4495401bb587906b97e72c677f4e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 P
    int32 T
    int32 Z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PTZControlRequest(null);
    if (msg.P !== undefined) {
      resolved.P = msg.P;
    }
    else {
      resolved.P = 0
    }

    if (msg.T !== undefined) {
      resolved.T = msg.T;
    }
    else {
      resolved.T = 0
    }

    if (msg.Z !== undefined) {
      resolved.Z = msg.Z;
    }
    else {
      resolved.Z = 0
    }

    return resolved;
    }
};

class PTZControlResponse {
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
    // Serializes a message object of type PTZControlResponse
    // Serialize message field [status_code]
    bufferOffset = _serializer.int32(obj.status_code, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PTZControlResponse
    let len;
    let data = new PTZControlResponse(null);
    // Deserialize message field [status_code]
    data.status_code = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'common/PTZControlResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7714e81371f09d2d15e163f37002ef48';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 status_code #0失败，1完成
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PTZControlResponse(null);
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
  Request: PTZControlRequest,
  Response: PTZControlResponse,
  md5sum() { return 'a267aab3f4294d8ab764debe91952069'; },
  datatype() { return 'common/PTZControl'; }
};
