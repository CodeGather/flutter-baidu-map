import 'package:flutter_baidu_yingyan_trace/src/model/location/location_types.dart';

/// 定位参数
class LocationOption {
  /// 活动类型 默认LocationActivityType
  LocationActivityType ?locationActivityType;

  /// 期望的定位精度 默认BestForNavigation
  LocationAccuracy ?locationAccuracy;

  /// 触发定位的距离阀值(多少米定位一次) 默认1
  double ?distanceFilter;

  /// 有参构造
  LocationOption(
      {this.locationActivityType: LocationActivityType.AutomotiveNavigation,
      this.locationAccuracy: LocationAccuracy.BestForNavigation,
      this.distanceFilter: 1.0});

  /// map => LocationOption
  LocationOption.fromMap(Map map)
      : assert(map != null,
            'Construct a LocationOption，The parameter map cannot be null !') {
    locationActivityType = map['locationActivityType'] == null
        ? null
        : LocationActivityType.values[map['locationActivityType'] as int];
    locationAccuracy = map['locationAccuracy'] == null
        ? null
        : LocationAccuracy.values[map['locationAccuracy'] as int];
    distanceFilter = map['distanceFilter'];
  }

  /// LocationOption => map
  Map toMap() {
    return {
      'locationActivityType': this.locationActivityType?.index,
      'locationAccuracy': this.locationAccuracy?.index,
      'distanceFilter': this.distanceFilter
    };
  }
}
