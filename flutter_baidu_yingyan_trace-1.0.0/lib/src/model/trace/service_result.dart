import 'package:flutter_baidu_yingyan_trace/src/model/base_result.dart';

/// 轨迹服务运行需要的基础信息类(iOS)
class ServiceResult extends BaseResult {

  /// map => ServiceResult
  ServiceResult.fromMap(Map map)
      : assert(map != null,
            'Construct a ServiceOption，The parameter map cannot be null !'),
        super.fromMap(map) {
  }

  /// ServiceResult => map
  @override
  Map toMap() {
    return super.toMap();
  }
}
