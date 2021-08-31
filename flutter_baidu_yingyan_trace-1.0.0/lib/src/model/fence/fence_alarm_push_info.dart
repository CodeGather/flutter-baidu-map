import 'package:flutter_baidu_yingyan_trace/src/model/coord_type.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/fence_types.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/lat_lng.dart';

/// 本地、服务端围栏报警推送消息
class FenceAlarmPushInfo {
  /// 围栏编号
  int ?fenceId;

  /// 围栏名称
  String ?fenceName;

  /// 监控对象
  String ?monitoredPerson;

  /// 监控动作
  MonitoredAction ?monitoredAction;

  /// 当前报警点轨迹信息
  AlarmPoint ?currentPoint;

  /// 上一个轨迹点信息
  AlarmPoint ?prePoint;

  FenceAlarmPushInfo.fromMap(Map map) : assert(map != null) {
    fenceId = map['fenceId'];
    fenceName = map['fenceName'];
    monitoredPerson = map['monitoredPerson'];
    if (map['monitoredAction'] != null) {
      int value = map['monitoredAction'] as int;
      if (value >= 0) {
        monitoredAction = MonitoredAction.values[value];
      }
    }

    currentPoint = map['currentPoint'] == null
        ? null
        : AlarmPoint.fromMap(map['currentPoint'] as Map);
    prePoint = map['prePoint'] == null
        ? null
        : AlarmPoint.fromMap(map['prePoint'] as Map);
  }

  Map toMap() {
    return {
      'fenceId': this.fenceId,
      'fenceName': this.fenceName,
      'monitoredPerson': this.monitoredPerson,
      'monitoredAction': this.monitoredAction?.index,
      'currentPoint': this.currentPoint?.toMap(),
      'prePoint': this.prePoint?.toMap(),
    };
  }
}

/// 围栏报警时轨迹点信息
class AlarmPoint {
  /// 坐标经纬度信息
  LatLng ?location;

  /// 坐标类型
  CoordType ?coordType;

  /// 定位时间（单位：秒）
  int ?locTime;

  /// 上传到服务端时间（只在查询服务端围栏历史报警信息时，该字段有值）
  int ?createTime;

  /// 定位精度（单位：米）
  double ?radius;

  AlarmPoint.fromMap(Map map) : assert(map != null) {
    location =
        map['location'] == null ? null : LatLng.fromMap(map['location'] as Map);
    if (map['coordType'] != null) {
      int value = map['coordType'] as int;
      if (value >= 0 && value <= 2) {
        coordType = CoordType.values[value];
      }
    }
    locTime = map['locTime'];
    createTime = map['createTime'];
    radius = map['radius'];
  }

  Map toMap() {
    return {
      'location': this.location?.toMap(),
      'coordType': this.coordType?.index,
      'locTime': this.locTime,
      'createTime': this.createTime,
      'radius': this.radius
    };
  }
}
