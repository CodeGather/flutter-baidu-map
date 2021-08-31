import 'package:flutter/services.dart';
import '../private/bmf_method_id.dart';

/// 检索channel单例
class BMFSearchChannelFactory {
  static MethodChannel ?_searchChannel;

  static MethodChannel get searchChannel {
    if (_searchChannel == null) {
      _searchChannel = new MethodChannel(BMFSearhConstants.kSearhMethodChannelName);
    }
    return _searchChannel!;
  }
}
