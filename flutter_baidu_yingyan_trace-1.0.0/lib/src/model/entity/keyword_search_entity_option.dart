import 'package:flutter_baidu_yingyan_trace/src/model/coord_type.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/common_search_entity_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/search_filter_condition.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/search_sort_by.dart';

/// 搜索entity：根据关键字及过滤条件进行搜索
class KeyWordSearchEntityOption extends CommonSearchOption {
  /// 搜索关键字，目前仅支持模糊检索entityName和entityDesc字段， keyword为空时检索全部
  String ?keyword;

  KeyWordSearchEntityOption(
      {required int tag,
      required int serviceId,
      required this.keyword,
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

  KeyWordSearchEntityOption.fromMap(Map map)
      : assert(map != null),
        super.fromMap(map) {
    keyword = map['keyword'];
  }

  @override
  Map toMap() {
    Map map = super.toMap();
    map['keyword'] = this.keyword;
    return map;
  }
}
