import 'package:flutter/material.dart';
import 'package:flutter_baidu_yingyan_trace/flutter_baidu_yingyan_trace.dart';
import 'package:flutter_baidu_yingyan_trace_example/CustomWidgets/map_appbar.dart';
import 'package:flutter_baidu_yingyan_trace_example/flutter_mapsearch_demo.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'dart:async';

// import 'package:flutter/services.dart';
// import 'package:flutter_baidu_yingyan_trace/flutter_baidu_yingyan_trace.dart';

void main() {
  runApp(MyApp());
  requestPermission();
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TraceController traceController = TraceController();

  @override
  void initState() {
    super.initState();
    // initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: BMFAppBar(
            title: '百度地图flutter插件searh组件Demo',
            isBack: false,
          ),
          body: BaiduYingYanPage()),
    );
  }
}

void requestPermission() async {
  Map<Permission, PermissionStatus> statuses =
      await [Permission.location].request();
  print('statuses = $statuses');
}
