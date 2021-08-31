import 'package:flutter/services.dart';
import 'package:flutter_baidu_mapapi_base/src/map/bmf_types.dart';

/// 鉴权方法名
const kSetAPIKey = 'flutter_bmfbase/sdk/setApiKey';

/// 地图sdk初始化鉴权
class BMFMapSDK {
  /// 初始化百度地图sdk
  ///
  /// apiKey 百度地图开放平台申请的ak
  /// coordType 坐标类型 目前不支持将全局坐标类型设置为WGS84
  static void setApiKeyAndCoordType(
      String apiKey, BMF_COORD_TYPE coordType) async {
    try {
      await MethodChannel('flutter_bmfbase').invokeMethod(
          kSetAPIKey, {'apiKey': apiKey, 'BMF_COORD_TYPE': coordType.index});
    } on PlatformException catch (e) {
      print(e.toString());
    }
  }

  /// 设置地图坐标类型
  ///
  /// coordType 坐标类型，目前不支持将全局坐标类型设置为WGS84
  static void setCoordType(BMF_COORD_TYPE coordType) async {
    try {
      await MethodChannel('flutter_bmfbase')
          .invokeMethod(kSetAPIKey, {'BMF_COORD_TYPE': coordType.index});
    } on PlatformException catch (e) {
      print(e.toString());
    }
  }
}
