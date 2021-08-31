import 'package:flutter_baidu_yingyan_trace/src/model/base_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/entity_info.dart';

/// entity搜索接口通用响应结果
class CommonSearchResult extends BaseResult {
  /// 本次检索总结果条数
  int ?totalSize;

  /// 本页返回的结果条数
  int ?size;

  /// entity详细信息列表
  List<EntityInfo> ?entities;

  CommonSearchResult.fromMap(Map map)
      : assert(map != null),
        super.fromMap(map) {
    totalSize = map['totalSize'];
    size = map['size'];
    if (map['entities'] != null) {
      entities = [] as List<EntityInfo>;
      map['entities'].forEach((e) {
        entities!.add(EntityInfo.fromMap(e as Map));
      });
    }
  }

  @override
  Map toMap() {
    Map map = super.toMap();
    map['totalSize'] = this.totalSize;
    map['size'] = this.size;
    map['entities'] = this.entities?.map((e) => e.toMap()).toList();
    return map;
  }

  @override
  String toString() {
    return 'CommonSearchResult{totalSize: $totalSize, size: $size, entities: $entities}';
  }
}
