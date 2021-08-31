import 'package:flutter_baidu_yingyan_trace/src/model/analysis/speeding_point.dart';

class SpeedingInfo {
  /// 超速里程，单位：米
  double ?distance;

  /// 超速点集合
  List<SpeedingPoint> ?points;

  SpeedingInfo.fromMap(Map map) : assert(map != null) {
    distance = map['distance'];
    if (map['points'] != null) {
      points = <SpeedingPoint>[];
      map['points'].forEach((e) {
        points!.add(SpeedingPoint.fromMap(e as Map));
      });
    }
  }

  Map toMap() {
    Map map = {};
    map['distance'] = this.distance;
    map['points'] = this.points?.map((e) => e.toMap()).toList();
    return map;
  }
}
