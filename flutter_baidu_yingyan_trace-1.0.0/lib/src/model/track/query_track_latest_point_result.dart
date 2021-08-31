import 'package:flutter_baidu_yingyan_trace/src/model/base_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/latest_point.dart';

/// 查询最新轨迹点请求参数
class QueryTrackLatestPointResult extends BaseResult {
  /// 需要查询的entity的名称，必填，必须为非空字符串。
  String ?entityName;

  /// 最新轨迹点
  LatestPoint ?latestPoint;

  /// 道路限速（单位：km/h）
  double ?limitSpeed;

  /// 有参构造
  QueryTrackLatestPointResult(
      {required int tag,
      required int serviceId,
      required this.entityName,
      this.latestPoint,
      this.limitSpeed}) : super(tag: tag);

  /// map => QueryTrackLatestPointResult
  QueryTrackLatestPointResult.fromMap(Map map)
      : assert(map != null,
            'Construct a QueryTrackLatestPointResult，The parameter map cannot be null !'),
        super.fromMap(map) {
    entityName = map['entityName'];
    limitSpeed = map['limitSpeed'];
    latestPoint = map['latestPoint'] == null
        ? null
        : LatestPoint.fromMap(map['latestPoint']);
  }

  @override
  Map toMap() {
    Map map = super.toMap();
    map['entityName'] = this.entityName;
    map['limitSpeed'] = this.limitSpeed;
    map['latestPoint'] = this.latestPoint?.toMap();
    return map;
  }
}
