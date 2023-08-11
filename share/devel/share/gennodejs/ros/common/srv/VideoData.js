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

class VideoDataRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.patrol_task_name = null;
      this.patrol_section_index = null;
      this.video_data = null;
    }
    else {
      if (initObj.hasOwnProperty('patrol_task_name')) {
        this.patrol_task_name = initObj.patrol_task_name
      }
      else {
        this.patrol_task_name = '';
      }
      if (initObj.hasOwnProperty('patrol_section_index')) {
        this.patrol_section_index = initObj.patrol_section_index
      }
      else {
        this.patrol_section_index = 0;
      }
      if (initObj.hasOwnProperty('video_data')) {
        this.video_data = initObj.video_data
      }
      else {
        this.video_data = new std_msgs.msg.UInt8MultiArray();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type VideoDataRequest
    // Serialize message field [patrol_task_name]
    bufferOffset = _serializer.string(obj.patrol_task_name, buffer, bufferOffset);
    // Serialize message field [patrol_section_index]
    bufferOffset = _serializer.int32(obj.patrol_section_index, buffer, bufferOffset);
    // Serialize message field [video_data]
    bufferOffset = std_msgs.msg.UInt8MultiArray.serialize(obj.video_data, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type VideoDataRequest
    let len;
    let data = new VideoDataRequest(null);
    // Deserialize message field [patrol_task_name]
    data.patrol_task_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [patrol_section_index]
    data.patrol_section_index = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [video_data]
    data.video_data = std_msgs.msg.UInt8MultiArray.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.patrol_task_name);
    length += std_msgs.msg.UInt8MultiArray.getMessageSize(object.video_data);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'common/VideoDataRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8f77074461472da68d7f62f138ae987a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string patrol_task_name     #连续巡检任务名称 写在patrolsections节点的Intro
    int32 patrol_section_index
    std_msgs/UInt8MultiArray video_data
    
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
    const resolved = new VideoDataRequest(null);
    if (msg.patrol_task_name !== undefined) {
      resolved.patrol_task_name = msg.patrol_task_name;
    }
    else {
      resolved.patrol_task_name = ''
    }

    if (msg.patrol_section_index !== undefined) {
      resolved.patrol_section_index = msg.patrol_section_index;
    }
    else {
      resolved.patrol_section_index = 0
    }

    if (msg.video_data !== undefined) {
      resolved.video_data = std_msgs.msg.UInt8MultiArray.Resolve(msg.video_data)
    }
    else {
      resolved.video_data = new std_msgs.msg.UInt8MultiArray()
    }

    return resolved;
    }
};

class VideoDataResponse {
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
    // Serializes a message object of type VideoDataResponse
    // Serialize message field [status_code]
    bufferOffset = _serializer.int32(obj.status_code, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type VideoDataResponse
    let len;
    let data = new VideoDataResponse(null);
    // Deserialize message field [status_code]
    data.status_code = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'common/VideoDataResponse';
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
    const resolved = new VideoDataResponse(null);
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
  Request: VideoDataRequest,
  Response: VideoDataResponse,
  md5sum() { return 'baa99bb834c12c1333deff1c3344d500'; },
  datatype() { return 'common/VideoData'; }
};
