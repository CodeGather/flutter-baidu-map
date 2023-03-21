import 'package:flutter_baidu_yingyan_trace/src/model/base_option.dart';

/// 清空客户端缓存的轨迹数据的请求信息类
class ClearTrackCacheOption extends BaseOption {
  /// 要删除缓存轨迹的entityNames，默认为null。
  /// entityNames为null时，表示清除所有缓存轨迹数据，不区分entityName；
  ///
  /// 注：entityNames与cacheTrackInfos不能同时设置，
  /// 若同时设置，则以cacheTrackInfos为准；
  /// 若两者存在某一为null，某一不为null的情况，则以不为null的为准。
  /// (android)
  List<String>? entityNames;

  ///  需要清空的缓存数据的筛选条件数组，选填。
  ///  数组中每个option用于指定一个筛选条件，类型为TrackCacheOption。
  /// 若设置，则清空符合条件的缓存数据；
  /// 若不设置或设置为null或为空数组，则清空所有的缓存数据。
  List<TrackCacheOption>? trackCacheOptions;

  /// 有参构造
  ClearTrackCacheOption({
    required int tag,
    required int serviceId,
    required this.entityNames,
    this.trackCacheOptions,
  }) : super(tag: tag, serviceId: serviceId);

  /// map => ClearTrackCacheOption
  ClearTrackCacheOption.fromMap(Map map)
      : assert(map != null, // ignore: unnecessary_null_comparison
  'Construct a ClearTrackCacheOption，The parameter map cannot be null !'),
        super.fromMap(map) {
    if (map['trackCacheOptions'] != null) {
      trackCacheOptions = [];
      map['trackCacheOptions'].forEach((e) {
        trackCacheOptions!.add(TrackCacheOption.fromMap(e));
      });
    }
    if (map['entityNames'] != null) {
      entityNames = [];
      map['entityNames'].forEach((e) {
        entityNames!.add(e as String);
      });
    }
  }

  @override
  Map toMap() {
    Map map = super.toMap();
    map['trackCacheOptions'] =
        this.trackCacheOptions?.map((e) => e.toMap()).toList();
    return map;
  }
}

///  删除客户端缓存的轨迹数据时的筛选条件
///  删除客户端缓存的轨迹数据时的筛选条件，每个筛选条件用于指定某个需要删除的entity所符合的特征。
/// 若指定startTime和endTime，则删除指定entity在该时间段内的缓存；
/// 若不指定，则删除指定entity的所有缓存数据。
class TrackCacheOption {
  /// 需要删除哪个entity的缓存数据，必选。
  late String entityName;

  /// 所属entity对应的缓存数据量。(android)
  int? total;

  /// 需要删除的缓存的开始时间，可选。
  int? startTime;

  /// 需要删除的缓存的结束时间，可选。
  int? endTime;

  /// 缓存轨迹的距离，单位：米 (android)
  double? cacheDistance;

  /// 有参构造
  TrackCacheOption({
    required this.entityName,
    required this.total,
    this.startTime,
    this.endTime,
    this.cacheDistance,
  });

  /// map => TrackCacheOption
  TrackCacheOption.fromMap(Map map)
      : assert(map != null, // ignore: unnecessary_null_comparison
  'Construct a TrackCacheOption，The parameter map cannot be null !') {
    entityName = map['entityName'];
    total = map['total'];
    startTime = map['startTime'];
    endTime = map['endTime'];
    cacheDistance = map['cacheDistance'];
  }

  /// TrackCacheOption => map
  Map toMap() {
    return {
      'entityName': this.entityName,
      'total': this.total,
      'startTime': this.startTime,
      'endTime': this.endTime,
      'cacheDistance': this.cacheDistance
    };
  }
}
