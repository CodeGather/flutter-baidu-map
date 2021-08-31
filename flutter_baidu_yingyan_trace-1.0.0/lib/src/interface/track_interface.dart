import 'package:flutter/foundation.dart';
import 'package:flutter_baidu_yingyan_trace/src/callback/track_callback.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/add_custom_track_point_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/add_custom_track_points_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/clear_track_cache_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/query_history_track_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/query_track_cacheInfo_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/query_track_distance_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/query_track_latest_point_option.dart';

/// 轨迹纠偏与里程计算相关接口
abstract class TrackInterface {
  /// 上传某个开发者自定义的轨迹点
  /// 除了SDK自动的轨迹采集上传外，开发者可以通过此方法上传自定义的轨迹点。
  /// 比如在两个采集周期之间，上传某个轨迹点作为补充。或者上传非当前登陆的entity的其他终端的轨迹点等。
  @required
  Future<bool> addCustomPoint(
      {required AddCustomTrackPointOption addCustomTrackPointOption,
      TrackCallBack trackCallBack});

  /// 批量上传若干个开发者自定义的轨迹点
  /// 除了SDK自动的轨迹采集上传外，开发者可以通过此方法批量上传自定义的轨迹点。
  /// 这些轨迹点可以属于不同的终端实体。
  @required
  Future<bool> addCustomPoints(
      {required AddCustomTrackPointsOption addCustomTrackPointsOption,
      TrackCallBack trackCallBack});

  ///  查询某终端实体的实时位置
  @required
  Future<bool> queryTrackLatestPoint(
      {required QueryTrackLatestPointOption queryTrackLatestPointOption,
      TrackCallBack trackCallBack});

  /// 查询某终端实体在一段时间内的里程
  @required
  Future<bool> queryTrackDistance(
      {required QueryTrackDistanceOption queryTrackDistanceOption,
      TrackCallBack trackCallBack});

  /// 查询某终端实体在一段时间内的轨迹
  @required
  Future<bool> queryHistoryTrack(
      {required QueryHistoryTrackOption queryHistoryTrackOption,
      TrackCallBack trackCallBack});

  /// 查询客户端缓存的轨迹信息
  @required
  Future<bool> queryTrackCacheInfo(
      {required QueryTrackCacheInfoOption queryTrackCacheInfoOption,
      TrackCallBack trackCallBack});

  /// 清空客户端缓存的轨迹信息
  @required
  Future<bool> clearTrackCache(
      {required ClearTrackCacheOption clearTrackCacheOption,
      TrackCallBack trackCallBack});
}
