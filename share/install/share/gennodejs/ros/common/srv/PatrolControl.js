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

class PatrolControlRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.patrol_command = null;
      this.xml_data = null;
    }
    else {
      if (initObj.hasOwnProperty('patrol_command')) {
        this.patrol_command = initObj.patrol_command
      }
      else {
        this.patrol_command = 0;
      }
      if (initObj.hasOwnProperty('xml_data')) {
        this.xml_data = initObj.xml_data
      }
      else {
        this.xml_data = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PatrolControlRequest
    // Serialize message field [patrol_command]
    bufferOffset = _serializer.int32(obj.patrol_command, buffer, bufferOffset);
    // Serialize message field [xml_data]
    bufferOffset = _serializer.string(obj.xml_data, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PatrolControlRequest
    let len;
    let data = new PatrolControlRequest(null);
    // Deserialize message field [patrol_command]
    data.patrol_command = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [xml_data]
    data.xml_data = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.xml_data);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'common/PatrolControlRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7a30c6751a8440ad9870f88bf1b71c38';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 patrol_command 
    #0结束巡检节点 1开启巡检节点+更新任务xml文件
    #任务进行过程中 patrol_state为2代表巡检任务正在执行
    #               patrol_state为0代表节点处于待命状态，可以随时开启巡检
    string xml_data
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PatrolControlRequest(null);
    if (msg.patrol_command !== undefined) {
      resolved.patrol_command = msg.patrol_command;
    }
    else {
      resolved.patrol_command = 0
    }

    if (msg.xml_data !== undefined) {
      resolved.xml_data = msg.xml_data;
    }
    else {
      resolved.xml_data = ''
    }

    return resolved;
    }
};

class PatrolControlResponse {
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
    // Serializes a message object of type PatrolControlResponse
    // Serialize message field [status_code]
    bufferOffset = _serializer.int32(obj.status_code, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PatrolControlResponse
    let len;
    let data = new PatrolControlResponse(null);
    // Deserialize message field [status_code]
    data.status_code = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'common/PatrolControlResponse';
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
    const resolved = new PatrolControlResponse(null);
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
  Request: PatrolControlRequest,
  Response: PatrolControlResponse,
  md5sum() { return 'fabfef9b528c8f61881ef7f060cb0b13'; },
  datatype() { return 'common/PatrolControl'; }
};
