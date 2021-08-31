import 'package:flutter_baidu_yingyan_trace/src/model/fence/add_monitored_person_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/create_fence_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/delete_fence_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/update_fence_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/query_fence_list_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/query_monitored_status_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/query_history_alarm_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/query_monitored_status_by_location_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/delete_monitored_person_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/query_list_monitored_person_result.dart';

typedef CreateFenceCallback = void Function(
    CreateFenceResult createFenceResult);
typedef UpdateFenceCallback = void Function(
    UpdateFenceResult updateFenceResult);
typedef DeleteFenceCallback = void Function(
    DeleteFenceResult deleteFenceResult);
typedef QueryFenceListCallback = void Function(
    QueryFenceListResult fenceListResult);
typedef QueryMonitoredStatusCallback = void Function(
    QueryMonitoredStatusResult monitoredStatusResult);
typedef QueryMonitoredStatusByLocationCallback = void Function(
    QueryMonitoredStatusByLocationResult monitoredStatusByLocationResult);
typedef QueryHistoryAlarmCallback = void Function(
    QueryHistoryAlarmResult historyAlarmResult);
typedef AddMonitoredPersonCallback = void Function(
    AddMonitoredPersonResult addMonitoredPersonResult);
typedef DeleteMonitoredPersonCallback = void Function(
    DeleteMonitoredPersonResult deleteMonitoredPersonResult);
typedef QueryListMonitoredPersonCallback = void Function(
    QueryListMonitoredPersonResult listMonitoredPersonResult);

class FenceCallback {
  /// 创建围栏回调接口
  CreateFenceCallback ?onCreateFenceCallback;

  /// 更新围栏回调接口
  UpdateFenceCallback ?onUpdateFenceCallback;

  /// 删除围栏回调接口
  DeleteFenceCallback ?onDeleteFenceCallback;

  /// 查询围栏列表回调接口
  QueryFenceListCallback ?onQueryFenceListCallback;

  /// 查询监控对象状态回调接口
  QueryMonitoredStatusCallback ?onQueryMonitoredStatusCallback;

  /// 查询指定位置监控对象状态回调接口
  QueryMonitoredStatusByLocationCallback ?onQueryMonitoredStatusByLocationCallback;

  /// 查询围栏历史报警信息回调接口
  QueryHistoryAlarmCallback ?onQueryHistoryAlarmCallback;

  /// 添加服务端围栏需要监控的对象（轨迹entity）
  AddMonitoredPersonCallback ?onAddMonitoredPersonCallback;

  /// 删除服务端围栏需要监控的对象（轨迹entity）
  DeleteMonitoredPersonCallback ?onDeleteMonitoredPersonCallback;

  /// 查询围栏监控的所有entity
  QueryListMonitoredPersonCallback ?onQueryListMonitoredPersonCallback;

  FenceCallback({
    this.onCreateFenceCallback,
    this.onUpdateFenceCallback,
    this.onDeleteFenceCallback,
    this.onQueryFenceListCallback,
    this.onQueryMonitoredStatusCallback,
    this.onQueryMonitoredStatusByLocationCallback,
    this.onQueryHistoryAlarmCallback,
    this.onAddMonitoredPersonCallback,
    this.onDeleteMonitoredPersonCallback,
    this.onQueryListMonitoredPersonCallback,
  });
}
