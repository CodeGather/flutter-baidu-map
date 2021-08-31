/// API请求的基类
class BaseOption {
  /// 请求标识 必填
  int ?tag;

  /// 鹰眼服务ID 必填
  int ?serviceId;

  /// 是否取消请求 (android)
  bool ?isCanceled = false;

  /// 有参构造
  BaseOption({required this.tag, required this.serviceId, this.isCanceled})
      : assert(tag != null),
        assert(serviceId != null);

  /// map => BaseOption
  BaseOption.fromMap(Map ?map)
      : assert(map != null, 'Construct a BaseOption，The parameter map cannot be null !') {
    tag = map!['tag'];
    serviceId = map['serviceId'];
    isCanceled = map['isCanceled'];
  }

  /// BaseOption => map
  Map toMap() {
    return {
      "tag": this.tag,
      "serviceId": this.serviceId,
      "isCanceled": this.isCanceled,
    };
  }
}
