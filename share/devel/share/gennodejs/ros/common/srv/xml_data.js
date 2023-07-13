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

class xml_dataRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.data = null;
    }
    else {
      if (initObj.hasOwnProperty('data')) {
        this.data = initObj.data
      }
      else {
        this.data = new std_msgs.msg.ByteMultiArray();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type xml_dataRequest
    // Serialize message field [data]
    bufferOffset = std_msgs.msg.ByteMultiArray.serialize(obj.data, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type xml_dataRequest
    let len;
    let data = new xml_dataRequest(null);
    // Deserialize message field [data]
    data.data = std_msgs.msg.ByteMultiArray.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.ByteMultiArray.getMessageSize(object.data);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'common/xml_dataRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '66d8e641bc88dff1ac4e4620b52311a3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/ByteMultiArray data
    
    ================================================================================
    MSG: std_msgs/ByteMultiArray
    # Please look at the MultiArrayLayout message definition for
    # documentation on all multiarrays.
    
    MultiArrayLayout  layout        # specification of data layout
    byte[]            data          # array of data
    
    
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
    const resolved = new xml_dataRequest(null);
    if (msg.data !== undefined) {
      resolved.data = std_msgs.msg.ByteMultiArray.Resolve(msg.data)
    }
    else {
      resolved.data = new std_msgs.msg.ByteMultiArray()
    }

    return resolved;
    }
};

class xml_dataResponse {
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
    // Serializes a message object of type xml_dataResponse
    // Serialize message field [status_code]
    bufferOffset = _serializer.int32(obj.status_code, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type xml_dataResponse
    let len;
    let data = new xml_dataResponse(null);
    // Deserialize message field [status_code]
    data.status_code = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'common/xml_dataResponse';
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
    const resolved = new xml_dataResponse(null);
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
  Request: xml_dataRequest,
  Response: xml_dataResponse,
  md5sum() { return '301e9cc7244d22b9d325571195eb0275'; },
  datatype() { return 'common/xml_data'; }
};
