import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:night/night.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var isSystemTheme = false;
  var isDarkTheme = false;

  @override
  void initState() {
    super.initState();
    changeState();
  }

  void changeState() async {
    try {
      isSystemTheme = await Night.isSystemTheme();
      isDarkTheme = await Night.isDarkTheme();
      setState(() {});
    } on PlatformException {}

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }

  void switchSystem(enable) {
    Night.updateSystemTheme(enable);
    changeState();
  }

  void switchNight(enable) async {
    final isSystem = await Night.isSystemTheme();
    if (!isSystem) {
      Night.updateDarkTheme(enable);
      changeState();
    }
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isDarkTheme ? Colors.black : Colors.white;
    final textColor = isDarkTheme ? Colors.white : Colors.black;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('isSystem on: $isSystemTheme',
                  style: TextStyle(color: textColor)),
              Text('isDark on: $isDarkTheme',
                  style: TextStyle(color: textColor)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("跟随系统:", style: TextStyle(color: textColor)),
                  Switch(
                      value: isSystemTheme,
                      onChanged: (enable) => switchSystem(enable))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("深色模式:", style: TextStyle(color: textColor)),
                  Switch(
                      value: isDarkTheme,
                      onChanged: (enable) => switchNight(enable))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
