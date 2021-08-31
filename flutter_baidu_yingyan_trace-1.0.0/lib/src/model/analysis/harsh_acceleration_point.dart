import 'package:flutter_baidu_yingyan_trace/src/model/point.dart';

/// 急加速点
class HarshAccelerationPoint extends Point {
  /// 实际加速度，单位：m/s^2
  double ?acceleration;

  /// 加速前时速，单位：km/h
  double ?initialSpeed;

  /// 加速后时速，单位：km/h
  double ?endSpeed;

  HarshAccelerationPoint.fromMap(Map map)
      : assert(map != null),
        super.fromMap(map) {
    acceleration = map['acceleration'];
    initialSpeed = map['initialSpeed'];
    endSpeed = map['endSpeed'];
  }

  @override
  Map toMap() {
    Map map = super.toMap();
    map['acceleration'] = this.acceleration;
    map['initialSpeed'] = this.initialSpeed;
    map['endSpeed'] = this.endSpeed;
    return map;
  }
}
