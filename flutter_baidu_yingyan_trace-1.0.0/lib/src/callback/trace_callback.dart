import 'package:flutter_baidu_yingyan_trace/src/model/push_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/trace/gather_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/trace/trace_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/trace/trace_types.dart';

/// 推送消息回调
typedef PushCallback = void Function(PushResult pushResult);

/// 开始轨迹服务回调
typedef StartTraceServiceCallback = void Function(TraceResult traceResult);

/// 轨迹服务绑定成功回调
typedef BindServiceCallback = void Function(TraceResult traceResult);

/// 停止轨迹服务回调
typedef StopTraceServiceCallback = void Function(TraceResult traceResult);

/// 开始采集回调
typedef StartGatherCallback = void Function(GatherResult gatherResult);

/// 停止采集回调
typedef StopGatherCallback = void Function(GatherResult gatherResult);

/// 设置采集周期和打包上传的周期回调
typedef SetIntervalCallback = void Function(
    SetIntervalErrorCode setIntervalErrorCode);

/// 设置SDK缓存所占磁盘空间的最大值回调
typedef SetCacheSizeCallback = void Function(
    SetCacheMaxSizeErrorCode setCacheMaxSizeErrorCode);

class TraceCallback {
  /// 推送消息回调
  PushCallback ?onPushCallBack;

  /// 开启轨迹服务回调
  StartTraceServiceCallback ?onStartTraceServiceCallBack;

  /// 轨迹服务绑定成功回调
  BindServiceCallback ?onBindServiceCallback;

  ///  停止轨迹服务回调
  StopTraceServiceCallback ?onStopTraceServiceCallBack;

  /// 开始采集回调
  StartGatherCallback ?onStartGatherCallBack;

  /// 停止采集回调
  StopGatherCallback ?onStopGatherCallBack;

  /// 设置采集周期和打包上传的周期回调
  SetIntervalCallback ?onSetIntervalCallBack;

  ///  设置SDK缓存所占磁盘空间的最大值回调
  SetCacheSizeCallback ?onSetCacheSizeCallBack;

  TraceCallback(
      {this.onPushCallBack,
      this.onStartTraceServiceCallBack,
      this.onBindServiceCallback,
      this.onStopTraceServiceCallBack,
      this.onStartGatherCallBack,
      this.onStopGatherCallBack,
      this.onSetIntervalCallBack,
      this.onSetCacheSizeCallBack});
}
