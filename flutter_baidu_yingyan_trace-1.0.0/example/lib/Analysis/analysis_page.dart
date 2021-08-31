import 'package:flutter/material.dart';
import 'package:flutter_baidu_yingyan_trace_example/CustomWidgets/map_appbar.dart';
import 'package:flutter_baidu_yingyan_trace/flutter_baidu_yingyan_trace.dart';
import 'package:flutter_baidu_yingyan_trace_example/constants.dart';

class AnalysisPage extends StatelessWidget {
  const AnalysisPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: BMFAppBar(
          title: '轨迹分析',
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
          child: new Text("驾驶行为分析"),
          onPressed: () async {
            DrivingBehaviourAnalysisOption drivingBehaviourAnalysisOption =
                DrivingBehaviourAnalysisOption(
                    entityName: entityName_test,
                    startTime: DateTime.now().millisecondsSinceEpoch ~/ 1000 -
                        60 * 60 * 24,
                    endTime: DateTime.now().millisecondsSinceEpoch ~/ 1000,
                    tag: 1,
                    serviceId: serviceID,
                    speedingThreshold: 0,
                    thresholdOption:
                        DrivingBehaviorThresholdOption(speedingThreshold: 0),
                    processOption: QueryTrackProcessOption(
                        denoise: true,
                        vacuate: true,
                        mapMatch: true,
                        radiusThreshold: 20,
                        transportMode: TrackProcessOptionTransportMode.AUTO),
                    outputCoordType: CoordType.BD09LL);

            bool flag = await TraceController.shareInstance
                .analyzeDrivingBehaviour(
                    drivingBehaviourAnalysisOption:
                        drivingBehaviourAnalysisOption,
                    analysisCallBack: AnalysisCallBack(
                        onDrivingBehaviourAnalysisCallBack:
                            (DrivingBehaviourAnalysisResult result) {
                      print('-- 驾驶行为分析回调 result = ${result?.toMap()}');
                    }));

            print('-- 驾驶行为分析 flag = $flag');
          }),
      FlatButton(
          child: new Text("停留点分析"),
          onPressed: () async {
            StayPointAnalysisOption stayPointAnalysisOption =
                StayPointAnalysisOption(
                    entityName: entityName_test,
                    startTime: DateTime.now().millisecondsSinceEpoch ~/ 1000 -
                        60 * 60 * 24,
                    endTime: DateTime.now().millisecondsSinceEpoch ~/ 1000,
                    tag: 1,
                    serviceId: serviceID,
                    stayRadius: 20,
                    processOption: QueryTrackProcessOption(
                        denoise: true,
                        vacuate: true,
                        mapMatch: true,
                        radiusThreshold: 20,
                        transportMode: TrackProcessOptionTransportMode.AUTO),
                    outputCoordType: CoordType.BD09LL);

            bool flag = await TraceController.shareInstance.analyzeStayPoint(
                stayPointAnalysisOption: stayPointAnalysisOption,
                analysisCallBack: AnalysisCallBack(onStayPointAnalysisCallBack:
                    (StayPointAnalysisResult result) {
                  print('-- 停留点分析回调 result = ${result?.toMap()}');
                }));

            print('-- 停留点分析 flag = $flag');
          })
    ]);
  }
}
