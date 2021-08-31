import 'package:flutter_baidu_yingyan_trace/src/model/point.dart';

/// 自定义轨迹点
class CustomTrackPoint {
  /// 轨迹点
  Point ?point;

  /// 自定义数据字典。可选。
  /// key为开发者添加的自定义字段；
  /// value为该字段对应的值。
  Map<String, String> ?customData;

  /// 该轨迹点所属的终端实体的名称
  String ?entityName;

  /// 有参构造
  CustomTrackPoint(
      {required this.point, required this.entityName, this.customData});

  /// map => CustomTrackPoint
  CustomTrackPoint.fromMap(Map map)
      : assert(map != null,
            'Construct a CustomTrackPoint，The parameter map cannot be null !') {
    point = map['point'] == null ? null : Point.fromMap(map['point']);
    customData = map['customData'] as Map<String, String>;
    entityName = map['entityName'];
  }

  /// CustomTrackPoint => map
  Map toMap() {
    Map map = Map();
    map['point'] = this.point?.toMap();
    map['customData'] = this.customData;
    map['entityName'] = this.entityName;
    return map;
  }
}
