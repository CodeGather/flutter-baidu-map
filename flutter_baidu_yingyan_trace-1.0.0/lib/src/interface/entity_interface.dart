import 'package:flutter/foundation.dart';
import 'package:flutter_baidu_yingyan_trace/flutter_baidu_yingyan_trace.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/around_search_entity_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/bound_search_entity_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/delete_entity_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/district_search_entity_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/keyword_search_entity_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/search_entity_list_option.dart';

/// entity终端的相关接口，包括entity的增、删、改、查
abstract class EntityInterface {
  /// 创建Entity终端实体，并赋属性信息
  @required
  Future<bool> addEntity(
      AddEntityOption addEntityOption, EntityCallBack entityCallBack);

  /// 删除Entity终端实体
  @required
  Future<bool> deleteEntity(
      DeleteEntityOption deleteEntityOption, EntityCallBack entityCallBack);

  /// 更新Entity终端实体属性信息
  @required
  Future<bool> updateEntity(
      UpdateEntityOption updateEntityOption, EntityCallBack entityCallBack);

  /// 检索符合过滤条件的Entity终端实体，返回Entity属性信息和最新位置;
  /// 可用于列出Entity，也可用于批量查询多个Entity的位置。
  @required
  Future<bool> queryEntityList(EntityListSearchOption entityListSearchOption,
      EntityCallBack entityCallBack);

  /// 根据关键字搜索Entity终端实体，并返回实时位置。
  @required
  Future<bool> keyWordSearchEntity(
      KeyWordSearchEntityOption keyWordSearchEntityOption,
      EntityCallBack entityCallBack);

  ///  根据矩形地理范围搜索Entity终端实体，并返回实时位置
  @required
  Future<bool> boundSearchEntity(
      BoundSearchEntityOption boundSearchEntityOption,
      EntityCallBack entityCallBack);

  /// 根据圆心半径搜索Entity终端实体，并返回实时位置
  @required
  Future<bool> aroundSearchEntity(
      AroundSearchEntityOption aroundSearchEntityOption,
      EntityCallBack entityCallBack);

  /// 在多边形区域内搜索Entity终端实体，并返回实时位置
  @required
  Future<bool> polygonSearchEntity(
      PolygonSearchEntityOption polygonSearchEntityOption,
      EntityCallBack entityCallBack);

  /// 在行政区域内搜索Entity终端实体，并返回实时位置
  @required
  Future<bool> districtSearchEntity(
      DistrictSearchEntityOption districtSearchEntityOption,
      EntityCallBack entityCallBack);
}
