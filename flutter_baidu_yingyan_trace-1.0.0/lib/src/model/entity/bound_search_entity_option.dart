import 'package:flutter_baidu_yingyan_trace/src/model/coord_type.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/common_search_entity_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/search_filter_condition.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/search_sort_by.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/lat_lng.dart';

/// 矩形搜索：根据矩形地理范围和筛选条件进行搜索
class BoundSearchEntityOption extends CommonSearchOption {
  /// 矩形区域左下角坐标
  LatLng ?lowerLeft;

  /// 矩形区域右上角
  LatLng ?upperRight;

  /// 矩形坐标类型，默认为百度经纬度
  CoordType ?coordTypeInput;

  BoundSearchEntityOption(
      {required int tag,
      required int serviceId,
      required this.lowerLeft,
      required this.upperRight,
      this.coordTypeInput: CoordType.BD09LL,
        required SearchFilterCondition searchFilterCondition,
        required SortBy sortBy,
      CoordType coordType: CoordType.BD09LL,
      int pageIndex: 1,
      int pageSize: 100})
      : assert(lowerLeft != null),
        assert(upperRight != null),
        super(
            tag: tag,
            serviceId: serviceId,
            searchFilterCondition: searchFilterCondition,
            sortBy: sortBy,
            coordType: coordType,
            pageIndex: pageIndex,
            pageSize: pageSize);

  BoundSearchEntityOption.fromMap(Map map)
      : assert(map != null),
        super.fromMap(map) {
    lowerLeft =
        map['lowerLeft'] == null ? null : LatLng.fromMap(map['lowerLeft']);
    upperRight =
        map['upperRight'] == null ? null : LatLng.fromMap(map['upperRight']);

    if (map['coordTypeInput'] != null) {
      int value = map['coordTypeInput'] as int;
      if (value >= 0 && value <= 2) {
        coordTypeInput = CoordType.values[value];
      }
    }
  }

  @override
  Map toMap() {
    Map map = super.toMap();
    map['lowerLeft'] = this.lowerLeft?.toMap();
    map['upperRight'] = this.upperRight?.toMap();
    map['coordTypeInput'] = this.coordTypeInput?.index;
    return map;
  }
}
