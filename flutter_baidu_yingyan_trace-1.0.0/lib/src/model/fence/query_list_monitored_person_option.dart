import 'package:flutter_baidu_yingyan_trace/src/model/base_option.dart';

/// 查询服务端围栏监控的所有entity请求封装
class QueryListMonitoredPersonOption extends BaseOption {
  /// 围栏的唯一标识
  int ?fenceId;

  /// 分页请求索引
  /// 默认值为1。pageIndex与pageSize一起计算从第几条结果返回，代表返回第几页。
  int ?pageIndex;

  /// 分页请求每页返回的条目数
  /// 默认值为100
  int ?pageSize;

  QueryListMonitoredPersonOption(
      {required int tag,
      required int serviceId,
      required this.fenceId,
      this.pageIndex: 1,
      this.pageSize: 100})
      : assert(fenceId != null),
        super(tag: tag, serviceId: serviceId);

  QueryListMonitoredPersonOption.fromMap(Map map)
      : assert(map != null),
        super.fromMap(map) {
    fenceId = map['fenceId'];
    pageIndex = map['pageIndex'];
    pageSize = map['pageSize'];
  }

  @override
  Map toMap() {
    Map map = super.toMap();
    map['fenceId'] = this.fenceId;
    map['pageIndex'] = this.pageIndex;
    map['pageSize'] = this.pageSize;
    return map;
  }
}
