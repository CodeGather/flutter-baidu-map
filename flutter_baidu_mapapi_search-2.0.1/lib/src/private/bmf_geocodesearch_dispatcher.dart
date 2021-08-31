import 'package:flutter/services.dart';
import '../model/bmf_geocodesearch_options.dart';
import '../model/bmf_geocodesearch_result.dart';
import '../private/bmf_method_id.dart'
    show BMFGeoAndReverseGeoMethodID;
import '../private/bmf_search_channel_factory.dart';
import '../search/bmf_search_errorcode.dart';

/// 正地理编码闭包
typedef BMFOnGetGeoCodeResultCallback = void Function(
    BMFGeoCodeSearchResult result, BMFSearchErrorCode errorCode);

/// 逆地理编码闭包
typedef BMFOnGetReverseGeoCodeResultCallback = void Function(
    BMFReverseGeoCodeSearchResult result, BMFSearchErrorCode errorCode);

/// 地理编码调度中心
class BMFGeocodeSearchDispatcher {
  /// 地理编码回调结果闭包
  BMFOnGetGeoCodeResultCallback ?_onGetGeoCodeCallback;

  /// 无参构造
  BMFGeocodeSearchDispatcher() {
    BMFSearchChannelFactory.searchChannel
        .setMethodCallHandler(_handlerMethodCallback);
  }

  /// 根据地址名称获取地理信息
  ///
  /// geoCodeSearchOption geo检索信息类
  /// 成功返回true，否则返回false
  Future<bool> geoCodeSearch(BMFGeoCodeSearchOption geoCodeSearchOption) async {
    if (geoCodeSearchOption == null) {
      return false;
    }
    bool result=false;
    try {
      Map map = (await BMFSearchChannelFactory.searchChannel.invokeMethod(
          BMFGeoAndReverseGeoMethodID.kGeoCode,
          {
            'geoCodeSearchOption': geoCodeSearchOption.toMap(),
          } as dynamic)) as Map;
      result = map['result'] as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  /// native - flutter
  Future<dynamic> _handlerMethodCallback(MethodCall call) async {
    if (call.method == BMFGeoAndReverseGeoMethodID.kGeoCode) {
      if (this._onGetGeoCodeCallback != null) {
        Map map = call.arguments;
        print('${call.arguments}');
        BMFGeoCodeSearchResult result =
            BMFGeoCodeSearchResult.fromMap(map['result']);
        BMFSearchErrorCode errorCode =
            BMFSearchErrorCode.values[map['errorCode'] as int];
        this._onGetGeoCodeCallback!(result, errorCode);
      }
    }
  }

  /// 正地理编码异步回调结果
  void onGetGeoCodeSearchCallback(BMFOnGetGeoCodeResultCallback block) {
    if (block == null) {
      return;
    }
    this._onGetGeoCodeCallback = block;
  }
}

/// 反编码调度中心
class BMFReverseGeoCodeSearchDispatcher {
  /// 逆地理编码回调结果闭包
  BMFOnGetReverseGeoCodeResultCallback ?_onGetReverseGeoCodeCallback;

  /// 无参构造
  BMFReverseGeoCodeSearchDispatcher() {
    BMFSearchChannelFactory.searchChannel
        .setMethodCallHandler(_handlerMethodCallback);
  }

  /// 根据地理坐标获取地址信息
  ///
  /// reverseGeoCodeOption 反geo检索信息类
  /// 成功返回true，否则返回false
  Future<bool> reverseGeoCodeSearch(
      BMFReverseGeoCodeSearchOption reverseGeoCodeSearchOption) async {
    if (reverseGeoCodeSearchOption == null) {
      return false;
    }
    bool result=false;
    try {
      Map map = (await BMFSearchChannelFactory.searchChannel.invokeMethod(
          BMFGeoAndReverseGeoMethodID.kReverseGeoCode,
          {
            'reverseGeoCodeSearchOption': reverseGeoCodeSearchOption.toMap(),
          } as dynamic)) as Map;
      result = map['result'] as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  /// native - flutter
  Future<dynamic> _handlerMethodCallback(MethodCall call) async {
    if (call.method == BMFGeoAndReverseGeoMethodID.kReverseGeoCode) {
      if (this._onGetReverseGeoCodeCallback != null) {
        Map map = call.arguments;
        BMFReverseGeoCodeSearchResult result =
            BMFReverseGeoCodeSearchResult.fromMap(map['result']);
        BMFSearchErrorCode errorCode =
            BMFSearchErrorCode.values[map['errorCode'] as int];
        this._onGetReverseGeoCodeCallback!(result, errorCode);
      }
    }
  }

  /// 逆地理编码异步回调结果
  void onGetReverseGeoCodeSearchCallback(
      BMFOnGetReverseGeoCodeResultCallback block) {
    if (block == null) {
      return;
    }
    this._onGetReverseGeoCodeCallback = block;
  }
}
