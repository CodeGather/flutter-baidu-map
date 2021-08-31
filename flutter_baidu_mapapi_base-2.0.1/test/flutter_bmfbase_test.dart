import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:flutter_bmfbase/flutter_bmfbase.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_bmfbase');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  // test('getPlatformVersion', () async {
  //   expect(await FlutterBmfbase.platformVersion, '42');
  // });
}
