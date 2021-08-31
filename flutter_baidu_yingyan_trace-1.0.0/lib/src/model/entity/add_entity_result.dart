import 'package:flutter_baidu_yingyan_trace/src/model/base_result.dart';

/// 创建Entity响应结果
class AddEntityResult extends BaseResult {
  AddEntityResult({required int tag, required int status, required String message})
      : super(tag: tag, status: status, message: message);

  /// map => AddEntityResult
  AddEntityResult.fromMap(Map map)
      : assert(map != null,
            'Construct a AddEntityResult，The parameter map cannot be null !'),
        super.fromMap(map);

  @override
  Map toMap() {
    return super.toMap();
  }

  @override
  String toString() {
    return "AddEntityResult{tag = $tag; status = $status; message = $message}";
  }
}
