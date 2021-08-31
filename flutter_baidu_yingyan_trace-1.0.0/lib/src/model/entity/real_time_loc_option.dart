import 'package:flutter_baidu_yingyan_trace/src/model/base_option.dart';

/// 定位请求
class RealTimeLocationOption extends BaseOption {

  RealTimeLocationOption({
    required int tag,
    required int serviceId
  }) : super(tag: tag, serviceId: serviceId);

  RealTimeLocationOption.fromMap(Map map) : assert(map != null), super.fromMap(map);

  @override
  Map toMap() {
    return super.toMap();
  }

}