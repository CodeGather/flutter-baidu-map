import 'package:flutter_baidu_yingyan_trace/src/interface/location_interface.dart';
import 'package:flutter_baidu_yingyan_trace/src/manager/base_manager.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/location/location_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/location_mode.dart';

class LocationManager extends BaseManager implements LocationInterface {
  @override
  Future<bool> requestLocalPermission() async {
    return await this.baiduYingYanMethodChannel.requestLocalPermission();
  }

  @override
  Future<bool> configLocationInfo(LocationOption locationOption) async {
    if (locationOption == null) {
      return false;
    }
    return await this
        .baiduYingYanMethodChannel
        .configLocationInfo(locationOption);
  }

  Future<bool> setLocationMode(LocationMode locationMode) async {
    if (locationMode == null) {
      return false;
    }
    return await this.baiduYingYanMethodChannel.setLocationMode(locationMode);
  }
}
