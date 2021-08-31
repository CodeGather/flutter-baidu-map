/// 鹰眼返回基础数据model
class BaseResult {
  /// 请求标识
  int ?tag;

  /// 状态码
  int ?status;

  /// 状态消息
  String ?message;

  BaseResult(
      {required this.tag, this.status, this.message});

  /// map => BaseResult
  BaseResult.fromMap(Map ?map)
      : assert(map != null,
            'Construct a BaseResult，The parameter map cannot be null !') {
    tag = map!['tag'];
    status = map['status'];
    message = map['message'];
  }

  /// BaseResult => map
  Map toMap() {
    return {
      "tag": this.tag,
      "status": this.status,
      "message": this.message,
    };
  }
}
