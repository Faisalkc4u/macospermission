import 'dart:async';

import 'package:flutter/services.dart';
import 'package:macospermission/CameraDevice.dart';

class Macospermission {
  static const MethodChannel _channel = const MethodChannel('macospermission');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  Future<void> requestCameraPermissions() async {
    final String version =
        await _channel.invokeMethod('requestCameraPermission');
    print(version);
    return version;
  }

  Future<String> getCameraPermissions() async {
    final String version = await _channel.invokeMethod('getCameraPermission');
    print(version);
    return version;
  }

  Future<String> getVideoPermission() async {
    final String version = await _channel.invokeMethod('getVideoPermission');
    print(version);
    return version;
  }

  Future<void> requestVideoPermission() async {
    final String version =
        await _channel.invokeMethod('requestVideoPermission');
    print(version);
    return version;
  }

  Future<List<CameraDevice>> getAvailableDevices() async {
    List<CameraDevice> temp = <CameraDevice>[];
    final devices =
        await _channel.invokeMethod<List<dynamic>>('availableDevices');
    for (var device in devices) {
      temp.add(CameraDevice.fromjson((device as Map<dynamic, dynamic>)));
    }
    return temp;
  }
}
