import 'dart:async';

import 'package:flutter/services.dart';

class Night {
  static const MethodChannel _channel = const MethodChannel('night');

  static Future<bool> isSystemTheme() async {
    return await _channel.invokeMethod("isSystemTheme");
  }

  static Future<bool> isDarkTheme() async {
    return await _channel.invokeMethod("isDarkTheme");
  }

  static void updateSystemTheme(bool enable) async {
    await _channel.invokeMethod("updateSystemTheme", {"enable": enable});
  }

  static void updateDarkTheme(bool enable) async {
    await _channel.invokeMethod("updateDarkTheme", {"enable": enable});
  }
}
