
"use strict";

let XmlData = require('./XmlData.js')
let TakePicture = require('./TakePicture.js')
let GimbalMotionControl = require('./GimbalMotionControl.js')
let VelocityControl = require('./VelocityControl.js')
let CameraControl = require('./CameraControl.js')
let Upgrade = require('./Upgrade.js')
let PositionControl = require('./PositionControl.js')
let FirmwareUpdate = require('./FirmwareUpdate.js')
let FireDoorControl = require('./FireDoorControl.js')
let PatrolPicture = require('./PatrolPicture.js')
let VideoData = require('./VideoData.js')
let ContinousXmlData = require('./ContinousXmlData.js')
let GimbalControl = require('./GimbalControl.js')
let StopControl = require('./StopControl.js')
let PatrolControl = require('./PatrolControl.js')

module.exports = {
  XmlData: XmlData,
  TakePicture: TakePicture,
  GimbalMotionControl: GimbalMotionControl,
  VelocityControl: VelocityControl,
  CameraControl: CameraControl,
  Upgrade: Upgrade,
  PositionControl: PositionControl,
  FirmwareUpdate: FirmwareUpdate,
  FireDoorControl: FireDoorControl,
  PatrolPicture: PatrolPicture,
  VideoData: VideoData,
  ContinousXmlData: ContinousXmlData,
  GimbalControl: GimbalControl,
  StopControl: StopControl,
  PatrolControl: PatrolControl,
};
