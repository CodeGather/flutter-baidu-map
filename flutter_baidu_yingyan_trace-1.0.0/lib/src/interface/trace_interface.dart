import 'package:flutter/foundation.dart';
import 'package:flutter_baidu_yingyan_trace/src/callback/trace_callback.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/trace/service_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/trace/trace.dart';

/// 轨迹服务与采集的相关接口
abstract class TraceInterface {
  /// 设置SDK运行所需的基础信息，调用任何方法之前都需要先调用此方法
  /// true代表设置成功，false代表设置失败
  /// ios 独有
  @required
  Future<bool> configServerInfo(ServiceOption serviceOption);

  /// 开启轨迹服务
  /// entityName 终端实体的名称
  @required
  Future<bool> startTraceService(
      {required Trace trace, TraceCallback traceCallback});

  /// 停止轨迹服务
  @required
  Future<bool> stopTraceService(
      {required Trace trace, TraceCallback traceCallback});

  /// 开始采集
  @required
  Future<bool> startGather({TraceCallback traceCallback});

  /// 停止采集
  @required
  Future<bool> stopGather({TraceCallback traceCallback});

  /// 设置采集周期和打包上传的周期
  /// 采集周期和上传周期的值域均为[2,300]，且上传周期必须是采集周期的整数倍
  /// gatherInterval 采集周期，单位：秒
  /// packInterval 打包上传周期，单位：秒
  @required
  Future<bool> setInterval(
      {required int gatherInterval,
      required int packInterval,
      TraceCallback traceCallback});

  /// 设置SDK缓存所占磁盘空间的最大值。单位：MB。
  /// 如果设置了该阈值，当SDK缓存的数据占用磁盘超过该阈值时，将删除最早的缓存轨迹，直到满足该条件。
  /// 如果对于缓存占用空间没有非常强烈的要求，建议不要调用此方法。否则将会导致缓存轨迹数据被丢弃等情况，且数据无法找回。
  /// size 缓存占用空间的最大值，最小值为50MB。
  @required
  Future<bool> setCacheSize({required int size, TraceCallback traceCallback});
}
