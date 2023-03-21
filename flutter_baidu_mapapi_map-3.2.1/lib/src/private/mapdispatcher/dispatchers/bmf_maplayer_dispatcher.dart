import 'package:flutter/services.dart';
import 'package:flutter_baidu_mapapi_map/src/private/mapdispatcher/bmf_map_method_id.dart'
    show BMFMapLayerMethId;

/// 地图图层
class BMFMapLayerDispatcher {
  /// 地图overlay图层与POI图层交换位置
  Future<bool> switchOverlayLayerAndPOILayer(
      MethodChannel _mapChannel, bool isSwitch) async {
    ArgumentError.checkNotNull(_mapChannel, "_mapChannel");
    ArgumentError.checkNotNull(isSwitch, "isSwitch");

    bool result = false;
    try {
      result = (await _mapChannel.invokeMethod(
          BMFMapLayerMethId.kSwitchOverlayLayerAndPOILayerMethod,
          {'isSwitch': isSwitch} as dynamic)) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }
}
