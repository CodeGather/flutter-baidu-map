import 'package:flutter_baidu_yingyan_trace/src/callback/track_callback.dart';
import 'package:flutter_baidu_yingyan_trace/src/interface/track_interface.dart';
import 'package:flutter_baidu_yingyan_trace/src/manager/base_manager.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/query_track_latest_point_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/query_track_distance_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/query_track_cacheInfo_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/query_history_track_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/clear_track_cache_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/add_custom_track_points_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/add_custom_track_point_option.dart';

class TrackManager extends BaseManager implements TrackInterface {
  static final TrackManager _instance = TrackManager._internal();

  factory TrackManager() => _instance;

  TrackManager._internal();

  @override
  Future<bool> addCustomPoints(
      {required AddCustomTrackPointsOption addCustomTrackPointsOption,
      TrackCallBack ?trackCallBack}) async {
    if (addCustomTrackPointsOption == null) {
      return false;
    }
    return await this.baiduYingYanMethodChannel.addCustomPoints(
        addCustomTrackPointsOption: addCustomTrackPointsOption,
        trackCallBack: trackCallBack);
  }

  @override
  Future<bool> addCustomPoint(
      {required AddCustomTrackPointOption addCustomTrackPointOption,
      TrackCallBack ?trackCallBack}) async {
    if (addCustomTrackPointOption == null) {
      return false;
    }
    return await this.baiduYingYanMethodChannel.addCustomPoint(
        addCustomTrackPointOption: addCustomTrackPointOption,
        trackCallBack: trackCallBack);
  }

  @override
  Future<bool> clearTrackCache(
      {required ClearTrackCacheOption clearTrackCacheOption,
      TrackCallBack ?trackCallBack}) async {
    if (clearTrackCacheOption == null) {
      return false;
    }
    return await this.baiduYingYanMethodChannel.clearTrackCache(
        clearTrackCacheOption: clearTrackCacheOption,
        trackCallBack: trackCallBack);
  }

  @override
  Future<bool> queryHistoryTrack(
      {required QueryHistoryTrackOption queryHistoryTrackOption,
      TrackCallBack ?trackCallBack}) async {
    if (queryHistoryTrackOption == null) {
      return false;
    }
    return await this.baiduYingYanMethodChannel.queryHistoryTrack(
        queryHistoryTrackOption: queryHistoryTrackOption,
        trackCallBack: trackCallBack);
  }

  @override
  Future<bool> queryTrackCacheInfo(
      {required QueryTrackCacheInfoOption queryTrackCacheInfoOption,
      TrackCallBack ?trackCallBack}) async {
    if (queryTrackCacheInfoOption == null) {
      return false;
    }
    return await this.baiduYingYanMethodChannel.queryTrackCacheInfo(
        queryTrackCacheInfoOption: queryTrackCacheInfoOption,
        trackCallBack: trackCallBack);
  }

  @override
  Future<bool> queryTrackDistance(
      {required QueryTrackDistanceOption queryTrackDistanceOption,
      TrackCallBack ?trackCallBack}) async {
    if (queryTrackDistanceOption == null) {
      return false;
    }
    return await this.baiduYingYanMethodChannel.queryTrackDistance(
        queryTrackDistanceOption: queryTrackDistanceOption,
        trackCallBack: trackCallBack);
  }

  @override
  Future<bool> queryTrackLatestPoint(
      {required QueryTrackLatestPointOption queryTrackLatestPointOption,
      TrackCallBack ?trackCallBack}) async {
    if (queryTrackLatestPointOption == null) {
      return false;
    }
    return await this.baiduYingYanMethodChannel.queryTrackLatestPoint(
        queryTrackLatestPointOption: queryTrackLatestPointOption,
        trackCallBack: trackCallBack);
  }
}
