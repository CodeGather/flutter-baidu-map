/* 
 * @Author: 21克的爱情
 * @Date: 2020-12-30 15:12:24
 * @Email: raohong07@163.com
 * @LastEditors: 21克的爱情
 * @LastEditTime: 2021-06-16 21:55:00
 * @Description: 
 */
import 'package:flutter_baidu_yingyan_trace/src/model/coord_type.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/lat_lng.dart';

/// 轨迹点的基类
class Point {
  /// 经纬度
  LatLng ?location;

  /// 坐标类型，默认为百度经纬度
  CoordType ?coordType;

  /// 定位精度（单位：m）
  double ?radius;

  /// 定位时间
  int ?locTime;

  /// 方向（范围为[0,359]，0度为正北方向，顺时针)
  int ?direction;

  /// 速度（单位：km/h）
  double ?speed;

  /// 高度（单位： m）
  double ?height;

  /// 有参构造
  Point(
      {required this.location,
      required this.locTime,
      this.coordType: CoordType.BD09LL,
      this.radius,
      this.direction,
      this.speed,
      this.height});

  /// map => Point
  Point.fromMap(Map map) : assert(map != null) {
    location =
        map['location'] == null ? null : LatLng.fromMap(map['location'] as Map);
    if (map['coordType'] != null) {
      int value = map['coordType'] as int;
      if (value >= 0 && value <= 2) {
        coordType = CoordType.values[value];
      }
    }
    radius = map['radius'];
    locTime = map['locTime'];
    direction = map['direction'];
    speed = map['speed'];
    height = map['height'];
  }

  Map toMap() {
    return {
      "location": this.location?.toMap(),
      "coordType": this.coordType?.index,
      "radius": this.radius,
      "locTime": this.locTime,
      "direction": this.direction,
      "speed": this.speed,
      "height": this.height,
    };
  }

  @override
  String toString() {
    return 'Point{location: $location, coordType: $coordType, radius: $radius, locTime: $locTime, direction: $direction, speed: $speed, height: $height}';
  }
}
