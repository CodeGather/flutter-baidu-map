import 'package:flutter_baidu_yingyan_trace/src/model/fence/fence_alarm_push_info.dart';

/// 推送消息
class PushResult {

  /// 消息类型
  int ?messageType;

  /// 其他消息（开发者自定义消息、系统预留消息）
  String ?message;

  /// 围栏报警推送信息（本地围栏、服务端围栏）
  FenceAlarmPushInfo ?fenceAlarmPushInfo;

  PushResult.fromMap(Map ?map) : assert(map != null) {
    messageType = map!['messageType'];
    message = map['message'];
    fenceAlarmPushInfo = FenceAlarmPushInfo.fromMap(map['fenceAlarmPushInfo']);
  }

  Map toMap() {
    return {
      "messageType": messageType,
      "message": message,
      "fenceAlarmPushInfo": fenceAlarmPushInfo!.toMap()
    };
  }

}