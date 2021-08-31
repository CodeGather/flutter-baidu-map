import 'package:flutter_baidu_yingyan_trace/flutter_baidu_yingyan_trace.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/around_search_entity_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/bound_search_entity_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/delete_entity_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/district_search_entity_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/keyword_search_entity_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/polygon_search_entity_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/real_time_loc_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/search_entity_list_result.dart';

typedef AddEntityCallBack = void Function(AddEntityResult addEntityResult);
typedef UpdateEntityCallBack = void Function(
    UpdateEntityResult updateEntityResult);
typedef DeleteEntityCallBack = void Function(
    DeleteEntityResult deleteFenceResult);
typedef EntitySearchListCallBack = void Function(
    EntityListSearchResult entityListSearchResult);
typedef KeyWordSearchEntityCallBack = void Function(
    KeyWordSearchEntityResult keyWordSearchEntityResult);
typedef BoundSearchEntityCallBack = void Function(
    BoundSearchEntityResult boundSearchEntityResult);
typedef AroundSearchEntityCallBack = void Function(
    AroundSearchEntityResult aroundSearchEntityResult);
typedef PolygonSearchEntityCallBack = void Function(
    PolygonSearchEntityResult polygonSearchEntityResult);
typedef DistrictSearchEntityCallBack = void Function(
    DistrictSearchEntityResult districtSearchEntityResult);

typedef QueryRealTimeLocationCallBack = void Function(
    RealTimeLocationResult realTimeLocationResult);

class EntityCallBack {

  /// 添加Entity事件
  AddEntityCallBack ?onAddEntityCallBack;
  /// 更新Entity事件
  UpdateEntityCallBack ?onUpdateEntityCallBack;
  /// 删除Entity事件
  DeleteEntityCallBack ?onDeleteEntityCallBack;
  /// 检索Entity List事件
  EntitySearchListCallBack ?onEntitySearchListCallBack;
  /// 关键字检索Entity事件
  KeyWordSearchEntityCallBack ?onKeyWordSearchEntityCallBack;
  /// 矩形检索Entity事件
  BoundSearchEntityCallBack ?onBoundSearchEntityCallBack;
  /// 周边检索Entity事件
  AroundSearchEntityCallBack ?onAroundSearchEntityCallBack;
  /// 多边形检索Entity事件
  PolygonSearchEntityCallBack ?onPolygonSearchEntityCallBack;
  /// 行政区域检索Entity事件
  DistrictSearchEntityCallBack ?onDistrictSearchEntityCallBack;

  /// 实时定位回调事件
  QueryRealTimeLocationCallBack ?onQueryRealTimeLocationCallBack;

  EntityCallBack({
    this.onAddEntityCallBack,
    this.onUpdateEntityCallBack,
    this.onDeleteEntityCallBack,
    this.onEntitySearchListCallBack,
    this.onKeyWordSearchEntityCallBack,
    this.onBoundSearchEntityCallBack,
    this.onAroundSearchEntityCallBack,
    this.onPolygonSearchEntityCallBack,
    this.onDistrictSearchEntityCallBack,
    this.onQueryRealTimeLocationCallBack,
  });

}