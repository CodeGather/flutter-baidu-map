import '../model/bmf_suggestionsearch_options.dart';
import '../model/bmf_suggestionsearch_result.dart';
import '../private/bmf_suggestionsearch_dispatcher.dart';
import '../search/bmf_search_errorcode.dart';

/// sug搜索服务
class BMFSuggestionSearch {
  /// sug搜索服务实例
  BMFSuggestionSearchDispatcher ?_suggestionSearchDispatcher;

  /// 无参构造
  BMFSuggestionSearch() {
    _suggestionSearchDispatcher = BMFSuggestionSearchDispatcher();
  }

  /// sug检索
  /// onGetSuggestSearchResult 通知sug检索结果BMFSuggestionSearchResult
  /// suggestionSearchOption   sug检索信息类
  /// 成功返回true，否则返回false
  Future<bool> suggestionSearch(
      BMFSuggestionSearchOption suggestionSearchOption) async {
    return await _suggestionSearchDispatcher!.suggestionSearch(suggestionSearchOption);
  }

  /// sug检索异步回调结果
  void onGetSuggestSearchResult(
      {required
          void Function(BMFSuggestionSearchResult result,
                  BMFSearchErrorCode errorCode)
              callback}) {
    _suggestionSearchDispatcher?.onGetSuggestionSearchCallback(callback);
  }
}
