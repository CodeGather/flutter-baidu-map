import 'package:flutter/foundation.dart';
import 'package:flutter_baidu_yingyan_trace/flutter_baidu_yingyan_trace.dart';
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

/// 地理围栏业务的相关接口
abstract class FenceInterface {
  /// 新建围栏
  @required
  Future<bool> createFence(
      {required CreateFenceOption createFenceOption,
      FenceCallback fenceCallback});

  /// 删除围栏
  @required
  Future<bool> deleteFence(
      {required DeleteFenceOption deleteFenceOption,
      FenceCallback fenceCallback});

  /// 更新围栏
  @required
  Future<bool> updateFence(
      {required UpdateFenceOption updateFenceOption,
      FenceCallback fenceCallback});

  /// 查询围栏
  Future<bool> queryFenceList(
      {required QueryFenceListOption queryFenceListOption,
      FenceCallback fenceCallback});

  /// 查询被监控对象和地理围栏的位置关系
  @required
  Future<bool> queryMonitoredStatus(
      {required QueryMonitoredStatusOption queryMonitoredStatusOption,
      FenceCallback fenceCallback});

  /// 查询被监控对象，在指定的坐标时，和地理围栏的位置关系
  @required
  Future<bool> queryMonitoredStatusByLocation(
      {required
          QueryMonitoredStatusByLocationOption
              queryMonitoredStatusByLocationOption,
      FenceCallback fenceCallback});

  /// 查询指定监控对象的地理围栏历史报警信息
  @required
  Future<bool> queryHistoryAlarm(
      {required QueryHistoryAlarmOption queryHistoryAlarmOption,
      FenceCallback fenceCallback});

  /// 给服务端地理围栏添加监控对象
  @required
  Future<bool> addMonitoredPerson(
      {required AddMonitoredPersonOption addMonitoredPersonOption,
      FenceCallback fenceCallback});

  /// 移除指定服务端地理围栏上的监控对象
  @required
  Future<bool> deleteMonitoredPerson(
      {required DeleteMonitoredPersonOption deleteMonitoredPersonOption,
      FenceCallback fenceCallback});

  /// 查询指定的服务端地理围栏上的监控对象
  @required
  Future<bool> queryListMonitoredPerson(
      {required QueryListMonitoredPersonOption queryListMonitoredPersonOption,
      FenceCallback fenceCallback});
}
