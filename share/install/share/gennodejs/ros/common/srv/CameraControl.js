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

class CameraControlRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.camera_command = null;
    }
    else {
      if (initObj.hasOwnProperty('camera_command')) {
        this.camera_command = initObj.camera_command
      }
      else {
        this.camera_command = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CameraControlRequest
    // Serialize message field [camera_command]
    bufferOffset = _serializer.int32(obj.camera_command, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CameraControlRequest
    let len;
    let data = new CameraControlRequest(null);
    // Deserialize message field [camera_command]
    data.camera_command = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'common/CameraControlRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a705f3ae2c77fa51379c4dc7f4a2e7ec';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 camera_command
    # 相机命令：
    # 0:停止预览
    # 1:彩色相机预览
    # 2:彩色相机预览+保存
    # 3:红外相机预览
    # 4:红外相机预览+保存
    # 5:彩色相机录制
    # 6:红外相机录制
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CameraControlRequest(null);
    if (msg.camera_command !== undefined) {
      resolved.camera_command = msg.camera_command;
    }
    else {
      resolved.camera_command = 0
    }

    return resolved;
    }
};

class CameraControlResponse {
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
    // Serializes a message object of type CameraControlResponse
    // Serialize message field [status_code]
    bufferOffset = _serializer.int32(obj.status_code, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CameraControlResponse
    let len;
    let data = new CameraControlResponse(null);
    // Deserialize message field [status_code]
    data.status_code = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'common/CameraControlResponse';
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
    const resolved = new CameraControlResponse(null);
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
  Request: CameraControlRequest,
  Response: CameraControlResponse,
  md5sum() { return '1197f65cafe4f6185711fff0c923b4bd'; },
  datatype() { return 'common/CameraControl'; }
};
