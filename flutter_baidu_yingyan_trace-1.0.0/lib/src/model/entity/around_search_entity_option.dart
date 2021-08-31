import 'package:flutter_baidu_yingyan_trace/src/model/coord_type.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/common_search_entity_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/search_filter_condition.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/search_sort_by.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/lat_lng.dart';

/// 周边搜索：根据圆心半径和筛选条件进行搜索
class AroundSearchEntityOption extends CommonSearchOption {
  /// 圆心经纬度
  LatLng ?center;

  /// 半径，取值范围[1, 5000]
  double ?radius;

  /// 圆心坐标类型，默认值为坐标类型百度经纬度(bd09ll)
  CoordType ?coordTypeInput;

  AroundSearchEntityOption(
      {required int tag,
      required int serviceId,
      required this.center,
      required this.radius,
      this.coordTypeInput: CoordType.BD09LL,
        required SearchFilterCondition searchFilterCondition,
        required SortBy sortBy,
      CoordType coordType: CoordType.BD09LL,
      int pageIndex: 1,
      int pageSize: 100})
      : assert(center != null),
        assert(radius != null),
        super(
            tag: tag,
            serviceId: serviceId,
            searchFilterCondition: searchFilterCondition,
            sortBy: sortBy,
            coordType: coordType,
            pageIndex: pageIndex,
            pageSize: pageSize);

  AroundSearchEntityOption.fromMap(Map map)
      : assert(map != null),
        super.fromMap(map) {
    center = map['center'] == null ? null : LatLng.fromMap(map['center']);
    radius = map['radius'];

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
    map['center'] = this.center?.toMap();
    map['radius'] = this.radius;
    map['coordTypeInput'] = this.coordTypeInput?.index;
    return map;
  }
}
