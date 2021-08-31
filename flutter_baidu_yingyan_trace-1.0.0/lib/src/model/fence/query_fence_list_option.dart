import 'package:flutter_baidu_yingyan_trace/src/model/base_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/coord_type.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/fence_types.dart';

/// 查询围栏请求
class QueryFenceListOption extends BaseOption {
  /// 围栏编号列表
  /// 要查询的地理围栏的ID数组，若为null或空数组则查询所有客户端地理围栏
  List<String> ?fenceIds;

  /// 监控对象
  /// 必选，轨迹服务中的entity_name。
  /// 支持通过entity列表向围栏添加entity。 每次添加entity上限为100个。
  /// 示例：monitoredPerson =entity_name1,entity_name2,entity_name3 多个entity_name
  /// 使用英文逗号分隔
  String ?monitoredPerson;

  /// 围栏类型（本地围栏、服务端围栏）
  /// 必选
  FenceType ?fenceType;

  /// 返回结果的坐标类型，默认为百度经纬度（暂只支持服务端围栏）
  CoordType ?coordTypeOutput;

  /// 分页请求索引 （暂只支持服务端围栏）
  /// 默认值为1。pageIndex与pageSize一起计算从第几条结果返回，代表返回第几页。
  int ?pageIndex;

  /// 分页请求每页返回的条目数 （暂只支持服务端围栏）
  /// 默认值为100
  int ?pageSize;

  QueryFenceListOption(
      {required int tag,
      required int serviceId,
      required this.monitoredPerson,
      required this.fenceType,
      this.fenceIds,
      this.coordTypeOutput: CoordType.BD09LL,
      this.pageIndex: 1,
      this.pageSize: 100})
      : assert(monitoredPerson != null),
        super(tag: tag, serviceId: serviceId);

  QueryFenceListOption.fromMap(Map map)
      : assert(map != null),
        super.fromMap(map) {
    if (map['fenceIds'] != null) {
      fenceIds = <String>[];
      map['fenceId'].forEach((e) {
        fenceIds!.add(e as String);
      });
    }
    monitoredPerson = map['monitoredPerson'];
    pageIndex = map['pageIndex'];
    pageSize = map['pageSize'];
    fenceType = map['fenceType'] == null
        ? null
        : FenceType.values[map['fenceType'] as int];

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
    map['pageIndex'] = this.pageIndex;
    map['pageSize'] = this.pageSize;
    map['fenceType'] = this.fenceType?.index;
    map['coordTypeOutput'] = this.coordTypeOutput?.index;
    return map;
  }
}
