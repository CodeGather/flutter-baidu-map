import 'dart:async';

import 'package:flutter_baidu_yingyan_trace/src/callback/analysis_callback.dart';
import 'package:flutter_baidu_yingyan_trace/src/callback/entity_callback.dart';
import 'package:flutter_baidu_yingyan_trace/src/callback/fence_callback.dart';
import 'package:flutter_baidu_yingyan_trace/src/callback/trace_callback.dart';
import 'package:flutter_baidu_yingyan_trace/src/callback/track_callback.dart';
import 'package:flutter_baidu_yingyan_trace/src/event/event.dart';
import 'package:flutter_baidu_yingyan_trace/src/manager/analysis_manager.dart';
import 'package:flutter_baidu_yingyan_trace/src/manager/entity_manager.dart';
import 'package:flutter_baidu_yingyan_trace/src/manager/fence_manager.dart';
import 'package:flutter_baidu_yingyan_trace/src/manager/location_manager.dart';
import 'package:flutter_baidu_yingyan_trace/src/manager/trace_manager.dart';
import 'package:flutter_baidu_yingyan_trace/src/manager/track_manager.dart';
import 'package:flutter_baidu_yingyan_trace/src/method_channel/trace_method_channel.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/analysis/driving_behavior_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/analysis/stay_point_analysis_option.dart';
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
import 'package:flutter_baidu_yingyan_trace/src/model/fence/add_monitored_person_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/create_fence_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/delete_fence_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/delete_monitored_person_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/query_fence_list_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/query_history_alarm_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/query_list_monitored_person_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/query_monitored_status_by_location_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/query_monitored_status_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/update_fence_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/location/location_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/location_mode.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/trace/service_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/trace/trace.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/add_custom_track_point_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/add_custom_track_points_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/clear_track_cache_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/query_history_track_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/query_track_cacheInfo_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/query_track_distance_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/query_track_latest_point_option.dart';

class TraceController {
  static final BaiduYingYanMethodChannel baiduYingYanMethodChannel =
  BaiduYingYanMethodChannel();

  /// 工厂模式
  factory TraceController() => _getInstance();
  static TraceController get shareInstance => _getInstance();
  static TraceController ?_instance;
  TraceController._internal() {
    // 初始化
  }
  static TraceController _getInstance() {
    if (_instance == null) {
      _instance = new TraceController._internal();
    }
    if (baiduYingYanMethodChannel.streamController.isClosed) {
      baiduYingYanMethodChannel.streamController = StreamController<BaseEvent>.broadcast();
    }
    return _instance!;
  }

  static TraceManager get _traceManager => TraceManager();
  static EntityManager get _entityManager => EntityManager();

  static FenceManager get _fenceManager => FenceManager();

  static AnalysisManager get _analysisManager => AnalysisManager();

  static TrackManager get _trackManager => TrackManager();
  static LocationManager get _locationManager => LocationManager();

  ///  ********************* 定位相关接口 *********************

  /// 申请鹰眼SDK定位权限（iOS）适配iOS14
  Future<bool> requestLocalPermission() async {
    return await _locationManager.requestLocalPermission();
  }

  /// 配置定位参数（iOS）
  /// locationOption 定位参数
  Future<bool> configLocationInfo(LocationOption locationOption) async {
    return await _locationManager.configLocationInfo(locationOption);
  }

  ///  ********************* 轨迹服务与采集的相关接口 *********************

  /// 设置SDK运行所需的基础信息，调用任何方法之前都需要先调用此方法
  /// true代表设置成功，false代表设置失败
  /// ios 独有
  Future<bool> configServerInfo(ServiceOption serviceOption) async {
    return await _traceManager.configServerInfo(serviceOption);
  }

  /// 开启轨迹服务
  /// trace (ios 只需要传入entityName参数)
  /// traceCallback  开启轨迹服务回调, StartTraceServiceCallback类型
  Future<bool> startTraceService(
      {required Trace trace, TraceCallback ?traceCallback}) async {
    return await _traceManager.startTraceService(
        trace: trace, traceCallback: traceCallback);
  }

  /// 停止轨迹服务
  /// trace (ios 不需要该参数)
  /// traceCallback 停止轨迹服务回调, StopTraceServiceCallback类型
  Future<bool> stopTraceService(
      {required Trace trace, TraceCallback ?traceCallback}) async {
    return await _traceManager.stopTraceService(
        trace: trace, traceCallback: traceCallback);
  }

  /// 开始采集
  /// traceCallback 开始采集回调, StartGatherCallback类型
  Future<bool> startGather({TraceCallback ?traceCallback}) async {
    return await _traceManager.startGather(traceCallback: traceCallback);
  }

  /// 停止采集
  /// traceCallback 停止采集回调 StopGatherCallback 类型
  Future<bool> stopGather({TraceCallback ?traceCallback}) async {
    return await _traceManager.stopGather(traceCallback: traceCallback);
  }

  /// 打开电池优化
  Future<bool> openBattery() async {
    return await _traceManager.openBattery();
  }

  /// 设置采集周期和打包上传的周期
  /// 采集周期和上传周期的值域均为[2,300]，且上传周期必须是采集周期的整数倍
  /// gatherInterval 采集周期，单位：秒
  /// packInterval 打包上传周期，单位：秒
  /// traceCallback  设置采集周期和打包上传的周期回调, SetIntervalCallback类型
  Future<bool> setInterval(
      {required int gatherInterval,
      required int packInterval,
      TraceCallback ?traceCallback}) async {
    return await _traceManager.setInterval(
        gatherInterval: gatherInterval,
        packInterval: packInterval,
        traceCallback: traceCallback);
  }

  /// 设置SDK缓存所占磁盘空间的最大值。单位：MB。
  /// 如果设置了该阈值，当SDK缓存的数据占用磁盘超过该阈值时，将删除最早的缓存轨迹，直到满足该条件。
  /// 如果对于缓存占用空间没有非常强烈的要求，建议不要调用此方法。否则将会导致缓存轨迹数据被丢弃等情况，且数据无法找回。
  /// size 缓存占用空间的最大值，最小值为50MB。
  /// traceCallback 设置SDK缓存所占磁盘空间的最大值回调， SetCacheSizeCallback类型
  Future<bool> setCacheSize(
      {required int size, TraceCallback ?traceCallback}) async {
    return await _traceManager.setCacheSize(
        size: size, traceCallback: traceCallback);
  }

  /// 添加Entity
  /// 使用要点:
  /// entity标识：可以是一个人、一辆车、或任何一个可以被记录轨迹的对象。在查询任何entity的实时位置、历史轨迹之前，都必须先创建entity。
  ///
  /// columnKey字段用于指定新创建的实体的自定义属性的值。假设有一些物流配送人员需要管理，
  /// 可以设置columnKey字段的值为"region=haidian,gender=male"，即指定新创建的entity的地区属性为海淀区，性别属性为男。
  /// 需要注意的是：这里的region和gender属性必须先通过鹰眼web api的<a href="http://lbsyun.baidu.com/index
  /// .php?title=yingyan/api/entity#addcolumn.E2.80.94.E2.80.94.E6.B7.BB.E5.8A.A0entity.E5.B1.9E
  /// .E6.80.A7.E5.AD.97.E6.AE.B5">entity/addcolumn</a>接口进行添加。
  /// 如果这两个属性是可检索的，调用queryEntityList()方法时，若columnKey字段指定为"gender=male"时，对应的entity就会被检索出来。
  /// 如果不是可检索的，只会作为queryEntityList()方法的结果，不能用来检索。
  ///
  /// 添加Entity有2种途径，一是通过调用addEntity()方法主动添加；
  ///                    二是在实例化Trace时，指定entityName，
  ///                    开启轨迹服务成功后（即调用startTrace()方法，回调接口状态码为：0，消息为：success），
  ///                    服务端会自动创建以entityName命名的entity。
  /// 需要注意的是：服务端自动创建的entity不包含自定义属性的值，若需要指定entity自定义属性的值，需要再调用updateEntity()方法，
  ///             通过columnKey字段指定自定义属性的值。
  ///
  /// @param addEntityOption  请求参数对象
  /// @param listener Entity监听器，对应回调接口为:
  ///                 {@link OnEntityListener#onAddEntityCallback(AddEntityResponse)}
  Future<bool> addEntity(
      {required AddEntityOption addEntityOption,
      EntityCallBack ?entityCallBack}) async {
    return await _entityManager.addEntity(
        addEntityOption: addEntityOption, entityCallBack: entityCallBack);
  }

  /// 更新Entity
  ///
  /// 使用要点:
  /// columnKey字段用于指定需要修改的自定义属性的值，仍以addEntity()中的物流配送场景为例，
  /// 如果将这里的columnKey字段设置为"region=chaoyang"就是将这个entity的地区属性修改为朝阳区。
  /// 此处region必须是已有的属性字段，可以是在addEntity()时创建的属性字段，
  /// 也可以是通过web api的<a href="http://lbsyun.baidu.com/index
  /// .php?title=yingyan/api/entity#addcolumn.E2.80.94.E2.80.94.E6.B7.BB.E5.8A.A0entity.E5.B1.9E
  /// .E6.80.A7.E5.AD.97.E6.AE.B5">entity/addcolumn</a>接口添加的属性字段。
  ///
  /// @param request  请求参数对象
  /// @param listener Entity监听器，对应回调接口为:
  ///                 {@link OnEntityListener#onUpdateEntityCallback(UpdateEntityResponse)}
  Future<bool> updateEntity(
      {required UpdateEntityOption updateEntityOption,
      EntityCallBack ?entityCallBack}) async {
    return await _entityManager.updateEntity(
        updateEntityOption: updateEntityOption, entityCallBack: entityCallBack);
  }

  ///
  /// 删除Entity
  ///
  /// @param deleteEntityOption  请求参数对象
  /// @param listener Entity监听器，对应回调接口为:
  /// {@link OnEntityListener#onDeleteEntityCallback(DeleteEntityResponse)}
  ///
  Future<bool> deleteEntity(
      {required DeleteEntityOption deleteEntityOption,
      EntityCallBack ?entityCallBack}) async {
    return await _entityManager.deleteEntity(
        deleteEntityOption: deleteEntityOption, entityCallBack: entityCallBack);
  }

  ///
  /// 关键字搜索Entity
  ///
  /// @param request  请求参数对象
  /// @param listener Entity监听器，对应回调接口为：
  ///                 {@link OnEntityListener#onSearchEntityCallback(SearchResponse)}
  Future<bool> keyWordSearchEntity(
      {required KeyWordSearchEntityOption keyWordSearchEntityOption,
      EntityCallBack ?entityCallBack}) async {
    return await _entityManager.keyWordSearchEntity(
        keyWordSearchEntityOption: keyWordSearchEntityOption,
        entityCallBack: entityCallBack);
  }

  /// 根据圆心半径搜索Entity终端实体，并返回实时位置
  /// aroundSearchEntityOption
  /// entityCallBack
  Future<bool> aroundSearchEntity(
      {required AroundSearchEntityOption aroundSearchEntityOption,
      EntityCallBack ?entityCallBack}) async {
    return await _entityManager.aroundSearchEntity(
        aroundSearchEntityOption: aroundSearchEntityOption,
        entityCallBack: entityCallBack);
  }

  /// 根据矩形地理范围搜索Entity终端实体，并返回实时位置
  /// boundSearchEntityOption
  /// entityCallBack
  Future<bool> boundSearchEntity(
      {required BoundSearchEntityOption boundSearchEntityOption,
      EntityCallBack ?entityCallBack}) async {
    return await _entityManager.boundSearchEntity(
        boundSearchEntityOption: boundSearchEntityOption,
        entityCallBack: entityCallBack);
  }

  /// 在行政区域内搜索Entity终端实体，并返回实时位置
  /// districtSearchEntityOption
  /// entityCallBack
  Future<bool> districtSearchEntity(
      {required DistrictSearchEntityOption districtSearchEntityOption,
      EntityCallBack ?entityCallBack}) async {
    return await _entityManager.districtSearchEntity(
        districtSearchEntityOption: districtSearchEntityOption,
        entityCallBack: entityCallBack);
  }

  /// 在多边形区域内搜索Entity终端实体，并返回实时位置
  /// polygonSearchEntityOption
  /// entityCallBack
  Future<bool> polygonSearchEntity(
      {required PolygonSearchEntityOption polygonSearchEntityOption,
      EntityCallBack ?entityCallBack}) async {
    return await _entityManager.polygonSearchEntity(
        polygonSearchEntityOption: polygonSearchEntityOption,
        entityCallBack: entityCallBack);
  }

  /// 检索符合过滤条件的Entity终端实体，返回Entity属性信息和最新位置;
  /// 可用于列出Entity，也可用于批量查询多个Entity的位置。
  /// entityListSearchOption
  /// entityCallBack
  Future<bool> queryEntityList(
      {required EntityListSearchOption entityListSearchOption,
      EntityCallBack ?entityCallBack}) async {
    return await _entityManager.queryEntityList(
        entityListSearchOption: entityListSearchOption,
        entityCallBack: entityCallBack);
  }

  ///  ********************* 轨迹接口 *********************

  /// 上传某个开发者自定义的轨迹点
  /// 除了SDK自动的轨迹采集上传外，开发者可以通过此方法上传自定义的轨迹点。
  /// 比如在两个采集周期之间，上传某个轨迹点作为补充。或者上传非当前登陆的entity的其他终端的轨迹点等。
  /// addCustomTrackPointOption
  /// trackCallBack
  Future<bool> addCustomPoint(
      {required AddCustomTrackPointOption addCustomTrackPointOption,
      TrackCallBack ?trackCallBack}) async {
    return await _trackManager.addCustomPoint(
        addCustomTrackPointOption: addCustomTrackPointOption,
        trackCallBack: trackCallBack);
  }

  /// 批量上传若干个开发者自定义的轨迹点
  /// 除了SDK自动的轨迹采集上传外，开发者可以通过此方法批量上传自定义的轨迹点。
  /// 这些轨迹点可以属于不同的终端实体。
  /// addCustomTrackPointsOption
  /// trackCallBack
  Future<bool> AddCustomPoints(
      {required AddCustomTrackPointsOption addCustomTrackPointsOption,
      TrackCallBack ?trackCallBack}) async {
    return await _trackManager.addCustomPoints(
        addCustomTrackPointsOption: addCustomTrackPointsOption,
        trackCallBack: trackCallBack);
  }

  /// 清空客户端缓存的轨迹信息
  /// clearTrackCacheOption
  /// trackCallBack
  Future<bool> clearTrackCache(
      {required ClearTrackCacheOption clearTrackCacheOption,
      TrackCallBack ?trackCallBack}) async {
    return await _trackManager.clearTrackCache(
        clearTrackCacheOption: clearTrackCacheOption,
        trackCallBack: trackCallBack);
  }

  /// 查询某终端实体在一段时间内的轨迹
  /// queryHistoryTrackOption
  /// trackCallBack
  Future<bool> queryHistoryTrack(
      {required QueryHistoryTrackOption queryHistoryTrackOption,
      TrackCallBack ?trackCallBack}) async {
    return await _trackManager.queryHistoryTrack(
        queryHistoryTrackOption: queryHistoryTrackOption,
        trackCallBack: trackCallBack);
  }

  /// 查询客户端缓存的轨迹信息
  /// queryTrackCacheInfoOption
  /// trackCallBack
  Future<bool> queryTrackCacheInfo(
      {required QueryTrackCacheInfoOption queryTrackCacheInfoOption,
      TrackCallBack ?trackCallBack}) async {
    return await _trackManager.queryTrackCacheInfo(
        queryTrackCacheInfoOption: queryTrackCacheInfoOption,
        trackCallBack: trackCallBack);
  }

  /// 查询某终端实体在一段时间内的里程
  /// queryTrackDistanceOption
  /// trackCallBack
  Future<bool> queryTrackDistance(
      {required QueryTrackDistanceOption queryTrackDistanceOption,
      TrackCallBack ?trackCallBack}) async {
    return await _trackManager.queryTrackDistance(
        queryTrackDistanceOption: queryTrackDistanceOption,
        trackCallBack: trackCallBack);
  }

  ///  查询某终端实体的实时位置
  /// queryTrackLatestPointOption
  /// trackCallBack
  Future<bool> queryTrackLatestPoint(
      {required QueryTrackLatestPointOption queryTrackLatestPointOption,
      TrackCallBack ?trackCallBack}) async {
    return await _trackManager.queryTrackLatestPoint(
        queryTrackLatestPointOption: queryTrackLatestPointOption,
        trackCallBack: trackCallBack);
  }

  ///  ********************* 轨迹分析相关接口 *********************
  /// 驾驶行为分析
  /// drivingBehaviourAnalysisOption
  /// analysisCallBack
  Future<bool> analyzeDrivingBehaviour(
      {required DrivingBehaviourAnalysisOption drivingBehaviourAnalysisOption,
      AnalysisCallBack ?analysisCallBack}) async {
    return await _analysisManager.analyzeDrivingBehaviour(
        drivingBehaviourAnalysisOption: drivingBehaviourAnalysisOption,
        analysisCallBack: analysisCallBack);
  }

  /// 停留点分析
  /// stayPointAnalysisOption
  /// analysisCallBack
  Future<bool> analyzeStayPoint(
      {required StayPointAnalysisOption stayPointAnalysisOption,
      AnalysisCallBack ?analysisCallBack}) async {
    return await _analysisManager.analyzeStayPoint(
        stayPointAnalysisOption: stayPointAnalysisOption,
        analysisCallBack: analysisCallBack);
  }

  ///  ********************* 围栏相关接口 *********************
  /// 给服务端地理围栏添加监控对象
  /// addMonitoredPersonOption
  /// fenceCallback
  Future<bool> addMonitoredPerson(
      {required AddMonitoredPersonOption addMonitoredPersonOption,
      FenceCallback ?fenceCallback}) async {
    return await _fenceManager.addMonitoredPerson(
        addMonitoredPersonOption: addMonitoredPersonOption,
        fenceCallback: fenceCallback);
  }

  /// 新建围栏
  /// createFenceOption
  /// fenceCallback
  Future<bool> createFence(
      {required CreateFenceOption createFenceOption,
      FenceCallback ?fenceCallback}) async {
    return await _fenceManager.createFence(
        createFenceOption: createFenceOption, fenceCallback: fenceCallback);
  }

  /// 删除围栏
  /// deleteFenceOption
  /// fenceCallback
  Future<bool> deleteFence(
      {required DeleteFenceOption deleteFenceOption,
      FenceCallback ?fenceCallback}) async {
    return await _fenceManager.deleteFence(
        deleteFenceOption: deleteFenceOption, fenceCallback: fenceCallback);
  }

  /// 移除指定服务端地理围栏上的监控对象
  /// deleteMonitoredPersonOption
  /// fenceCallback
  Future<bool> deleteMonitoredPerson(
      {required DeleteMonitoredPersonOption deleteMonitoredPersonOption,
      FenceCallback ?fenceCallback}) async {
    return await _fenceManager.deleteMonitoredPerson(
        deleteMonitoredPersonOption: deleteMonitoredPersonOption,
        fenceCallback: fenceCallback);
  }

  /// 查询围栏
  /// queryFenceListOption
  /// fenceCallback
  Future<bool> queryFenceList(
      {required QueryFenceListOption queryFenceListOption,
      FenceCallback ?fenceCallback}) async {
    return await _fenceManager.queryFenceList(
        queryFenceListOption: queryFenceListOption,
        fenceCallback: fenceCallback);
  }

  /// 查询指定监控对象的地理围栏历史报警信息
  /// queryHistoryAlarmOption
  /// fenceCallback
  Future<bool> queryHistoryAlarm(
      {required QueryHistoryAlarmOption queryHistoryAlarmOption,
      FenceCallback ?fenceCallback}) async {
    return await _fenceManager.queryHistoryAlarm(
        queryHistoryAlarmOption: queryHistoryAlarmOption,
        fenceCallback: fenceCallback);
  }

  /// 查询指定的服务端地理围栏上的监控对象
  /// queryListMonitoredPersonOption
  /// fenceCallback
  Future<bool> queryListMonitoredPerson(
      {required QueryListMonitoredPersonOption queryListMonitoredPersonOption,
      FenceCallback ?fenceCallback}) async {
    return await _fenceManager.queryListMonitoredPerson(
        queryListMonitoredPersonOption: queryListMonitoredPersonOption,
        fenceCallback: fenceCallback);
  }

  /// 查询被监控对象和地理围栏的位置关系
  /// queryMonitoredStatusOption
  /// fenceCallback
  Future<bool> queryMonitoredStatus(
      {required QueryMonitoredStatusOption queryMonitoredStatusOption,
      FenceCallback ?fenceCallback}) async {
    return await _fenceManager.queryMonitoredStatus(
        queryMonitoredStatusOption: queryMonitoredStatusOption,
        fenceCallback: fenceCallback);
  }

  /// 查询被监控对象，在指定的坐标时，和地理围栏的位置关系
  /// queryMonitoredStatusByLocationOption
  /// fenceCallback
  Future<bool> queryMonitoredStatusByLocation(
      {required
          QueryMonitoredStatusByLocationOption
              queryMonitoredStatusByLocationOption,
      FenceCallback ?fenceCallback}) async {
    return await _fenceManager.queryMonitoredStatusByLocation(
        queryMonitoredStatusByLocationOption:
            queryMonitoredStatusByLocationOption,
        fenceCallback: fenceCallback);
  }

  /// 更新围栏
  /// updateFenceOption
  /// fenceCallback
  Future<bool> updateFence(
      {required UpdateFenceOption updateFenceOption,
      FenceCallback ?fenceCallback}) async {
    return await _fenceManager.updateFence(
        updateFenceOption: updateFenceOption, fenceCallback: fenceCallback);
  }

  /// 查询当前实时位置 (Android)
  /// realTimeLocationOption 查询实时位置配置
  /// entityCallBack 查询实时位置回调
  Future<bool> queryRealTimeLoc(
      {required RealTimeLocationOption realTimeLocationOption,
      EntityCallBack ?entityCallBack}) async {
    return await _entityManager.queryRealTimeLoc(
        realTimeLocationOption: realTimeLocationOption,
        entityCallBack: entityCallBack);
  }

  /// 停止实时定位
  Future<bool> stopRealTimeLoc() async {
    return await _entityManager.stopRealTimeLoc();
  }

  /// 设置采集定位模式 (Android)
  ///
  /// 若设置定位模式为低功耗模式（网络定位），则SDK只会采集wifi和基站数据，即便此时已开启GPS；
  /// 若设置定位模式为高精度（GPS和网络综合定位），则在GPS定位成功时，SDK只采集GPS信息；GPS未开启或者处于搜索状态，SDK采集wifi和基站数据；
  /// 若设置定位模式为仅GPS，则SDK只采集GPS信息；因此，在GPS未打开或处于搜索状态时，SDK将采集不到的轨迹数据（即此时不会有轨迹数据）。
  Future<bool> setLocationMode(LocationMode locationMode) async {
    return await _locationManager.setLocationMode(locationMode);
  }

  /// 释放资源
  ///
  /// 注意：为保证sdk正常运行，请只在以下两种情况下调用该方法：
  /// 1、app退出时；2、不再使用SDK中的任何功能，且再次使用时，会重新初始化LBSTraceClient
  Future<bool> release() async {
    return await _traceManager.release();
  }

}
