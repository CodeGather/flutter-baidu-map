import 'package:flutter_baidu_yingyan_trace/src/model/base_result.dart';

/// 查询里程响应结果
class QueryTrackDistanceResult extends BaseResult {
  /// entity名称
  String ?entityName;

  /// 符合条件的轨迹点的里程
  double ?distance;

  /// 低速里程, 单位米
  ///
  /// 若请求参数{@link DistanceRequest}lowSpeedThreshold，则返回该字段，否则不返回
  /// 代表速度低于lowSpeedThreshold的里程
  double ?lowSpeedDistance;

  /// map => QueryTrackDistanceResult
  QueryTrackDistanceResult.fromMap(Map map)
      : assert(map != null,
            'Construct a QueryTrackDistanceResult，The parameter map cannot be null !'),
        super.fromMap(map) {
    entityName = map['entityName'];
    distance = map['distance'];
    lowSpeedDistance = map['lowSpeedDistance'];
  }

  @override
  Map toMap() {
    Map map = super.toMap();
    map['entityName'] = this.entityName;
    map['distance'] = this.distance;
    map['lowSpeedDistance'] = this.lowSpeedDistance;
    return map;
  }
}
