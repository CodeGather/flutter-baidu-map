import 'package:flutter_baidu_yingyan_trace/src/model/base_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/query_track_process_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/track_types.dart';

/// 查询某entity终端实体，在指定时间段内的行驶里程的请求信息类
class QueryTrackDistanceOption extends BaseOption {
  /// 需要查询的entity的名称，必填，必须为非空字符串
  String ?entityName;

  /// 开始时间 UNIX时间戳，必填。
  int ?startTime;

  /// 结束时间 UNIX时间戳，必填。
  /// 结束时间不能大于当前时间，且起止时间区间不超过24小时。
  int ?endTime;

  /// 是否返回纠偏后的里程，选填。
  /// TRUE代表返回纠偏后的里程，FALSE代表使用原始轨迹计算里程。
  /// 默认值为FALSE。
  bool ?isProcessed;

  /// 纠偏选项，选填。
  /// 若设置此选项，则使用开发者指定的选项进行纠偏。
  /// 如果不设置，或者值为null，将使用默认的纠偏选项：去燥、不绑路、不过滤噪点、交通方式为驾车。
  QueryTrackProcessOption ?processOption;

  /// 里程补偿的方式，选填。
  /// 在里程计算时，两个轨迹点定位时间间隔5分钟以上，被认为是中断。中断轨迹可以进行里程补偿，通过此属性设置里程补偿的方式。
  /// 默认值为TrackProcessOptionSupplementMode.NO_SUPPLEMENT 不进行里程补偿。
  TrackProcessOptionSupplementMode ?supplementMode;

  /// 低速阈值，选填。（单位：千米/小时）
  /// 若填写该值且isProcessed=true时，则返回结果中将增加low_speed_distance字段，表示速度低于该值的里程。
  /// 示例：
  /// lowSpeedThreshold=20，则返回结果中将增加low_speed_distance字段表示此段轨迹中速度低于20千米/小时的里程，可用于网约车行业中计算低速里程。
  double ?lowSpeedThreshold;

  /// 有参构造
  QueryTrackDistanceOption(
      {required int tag,
      required int serviceId,
      required this.entityName,
      required this.startTime,
      required this.endTime,
      this.isProcessed: false,
      this.processOption,
      this.supplementMode: TrackProcessOptionSupplementMode.NO_SUPPLEMENT,
      this.lowSpeedThreshold})
      : super(tag: tag, serviceId: serviceId);

  /// map => QueryTrackDistanceOption
  QueryTrackDistanceOption.fromMap(Map map)
      : assert(map != null,
            'Construct a QueryTrackDistanceOption，The parameter map cannot be null !'),
        super.fromMap(map) {
    entityName = map['entityName'];
    startTime = map['startTime'];
    endTime = map['endTime'];
    isProcessed = map['isProcessed'];
    processOption = map['processOption'] == null
        ? null
        : QueryTrackProcessOption.fromMap(map['processOption']);
    supplementMode = map['supplementMode'] == null
        ? null
        : TrackProcessOptionSupplementMode.values[map['supplementMode'] as int];
    lowSpeedThreshold = map['lowSpeedThreshold'];
  }

  @override
  Map toMap() {
    Map map = super.toMap();
    map['entityName'] = this.entityName;
    map['startTime'] = this.startTime;
    map['endTime'] = this.endTime;
    map['isProcessed'] = this.isProcessed;
    map['processOption'] = this.processOption?.toMap();
    map['supplementMode'] = this.supplementMode?.index;
    map['lowSpeedThreshold'] = this.lowSpeedThreshold;
    return map;
  }
}
