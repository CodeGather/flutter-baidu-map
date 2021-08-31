import 'package:flutter_baidu_yingyan_trace/src/model/base_option.dart';

/// 查询客户端缓存的轨迹数据的请求信息类
class QueryTrackCacheInfoOption extends BaseOption {
  /// 将轨迹点所属的entity，作为过滤缓存查询的条件。最终查询结果为所有过滤条件的交集。
  /// 类型为数组，选填。
  /// 若设置，则查询指定entity的缓存数据；
  /// 若不设置或设置为null或为空数组，则查询所有缓存数据。
  List<String> ?entityNames;

  /// 将轨迹点的定位时间戳，作为过滤缓存查询的条件。最终查询结果为所有过滤条件的交集。
  /// 查询指定时间段内缓存的轨迹，时间段起点的UNIX时间戳，选填
  /// 若单独指定startTime，不指定endTime，则查询startTime至当前的缓存轨迹
  int ?startTime;

  /// 将轨迹点的定位时间戳，作为过滤缓存查询的条件。最终查询结果为所有过滤条件的交集。
  /// 查询指定时间段内缓存的轨迹，时间段终点的UNIX时间戳，选填
  /// 如果设置endTime，则endTime必须大于startTime
  /// 若单独指定endTime，不指定startTime，则查询endTime之前的所有缓存轨迹
  int ?endTime;

  /// 是否返回每个entity的缓存轨迹的里程，选填，默认为false。
  /// 若设置为true，则返回的缓存信息中，包含该entity的所有缓存轨迹的里程信息；
  /// 若不设置，或设置为false，则返回的缓存信息中，不包括里程信息。
  bool ?needDistance;

  /// 精度过滤阈值，单位：米
  /// 当缓存的轨迹点的定位精度超过此阈值时，此点不参与离线里程计算
  double ?distanceFilter;

  /// 有参构造
  QueryTrackCacheInfoOption(
      {required int tag,
      required int serviceId,
      this.entityNames,
      this.startTime,
      this.endTime,
      this.needDistance: false,
      this.distanceFilter})
      : super(tag: tag, serviceId: serviceId);

  /// map => QueryTrackCacheInfoOption
  QueryTrackCacheInfoOption.fromMap(Map map)
      : assert(map != null,
            'Construct a QueryTrackCacheInfoOption，The parameter map cannot be null !'),
        super.fromMap(map) {
    if (map['entityNames'] != null) {
      entityNames = [] as List<String>;
      map['entityNames'].forEach((e) {
        entityNames!.add(e);
      });
    }
    startTime = map['startTime'];
    endTime = map['endTime'];
    needDistance = map['needDistance'];
    distanceFilter = map['distanceFilter'];
  }

  @override
  Map toMap() {
    Map map = super.toMap();
    map['entityNames'] = this.entityNames?.map((e) => e)?.toList();
    map['startTime'] = this.startTime;
    map['endTime'] = this.endTime;
    map['needDistance'] = this.needDistance;
    map['distanceFilter'] = this.distanceFilter;
    return map;
  }
}
