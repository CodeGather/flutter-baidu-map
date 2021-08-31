import 'package:flutter_baidu_yingyan_trace/src/model/base_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/fence_types.dart';

/// 删除围栏信息请求类
class DeleteFenceOption extends BaseOption {
  /// 围栏类型 （必传）
  FenceType ?fenceType;

  /// 要删除的地理围栏所监控的对象
  /// 可选。
  /// fenceIDs与monitoredObject共同决定了将被删除的地理围栏实体，规则如下：
  /// 若fenceIDs与monitoredObject同时设置，会删除指定的ID列表中，被监控对象为monitoredObject的地理围栏；
  /// 若设置了fenceIDs，但是没有设置monitoredObject，则会删除指定的ID列表对应的地理围栏；
  /// 若设置了monitoredObject，但是没有设置fenceIDs，则会删除所有被监控对象为monitoredObject的地理围栏；
  /// 若fenceIDs与monitoredObject都没有设置，则会删除所有的地理围栏。
  String ?monitoredPerson;

  /// 要删除的地理围栏的ID数组，若为null或空数组则删除监控对象上的所有地理围栏（必传）
  List<int> fenceIds;

  /// 构建删除本地围栏请求对象
  DeleteFenceOption.deleteLocalFenceOption(
      {required int tag,
      required int serviceId,
      required this.fenceIds,
      this.monitoredPerson})
      : assert(fenceIds != null),
        super(tag: tag, serviceId: serviceId) {
    fenceType = FenceType.local;
  }

  /// 构建删除服务端围栏请求对象
  DeleteFenceOption.deleteServerFenceOption(
      {required int tag,
      required int serviceId,
      required this.fenceIds,
      this.monitoredPerson})
      : assert(fenceIds != null),
        super(tag: tag, serviceId: serviceId) {
    fenceType = FenceType.server;
  }

  @override
  Map toMap() {
    Map map = super.toMap();
    map['fenceIds'] = this.fenceIds.map((e) => e).toList();
    map['monitoredPerson'] = this.monitoredPerson;
    map['fenceType'] = this.fenceType?.index;
    return map;
  }
}
