import 'package:flutter/foundation.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/location/location_option.dart';

/// 定位相关接口
abstract class LocationInterface {
  /// 鹰眼SDK定位权限申请
  @required
  Future<bool> requestLocalPermission();

  /// 配置定位参数
  @required
  Future<bool> configLocationInfo(LocationOption locationOption);
}
