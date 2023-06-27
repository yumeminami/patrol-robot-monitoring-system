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

class VelocityControlRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.velocity_f = null;
    }
    else {
      if (initObj.hasOwnProperty('velocity_f')) {
        this.velocity_f = initObj.velocity_f
      }
      else {
        this.velocity_f = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type VelocityControlRequest
    // Serialize message field [velocity_f]
    bufferOffset = _serializer.float32(obj.velocity_f, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type VelocityControlRequest
    let len;
    let data = new VelocityControlRequest(null);
    // Deserialize message field [velocity_f]
    data.velocity_f = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'common/VelocityControlRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '67298657c9ef3f2768b496520fa1fd62';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 velocity_f #速度控制
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new VelocityControlRequest(null);
    if (msg.velocity_f !== undefined) {
      resolved.velocity_f = msg.velocity_f;
    }
    else {
      resolved.velocity_f = 0.0
    }

    return resolved;
    }
};

class VelocityControlResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.status_code = null;
      this.err_msg = null;
    }
    else {
      if (initObj.hasOwnProperty('status_code')) {
        this.status_code = initObj.status_code
      }
      else {
        this.status_code = 0;
      }
      if (initObj.hasOwnProperty('err_msg')) {
        this.err_msg = initObj.err_msg
      }
      else {
        this.err_msg = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type VelocityControlResponse
    // Serialize message field [status_code]
    bufferOffset = _serializer.int32(obj.status_code, buffer, bufferOffset);
    // Serialize message field [err_msg]
    bufferOffset = _serializer.string(obj.err_msg, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type VelocityControlResponse
    let len;
    let data = new VelocityControlResponse(null);
    // Deserialize message field [status_code]
    data.status_code = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [err_msg]
    data.err_msg = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.err_msg);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'common/VelocityControlResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '80eaa364191b69673f6e2b8956e8e3a9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 status_code #0失败，1完成
    string err_msg
    
    
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new VelocityControlResponse(null);
    if (msg.status_code !== undefined) {
      resolved.status_code = msg.status_code;
    }
    else {
      resolved.status_code = 0
    }

    if (msg.err_msg !== undefined) {
      resolved.err_msg = msg.err_msg;
    }
    else {
      resolved.err_msg = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: VelocityControlRequest,
  Response: VelocityControlResponse,
  md5sum() { return 'c2220f86ebacca2a046f47fb48d0d40f'; },
  datatype() { return 'common/VelocityControl'; }
};
