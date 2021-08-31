import 'package:flutter_baidu_yingyan_trace/src/model/base_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/coord_type.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/search_filter_condition.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/search_sort_by.dart';

/// entity搜索接口通用请求参数
class CommonSearchOption extends BaseOption {
  /// 过滤条件
  SearchFilterCondition ?searchFilterCondition;

  /// 排序方法，该字段在查询EntityList(EntityListRequest)时无效
  SortBy ?sortBy;

  /// 返回结果的坐标类型，默认为百度经纬度
  CoordType ?coordType;

  /// 分页索引，默认值为1
  int ?pageIndex;

  /// 分页大小，默认值为100
  int ?pageSize;

  CommonSearchOption(
      {required int tag,
      required int serviceId,
      this.searchFilterCondition,
      this.sortBy,
      this.coordType: CoordType.BD09LL,
      this.pageIndex: 1,
      this.pageSize: 100})
      : super(tag: tag, serviceId: serviceId);

  CommonSearchOption.fromMap(Map map)
      : assert(map != null),
        super.fromMap(map) {
    searchFilterCondition = map['searchFilterCondition'] == null
        ? null
        : SearchFilterCondition.fromMap(map['searchFilterCondition']);
    sortBy = map['sortBy'] == null ? null : SortBy.fromMap(map['sortBy']);

    if (map['coordType'] != null) {
      int value = map['coordType'] as int;
      if (value >= 0 && value <= 2) {
        coordType = CoordType.values[value];
      }
    }
    pageIndex = map['pageIndex'];
    pageSize = map['pageSize'];
  }

  @override
  Map toMap() {
    Map map = super.toMap();
    map['searchFilterCondition'] = this.searchFilterCondition?.toMap();
    map['sortBy'] = this.sortBy?.toMap();
    map['coordType'] = this.coordType?.index;
    map['pageIndex'] = this.pageIndex;
    map['pageSize'] = this.pageSize;
    return map;
  }

  @override
  String toString() {
    return 'CommonSearchOption{tag: $tag, servicedId: '
        '$serviceId, searchFilterCondition: '
        '$searchFilterCondition, sortBy: $sortBy, coordType: $coordType, '
        'pageIndex: $pageIndex, pageSize: $pageSize}';
  }
}
