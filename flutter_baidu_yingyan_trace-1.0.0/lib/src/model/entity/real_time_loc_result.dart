import 'package:flutter_baidu_yingyan_trace/src/model/base_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/coord_type.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/loc_type.dart';

/// 实时定位结果
class RealTimeLocationResult extends BaseResult {
  /// 定位类型
  LocType ?locType;

  /// 楼层信息
  String ?floor;

  ///室内定位结果类型
  String ?indoor;

  /// 建筑物信息
  String ?building;

  /// 纬度
  double ?latitude;

  /// 经度
  double ?longitude;

  /// 坐标类型
  CoordType ?coordType;

  /// 精度（单位 : 米）
  double ?radius;

  /// 方向（单位 : 度）
  double ?direction;

  /// 速度（单位 : 公里/小时）
  double ?speed;

  /// 高度（单位 : 米）
  int ?altitude;

  /// 定位时间（格式 : yyyy-MM-dd HH:mm:ss, eg : 2015-01-01 14:01:01）
  String ?time;

  RealTimeLocationResult.fromMap(Map map)
      : assert(map != null),
        super.fromMap(map) {
    locType = LocType.values[map['locType'] as int];
    floor = map['floor'];
    indoor = map['indoor'];
    building = map['building'];
    latitude = map['latitude'];
    longitude = map['longitude'];
    if (map['coordType'] != null) {
      int value = map['coordType'] as int;
      if (value >= 0 && value <= 2) {
        coordType = CoordType.values[value];
      }
    }
    radius = map['radius'];
    direction = map['direction'];
    speed = map['speed'];
    altitude = map['altitude'];
    time = map['time'];
  }

  @override
  Map toMap() {
    Map map = super.toMap();
    map['locType'] = locType?.index;
    map['floor'] = floor;
    map['indoor'] = indoor;
    map['building'] = building;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['coordType'] = coordType?.index;
    map['radius'] = radius;
    map['direction'] = direction;
    map['speed'] = speed;
    map['altitude'] = altitude;
    map['time'] = time;
    return map;
  }
}
