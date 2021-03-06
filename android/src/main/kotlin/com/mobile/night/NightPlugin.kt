package com.mobile.night

import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

/** DarkPlugin */
public class NightPlugin : FlutterPlugin, MethodCallHandler {
    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        DarkModeTools.get(flutterPluginBinding.applicationContext)
        if (!DarkModeTools.get().isSystemTheme()) {
            DarkModeTools.get().updateNightTheme(DarkModeTools.get().isDarkTheme())
        }
        val channel = MethodChannel(flutterPluginBinding.flutterEngine.dartExecutor, "night")
        channel.setMethodCallHandler(NightPlugin());
    }

    // This static function is optional and equivalent to onAttachedToEngine. It supports the old
    // pre-Flutter-1.12 Android projects. You are encouraged to continue supporting
    // plugin registration via this function while apps migrate to use the new Android APIs
    // post-flutter-1.12 via https://flutter.dev/go/android-project-migration.
    //
    // It is encouraged to share logic between onAttachedToEngine and registerWith to keep
    // them functionally equivalent. Only one of onAttachedToEngine or registerWith will be called
    // depending on the user's project. onAttachedToEngine or registerWith must both be defined
    // in the same class.
    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), "night")
            channel.setMethodCallHandler(NightPlugin())
        }
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        when (call.method) {
            "getDefaultNightMode" -> result.success(DarkModeTools.get().getDefaultNightMode())
            "isSystemTheme" -> result.success(DarkModeTools.get().isSystemTheme())
            "isDarkTheme" -> result.success(DarkModeTools.get().isDarkTheme())
            "updateSystemTheme" -> DarkModeTools.get().updateSystemTheme(call.argument<Boolean>("enable")!!)
            "updateNightTheme" -> DarkModeTools.get().updateNightTheme(call.argument<Boolean>("enable")!!)
            else -> result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    }
}
