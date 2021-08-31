import 'package:flutter_baidu_yingyan_trace/src/model/track/track_types.dart';

/// 查询Track时的纠偏选项
class QueryTrackProcessOption {
  /// 纠偏时是否需要去噪，TRUE代表去噪
  bool ?denoise;

  /// 纠偏时是否需要抽稀，TRUE代表抽稀。
  /// 该选项只有在查询行程信息的请求QueryHistoryTrackOption中有效。
  /// 在QueryTrackLatestPointOption和QueryTrackDistanceOption中的processOption选项中设置此属性没有效果。
  bool ?vacuate;

  /// 纠偏时是否需要绑路，TRUE代表绑路
  bool ?mapMatch;

  /// 纠偏时的定位精度过滤阀值，用于过滤掉定位精度较差的轨迹点。
  /// 0代表不过滤，100代表过滤掉定位精度大于100米的轨迹点。
  /// 例如：若只需保留 GPS 定位点，则建议设为：20；若需保留 GPS 和 Wi-Fi 定位点，去除基站定位点，则建议设为：100
  int ?radiusThreshold;

  /// 纠偏时的交通方式，鹰眼将根据不同交通工具选择不同的纠偏策略
  TrackProcessOptionTransportMode ?transportMode;

  /// 有参构造
  QueryTrackProcessOption(
      {this.denoise,
      this.vacuate,
      this.mapMatch,
      this.radiusThreshold,
      this.transportMode});

  /// map => QueryTrackProcessOption
  QueryTrackProcessOption.fromMap(Map map)
      : assert(map != null,
            'Construct a QueryTrackProcessOption，The parameter map cannot be null !') {
    denoise = map['denoise'];
    vacuate = map['vacuate'];
    mapMatch = map['mapMatch'];
    radiusThreshold = map['radiusThreshold'];
    transportMode = map['transportMode'] == null
        ? null
        : TrackProcessOptionTransportMode.values[map['transportMode'] as int];
  }

  /// QueryTrackProcessOption => map
  Map toMap() {
    return {
      'denoise': this.denoise,
      'vacuate': this.vacuate,
      'mapMatch': this.mapMatch,
      'radiusThreshold': this.radiusThreshold,
      'transportMode': this.transportMode?.index
    };
  }
}
