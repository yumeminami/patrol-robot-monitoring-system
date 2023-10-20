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

class PanoramicVideoUrlRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.panoramic_video_url = null;
    }
    else {
      if (initObj.hasOwnProperty('panoramic_video_url')) {
        this.panoramic_video_url = initObj.panoramic_video_url
      }
      else {
        this.panoramic_video_url = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PanoramicVideoUrlRequest
    // Serialize message field [panoramic_video_url]
    bufferOffset = _serializer.string(obj.panoramic_video_url, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PanoramicVideoUrlRequest
    let len;
    let data = new PanoramicVideoUrlRequest(null);
    // Deserialize message field [panoramic_video_url]
    data.panoramic_video_url = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.panoramic_video_url);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'common/PanoramicVideoUrlRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ba607c1e80b486a09f8e68edd373cea1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string panoramic_video_url
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PanoramicVideoUrlRequest(null);
    if (msg.panoramic_video_url !== undefined) {
      resolved.panoramic_video_url = msg.panoramic_video_url;
    }
    else {
      resolved.panoramic_video_url = ''
    }

    return resolved;
    }
};

class PanoramicVideoUrlResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PanoramicVideoUrlResponse
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PanoramicVideoUrlResponse
    let len;
    let data = new PanoramicVideoUrlResponse(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'common/PanoramicVideoUrlResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PanoramicVideoUrlResponse(null);
    return resolved;
    }
};

module.exports = {
  Request: PanoramicVideoUrlRequest,
  Response: PanoramicVideoUrlResponse,
  md5sum() { return 'ba607c1e80b486a09f8e68edd373cea1'; },
  datatype() { return 'common/PanoramicVideoUrl'; }
};
