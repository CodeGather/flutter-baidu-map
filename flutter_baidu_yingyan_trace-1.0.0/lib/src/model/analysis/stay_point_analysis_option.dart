import 'package:flutter_baidu_yingyan_trace/src/model/base_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/coord_type.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/query_track_process_option.dart';

/// 停留点分析的请求信息类
class StayPointAnalysisOption extends BaseOption {
  ///  需要查询的entity的名称，必填，必须为非空字符串。
  String ?entityName;

  /// 开始时间，必选。
  int ?startTime;

  /// 结束时间，必选。
  int ?endTime;

  /// 停留时间，可选。
  /// 单位：秒，默认值：600。
  /// 该字段用于设置停留点判断规则，即若系统判断在半径为stay_radius的圆形范围内停留时间超过stay_time，则被认为是一次停留。
  int ?stayTime;

  /// 停留半径，可选。
  /// 单位：米，取值范围：[1,500]，默认值：20。
  /// 该字段用于设置停留点判断规则，即若系统判断在半径为stay_radius的圆形范围内停留时间超过stay_time，则被认为是一次停留。
  int ?stayRadius;

  /// 纠偏选项，用于控制返回坐标的纠偏处理方式。
  /// 在停留点分析方法中，只有其中的mapMatch和transportMode有效。
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
  StayPointAnalysisOption(
      {required int tag,
      required int serviceId,
      required this.entityName,
      required this.startTime,
      required this.endTime,
      this.stayRadius: 20,
      this.processOption,
      this.outputCoordType: CoordType.BD09LL})
      : super(tag: tag, serviceId: serviceId);

  /// map => StayPointAnalysisOption
  StayPointAnalysisOption.fromMap(Map ?map)
      : assert(map != null, 'Construct a StayPointAnalysisOption，The parameter map cannot be null !'),
        super.fromMap(map!) {
    entityName = map['entityName'];
    startTime = map['startTime'];
    endTime = map['endTime'];
    stayRadius = map['stayRadius'];
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
    map['stayRadius'] = this.stayRadius;
    map['processOption'] = this.processOption?.toMap();
    map['outputCoordType'] = this.outputCoordType?.index;
    return map;
  }
}
