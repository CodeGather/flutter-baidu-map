import 'package:flutter_baidu_yingyan_trace/src/model/point.dart';

/// 停留点
class StayPoint extends Point {
  ///停留开始时间
  int ?startTime;

  /// 停留结束时间
  int ?endTime;

  /// 停留时长
  int ?duration;

  StayPoint.fromMap(Map map)
      : assert(map != null),
        super.fromMap(map) {
    startTime = map['startTime'];
    endTime = map['endTime'];
    duration = map['duration'];
  }

  @override
  Map toMap() {
    Map map = super.toMap();
    map['startTime'] = this.startTime;
    map['endTime'] = this.endTime;
    map['duration'] = this.duration;
    return map;
  }
}
