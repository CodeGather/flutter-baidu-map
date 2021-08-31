import 'package:flutter/material.dart';
import 'package:flutter_baidu_yingyan_trace/flutter_baidu_yingyan_trace.dart';
import 'package:flutter_baidu_yingyan_trace_example/CustomWidgets/map_appbar.dart';
import 'package:flutter_baidu_yingyan_trace_example/constants.dart';

class TracePage extends StatelessWidget {
  const TracePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: BMFAppBar(
          title: '开启鹰眼服务',
          onBack: () {
            Navigator.pop(context);
          },
        ),
        body: Container(child: generateWidgetColumen()),
      ),
    );
  }

  Column generateWidgetColumen() {
    return Column(children: <Widget>[
      FlatButton(
          child: new Text("百度鹰眼服务配置"),
          onPressed: () async {
            /// 鹰眼配置
            ServiceOption serviceOption = ServiceOption(
                ak: ak,
                mcode: mcode,
                serviceId: serviceID,
                keepAlive: false);

            /// 设置SDK运行所需的基础信息，调用任何方法之前都需要先调用此方法
            /// true代表设置成功，false代表设置失败
            /// ios 独有
            bool flag = await TraceController.shareInstance
                .configServerInfo(serviceOption);
            print('--百度鹰眼服务配置 flag = $flag');
          }),
      FlatButton(
          child: new Text("开启鹰眼服务"),
          onPressed: () async {
            /// 开启轨迹服务
            /// entityName 终端实体的名称
            bool flag = await TraceController.shareInstance.startTraceService(
                trace: Trace(serviceId: serviceID, entityName: entityName_test),
                traceCallback: TraceCallback(
                    onStartTraceServiceCallBack: (TraceResult result) {
                  print('--开启鹰眼服务回调 result = ${result?.toMap()}');
                }, onPushCallBack: (PushResult result) {
                  // 报警推送回调
                  print('--报警推送回调 resutlt = ${result.toMap()}');
                }));
            print('--开启鹰眼服务 flag = $flag');
          }),
      FlatButton(
          child: new Text("停止鹰眼服务"),
          onPressed: () async {
            /// 停止轨迹服务回调
            bool flag = await TraceController.shareInstance.stopTraceService(
                trace: Trace(serviceId: serviceID, entityName: entityName_test),
                traceCallback: TraceCallback(
                    onStopTraceServiceCallBack: (TraceResult result) {
                  print('--停止鹰眼服务回调 result = ${result?.toMap()}');
                }));
            print('--停止鹰眼服务 flag = $flag');
          }),
      FlatButton(
          child: new Text("申请定位权限"),
          onPressed: () async {
            /// 申请定位权限
            bool flag =
                await TraceController.shareInstance.requestLocalPermission();
            print('--申请定位权限 flag = $flag');
          }),
      FlatButton(
          child: new Text("配置定位参数"),
          onPressed: () async {
            /// 配置定位参数
            LocationOption locationOption = LocationOption();
            print('${locationOption.toMap()}');
            bool flag = await TraceController.shareInstance
                .configLocationInfo(locationOption);
            print('--配置定位参数 flag = $flag');
          }),
      FlatButton(
          child: new Text("开始采集"),
          onPressed: () async {
            /// 开始采集
            bool flag = await TraceController.shareInstance.startGather(
                traceCallback:
                    TraceCallback(onStartGatherCallBack: (GatherResult result) {
              print('--开始采集回调 result = ${result?.toMap()}');
            }));
            print('--开始采集 flag = $flag');
          }),
      FlatButton(
          child: new Text("停止采集"),
          onPressed: () async {
            bool flag = await TraceController.shareInstance.stopGather(
                traceCallback:
                    TraceCallback(onStopGatherCallBack: (GatherResult result) {
              print('--停止采集回调 result = ${result?.toMap()}');
            }));
            print('--停止采集 flag = $flag');
          }),
    ]);
  }
}
