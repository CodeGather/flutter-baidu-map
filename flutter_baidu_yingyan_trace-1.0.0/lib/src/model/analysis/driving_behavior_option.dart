import 'package:flutter_baidu_yingyan_trace/src/model/base_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/coord_type.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/query_track_process_option.dart';

/// 驾驶行为分析的请求信息类
class DrivingBehaviourAnalysisOption extends BaseOption {
  /// 需要查询的entity的名称，必填，必须为非空字符串。
  String ?entityName;

  /// 开始时间，必选。
  int ?startTime;

  /// 结束时间，必选。
  int ?endTime;

  /// 固定限速值，可选。
  /// 若设置为非0值，则以设置的数值为阈值，轨迹点速度超过该值则认为是超速；
  /// 若不设置，或设置为0，则根据百度地图道路限速数据计算超速点。
  double ?speedingThreshold;

  /// 自定义轨迹分析时需要的阈值，可选。
  /// 若为null，则使用默认的阈值，若设置，则使用指定的各阈值进行轨迹分析。
  DrivingBehaviorThresholdOption ?thresholdOption;

  /// 纠偏选项，用于控制返回坐标的纠偏处理方式。
  /// 在驾驶行为分析方法中，只有其中的mapMatch和transportMode有效。
  /// 可选。若不设置或为null，则采用默认值。不绑路、交通方式为驾车。
  QueryTrackProcessOption ?processOption;

  /// 返回的坐标类型，可选。
  /// 该字段用于控制返回结果中的坐标类型。可选值为：
  /// CoordType.WGS84: GPS全球卫星定位系统使用的坐标系
  /// CoordType.GCJ02：国测局加密坐标
  /// CoordType.BD09LL：百度经纬度坐标
  /// 该参数仅对国内（包含港、澳、台）轨迹有效，海外区域轨迹均返回 wgs84坐标系
  CoordType ?outputCoordType;

  /// 有参构造
  DrivingBehaviourAnalysisOption(
      {required int tag,
      required int serviceId,
      required this.entityName,
      required this.startTime,
      required this.endTime,
      this.speedingThreshold,
      this.thresholdOption,
      this.processOption,
      this.outputCoordType: CoordType.BD09LL})
      : super(tag: tag, serviceId: serviceId);

  /// map => DrivingBehaviourAnalysisOption
  DrivingBehaviourAnalysisOption.fromMap(Map map)
      : assert(map != null,
            'Construct a DrivingBehaviourAnalysisOption，The parameter map cannot be null !'),
        super.fromMap(map) {
    entityName = map['entityName'];
    startTime = map['startTime'];
    endTime = map['endTime'];
    speedingThreshold = map['speedingThreshold'];
    thresholdOption = map['thresholdOption'] == null
        ? null
        : DrivingBehaviorThresholdOption.fromMap(map['thresholdOption']);
    processOption = map['processOption'] == null
        ? null
        : QueryTrackProcessOption.fromMap(map['processOption']);

    if (map['outputCoordType'] != null) {
      int value = map['outputCoordType'] as int;
      if (value >= 0 && value <= 2) {
        outputCoordType = CoordType.values[value];
      }
    }
  }
  @override
  Map toMap() {
    Map map = super.toMap();
    map['entityName'] = this.entityName;
    map['startTime'] = this.startTime;
    map['endTime'] = this.endTime;
    map['speedingThreshold'] = this.speedingThreshold;
    map['thresholdOption'] = this.thresholdOption?.toMap();
    map['processOption'] = this.processOption?.toMap();
    map['outputCoordType'] = this.outputCoordType?.index;
    return map;
  }
}

/// 轨迹分析时需要的阈值，各阈值均有默认值。
class DrivingBehaviorThresholdOption {
  /// 固定限速值，可选。
  /// 若设置为非0值，则以设置的数值为阈值，轨迹点速度超过该值则认为是超速；
  /// 若不设置，或设置为0，则根据百度地图道路限速数据计算超速点。
  double ?speedingThreshold;

  /// 急加速的水平加速度阈值。
  /// 单位：m^2/s，默认值：1.67，仅支持正数
  double ?harshAccelerationThreshold;

  /// 急减速的水平加速度阈值。
  /// 单位：m^2/s，默认值：-1.67，仅支持负数
  double ?harshBreakingThreshold;

  /// 急转弯的向心加速度阈值。
  /// 单位：m^2/s，默认值：5，仅支持正数
  double ?harshSteeringThreshold;

  /// 有参构造
  DrivingBehaviorThresholdOption(
      {this.speedingThreshold,
      this.harshAccelerationThreshold: 1.67,
      this.harshBreakingThreshold: -1.67,
      this.harshSteeringThreshold: 5.0});

  /// map => DrivingBehaviorThresholdOption
  DrivingBehaviorThresholdOption.fromMap(Map map)
      : assert(map != null,
            'Construct a DrivingBehaviorThresholdOption，The parameter map cannot be null !') {
    speedingThreshold = map['speedingThreshold'];
    harshAccelerationThreshold = map['harshAccelerationThreshold'];
    harshBreakingThreshold = map['harshBreakingThreshold'];
    harshSteeringThreshold = map['harshSteeringThreshold'];
  }

  /// DrivingBehaviorThresholdOption => map
  Map toMap() {
    return {
      'speedingThreshold': this.speedingThreshold,
      'harshAccelerationThreshold': this.harshAccelerationThreshold,
      'harshBreakingThreshold': this.harshBreakingThreshold,
      'harshSteeringThreshold': this.harshSteeringThreshold
    };
  }
}
