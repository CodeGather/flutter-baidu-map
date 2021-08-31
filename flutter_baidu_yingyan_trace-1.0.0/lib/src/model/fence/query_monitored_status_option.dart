import 'package:flutter_baidu_yingyan_trace/src/model/base_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/fence_types.dart';

/// 查询监控对象状态请求参数
class QueryMonitoredStatusOption extends BaseOption {
  /// 围栏编号列表
  /// 设置此属性，则查找监控对象相对于指定围栏的位置关系。
  /// 不设置此属性，则查询监控对象相对于其上所有围栏的位置关系。
  List<int> ?fenceIds;

  /// 监控对象
  /// 必选，轨迹服务中的entity_name。
  /// 支持通过entity列表向围栏添加entity。 每次添加entity上限为100个。
  /// 示例：monitoredPerson =entity_name1,entity_name2,entity_name3 多个entity_name
  /// 使用英文逗号分隔
  String ?monitoredPerson;

  /// 围栏类型（本地围栏、服务端围栏）
  FenceType ?fenceType;

  /// 分页请求索引
  /// 默认值为1。pageIndex与pageSize一起计算从第几条结果返回，代表返回第几页。
  int ?pageIndex;

  /// 分页请求每页返回的条目数
  /// 默认值为100
  int ?pageSize;

  QueryMonitoredStatusOption(
      {required int tag,
      required int serviceId,
      required this.monitoredPerson,
      required this.fenceType,
      this.fenceIds,
      this.pageIndex: 1,
      this.pageSize: 100})
      : assert(monitoredPerson != null, fenceType != null),
        super(tag: tag, serviceId: serviceId);

  QueryMonitoredStatusOption.fromMap(Map map)
      : assert(map != null),
        super.fromMap(map) {
    if (map['fenceIds'] != null) {
      fenceIds = <int>[];
      map['fenceId'].forEach((e) {
        fenceIds!.add(e as int);
      });
    }
    monitoredPerson = map['monitoredPerson'];
    pageIndex = map['pageIndex'];
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
    map['pageIndex'] = this.pageIndex;
    map['pageSize'] = this.pageSize;
    map['fenceType'] = this.fenceType?.index;
    return map;
  }
}
