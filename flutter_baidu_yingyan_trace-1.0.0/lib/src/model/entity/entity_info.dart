import 'package:flutter_baidu_yingyan_trace/src/model/coord_type.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/lat_lng.dart';

/// Entity信息（封装查询Entity列表时返回的Entity信息）
class EntityInfo {
  /// entity名称，其唯一标识
  String ?entityName;

  /// entity 可读性描述
  String ?entityDesc;

  /// entity属性修改时间
  String ?modifyTime;

  /// entity创建时间
  String ?createTime;

  /// 开发者自定义的entity属性信息
  Map<String, String> ?customColumns;

  /// 最新的轨迹点信息
  LatestLocation ?latestLocation;

  EntityInfo.fromMap(Map map) : assert(map != null) {
    entityName = map['entityName'];
    entityDesc = map['entityDesc'];
    modifyTime = map['modifyTime'];
    createTime = map['createTime'];
    customColumns = map['customColumns'] == null
        ? null
        : Map<String, String>.from(map['customColumns']);
    latestLocation = map['latestLocation'] == null
        ? null
        : LatestLocation.fromMap(map['latestLocation']);
  }

  Map toMap() {
    return {
      "entityName": this.entityName,
      "entityDesc": this.entityDesc,
      "modifyTime": this.modifyTime,
      "createTime": this.createTime,
      "customColumns": this.customColumns,
      "latestLocation": this.latestLocation?.toMap()
    };
  }

  @override
  String toString() {
    return 'EntityInfo{entityName: $entityName, entityDesc: $entityDesc, modifyTime: $modifyTime, createTime: $createTime, customColumns: $customColumns, latestLocation: $latestLocation}';
  }
}

/// 最新轨迹点信息
class LatestLocation {
  /// 经纬度
  LatLng ?location;

  CoordType ?coordType;

  /// 楼层
  String ?floor;

  /// 距中心点距离
  double ?distance;

  /// 对象名称
  String ?objectName;

  /// 定位精度（单位：m）
  double ?radius;

  /// 定位时间
  int ?locTime;

  /// 方向（范围为[0,359]，0度为正北方向，顺时针）
  int ?direction;

  /// 速度（单位：km/h）
  double ?speed;

  /// 高度（单位： m）
  double ?height;

  /// 自定义轨迹属性（track attribute）
  Map<String, String> ?columns;

  LatestLocation.fromMap(Map map) : assert(map != null) {
    location = map['location'] == null ? null : LatLng.fromMap(map['location']);
    if (map['coordType'] != null) {
      int value = map['coordType'] as int;
      if (value >= 0 && value <= 2) {
        coordType = CoordType.values[value];
      }
    }
    floor = map['floor'];
    distance = map['distance'];
    objectName = map['objectName'];
    columns = map['columns'] == null
        ? null
        : Map<String, String>.from(map['columns']);
    radius = map['radius'];
    locTime = map['locTime'];
    direction = map['direction'];
    speed = map['speed'];
    height = map['height'];
  }

  Map toMap() {
    return {
      "floor": this.floor,
      "distance": this.distance,
      "objectName": this.objectName,
      "columns": this.columns,
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
    return 'LatestLocation{location: $location, coordType: $coordType, floor: $floor, distance: $distance, objectName: $objectName, radius: $radius, locTime: $locTime, direction: $direction, speed: $speed, height: $height, columns: $columns}';
  }


}
