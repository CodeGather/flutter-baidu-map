import 'package:flutter_baidu_yingyan_trace/src/model/coord_type.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/common_search_entity_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/search_filter_condition.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/search_sort_by.dart';

/// 查询EntityList请求参数
class EntityListSearchOption extends CommonSearchOption {
  /// 有参构造
  EntityListSearchOption(
      {required int tag,
      required int serviceId,
        required SearchFilterCondition searchFilterCondition,
        required SortBy sortBy,
      CoordType coordType: CoordType.BD09LL,
      int pageIndex: 1,
      int pageSize: 100})
      : super(
            tag: tag,
            serviceId: serviceId,
            searchFilterCondition: searchFilterCondition,
            sortBy: sortBy,
            coordType: coordType,
            pageIndex: pageIndex,
            pageSize: pageSize);

  /// map => EntityListSearchOption
  EntityListSearchOption.fromMap(Map map) : super.fromMap(map);

  @override
  Map toMap() {
    return super.toMap();
  }
}
