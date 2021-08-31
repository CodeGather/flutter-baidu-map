/// 轨迹服务运行需要的基础信息类(iOS)
class ServiceOption {
  ///  AK
  /// 填写你在API控制台申请的iOS类型的AK
  String ?ak;

  /// mcode
  /// 填写你在API控制台申请iOS类型AK时指定的Bundle Identifier
  String ?mcode;

  /// 轨迹服务的ID
  /// 填写你在鹰眼轨迹管理台创建的鹰眼服务对应的ID
  int ?serviceId;

  /// 是否保活
  bool ?keepAlive;

  /// 有参构造
  ServiceOption(
      {required this.ak,
      required this.mcode,
      required this.serviceId,
      required this.keepAlive});

  /// map => ServiceOption
  ServiceOption.fromMap(Map map)
      : assert(map != null,
            'Construct a ServiceOption，The parameter map cannot be null !') {
    ak = map['ak'];
    mcode = map['mcode'];
    serviceId = map['serviceId'];
    keepAlive = map['keepAlive'];
  }

  /// ServiceOption => map
  Map toMap() {
    return {
      'ak': this.ak,
      'mcode': this.mcode,
      'serviceId': this.serviceId,
      'keepAlive': this.keepAlive
    };
  }
}
