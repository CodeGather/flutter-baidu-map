import 'package:flutter/services.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';
import 'package:flutter_baidu_mapapi_map/src/models/bmf_heatmap.dart';
import 'package:flutter_baidu_mapapi_map/src/private/mapdispatcher/bmf_map_method_id.dart'
    show BMFHeatMapMethodId;

/// 热力图相关操作
class BMFHeatMapDispatcher {
  /// 添加热力图
  Future<bool> addHeatMap(MethodChannel _mapChannel, BMFHeatMap heapMap) async {
    ArgumentError.checkNotNull(_mapChannel, "_mapChannel");
    ArgumentError.checkNotNull(heapMap, "heapMap");

    bool result = false;
    try {
      result = (await _mapChannel.invokeMethod(BMFHeatMapMethodId.kAddMapMethod,
          {'heatMap': heapMap.toMap()} as dynamic)) as bool;
    } on PlatformException catch (e) {
      BMFLog.e(e.toString());
    }
    return result;
  }

  /// 删除热力图
  Future<bool> removeHeatMap(MethodChannel _mapChannel) async {
    ArgumentError.checkNotNull(_mapChannel, "_mapChannel");

    bool result = false;
    try {
      result = (await _mapChannel
          .invokeMethod(BMFHeatMapMethodId.kRemoveHeatMapMethod) as bool);
    } on PlatformException catch (e) {
      BMFLog.e(e.toString());
    }
    return result;
  }

  /// 是否展示热力图
  Future<bool> showHeatMap(MethodChannel _mapChannel, bool show) async {
    ArgumentError.checkNotNull(_mapChannel, "_mapChannel");
    ArgumentError.checkNotNull(show, "show");

    bool result = false;
    try {
      result = (await _mapChannel.invokeMethod(
              BMFHeatMapMethodId.kShowHeatMapMethod, {'show': show} as dynamic))
          as bool;
    } on PlatformException catch (e) {
      BMFLog.e(e.toString());
    }
    return result;
  }
}
