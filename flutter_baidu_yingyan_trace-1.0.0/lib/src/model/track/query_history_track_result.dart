import 'package:flutter_baidu_yingyan_trace/src/model/base_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/point.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/track_point.dart';

/// 查询历史轨迹响应结果
class QueryHistoryTrackResult extends BaseResult {
  /// 忽略掉pageIndex，pageSize后的轨迹点数量
  int ?totalSize;

  /// 返回结果条数
  int ?size;

  /// entity标识
  String ?entityName;

  /// 此段轨迹的里程数，单位：米
  double ?distance;

  /// 此段轨迹的收费里程数，单位：米
  double ?tollDistance;

  /// 起点信息
  Point ?startPoint;

  /// 终点信息
  Point ?endPoint;

  /// 轨迹点列表
  List<TrackPoint> ?trackPoints;

  /// 低速里程
  ///
  /// 请求参数中填写了lowSpeedThreshold，则返回该字段，否则不返回
  /// 代表速度低于low_speed_threshold的轨迹里程
  double ?lowSpeedDistance;

  /// map => QueryHistoryTrackResult
  QueryHistoryTrackResult.fromMap(Map map)
      : assert(map != null,
            'Construct a QueryHistoryTrackResult，The parameter map cannot be null !'),
        super.fromMap(map) {
    entityName = map['entityName'];
    totalSize = map['totalSize'];
    size = map['size'];
    distance = map['distance'];
    tollDistance = map['tollDistance'];
    lowSpeedDistance = map['lowSpeedDistance'];
    if (map['startPoint'] != null) {
      startPoint = Point.fromMap(map['startPoint']);
    }
    if (map['endPoint'] != null) {
      endPoint = Point.fromMap(map['endPoint']);
    }
    if (map['trackPoints'] != null) {
      trackPoints = <TrackPoint>[];
      map['trackPoints'].forEach((e) {
        trackPoints!.add(TrackPoint.fromMap(e as Map));
      });
    }
  }

  @override
  Map toMap() {
    Map map = super.toMap();
    map['entityName'] = this.entityName;
    map['totalSize'] = this.totalSize;
    map['size'] = this.size;
    map['distance'] = this.distance;
    map['tollDistance'] = this.tollDistance;
    map['lowSpeedDistance'] = this.lowSpeedDistance;
    map['startPoint'] = this.startPoint?.toMap();
    map['endPoint'] = this.endPoint?.toMap();
    map['trackPoints'] = this.trackPoints?.map((e) => e.toMap()).toList();
    return map;
  }
}
