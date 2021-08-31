import 'package:flutter_baidu_yingyan_trace/src/model/base_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/track_point.dart';

/// 批量上传多个开发者自定义的轨迹点的请求类
class AddCustomTrackPointsOption extends BaseOption {
  /// 需要批量上传的轨迹点数组，数组中每一项为CustomTrackPoint类型。
  Map<String, List<TrackPoint>> ?customTrackPoints;

  /// 有参构造
  AddCustomTrackPointsOption({required int tag,
    required int serviceId,
    required this.customTrackPoints})
      : super(tag: tag, serviceId: serviceId);

  /// map => AddCustomTrackPointsOption
  AddCustomTrackPointsOption.fromMap(Map map)
      : assert(map != null,
  'Construct a AddCustomTrackPointsOption，The parameter map cannot be null !'),
        super.fromMap(map) {
    if (map['customTrackPoints'] != null) {
      customTrackPoints = Map<String, List<TrackPoint>>();
      Map<String, dynamic>.from(map['customTrackPoints']).forEach((key, value) {
        List<TrackPoint> list =[] as List<TrackPoint>;
        [value as List].forEach((element) {
          list.add(TrackPoint.fromMap(element as Map));
        });
        customTrackPoints!.putIfAbsent(key, () => list);
      });
    }
  }

  @override
  Map toMap() {
    Map map = super.toMap();
    map['customTrackPoints'] =
        this.customTrackPoints?.map((key, value) {
          return MapEntry(key, value.map((e) => e.toMap()).toList());
        });
    return map;
  }
}
