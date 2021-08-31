import 'package:flutter_baidu_yingyan_trace/src/model/base_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/coord_type.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/query_track_process_option.dart';

/// 查询某entity终端实体的实时位置的请求信息类
class QueryTrackLatestPointOption extends BaseOption {
  /// 需要查询的entity的名称，必填，必须为非空字符串。
  String ?entityName;

  /// 纠偏选项，选填。
  /// 若设置此选项，则使用开发者指定的选项进行纠偏。
  /// 如果不设置，或者值为null，将使用默认的纠偏选项：去燥、不绑路、不过滤噪点、交通方式为驾车。
  QueryTrackProcessOption ?processOption;

  /// 返回的坐标类型，选填。
  /// 该字段用于控制返回结果中的坐标类型。
  /// 只允许设置为百度经纬度或者国测局经纬度。
  /// 该参数仅对国内（包含港、澳、台）轨迹有效，海外区域轨迹均返回 wgs84坐标系。
  CoordType ?outputCoordType;

  /// 有参构造
  QueryTrackLatestPointOption(
      {required int tag,
      required int serviceId,
      required this.entityName,
      this.processOption,
      this.outputCoordType: CoordType.BD09LL})
      : super(tag: tag, serviceId: serviceId);

  /// map => QueryTrackLatestPointOption
  QueryTrackLatestPointOption.fromMap(Map map)
      : assert(map != null,
            'Construct a QueryTrackLatestPointOption，The parameter map cannot be null !'),
        super.fromMap(map) {
    entityName = map['entityName'];
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
    map['processOption'] = this.processOption?.toMap();
    map['outputCoordType'] = this.outputCoordType?.index;
    return map;
  }
}
