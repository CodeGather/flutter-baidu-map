import 'package:flutter_baidu_yingyan_trace/src/model/track/add_custom_track_point_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/add_custom_track_points_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/clear_track_cache_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/query_history_track_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/query_track_cacheInfo_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/query_track_distance_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/query_track_latest_point_result.dart';

/// 上传单个轨迹回调
typedef AddCustomTrackPointCallBack = void Function(
    AddCustomTrackPointResult addCustomTrackPointResult);

/// 批量上传多个开发者自定义的轨迹点回调
typedef AddCustomTrackPointsCallBack = void Function(
    AddCustomTrackPointsResult addCustomTrackPointsResult);

/// 清空客户端缓存的轨迹数据回调
typedef ClearTrackCacheCallBack = void Function(
    ClearTrackCacheResult clearTrackCachekResult);

/// 查询某entity终端实体，在一段时间之内的行程信息的回调
typedef QueryHistoryTrackCallBack = void Function(
    QueryHistoryTrackResult queryHistoryTrackResult);

/// 查询客户端缓存的轨迹数据的回调
typedef QueryTrackCacheInfoCallBack = void Function(
    QueryTrackCacheInfoResult queryTrackCacheInfoResult);

/// 查询某entity终端实体，在指定时间段内的行驶里程的回调
typedef QueryTrackDistanceCallBack = void Function(
    QueryTrackDistanceResult queryTrackDistanceResult);

/// 查询某entity终端实体的实时位置的回调
typedef QueryTrackLatestPointCallBack = void Function(
    QueryTrackLatestPointResult queryTrackLatestPointResult);

/// track回调
class TrackCallBack {
  /// 上传单个轨迹回调
  AddCustomTrackPointCallBack ?onAddCustomTrackPointCallBack;

  /// 批量上传多个开发者自定义的轨迹点回调
  AddCustomTrackPointsCallBack ?onAddCustomTrackPointsCallBack;

  /// 清空客户端缓存的轨迹数据回调
  ClearTrackCacheCallBack ?onClearTrackCacheCallBack;

  /// 查询某entity终端实体，在一段时间之内的行程信息的回调
  QueryHistoryTrackCallBack ?onQueryHistoryTrackCallBack;

  /// 查询客户端缓存的轨迹数据的回调
  QueryTrackCacheInfoCallBack ?onQueryTrackCacheInfoCallBack;

  /// 查询某entity终端实体，在指定时间段内的行驶里程的回调
  QueryTrackDistanceCallBack ?onQueryTrackDistanceCallBack;

  /// 查询某entity终端实体的实时位置的回调
  QueryTrackLatestPointCallBack ?onQueryTrackLatestPointCallBack;

  TrackCallBack(
      {this.onAddCustomTrackPointCallBack,
      this.onAddCustomTrackPointsCallBack,
      this.onClearTrackCacheCallBack,
      this.onQueryHistoryTrackCallBack,
      this.onQueryTrackCacheInfoCallBack,
      this.onQueryTrackDistanceCallBack,
      this.onQueryTrackLatestPointCallBack});
}
