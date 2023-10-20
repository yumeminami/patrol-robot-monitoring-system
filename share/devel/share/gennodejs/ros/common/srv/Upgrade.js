// Auto-generated. Do not edit!

// (in-package common.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class UpgradeRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.board_type = null;
      this.upgrade_file = null;
    }
    else {
      if (initObj.hasOwnProperty('board_type')) {
        this.board_type = initObj.board_type
      }
      else {
        this.board_type = 0;
      }
      if (initObj.hasOwnProperty('upgrade_file')) {
        this.upgrade_file = initObj.upgrade_file
      }
      else {
        this.upgrade_file = new std_msgs.msg.UInt8MultiArray();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type UpgradeRequest
    // Serialize message field [board_type]
    bufferOffset = _serializer.int32(obj.board_type, buffer, bufferOffset);
    // Serialize message field [upgrade_file]
    bufferOffset = std_msgs.msg.UInt8MultiArray.serialize(obj.upgrade_file, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type UpgradeRequest
    let len;
    let data = new UpgradeRequest(null);
    // Deserialize message field [board_type]
    data.board_type = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [upgrade_file]
    data.upgrade_file = std_msgs.msg.UInt8MultiArray.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.UInt8MultiArray.getMessageSize(object.upgrade_file);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'common/UpgradeRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6e0ffffbece00f14359e831b77bfc020';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 board_type
    #0运动控制板
    #1传感器板
    std_msgs/UInt8MultiArray upgrade_file
    
    ================================================================================
    MSG: std_msgs/UInt8MultiArray
    # Please look at the MultiArrayLayout message definition for
    # documentation on all multiarrays.
    
    MultiArrayLayout  layout        # specification of data layout
    uint8[]           data          # array of data
    
    
    ================================================================================
    MSG: std_msgs/MultiArrayLayout
    # The multiarray declares a generic multi-dimensional array of a
    # particular data type.  Dimensions are ordered from outer most
    # to inner most.
    
    MultiArrayDimension[] dim # Array of dimension properties
    uint32 data_offset        # padding elements at front of data
    
    # Accessors should ALWAYS be written in terms of dimension stride
    # and specified outer-most dimension first.
    # 
    # multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]
    #
    # A standard, 3-channel 640x480 image with interleaved color channels
    # would be specified as:
    #
    # dim[0].label  = "height"
    # dim[0].size   = 480
    # dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)
    # dim[1].label  = "width"
    # dim[1].size   = 640
    # dim[1].stride = 3*640 = 1920
    # dim[2].label  = "channel"
    # dim[2].size   = 3
    # dim[2].stride = 3
    #
    # multiarray(i,j,k) refers to the ith row, jth column, and kth channel.
    
    ================================================================================
    MSG: std_msgs/MultiArrayDimension
    string label   # label of given dimension
    uint32 size    # size of given dimension (in type units)
    uint32 stride  # stride of given dimension
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new UpgradeRequest(null);
    if (msg.board_type !== undefined) {
      resolved.board_type = msg.board_type;
    }
    else {
      resolved.board_type = 0
    }

    if (msg.upgrade_file !== undefined) {
      resolved.upgrade_file = std_msgs.msg.UInt8MultiArray.Resolve(msg.upgrade_file)
    }
    else {
      resolved.upgrade_file = new std_msgs.msg.UInt8MultiArray()
    }

    return resolved;
    }
};

class UpgradeResponse {
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
    // Serializes a message object of type UpgradeResponse
    // Serialize message field [status_code]
    bufferOffset = _serializer.int32(obj.status_code, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type UpgradeResponse
    let len;
    let data = new UpgradeResponse(null);
    // Deserialize message field [status_code]
    data.status_code = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'common/UpgradeResponse';
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
    const resolved = new UpgradeResponse(null);
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
  Request: UpgradeRequest,
  Response: UpgradeResponse,
  md5sum() { return 'd1a7d02d9af64b80a87fb39b34004f24'; },
  datatype() { return 'common/Upgrade'; }
};
