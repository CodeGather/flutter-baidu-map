import 'package:flutter_baidu_yingyan_trace/src/model/base_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/custom_track_point.dart';

/// 上传单个轨迹点的请求类
class AddCustomTrackPointOption extends BaseOption {
  /// 需要上传的轨迹点
  CustomTrackPoint ?customTrackPoint;

  /// 有参构造
  AddCustomTrackPointOption(
      {required int tag,
      required int serviceId,
      required this.customTrackPoint})
      : super(tag: tag, serviceId: serviceId);

  /// map => AddCustomTrackPointOption
  AddCustomTrackPointOption.fromMap(Map map)
      : assert(map != null,
            'Construct a AddCustomTrackPointOption，The parameter map cannot be null !'),
        super.fromMap(map) {
    customTrackPoint = map['customTrackPoint'] == null
        ? null
        : CustomTrackPoint.fromMap(map['customTrackPoint']);
  }
  @override
  Map toMap() {
    Map map = super.toMap();
    map['customTrackPoint'] = this.customTrackPoint?.toMap();
    return map;
  }
}
