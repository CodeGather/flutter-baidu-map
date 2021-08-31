import 'package:flutter_baidu_yingyan_trace/src/model/fence/fence_types.dart';

/// 监控状态信息（封装查询监控对象状态时返回的状态信息）
class MonitoredStatusInfo {
  /// 围栏编号
  int ?fenceId;

  /// 监控状态
  MonitoredStatus ?monitoredStatus;

  MonitoredStatusInfo.fromMap(Map map) : assert(map != null) {
    fenceId = map['fenceId'];
    monitoredStatus = map['monitoredStatus'] == null
        ? null
        : MonitoredStatus.values[map['monitoredStatus'] as int];
  }

  Map toMap() {
    return {
      "fenceId": this.fenceId,
      "monitoredStatus": this.monitoredStatus?.index,
    };
  }
}
