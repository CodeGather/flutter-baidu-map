import 'package:flutter/services.dart';
import '../model/bmf_recommendstopsearch_options.dart';

import '../model/bmf_recommendstopsearch_reslut.dart';
import '../private/bmf_method_id.dart';
import '../search/bmf_search_errorcode.dart';
import '../private/bmf_search_channel_factory.dart';

/// 推荐上车点回调闭包
typedef BMFOnGetRecommendStopSearchResultCallback = void Function(
    BMFRecommendStopSearchResult result, BMFSearchErrorCode errorCode);

class BMFRecommendStopSearchDispatcher {
  /// 推荐上车点回调闭包
  BMFOnGetRecommendStopSearchResultCallback ?_onGetRecommendStopSearchCallback;

  BMFRecommendStopSearchDispatcher() {
    BMFSearchChannelFactory.searchChannel
        .setMethodCallHandler(_handlerMethodCallback);
  }

  Future<bool> recommendStopSearch(
      BMFRecommendStopSearchOption recommendStopSearchOption) async {
    if (recommendStopSearchOption == null) {
      return false;
    }
    bool result = false;
    try {
      Map map = (await BMFSearchChannelFactory.searchChannel.invokeMethod(
          BMFRecommendStopSearchMethodID.kRecommendStopSearch,
          {
            'recommendStopSearchOption': recommendStopSearchOption.toMap(),
          } as dynamic)) as Map;
      result = map['result'] as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  /// native - flutter
  Future<dynamic> _handlerMethodCallback(MethodCall call) async {
    if (call.method == BMFRecommendStopSearchMethodID.kRecommendStopSearch) {
      if (this._onGetRecommendStopSearchCallback != null) {
        Map map = call.arguments;
        // print('call.arguments = ${map}');

        BMFRecommendStopSearchResult result =
            BMFRecommendStopSearchResult.fromMap(map['result']);
        BMFSearchErrorCode errorCode =
            BMFSearchErrorCode.values[map['errorCode'] as int];
        this._onGetRecommendStopSearchCallback!(result, errorCode);
      }
    }
  }

  /// 推荐上车点检索异步回调结果
  void onGetRecommendStopSearchCallback(
      BMFOnGetRecommendStopSearchResultCallback block) {
    if (block == null) {
      return;
    }
    this._onGetRecommendStopSearchCallback = block;
  }
}
