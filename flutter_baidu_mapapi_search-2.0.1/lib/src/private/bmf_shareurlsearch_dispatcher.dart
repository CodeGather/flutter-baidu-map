import 'package:flutter/services.dart';
import '../model/bmf_shareurlsearch_options.dart';
import '../model/bmf_shareurlsearch_result.dart';
import '../private/bmf_method_id.dart';
import '../private/bmf_search_channel_factory.dart';
import '../search/bmf_search_errorcode.dart';

/// 短串分享回调结果闭包
typedef BMFOnGetShareURLResultCallback = void Function(
    BMFShareURLResult result, BMFSearchErrorCode errorCode);

/// 短串检索调度中心
class BMFShareurlSearchDispatcher {
  /// poi详情短串分享url回调结果闭包
  BMFOnGetShareURLResultCallback ?_onGetPoiDetailShareURLCallback;

  /// 反geo短串分享url回调结果闭包
  BMFOnGetShareURLResultCallback ?_onGetReverseGeoShareURLCallback;

  /// 路线规划短串分享url回调结果闭包
  BMFOnGetShareURLResultCallback ?_onGetRoutePlanShareURLCallback;

  /// 无参构造
  BMFShareurlSearchDispatcher() {
    BMFSearchChannelFactory.searchChannel
        .setMethodCallHandler(_handlerMethodCallback);
  }

  /// 获取poi详情短串分享url
  ///
  /// poiDetailShareUrlSearchOption poi详情短串分享检索信息类
  /// 请求发送成功返回true，否则返回false
  Future<bool> poiDetailShareUrlSearchDispatcher(
      BMFPoiDetailShareURLOption poiDetailShareURLOption) async {
    if (poiDetailShareURLOption == null) {
      return false;
    }
    bool result = false;
    try {
      Map map = (await BMFSearchChannelFactory.searchChannel.invokeMethod(
          BMFShareURLSearchMethodID.kRequestPoiDetailShareURL,
          {
            'poiDetailShareURLOption': poiDetailShareURLOption.toMap(),
          } as dynamic)) as Map;
      result = map['result'];
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  /// 获取反geo短串分享url
  ///
  /// reverseGeoShareUrlSearchOption 反geo短串分享检索信息类
  /// 请求发送成功返回true，否则返回false
  Future<bool> reverseGeoShareUrlSearchDispatcher(
      BMFReverseGeoShareURLOption reverseGeoShareURLOption) async {
    if (reverseGeoShareURLOption == null) {
      return false;
    }
    bool result = false;
    try {
      Map map = (await BMFSearchChannelFactory.searchChannel.invokeMethod(
          BMFShareURLSearchMethodID.kRequestLocationShareURL,
          {
            'reverseGeoShareURLOption': reverseGeoShareURLOption.toMap(),
          } as dynamic)) as Map;
      result = map['result'];
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  /// 获取路线规划短串分享url
  ///
  /// routePlanShareUrlSearchOption 取路线规划短串分享检索信息类
  /// 请求发送成功返回true，否则返回false
  Future<bool> routePlanShareUrlSearchDispatcher(
      BMFRoutePlanShareURLOption routePlanShareURLOption) async {
    if (routePlanShareURLOption == null) {
      return false;
    }
    bool result = false;
    try {
      Map map = (await BMFSearchChannelFactory.searchChannel.invokeMethod(
          BMFShareURLSearchMethodID.kRequestRoutePlanShareURL,
          {
            'routePlanShareURLOption': routePlanShareURLOption.toMap(),
          } as dynamic)) as Map;
      result = map['result'];
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  /// native - flutter
  Future<dynamic> _handlerMethodCallback(MethodCall call) async {
    // print('call.arguments = ${call.arguments}');
    switch (call.method) {
      case BMFShareURLSearchMethodID.kRequestPoiDetailShareURL:
        if (this._onGetPoiDetailShareURLCallback != null) {
          Map map = call.arguments;
          BMFShareURLResult result = BMFShareURLResult.fromMap(map['result']);
          BMFSearchErrorCode errorCode =
              BMFSearchErrorCode.values[map['errorCode'] as int];
          this._onGetPoiDetailShareURLCallback!(result, errorCode);
        }
        break;
      case BMFShareURLSearchMethodID.kRequestLocationShareURL:
        if (this._onGetReverseGeoShareURLCallback != null) {
          Map map = call.arguments;
          BMFShareURLResult result = BMFShareURLResult.fromMap(map['result']);
          BMFSearchErrorCode errorCode =
              BMFSearchErrorCode.values[map['errorCode'] as int];
          this._onGetReverseGeoShareURLCallback!(result, errorCode);
        }
        break;
      case BMFShareURLSearchMethodID.kRequestRoutePlanShareURL:
        if (this._onGetRoutePlanShareURLCallback != null) {
          Map map = call.arguments;
          BMFShareURLResult result = BMFShareURLResult.fromMap(map['result']);
          BMFSearchErrorCode errorCode =
              BMFSearchErrorCode.values[map['errorCode'] as int];
          this._onGetRoutePlanShareURLCallback!(result, errorCode);
        }
        break;
      default:
    }
  }

  /// poi详情短串分享url回调结果
  void onGetPoiDetailShareURLResultCallback(
      BMFOnGetShareURLResultCallback block) {
    if (block == null) {
      return;
    }
    this._onGetPoiDetailShareURLCallback = block;
  }

  /// 反geo短串分享url回调结果
  void onGetReverseGeoShareURLResultCallback(
      BMFOnGetShareURLResultCallback block) {
    if (block == null) {
      return;
    }
    this._onGetReverseGeoShareURLCallback = block;
  }

  /// 路线规划短串分享url回调结果闭包
  void onGetRoutePlanShareURLResultCallback(
      BMFOnGetShareURLResultCallback block) {
    if (block == null) {
      return;
    }
    this._onGetRoutePlanShareURLCallback = block;
  }
}
