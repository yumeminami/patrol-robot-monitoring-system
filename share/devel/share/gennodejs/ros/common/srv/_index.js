
"use strict";

let TakePicture = require('./TakePicture.js')
let GimbalMotionControl = require('./GimbalMotionControl.js')
let VelocityControl = require('./VelocityControl.js')
let CameraControl = require('./CameraControl.js')
let PositionControl = require('./PositionControl.js')
let GimbalControl = require('./GimbalControl.js')
let StopControl = require('./StopControl.js')

module.exports = {
  TakePicture: TakePicture,
  GimbalMotionControl: GimbalMotionControl,
  VelocityControl: VelocityControl,
  CameraControl: CameraControl,
  PositionControl: PositionControl,
  GimbalControl: GimbalControl,
  StopControl: StopControl,
};
