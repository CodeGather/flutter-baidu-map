import 'package:flutter_baidu_yingyan_trace/src/model/base_result.dart';

/// 删除围栏需监控的entity的请求响应结果
class DeleteMonitoredPersonResult extends BaseResult {
  DeleteMonitoredPersonResult.fromMap(Map map)
      : assert(map != null),
        super.fromMap(map) {}

  @override
  Map toMap() {
    return super.toMap();
  }
}
