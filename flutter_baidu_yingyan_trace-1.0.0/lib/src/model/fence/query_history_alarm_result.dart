import 'package:flutter_baidu_yingyan_trace/src/model/base_result.dart';

import 'fence_alarm_info.dart';
import 'fence_types.dart';

/// 查询围栏历史报警响应结果
class QueryHistoryAlarmResult extends BaseResult {
  /// 本次查询总报警数
  int ?totalSize;

  /// 本页返回的结果条数
  int ?size;

  /// 围栏类型
  FenceType ?fenceType;

  /// 监控对象历史报警列表
  List<FenceAlarmInfo> ?fenceAlarmInfos;

  QueryHistoryAlarmResult.fromMap(Map map)
      : assert(map != null),
        super.fromMap(map) {
    totalSize = map['totalSize'];
    size = map['size'];
    fenceType = map['fenceType'] == null
        ? null
        : FenceType.values[map['fenceType'] as int];
    if (map['fenceAlarmInfos'] != null) {
      fenceAlarmInfos = <FenceAlarmInfo>[];
      map['fenceAlarmInfos'].forEach((e) {
        fenceAlarmInfos!.add(FenceAlarmInfo.fromMap(e as Map));
      });
    }
  }

  @override
  Map toMap() {
    Map map = super.toMap();
    map['totalSize'] = this.totalSize;
    map['size'] = this.size;
    map['fenceType'] = this.fenceType?.index;
    map['fenceAlarmInfos'] =
        this.fenceAlarmInfos?.map((e) => e.toMap()).toList();
    return map;
  }
}
