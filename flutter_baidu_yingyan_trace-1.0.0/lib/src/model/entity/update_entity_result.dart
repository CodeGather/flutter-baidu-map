import 'package:flutter_baidu_yingyan_trace/src/model/base_result.dart';

/// 更新Entity响应结果
class UpdateEntityResult extends BaseResult {
  UpdateEntityResult(
      {required int tag, required int status, required String message})
      : super(tag: tag, status: status, message: message);

  /// map => UpdateEntityResult
  UpdateEntityResult.fromMap(Map map)
      : assert(map != null,
            'Construct a UpdateEntityResult，The parameter map cannot be null !'),
        super.fromMap(map);

  @override
  Map toMap() {
    return super.toMap();
  }

  @override
  String toString() {
    return "UpdateEntityResult{tag = $tag; status = $status; "
        "message = $message}";
  }
}
