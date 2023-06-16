// Auto-generated. Do not edit!

// (in-package common.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class sensor_data {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.temperature = null;
      this.humidity = null;
      this.light = null;
      this.PM1_0 = null;
      this.PM2_5 = null;
      this.PM10 = null;
      this.smoke1 = null;
      this.smoke2 = null;
    }
    else {
      if (initObj.hasOwnProperty('temperature')) {
        this.temperature = initObj.temperature
      }
      else {
        this.temperature = 0.0;
      }
      if (initObj.hasOwnProperty('humidity')) {
        this.humidity = initObj.humidity
      }
      else {
        this.humidity = 0.0;
      }
      if (initObj.hasOwnProperty('light')) {
        this.light = initObj.light
      }
      else {
        this.light = 0.0;
      }
      if (initObj.hasOwnProperty('PM1_0')) {
        this.PM1_0 = initObj.PM1_0
      }
      else {
        this.PM1_0 = 0;
      }
      if (initObj.hasOwnProperty('PM2_5')) {
        this.PM2_5 = initObj.PM2_5
      }
      else {
        this.PM2_5 = 0;
      }
      if (initObj.hasOwnProperty('PM10')) {
        this.PM10 = initObj.PM10
      }
      else {
        this.PM10 = 0;
      }
      if (initObj.hasOwnProperty('smoke1')) {
        this.smoke1 = initObj.smoke1
      }
      else {
        this.smoke1 = 0;
      }
      if (initObj.hasOwnProperty('smoke2')) {
        this.smoke2 = initObj.smoke2
      }
      else {
        this.smoke2 = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type sensor_data
    // Serialize message field [temperature]
    bufferOffset = _serializer.float32(obj.temperature, buffer, bufferOffset);
    // Serialize message field [humidity]
    bufferOffset = _serializer.float32(obj.humidity, buffer, bufferOffset);
    // Serialize message field [light]
    bufferOffset = _serializer.float32(obj.light, buffer, bufferOffset);
    // Serialize message field [PM1_0]
    bufferOffset = _serializer.int32(obj.PM1_0, buffer, bufferOffset);
    // Serialize message field [PM2_5]
    bufferOffset = _serializer.int32(obj.PM2_5, buffer, bufferOffset);
    // Serialize message field [PM10]
    bufferOffset = _serializer.int32(obj.PM10, buffer, bufferOffset);
    // Serialize message field [smoke1]
    bufferOffset = _serializer.int32(obj.smoke1, buffer, bufferOffset);
    // Serialize message field [smoke2]
    bufferOffset = _serializer.int32(obj.smoke2, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type sensor_data
    let len;
    let data = new sensor_data(null);
    // Deserialize message field [temperature]
    data.temperature = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [humidity]
    data.humidity = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [light]
    data.light = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [PM1_0]
    data.PM1_0 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [PM2_5]
    data.PM2_5 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [PM10]
    data.PM10 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [smoke1]
    data.smoke1 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [smoke2]
    data.smoke2 = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 32;
  }

  static datatype() {
    // Returns string type for a message object
    return 'common/sensor_data';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2514f8bdc76a9a175afe9b9b60de1304';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 temperature
    float32 humidity
    
    float32 light
    int32 PM1_0
    int32 PM2_5
    int32 PM10
    int32 smoke1
    int32 smoke2
    
    
    
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new sensor_data(null);
    if (msg.temperature !== undefined) {
      resolved.temperature = msg.temperature;
    }
    else {
      resolved.temperature = 0.0
    }

    if (msg.humidity !== undefined) {
      resolved.humidity = msg.humidity;
    }
    else {
      resolved.humidity = 0.0
    }

    if (msg.light !== undefined) {
      resolved.light = msg.light;
    }
    else {
      resolved.light = 0.0
    }

    if (msg.PM1_0 !== undefined) {
      resolved.PM1_0 = msg.PM1_0;
    }
    else {
      resolved.PM1_0 = 0
    }

    if (msg.PM2_5 !== undefined) {
      resolved.PM2_5 = msg.PM2_5;
    }
    else {
      resolved.PM2_5 = 0
    }

    if (msg.PM10 !== undefined) {
      resolved.PM10 = msg.PM10;
    }
    else {
      resolved.PM10 = 0
    }

    if (msg.smoke1 !== undefined) {
      resolved.smoke1 = msg.smoke1;
    }
    else {
      resolved.smoke1 = 0
    }

    if (msg.smoke2 !== undefined) {
      resolved.smoke2 = msg.smoke2;
    }
    else {
      resolved.smoke2 = 0
    }

    return resolved;
    }
};

module.exports = sensor_data;
