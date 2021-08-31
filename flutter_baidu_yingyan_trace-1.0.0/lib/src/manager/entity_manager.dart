import 'package:flutter_baidu_yingyan_trace/src/callback/entity_callback.dart';
import 'package:flutter_baidu_yingyan_trace/src/manager/base_manager.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/add_entity_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/around_search_entity_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/bound_search_entity_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/delete_entity_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/district_search_entity_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/keyword_search_entity_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/polygon_search_entity_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/real_time_loc_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/search_entity_list_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/update_entity_option.dart';

class EntityManager extends BaseManager {
  static final EntityManager _instance = EntityManager._internal();

  factory EntityManager() => _instance;

  EntityManager._internal();

  Future<bool> addEntity(
      {required AddEntityOption addEntityOption,
      EntityCallBack ?entityCallBack}) async {
    return await baiduYingYanMethodChannel.addEntity(
        addEntityOption, entityCallBack);
  }

  Future<bool> aroundSearchEntity(
      {required AroundSearchEntityOption aroundSearchEntityOption,
      EntityCallBack ?entityCallBack}) async {
    return await baiduYingYanMethodChannel.aroundSearchEntity(
        aroundSearchEntityOption, entityCallBack);
  }

  Future<bool> boundSearchEntity(
      {required BoundSearchEntityOption boundSearchEntityOption,
      EntityCallBack ?entityCallBack}) async {
    return await baiduYingYanMethodChannel.boundSearchEntity(
        boundSearchEntityOption, entityCallBack);
  }

  Future<bool> deleteEntity(
      {required DeleteEntityOption deleteEntityOption,
      EntityCallBack ?entityCallBack}) async {
    return await baiduYingYanMethodChannel.deleteEntity(
        deleteEntityOption, entityCallBack);
  }

  Future<bool> districtSearchEntity(
      {required DistrictSearchEntityOption districtSearchEntityOption,
      EntityCallBack ?entityCallBack}) async {
    return await baiduYingYanMethodChannel.districtSearchEntity(
        districtSearchEntityOption, entityCallBack);
  }

  Future<bool> keyWordSearchEntity(
      {required KeyWordSearchEntityOption keyWordSearchEntityOption,
      EntityCallBack ?entityCallBack}) async {
    return await baiduYingYanMethodChannel.keyWordSearchEntity(
        keyWordSearchEntityOption, entityCallBack);
  }

  Future<bool> polygonSearchEntity(
      {required PolygonSearchEntityOption polygonSearchEntityOption,
      EntityCallBack ?entityCallBack}) async {
    return await baiduYingYanMethodChannel.polygonSearchEntity(
        polygonSearchEntityOption, entityCallBack);
  }

  Future<bool> queryEntityList(
      {required EntityListSearchOption entityListSearchOption,
      EntityCallBack ?entityCallBack}) async {
    return await baiduYingYanMethodChannel.queryEntityList(
        entityListSearchOption, entityCallBack);
  }

  Future<bool> updateEntity(
      {required UpdateEntityOption updateEntityOption,
      EntityCallBack ?entityCallBack}) async {
    return await baiduYingYanMethodChannel.updateEntity(
        updateEntityOption, entityCallBack);
  }

  Future<bool> queryRealTimeLoc(
      {required RealTimeLocationOption realTimeLocationOption,
      EntityCallBack ?entityCallBack}) async {
    if (realTimeLocationOption == null) {
      return false;
    }
    return await this.baiduYingYanMethodChannel.queryRealTimeLoc(
        realTimeLocationOption: realTimeLocationOption,
        entityCallBack: entityCallBack);
  }

  Future<bool> stopRealTimeLoc() async {
    return await baiduYingYanMethodChannel.stopRealTimeLoc();
  }

}
