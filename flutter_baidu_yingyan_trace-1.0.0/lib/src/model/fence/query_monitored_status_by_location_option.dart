import 'package:flutter_baidu_yingyan_trace/src/model/base_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/coord_type.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/fence_types.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/lat_lng.dart';

/// 查询指定位置监控对象的状态
class QueryMonitoredStatusByLocationOption extends BaseOption {
  /// 围栏编号列表
  /// 若为null或空数组，则查询指定坐标位置相对该监控对象上的所有服务端地理围栏的位置关系。
  List<int> ?fenceIds;

  /// 监控对象
  /// 必选，轨迹服务中的entity_name。
  /// 支持通过entity列表向围栏添加entity。 每次添加entity上限为100个。
  /// 示例：monitoredPerson =entity_name1,entity_name2,entity_name3 多个entity_name
  /// 使用英文逗号分隔
  String ?monitoredPerson;

  /// 指定位置坐标
  LatLng ?latLng;

  /// 坐标类型
  CoordType ?coordType;

  /// 围栏类型（本地围栏、服务端围栏）
  FenceType ?fenceType;

  /// 分页请求索引
  /// 默认值为1。pageIndex与pageSize一起计算从第几条结果返回，代表返回第几页。
  int ?pageIndex;

  /// 分页请求每页返回的条目数
  /// 默认值为100
  int ?pageSize;

  QueryMonitoredStatusByLocationOption(
      {required int tag,
      required int serviceId,
      required this.monitoredPerson,
      required this.fenceType,
      required this.latLng,
      this.fenceIds,
      this.coordType: CoordType.BD09LL,
      this.pageIndex: 1,
      this.pageSize: 100})
      : assert(monitoredPerson != null),
        super(tag: tag, serviceId: serviceId);

  QueryMonitoredStatusByLocationOption.fromMap(Map map)
      : assert(map != null),
        super.fromMap(map) {
    if (map['fenceIds'] != null) {
      fenceIds = <int>[];
      map['fenceIds'].forEach((e) {
        fenceIds!.add(e as int);
      });
    }
    monitoredPerson = map['monitoredPerson'];
    latLng =
        map['latLng'] == null ? null : LatLng.fromMap(map['latLng'] as Map);
    pageIndex = map['pageIndex'];

    if (map['coordType'] != null) {
      int value = map['coordType'] as int;
      if (value >= 0 && value <= 2) {
        coordType = CoordType.values[value];
      }
    }
    pageSize = map['pageSize'];
    fenceType = map['fenceType'] == null
        ? null
        : FenceType.values[map['fenceType'] as int];
  }

  @override
  Map toMap() {
    Map map = super.toMap();
    map['fenceIds'] = this.fenceIds?.map((e) => e).toList();
    map['monitoredPerson'] = this.monitoredPerson;
    map['latLng'] = this.latLng?.toMap();
    map['coordType'] = this.coordType?.index;
    map['pageIndex'] = this.pageIndex;
    map['pageSize'] = this.pageSize;
    map['fenceType'] = this.fenceType?.index;
    return map;
  }
}
