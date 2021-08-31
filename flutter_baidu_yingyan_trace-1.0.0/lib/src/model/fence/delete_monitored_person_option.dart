import 'package:flutter_baidu_yingyan_trace/src/model/base_option.dart';

/// 删除围栏所监控的entity请求封装
class DeleteMonitoredPersonOption extends BaseOption {
  /// 围栏的唯一标识
  int ?fenceId;

  /// 需要添加的监控对象的名称数组，必选。
  /// 数组中每一项代表一个被监控对象的名称
  List<String> ?monitoredPersons;

  DeleteMonitoredPersonOption({
    required int tag,
    required int serviceId,
    required this.fenceId,
    required this.monitoredPersons,
  })  : assert(fenceId != null),
        assert(monitoredPersons != null),
        super(tag: tag, serviceId: serviceId);

  DeleteMonitoredPersonOption.fromMap(Map map)
      : assert(map != null),
        super.fromMap(map) {
    fenceId = map['fenceId'];
    if (map['monitoredPersons'] != null) {
      monitoredPersons = [] as List<String>;
      map['monitoredPersons'].forEach((e) {
        monitoredPersons!.add(e as String);
      });
    }
  }

  @override
  Map toMap() {
    Map map = super.toMap();
    map['fenceId'] = this.fenceId;
    map['monitoredPersons'] = this.monitoredPersons?.map((e) => e)?.toList();
    return map;
  }
}
