import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:night/night.dart';

void main() {
  const MethodChannel channel = MethodChannel('night');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return 404;
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getDefaultNightMode', () async {
    print(await Night.getDefaultNightMode);
  });
}
