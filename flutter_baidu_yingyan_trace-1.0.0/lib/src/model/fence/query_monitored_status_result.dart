import 'package:flutter_baidu_yingyan_trace/src/model/base_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/fence_types.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/monitored_status_info.dart';

/// 查询监控对象状态响应结果
class QueryMonitoredStatusResult extends BaseResult {
  /// 所有结果条数（忽略pageIndex，pageSize后的本次查询总围栏个数）
  int ?totalSize;

  /// 当前请求页返回的结果条数
  int ?size;

  /// 围栏类型
  FenceType ?fenceType;

  /// 监控状态信息列表
  List<MonitoredStatusInfo> ?monitoredStatusInfos;

  QueryMonitoredStatusResult.fromMap(Map map)
      : assert(map != null),
        super.fromMap(map) {
    totalSize = map['totalSize'];
    size = map['size'];
    fenceType = map['fenceType'] == null
        ? null
        : FenceType.values[map['fenceType'] as int];
    if (map['monitoredStatusInfos'] != null) {
      monitoredStatusInfos = <MonitoredStatusInfo>[];
      map['monitoredStatusInfos'].forEach((e) {
        monitoredStatusInfos!.add(MonitoredStatusInfo.fromMap(e as Map));
      });
    }
  }

  @override
  Map toMap() {
    Map map = super.toMap();
    map['totalSize'] = this.totalSize;
    map['size'] = this.size;
    map['fenceType'] = this.fenceType?.index;
    map['monitoredStatusInfos'] =
        this.monitoredStatusInfos?.map((e) => e.toMap()).toList();

    return map;
  }
}
