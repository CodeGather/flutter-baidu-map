import 'package:flutter/services.dart';
import '../model/bmf_suggestionsearch_options.dart';
import '../model/bmf_suggestionsearch_result.dart';
import '../private/bmf_method_id.dart';
import '../private/bmf_search_channel_factory.dart';
import '../search/bmf_search_errorcode.dart';

/// sug检索回调闭包
typedef BMFOnGetSuggestionSearchResultCallback = void Function(
    BMFSuggestionSearchResult result, BMFSearchErrorCode errorCode);

/// sug检索调度中心
class BMFSuggestionSearchDispatcher {
  /// sug检索回调闭包
  BMFOnGetSuggestionSearchResultCallback ?_onGetSuggestionSearchCallback;

  /// 无参构造
  BMFSuggestionSearchDispatcher() {
    BMFSearchChannelFactory.searchChannel
        .setMethodCallHandler(_handlerMethodCallback);
  }

  /// 搜索建议检索
  ///
  /// suggestionSearchOption       sug检索信息类
  /// 成功返回ture，否则返回false
  Future<bool> suggestionSearch(
      BMFSuggestionSearchOption suggestionSearchOption) async {
    if (suggestionSearchOption == null) {
      return false;
    }
    bool result = false;
    try {
      Map map = (await BMFSearchChannelFactory.searchChannel.invokeMethod(
          BMFSuggestionSearchMethodID.kSuggestionSearch,
          {
            'suggestionSearchOption': suggestionSearchOption.toMap(),
          } as dynamic)) as Map;
      result = map['result'] as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  /// native - flutter
  Future<dynamic> _handlerMethodCallback(MethodCall call) async {
    if (call.method == BMFSuggestionSearchMethodID.kSuggestionSearch) {
      if (this._onGetSuggestionSearchCallback != null) {
        Map map = call.arguments;
        // print('call.arguments = ${map}');

        BMFSuggestionSearchResult result =
            BMFSuggestionSearchResult.fromMap(map['result']);
        BMFSearchErrorCode errorCode =
            BMFSearchErrorCode.values[map['errorCode'] as int];
        this._onGetSuggestionSearchCallback!(result, errorCode);
      }
    }
  }

  /// sug检索异步回调结果
  void onGetSuggestionSearchCallback(
      BMFOnGetSuggestionSearchResultCallback block) {
    if (block == null) {
      return;
    }
    this._onGetSuggestionSearchCallback = block;
  }
}
