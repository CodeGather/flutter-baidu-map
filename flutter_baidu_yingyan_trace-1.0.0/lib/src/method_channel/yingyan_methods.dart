/// search公共常量定义
class YingYanConstants {
  /// search基础通信channel
  static const kYingYanMethodChannelName = 'flutter_baidu_yingyan_trace';
}

class CommonMethods {
  /// 释放资源
  static const String kRelease =
      YingYanConstants.kYingYanMethodChannelName + '/client/release';

  /// 停止实时定位
  static const String kStopRealTimeLoc =
      YingYanConstants.kYingYanMethodChannelName + '/location/stopRealTimeLoc';
}

/// 轨迹相关方法
class AnalysisMethods {
  /// 停留点分析
  static const String kAnalyzeStayPoint =
      YingYanConstants.kYingYanMethodChannelName + '/analysis/analyzeStayPoint';

  static const String kAnalyzeStayPointCallBack =
      YingYanConstants.kYingYanMethodChannelName + '/analysis/analyzeStayPointCallBack';

  /// 驾驶行为分析
  static const String kAnalyzeDrivingBehaviour =
      YingYanConstants.kYingYanMethodChannelName +
          '/analysis/analyzeDrivingBehaviour';

  static const String kAnalyzeDrivingBehaviourCallBack =
      YingYanConstants.kYingYanMethodChannelName +
          '/analysis/analyzeDrivingBehaviourCallBack';
}

/// entity终端的相关方法
class EntityMethods {
  /// 开始实时定位
  static const String kQueryRealTimeLoc =
      YingYanConstants.kYingYanMethodChannelName + '/entity/queryRealTimeLoc';
  /// 开始实时定位
  static const String kQueryRealTimeLocCallBack =
      YingYanConstants.kYingYanMethodChannelName + '/entity/queryRealTimeLocCallBack';

  /// 创建Entity终端实体，并赋属性信息
  static const String kAddEntity =
      YingYanConstants.kYingYanMethodChannelName + '/entity/addEntity';

  static const String kAddEntityCallBack =
      YingYanConstants.kYingYanMethodChannelName + '/entity/addEntityCallBack';

  /// 删除Entity终端实体
  static const String kDeleteEntity =
      YingYanConstants.kYingYanMethodChannelName + '/entity/deleteEntity';

  static const String kDeleteEntityCallBack =
      YingYanConstants.kYingYanMethodChannelName +
          '/entity/deleteEntityCallBack';

  /// 更新Entity终端实体属性信息
  static const String kUpdateEntity =
      YingYanConstants.kYingYanMethodChannelName + '/entity/updateEntity';

  static const String kUpdateEntityCallBack =
      YingYanConstants.kYingYanMethodChannelName +
          '/entity/updateEntityCallBack';

  /// 检索符合过滤条件的Entity终端实体，返回Entity属性信息和最新位置;
  /// 可用于列出Entity，也可用于批量查询多个Entity的位置。
  static const String kQueryEntityList =
      YingYanConstants.kYingYanMethodChannelName + '/entity/queryEntity';

  static const String kQueryEntityListCallBack =
      YingYanConstants.kYingYanMethodChannelName +
          '/entity/queryEntityCallBack';

  /// 根据关键字搜索Entity终端实体，并返回实时位置。
  static const String kSearchEntity =
      YingYanConstants.kYingYanMethodChannelName + '/entity/searchEntity';

  static const String kSearchEntityCallBack =
      YingYanConstants.kYingYanMethodChannelName +
          '/entity/searchEntityCallBack';

  ///  根据矩形地理范围搜索Entity终端实体，并返回实时位置
  static const String kBoundSearchEntity =
      YingYanConstants.kYingYanMethodChannelName + '/entity/boundSearchEntity';

  static const String kBoundSearchEntityCallBack =
      YingYanConstants.kYingYanMethodChannelName +
          '/entity/boundSearchEntityCallBack';

  /// 根据圆心半径搜索Entity终端实体，并返回实时位置
  static const String kAroundSearchEntity =
      YingYanConstants.kYingYanMethodChannelName + '/entity/aroundSearchEntity';

  static const String kAroundSearchEntityCallBack =
      YingYanConstants.kYingYanMethodChannelName +
          '/entity/aroundSearchEntityCallBack';

  /// 在多边形区域内搜索Entity终端实体，并返回实时位置
  static const String kPolygonSearchEntity =
      YingYanConstants.kYingYanMethodChannelName +
          '/entity/polygonSearchEntity';

  static const String kPolygonSearchEntityCallBack =
      YingYanConstants.kYingYanMethodChannelName +
          '/entity/polygonSearchEntityCallBack';

  /// 在行政区域内搜索Entity终端实体，并返回实时位置
  static const String kDistrictSearchEntity =
      YingYanConstants.kYingYanMethodChannelName +
          '/entity/districtSearchEntity';

  static const String kDistrictSearchEntityCallBack =
      YingYanConstants.kYingYanMethodChannelName +
          '/entity/districtSearchEntityCallBack';
}

/// 地理围栏业务的相关方法
class FenceMethods {
  /// 新建围栏
  static const String kCreateFence =
      YingYanConstants.kYingYanMethodChannelName + '/fence/createFence';

  /// 新建围栏回调
  static const String kCreateFenceCallBack =
      YingYanConstants.kYingYanMethodChannelName + '/fence/createFenceCallBack';

  /// 删除围栏
  static const String kDeleteFence =
      YingYanConstants.kYingYanMethodChannelName + '/fence/deleteFence';

  /// 删除围栏回调
  static const String kDeleteFenceCallBack =
      YingYanConstants.kYingYanMethodChannelName + '/fence/deleteFenceCallBack';

  /// 更新围栏
  static const String kUpdateFence =
      YingYanConstants.kYingYanMethodChannelName + '/fence/updateFence';

  /// 更新围栏回调
  static const String kUpdateFenceCallBack =
      YingYanConstants.kYingYanMethodChannelName + '/fence/updateFenceCallBack';

  /// 查询围栏
  static const String kQueryFenceList =
      YingYanConstants.kYingYanMethodChannelName + '/fence/queryFenceList';

  /// 查询围栏回调
  static const String kQueryFenceListCallBack =
      YingYanConstants.kYingYanMethodChannelName +
          '/fence/queryFenceListCallBack';

  /// 查询被监控对象和客户端地理围栏的位置关系
  static const String kQueryMonitoredStatus =
      YingYanConstants.kYingYanMethodChannelName +
          '/fence/queryMonitoredStatus';

  /// 查询被监控对象和客户端地理围栏的位置关系回调
  static const String kQueryMonitoredStatusCallBack =
      YingYanConstants.kYingYanMethodChannelName +
          '/fence/queryMonitoredStatusCallBack';

  /// 查询被监控对象，在指定的坐标时，和客户端地理围栏的位置关系
  static const String kQueryMonitoredStatusByLocation =
      YingYanConstants.kYingYanMethodChannelName +
          '/fence/queryMonitoredStatusByLocation';

  /// 查询被监控对象，在指定的坐标时，和客户端地理围栏的位置关系回调
  static const String kQueryMonitoredStatusByLocationCallBack =
      YingYanConstants.kYingYanMethodChannelName +
          '/fence/queryMonitoredStatusByLocationCallBack';

  /// 查询指定监控对象的客户端地理围栏历史报警信息
  static const String kQueryHistoryAlarm =
      YingYanConstants.kYingYanMethodChannelName + '/fence/queryHistoryAlarm';

  /// 查询指定监控对象的客户端地理围栏历史报警信息回调
  static const String kQueryHistoryAlarmCallBack =
      YingYanConstants.kYingYanMethodChannelName +
          '/fence/queryHistoryAlarmCallBack';

  /// 给服务端地理围栏添加监控对象
  static const String kAddMonitoredPerson =
      YingYanConstants.kYingYanMethodChannelName + '/fence/addMonitoredPerson';

  /// 给服务端地理围栏添加监控对象回调
  static const String kAddMonitoredPersonCallBack =
      YingYanConstants.kYingYanMethodChannelName +
          '/fence/addMonitoredPersonCallBack';

  /// 移除指定服务端地理围栏上的监控对象
  static const String kDeleteMonitoredPerson =
      YingYanConstants.kYingYanMethodChannelName +
          '/fence/deleteMonitoredPerson';

  /// 移除指定服务端地理围栏上的监控对象回调
  static const String kDeleteMonitoredPersonCallBack =
      YingYanConstants.kYingYanMethodChannelName +
          '/fence/deleteMonitoredPersonCallBack';

  /// 查询指定的服务端地理围栏上的监控对象
  static const String kQueryListMonitoredPerson =
      YingYanConstants.kYingYanMethodChannelName +
          '/fence/queryListMonitoredPerson';

  /// 查询指定的服务端地理围栏上的监控对象回调
  static const String kQueryListMonitoredPersonCallBack =
      YingYanConstants.kYingYanMethodChannelName +
          '/fence/queryListMonitoredPersonCallBack';
}

/// 采集相关方法
class TraceMethods {
  /// 设置SDK运行所需的基础信息，调用任何方法之前都需要先调用此方法(ios)
  static const String kConfigServerInfo =
      YingYanConstants.kYingYanMethodChannelName + '/trace/configServerInfo';

  static const String kPushCallBack =
      YingYanConstants.kYingYanMethodChannelName +
          '/trace/onPushCallBack';

  static const String kBindTraceServiceCallBack =
      YingYanConstants.kYingYanMethodChannelName +
          '/trace/onBindTraceServiceCallBack';

  /// 开启轨迹服务
  static const String kStartTraceService =
      YingYanConstants.kYingYanMethodChannelName + '/trace/startTraceService';

  static const String kStartTraceServiceCallBack =
      YingYanConstants.kYingYanMethodChannelName +
          '/trace/startTraceServiceCallBack';

  /// 停止轨迹服务
  static const String kStopTraceService =
      YingYanConstants.kYingYanMethodChannelName + '/trace/stopTraceService';

  static const String kStopTraceServiceCallBack =
      YingYanConstants.kYingYanMethodChannelName +
          '/trace/stopTraceServiceCallBack';

  /// 开始采集
  static const String kStartGather =
      YingYanConstants.kYingYanMethodChannelName + '/trace/startGather';

  static const String kStartGatherCallBack =
      YingYanConstants.kYingYanMethodChannelName + '/trace/startGatherCallBack';

  /// 停止采集
  static const String kStopGather =
      YingYanConstants.kYingYanMethodChannelName + '/trace/stopGather';

  static const String kStopGatherCallBack =
      YingYanConstants.kYingYanMethodChannelName + '/trace/stopGatherCallBack';

  /// 设置采集周期和打包上传的周期
  static const String kSetInterval =
      YingYanConstants.kYingYanMethodChannelName + '/trace/setInterval';

  static const String kSetIntervalCallBack =
      YingYanConstants.kYingYanMethodChannelName +
          '/trace/setIntervalCallBack ';

  /// 设置SDK缓存所占磁盘空间的最大值。单位：MB。
  static const String kSetCacheSize =
      YingYanConstants.kYingYanMethodChannelName + '/trace/setCacheSize';

  static const String kSetCacheSizeCallBack =
      YingYanConstants.kYingYanMethodChannelName +
          '/trace/setCacheSizeCallBack';
}

/// 轨迹纠偏与里程计算相关方法
class TrackMethods {
  /// 上传某个开发者自定义的轨迹点
  /// 除了SDK自动的轨迹采集上传外，开发者可以通过此方法上传自定义的轨迹点。
  /// 比如在两个采集周期之间，上传某个轨迹点作为补充。或者上传非当前登陆的entity的其他终端的轨迹点等。
  static const String kAddCustomPoint =
      YingYanConstants.kYingYanMethodChannelName + '/track/addCustomPoint';

  static const String kAddCustomPointCallBack =
      YingYanConstants.kYingYanMethodChannelName + '/track/addCustomPointCallBack';

  /// 批量上传若干个开发者自定义的轨迹点
  /// 除了SDK自动的轨迹采集上传外，开发者可以通过此方法批量上传自定义的轨迹点。
  /// 这些轨迹点可以属于不同的终端实体。
  static const String kBatchAddCustomPoint =
      YingYanConstants.kYingYanMethodChannelName + '/track/batchAddCustomPoint';

  static const String kBatchAddCustomPointCallBack =
      YingYanConstants.kYingYanMethodChannelName + '/track/batchAddCustomPointCallBack';

  ///  查询某终端实体的实时位置
  static const String kQueryTrackLatestPoint =
      YingYanConstants.kYingYanMethodChannelName +
          '/track/queryTrackLatestPoint';

  static const String kQueryTrackLatestPointCallBack =
      YingYanConstants.kYingYanMethodChannelName +
          '/track/queryTrackLatestPointCallBack';

  /// 查询某终端实体在一段时间内的里程
  static const String kQueryTrackDistance =
      YingYanConstants.kYingYanMethodChannelName + '/track/queryTrackDistance';

  static const String kQueryTrackDistanceCallBack =
      YingYanConstants.kYingYanMethodChannelName + '/track/queryTrackDistanceCallBack';

  /// 查询某终端实体在一段时间内的轨迹
  static const String kQueryHistoryTrack =
      YingYanConstants.kYingYanMethodChannelName + '/track/queryHistoryTrack';

  static const String kQueryHistoryTrackCallBack =
      YingYanConstants.kYingYanMethodChannelName + '/track/queryHistoryTrackCallBack';

  /// 查询客户端缓存的轨迹信息
  static const String kQueryTrackCacheInfo =
      YingYanConstants.kYingYanMethodChannelName + '/track/queryTrackCacheInfo';

  static const String kQueryTrackCacheInfoCallBack =
      YingYanConstants.kYingYanMethodChannelName + '/track/queryTrackCacheInfoCallBack';

  /// 清空客户端缓存的轨迹信息
  static const String kClearTrackCache =
      YingYanConstants.kYingYanMethodChannelName + '/track/clearTrackCache';

  static const String kClearTrackCacheCallBack =
      YingYanConstants.kYingYanMethodChannelName + '/track/clearTrackCacheCallBack';
}

/// 定位相关方法
class LocationMethods {
  /// 申请SDK定位权限(ios)
  static const String kRequestLocalPermission =
      YingYanConstants.kYingYanMethodChannelName +
          '/localPermission/requestLocalPermission';

  /// 配置定位参数
  static const String kConfigLocationInfo =
      YingYanConstants.kYingYanMethodChannelName +
          '/localPermission/configLocationInfo';

  /// 配置定位参数
  static const String kSetLocationMode =
      YingYanConstants.kYingYanMethodChannelName +
          '/location/setLocationMode';
}
