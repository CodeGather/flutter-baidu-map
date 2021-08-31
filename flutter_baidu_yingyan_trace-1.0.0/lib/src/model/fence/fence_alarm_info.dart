import 'package:flutter_baidu_yingyan_trace/src/model/fence/fence_alarm_push_info.dart';

/// 围栏报警信息（封装查询围栏历史报警时返回的报警信息）
class FenceAlarmInfo extends FenceAlarmPushInfo {

  FenceAlarmInfo.fromMap(Map map)
      : assert(map != null),
        super.fromMap(map);

  @override
  Map toMap() {
    return super.toMap();
  }
}