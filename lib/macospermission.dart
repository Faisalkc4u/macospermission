import 'dart:async';

import 'package:flutter/services.dart';
import 'package:macospermission/CameraDevice.dart';

class Macospermission {
  static const MethodChannel _channel = const MethodChannel('macospermission');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  Future<void> requestAudioPermissions() async {
    await _channel.invokeMethod('requestAudioPermission');
    return;
  }

  Future<String> getAudioPermissions() async {
    final String version = await _channel.invokeMethod('getAudioPermission');
    print(version);
    return version;
  }

  Future<String> getCameraPermission() async {
    final String version = await _channel.invokeMethod('getCameraPermission');
    print(version);
    return version;
  }

  Future<void> requestCameraPermission() async {
    await _channel.invokeMethod('requestCameraPermission');
    return;
  }

  Future<List<MacDevice>> getAvailableDevices() async {
    List<MacDevice> temp = <MacDevice>[];
    final devices =
        await _channel.invokeMethod<List<dynamic>>('availableDevices');
    for (var device in devices) {
      temp.add(MacDevice.fromjson((device as Map<dynamic, dynamic>)));
    }
    return temp;
  }
}
