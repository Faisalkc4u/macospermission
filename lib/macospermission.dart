import 'dart:async';

import 'package:flutter/services.dart';

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
}
