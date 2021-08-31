import 'package:flutter/material.dart';
import 'package:flutter_baidu_yingyan_trace/flutter_baidu_yingyan_trace.dart';
import 'package:flutter_baidu_yingyan_trace_example/CustomWidgets/map_appbar.dart';
import 'package:flutter_baidu_yingyan_trace_example/constants.dart';

class FencePage extends StatelessWidget {
  const FencePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: BMFAppBar(
          title: '围栏相关',
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
          child: new Text("创建围栏"),
          onPressed: () async {
            /// 客户端围栏
            // CreateFenceOption createFenceOption =
            //     CreateFenceOption.buildLocalCircleOption(
            //         tag: 1,
            //         serviceId: serviceID,
            //         center: LatLng(38, 116.0),
            //         radius: 500,
            //         fenceName: 'haha',
            //         monitoredPerson: entityName_test);

            /// 服务端circle围栏
            // CreateFenceOption createFenceOption =
            //     CreateFenceOption.buildServerCircleFenceOption(
            //         tag: 1,
            //         serviceId: serviceID,
            //         center: LatLng(38, 116.0),
            //         radius: 500,
            //         fenceName: 'haha',
            //         monitoredPerson: entityName_test);

            /// 服务端polygon围栏
            // CreateFenceOption createFenceOption =
            //     CreateFenceOption.buildServerPolygonFenceOption(
            //         tag: 1,
            //         serviceId: serviceID,
            //         vertexes: [
            //           LatLng(38.0, 116.9),
            //           LatLng(38.01, 116.9),
            //           LatLng(38.02, 116.87)
            //         ],
            //         fenceName: 'haha',
            //         monitoredPerson: entityName_test,
            //         deNoise: 10);

            /// 服务端polyline围栏
            CreateFenceOption createFenceOption =
                CreateFenceOption.buildServerPolylineFenceOption(
                    tag: 1,
                    serviceId: serviceID,
                    vertexes: [LatLng(38.0, 116.9), LatLng(39.0, 116.9)],
                    offset: 2,
                    fenceName: 'haha',
                    monitoredPerson: entityName_test,
                    deNoise: 50);

            /// 服务端district围栏
            // CreateFenceOption createFenceOption =
            //     CreateFenceOption.buildServerDistrictFenceOption(
            //         tag: 1,
            //         serviceId: serviceID,
            //         keyword: '湖南省长沙市雨花区',
            //         fenceName: 'haha',
            //         monitoredPerson: entityName_test);

            bool flag = await TraceController.shareInstance.createFence(
                createFenceOption: createFenceOption,
                fenceCallback: FenceCallback(
                    onCreateFenceCallback: (CreateFenceResult result) {
                  print('-- 创建围栏回调 result = ${result?.toMap()}');
                }));

            print('-- 创建围栏 flag = $flag');
          }),
      FlatButton(
          child: new Text("删除fence"),
          onPressed: () async {
            /// 删除本地围栏
            // DeleteFenceOption deleteFenceOption =
            //     DeleteFenceOption.deleteLocalFenceOption(
            //         tag: 1, serviceId: serviceID, fenceIds: [0, 1]);
            /// 删除服务端围栏
            DeleteFenceOption deleteFenceOption =
                DeleteFenceOption.deleteServerFenceOption(
                    tag: 1, serviceId: serviceID, fenceIds: [13, 17]);

            /// 发起删除fence
            bool flag = await TraceController.shareInstance.deleteFence(
                deleteFenceOption: deleteFenceOption,
                fenceCallback: FenceCallback(
                    onDeleteFenceCallback: (DeleteFenceResult result) {
                  print('-- 删除fence回调 result = ${result?.toMap()}');
                }));

            print('-- 删除fence flag = $flag');
          }),
      FlatButton(
          child: new Text("更新fence"),
          onPressed: () async {
            /// 客户端围栏更新
            // UpdateFenceOption updateFenceOption =
            //     UpdateFenceOption.buildLocalCircleOption(
            //         tag: 1,
            //         serviceId: serviceID,
            //         fenceId: 5,
            //         center: LatLng(38.0, 116.0),
            //         radius: 500);

            /// 服务端circle围栏更新
            // UpdateFenceOption updateFenceOption =
            //     UpdateFenceOption.buildServerCircleFenceOption(
            //         tag: 1,
            //         serviceId: serviceID,
            //         fenceId: 15,
            //         center: LatLng(38.0, 116.0),
            //         radius: 500);

            /// 服务端polygon围栏更新
            UpdateFenceOption updateFenceOption =
                UpdateFenceOption.buildServerPolygonFenceOption(
                    tag: 1,
                    serviceId: serviceID,
                    vertexes: [
                      LatLng(38.0, 116.9),
                      LatLng(39.0, 116.9),
                      LatLng(40.0, 116.0)
                    ],
                    fenceName: 'haha',
                    monitoredPerson: entityName_test,
                    fenceId: 0);

            /// 服务端polyline围栏更新
            // UpdateFenceOption updateFenceOption =
            //     UpdateFenceOption.buildServerPolylineFenceOption(
            //         tag: 1,
            //         serviceId: serviceID,
            //         vertexes: [LatLng(38.0, 116.9), LatLng(39.0, 116.9)],
            //         offset: 2,
            //         fenceName: 'haha',
            //         monitoredPerson: entityName_test,
            //         fenceId: 0);

            /// 服务端district围栏更新
            // UpdateFenceOption updateFenceOption =
            //     UpdateFenceOption.buildServerDistrictFenceOption(
            //         tag: 1,
            //         serviceId: serviceID,
            //         fenceId: 16,
            //         keyWord: '北京市海淀区');

            /// 发起更新fence
            bool flag = await TraceController.shareInstance.updateFence(
                updateFenceOption: updateFenceOption,
                fenceCallback: FenceCallback(
                    onUpdateFenceCallback: (UpdateFenceResult result) {
                  print('-- 更新fence回调 result = ${result?.toMap()}');
                }));

            print('-- 更新fence flag = $flag');
          }),
      FlatButton(
          child: new Text("查询fence"),
          onPressed: () async {
            /// 客户端围栏查询
            QueryFenceListOption queryFenceListOption = QueryFenceListOption(
                tag: 1,
                serviceId: serviceID,
                // fenceIds: [0, 1],
                monitoredPerson: entityName_test,
                fenceType: FenceType.local);

            /// 服务端围栏查询
            // QueryFenceListOption queryFenceListOption = QueryFenceListOption(
            //     tag: 1,
            //     serviceId: serviceID,
            //     // fenceIds: [0, 1],
            //     monitoredPerson: entityName_test,
            //     fenceType: FenceType.server);
            bool flag = await TraceController.shareInstance.queryFenceList(
                queryFenceListOption: queryFenceListOption,
                fenceCallback: FenceCallback(
                    onQueryFenceListCallback: (QueryFenceListResult result) {
                  print('--++ 查询fence回调 result = ${result?.toMap()}');
                }));

            print('-- 查询fence flag = $flag');
          }),
      FlatButton(
          child: new Text("查询监控对象"),
          onPressed: () async {
            /// 查询监控对象状态请求参数 (客户端)
            // QueryMonitoredStatusOption queryMonitoredStatusOption =
            // QueryMonitoredStatusOption(
            //     // fenceIds: [0, 1],
            //     fenceType: FenceType.local,
            //     monitoredPerson: entityName_test,
            //     serviceId: serviceID,
            //     tag: 1);

            /// 查询监控对象状态请求参数 (服务端)
            QueryMonitoredStatusOption queryMonitoredStatusOption =
                QueryMonitoredStatusOption(
                    // fenceIds: [0, 1],
                    fenceType: FenceType.server,
                    monitoredPerson: entityName_test,
                    serviceId: serviceID,
                    tag: 1);

            bool flag = await TraceController.shareInstance
                .queryMonitoredStatus(
                    queryMonitoredStatusOption: queryMonitoredStatusOption,
                    fenceCallback: FenceCallback(onQueryMonitoredStatusCallback:
                        (QueryMonitoredStatusResult result) {
                      print('-- 查询监控对象回调 result = ${result?.toMap()}');
                    }));

            print('-- 查询监控对象 flag = $flag');
          }),
      FlatButton(
          child: new Text("查询被监控对象，在指定的坐标时，和地理围栏的位置关系"),
          onPressed: () async {
            /// 查询被监控对象，在指定的坐标时，和地理围栏的位置关系(客户端)
            QueryMonitoredStatusByLocationOption
                queryMonitoredStatusByLocationOption =
                QueryMonitoredStatusByLocationOption(
                    tag: 1,
                    serviceId: serviceID,
                    // fenceIds: [0, 1],
                    monitoredPerson: entityName_test,
                    fenceType: FenceType.local,
                    latLng: LatLng(38.0, 116.0));

            /// 查询被监控对象，在指定的坐标时，和地理围栏的位置关系(服务端)
            // QueryMonitoredStatusByLocationOption
            //     queryMonitoredStatusByLocationOption =
            //     QueryMonitoredStatusByLocationOption(
            //         tag: 1,
            //         serviceId: serviceID,
            //         fenceIds: [0, 1],
            //         monitoredPerson: entityName_test,
            //         fenceType: FenceType.server,
            //         latLng: LatLng(38.0, 116.0));

            bool flag = await TraceController.shareInstance
                .queryMonitoredStatusByLocation(
                    queryMonitoredStatusByLocationOption:
                        queryMonitoredStatusByLocationOption,
                    fenceCallback: FenceCallback(
                        onQueryMonitoredStatusByLocationCallback:
                            (QueryMonitoredStatusByLocationResult result) {
                      print(
                          '-- 查询被监控对象，在指定的坐标时，和地理围栏的位置关系回调 result = ${result?.toMap()}');
                    }));

            print('-- 查询被监控对象，在指定的坐标时，和地理围栏的位置关系 flag = $flag');
          }),
      FlatButton(
          child: new Text("查询指定监控对象的地理围栏历史报警信息"),
          onPressed: () async {
            /// 查询指定监控对象的地理围栏历史报警信息（客户端）
            // QueryHistoryAlarmOption queryHistoryAlarmOption =
            //     QueryHistoryAlarmOption(
            //         tag: 1,
            //         serviceId: serviceID,
            //         fenceIds: [0, 1],
            //         monitoredPerson: entityName_test,
            //         fenceType: FenceType.local);

            /// 查询指定监控对象的地理围栏历史报警信息（服务端）
            QueryHistoryAlarmOption queryHistoryAlarmOption =
                QueryHistoryAlarmOption(
                    tag: 1,
                    serviceId: serviceID,
                    // fenceIds: [0, 1],
                    monitoredPerson: entityName_test,
                    fenceType: FenceType.server);

            bool flag = await TraceController.shareInstance.queryHistoryAlarm(
                queryHistoryAlarmOption: queryHistoryAlarmOption,
                fenceCallback: FenceCallback(onQueryHistoryAlarmCallback:
                    (QueryHistoryAlarmResult result) {
                  print('-- 查询指定监控对象的地理围栏历史报警信息回调 result = ${result?.toMap()}');
                }));

            print('-- 查询指定监控对象的地理围栏历史报警信息 flag = $flag');
          }),
      FlatButton(
          child: new Text("给服务端地理围栏添加监控对象"),
          onPressed: () async {
            /// 给服务端地理围栏添加监控对象
            AddMonitoredPersonOption addMonitoredPersonOption =
                AddMonitoredPersonOption(
                    tag: 1,
                    serviceId: serviceID,
                    fenceId: 16,
                    monitoredPersons: [entityName_test],
                    fenceType: FenceType.server);

            bool flag = await TraceController.shareInstance.addMonitoredPerson(
                addMonitoredPersonOption: addMonitoredPersonOption,
                fenceCallback: FenceCallback(onAddMonitoredPersonCallback:
                    (AddMonitoredPersonResult result) {
                  print('-- 给服务端地理围栏添加监控对象回调 result = ${result?.toMap()}');
                }));
            print('-- 给服务端地理围栏添加监控对象 flag = $flag');
          }),
      FlatButton(
          child: new Text("移除指定服务端地理围栏上的监控对象"),
          onPressed: () async {
            /// 移除指定服务端地理围栏上的监控对象
            DeleteMonitoredPersonOption deleteMonitoredPersonOption =
                DeleteMonitoredPersonOption(
                    tag: 1,
                    serviceId: serviceID,
                    fenceId: 16,
                    monitoredPersons: [entityName_test]);

            bool flag = await TraceController.shareInstance
                .deleteMonitoredPerson(
                    deleteMonitoredPersonOption: deleteMonitoredPersonOption,
                    fenceCallback: FenceCallback(
                        onDeleteMonitoredPersonCallback:
                            (DeleteMonitoredPersonResult result) {
                      print(
                          '-- 移除指定服务端地理围栏上的监控对象回调 result = ${result?.toMap()}');
                    }));

            print('-- 移除指定服务端地理围栏上的监控对象 flag = $flag');
          }),
      FlatButton(
          child: new Text("查询指定的服务端地理围栏上的监控对象"),
          onPressed: () async {
            /// 查询指定的服务端地理围栏上的监控对象
            QueryListMonitoredPersonOption queryListMonitoredPersonOption =
                QueryListMonitoredPersonOption(
                    tag: 1, serviceId: serviceID, fenceId: 15);

            bool flag = await TraceController.shareInstance
                .queryListMonitoredPerson(
                    queryListMonitoredPersonOption:
                        queryListMonitoredPersonOption,
                    fenceCallback: FenceCallback(
                        onQueryListMonitoredPersonCallback:
                            (QueryListMonitoredPersonResult result) {
                      print(
                          '-- 查询指定的服务端地理围栏上的监控对象回调 result = ${result?.toMap()}');
                    }));

            print('-- 查询指定的服务端地理围栏上的监控对象 flag = $flag');
          })
    ]);
  }
}
