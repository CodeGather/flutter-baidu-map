import 'package:flutter_baidu_yingyan_trace/src/model/base_result.dart';

/// 查询服务端围栏监控的所有entity响应封装
class QueryListMonitoredPersonResult extends BaseResult {
  /// 查询监控entity的总个数
  int ?totalSize;

  /// 本页返回的entity个数
  int ?size;

  /// entity列表
  List<String> ?monitoredPersons;

  QueryListMonitoredPersonResult.fromMap(Map map)
      : assert(map != null),
        super.fromMap(map) {
    totalSize = map['totalSize'];
    size = map['size'];
    if (map['monitoredPersons'] != null) {
      monitoredPersons = [] as List<String>;
      map['monitoredPersons'].forEach((e) {
        monitoredPersons!.add(e as String);
      });
    }
  }

  @override
  Map toMap() {
    var map = super.toMap();
    map['totalSize'] = this.totalSize;
    map['size'] = this.size;
    map['monitoredPersons'] = this.monitoredPersons?.map((e) => e).toList();
    return map;
  }
}
