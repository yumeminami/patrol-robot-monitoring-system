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

class LedControlRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.num = null;
      this.R = null;
      this.G = null;
      this.B = null;
    }
    else {
      if (initObj.hasOwnProperty('num')) {
        this.num = initObj.num
      }
      else {
        this.num = 0;
      }
      if (initObj.hasOwnProperty('R')) {
        this.R = initObj.R
      }
      else {
        this.R = [];
      }
      if (initObj.hasOwnProperty('G')) {
        this.G = initObj.G
      }
      else {
        this.G = [];
      }
      if (initObj.hasOwnProperty('B')) {
        this.B = initObj.B
      }
      else {
        this.B = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LedControlRequest
    // Serialize message field [num]
    bufferOffset = _serializer.int32(obj.num, buffer, bufferOffset);
    // Serialize message field [R]
    bufferOffset = _arraySerializer.int32(obj.R, buffer, bufferOffset, null);
    // Serialize message field [G]
    bufferOffset = _arraySerializer.int32(obj.G, buffer, bufferOffset, null);
    // Serialize message field [B]
    bufferOffset = _arraySerializer.int32(obj.B, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LedControlRequest
    let len;
    let data = new LedControlRequest(null);
    // Deserialize message field [num]
    data.num = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [R]
    data.R = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [G]
    data.G = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [B]
    data.B = _arrayDeserializer.int32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.R.length;
    length += 4 * object.G.length;
    length += 4 * object.B.length;
    return length + 16;
  }

  static datatype() {
    // Returns string type for a service object
    return 'common/LedControlRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '761fe52a3b186c63a2004f6346027878';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #灯带控制 num表示灯的数量
    int32 num
    int32[] R
    int32[] G
    int32[] B
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new LedControlRequest(null);
    if (msg.num !== undefined) {
      resolved.num = msg.num;
    }
    else {
      resolved.num = 0
    }

    if (msg.R !== undefined) {
      resolved.R = msg.R;
    }
    else {
      resolved.R = []
    }

    if (msg.G !== undefined) {
      resolved.G = msg.G;
    }
    else {
      resolved.G = []
    }

    if (msg.B !== undefined) {
      resolved.B = msg.B;
    }
    else {
      resolved.B = []
    }

    return resolved;
    }
};

class LedControlResponse {
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
    // Serializes a message object of type LedControlResponse
    // Serialize message field [status_code]
    bufferOffset = _serializer.int32(obj.status_code, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LedControlResponse
    let len;
    let data = new LedControlResponse(null);
    // Deserialize message field [status_code]
    data.status_code = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'common/LedControlResponse';
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
    const resolved = new LedControlResponse(null);
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
  Request: LedControlRequest,
  Response: LedControlResponse,
  md5sum() { return 'b489cd436df01b887c57cc1f419161c1'; },
  datatype() { return 'common/LedControl'; }
};
