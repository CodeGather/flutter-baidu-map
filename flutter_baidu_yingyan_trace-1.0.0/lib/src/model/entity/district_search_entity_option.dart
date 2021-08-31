import 'package:flutter_baidu_yingyan_trace/src/model/coord_type.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/common_search_entity_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/entity_types.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/search_filter_condition.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/search_sort_by.dart';

/// 行政区搜索：搜索中国范围内，国家、省、市、区/县中的entity
class DistrictSearchEntityOption extends CommonSearchOption {
  /// 行政区划关键字
  String ?keyword;

  /// 设置返回值的内容，默认值为ReturnType.all
  ReturnType ?returnType = ReturnType.all;

  DistrictSearchEntityOption(
      {required int tag,
      required int serviceId,
      required this.keyword,
      this.returnType,
        required SearchFilterCondition searchFilterCondition,
        required SortBy sortBy,
      CoordType coordType: CoordType.BD09LL,
      int pageIndex: 1,
      int pageSize: 100})
      : assert(keyword != null),
        super(
            tag: tag,
            serviceId: serviceId,
            searchFilterCondition: searchFilterCondition,
            sortBy: sortBy,
            coordType: coordType,
            pageIndex: pageIndex,
            pageSize: pageSize);

  DistrictSearchEntityOption.fromMap(Map map)
      : assert(map != null),
        super.fromMap(map) {
    keyword = map['keyword'];
    returnType = map['returnType'] == null
        ? null
        : ReturnType.values[map['returnType'] as int];
  }

  @override
  Map toMap() {
    Map map = super.toMap();
    map['keyword'] = this.keyword;
    map['returnType'] = this.returnType?.index;
    return map;
  }
}
