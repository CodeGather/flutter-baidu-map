import 'package:flutter_baidu_yingyan_trace/src/model/base_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/coord_type.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/fence_types.dart';

/// 查询围栏历史报警请求参数
class QueryHistoryAlarmOption extends BaseOption {
  /// 开始时间
  int ?startTime;

  /// 结束时间
  int ?endTime;

  /// 围栏编号列表
  /// 若设置此属性，则查找监控对象触发指定的围栏的历史报警。
  /// 若不设置此属性，则查询监控对象上的所有客户端地理围栏的历史报警
  List<int> ?fenceIds;

  /// 监控对象
  /// 必选，轨迹服务中的entity_name。
  /// 支持通过entity列表向围栏添加entity。 每次添加entity上限为100个。
  /// 示例：monitoredPerson =entity_name1,entity_name2,entity_name3 多个entity_name
  /// 使用英文逗号分隔
  String ?monitoredPerson;

  /// 返回结果的坐标类型，默认为百度经纬度（暂只支持服务端围栏）
  CoordType ?coordTypeOutput;

  /// 围栏类型（本地围栏、服务端围栏）
  FenceType ?fenceType;

  QueryHistoryAlarmOption(
      {required int tag,
      required int serviceId,
      required this.monitoredPerson,
      required this.fenceType,
      this.fenceIds,
      this.coordTypeOutput: CoordType.BD09LL})
      : assert(monitoredPerson != null),
        super(tag: tag, serviceId: serviceId);

  QueryHistoryAlarmOption.fromMap(Map map)
      : assert(map != null),
        super.fromMap(map) {
    if (map['fenceIds'] != null) {
      fenceIds = <int>[];
      map['fenceIds'].forEach((e) {
        fenceIds!.add(e as int);
      });
    }
    startTime = map['startTime'];
    endTime = map['endTime'];
    monitoredPerson = map['monitoredPerson'];
    fenceType = FenceType.values[map['fenceType'] as int];
    if (map['coordTypeOutput'] != null) {
      int value = map['coordTypeOutput'] as int;
      if (value >= 0 && value <= 2) {
        coordTypeOutput = CoordType.values[value];
      }
    }
  }

  @override
  Map toMap() {
    Map map = super.toMap();
    map['fenceIds'] = this.fenceIds?.map((e) => e)?.toList();
    map['monitoredPerson'] = this.monitoredPerson;
    map['startTime'] = this.startTime;
    map['endTime'] = this.endTime;
    map['fenceType'] = this.fenceType?.index;
    map['coordTypeOutput'] = this.coordTypeOutput?.index;
    return map;
  }
}
