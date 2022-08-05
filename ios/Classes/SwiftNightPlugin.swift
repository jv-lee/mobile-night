import Flutter
import UIKit

public class SwiftNightPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    DarkModeTools.instance.isSystemTheme()
    let channel = FlutterMethodChannel(name: "night", binaryMessenger: registrar.messenger())
    let instance = SwiftNightPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    let args = call.arguments as? [String: Any]
    switch call.method {
            case "isSystemTheme":
                result(DarkModeTools.instance.isSystemTheme() as Bool)
            case "isDarkTheme":
                result(DarkModeTools.instance.isDarkTheme() as Bool)
            case "updateSystemTheme":
                DarkModeTools.instance.updateSystemTheme(enable: args?["enable"] as! Bool)
            case "updateDarkTheme":
                DarkModeTools.instance.updateDarkTheme(enable: args?["enable"] as! Bool)
            default:
                result(0)
        }
  }
}
