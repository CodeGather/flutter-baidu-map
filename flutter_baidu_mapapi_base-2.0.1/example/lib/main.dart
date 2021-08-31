import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 百度地图sdk初始化鉴权
  if (Platform.isIOS) {
    BMFMapSDK.setApiKeyAndCoordType(
        'QtnnGzvXiKVzwTTZybjh5keEgZKWM60o', BMF_COORD_TYPE.BD09LL);
  } else if (Platform.isAndroid) {
    // Android 目前不支持接口设置Apikey,
    // 请在主工程的Manifest文件里设置，详细配置方法请参考官网(https://lbsyun.baidu.com/)demo
    BMFMapSDK.setCoordType(BMF_COORD_TYPE.BD09LL);
  }

  Map map = await BMFMapAPI_Base.nativeBaseVersion;
  print('获取原生地图版本号：$map');
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    // initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Container(
          child: Text('00'),
        ),
      ),
    );
  }
}
