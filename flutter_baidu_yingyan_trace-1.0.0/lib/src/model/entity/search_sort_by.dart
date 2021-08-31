import 'package:flutter_baidu_yingyan_trace/src/model/entity/entity_types.dart';

/// 实时位置搜索的排序方法
class SortBy {
  /// 排序字段名称
  String ?fieldName;

  /// 排序规则
  SortType ?sortType;

  /// 有参构造
  SortBy({this.fieldName, this.sortType});

  /// map => SortBy
  SortBy.fromMap(Map map) : assert(map != null) {
    fieldName = map['fieldName'];
    sortType = map['sortType'] == null
        ? null
        : SortType.values[map['sortType'] as int];
  }

  /// SortBy => map
  Map toMap() {
    return {"fieldName": this.fieldName, "sortType": this.sortType?.index};
  }

  @override
  String toString() {
    return 'SortBy{fieldName: $fieldName, sortType: $sortType}';
  }
}
