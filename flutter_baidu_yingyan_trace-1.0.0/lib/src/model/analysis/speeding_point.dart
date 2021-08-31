import 'package:flutter_baidu_yingyan_trace/flutter_baidu_yingyan_trace.dart';

/// 超速点
class SpeedingPoint extends Point {
  /// 实际行使时速，单位：km/h
  double ?actualSpeed;

  /// 所在道路限定最高时速，单位：km/h
  double ?limitSpeed;

  SpeedingPoint.fromMap(Map map)
      : assert(map != null),
        super.fromMap(map) {
    actualSpeed = map['actualSpeed'];
    limitSpeed = map['limitSpeed'];
  }

  @override
  Map toMap() {
    Map map = super.toMap();
    map['actualSpeed'] = this.actualSpeed;
    map['limitSpeed'] = this.limitSpeed;
    return map;
  }
}
