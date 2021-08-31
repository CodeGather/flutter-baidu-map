import 'package:flutter_baidu_yingyan_trace/src/model/point.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/analysis/turn_type.dart';

/// 急转弯点
class HarshSteeringPoint extends Point {
  /// 向心加速度，单位：m/s^2
  double ?centripetalAcceleration;

  /// 转向类型
  TurnType ?turnType;

  /// 刹车后时速，单位：km/h
  double ?endSpeed;

  HarshSteeringPoint.fromMap(Map map)
      : assert(map != null),
        super.fromMap(map) {
    centripetalAcceleration = map['centripetalAcceleration'];
    turnType = map['turnType'] == null
        ? null
        : TurnType.values[map['turnType'] as int];
    endSpeed = map['endSpeed'];
  }

  @override
  Map toMap() {
    Map map = super.toMap();
    map['centripetalAcceleration'] = this.centripetalAcceleration;
    map['turnType'] = this.turnType?.index;
    map['endSpeed'] = this.endSpeed;
    return map;
  }
}
