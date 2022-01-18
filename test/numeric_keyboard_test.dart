import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

void main() {
  const MethodChannel channel = MethodChannel('numeric_keyboard');

  TestWidgetsFlutterBinding.ensureInitialized();
  //
  // setUp(() {
  //   channel.setMockMethodCallHandler((MethodCall methodCall) async {
  //     return '42';
  //   });
  // });
  //
  // tearDown(() {
  //   channel.setMockMethodCallHandler(null);
  // });
  //
  // test('getPlatformVersion', () async {
  //   expect(await NumericKeyboard.platformVersion, '42');
  // });
}
