import 'dart:async';

import 'package:flutter/services.dart';

class Night {
  static const MethodChannel _channel = const MethodChannel('night');

  static Future<int> get getDefaultNightMode async {
    final int mode = await _channel.invokeMethod('getDefaultNightMode');
    return mode;
  }

  static Future<bool> get isSystemTheme async {
    final bool enable = await _channel.invokeMethod("isSystemTheme");
    return enable;
  }

  static Future<bool> isDarkTheme() async {
    final bool result = await _channel.invokeMethod("isDarkTheme");
    return result;
  }

  static void updateSystemTheme(bool enable) async {
    await _channel.invokeMethod("updateSystemTheme", {"enable": enable});
  }

  static void updateNightTheme(bool enable) async {
    await _channel.invokeMethod("updateNightTheme", {"enable": enable});
  }
}
