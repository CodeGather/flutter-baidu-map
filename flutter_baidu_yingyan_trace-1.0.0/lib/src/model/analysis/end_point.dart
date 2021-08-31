import 'package:flutter_baidu_yingyan_trace/src/model/point.dart';

/// 终点信息
class EndPoint extends Point {
  /// 地址信息
  String ?address;

  EndPoint.fromMap(Map map)
      : assert(map != null),
        super.fromMap(map) {
    address = map['address'];
  }

  @override
  Map toMap() {
    Map map = super.toMap();
    map['address'] = this.address;
    return map;
  }
}
