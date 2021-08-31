import 'package:flutter_baidu_yingyan_trace/src/model/analysis/end_point.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/analysis/harsh_acceleration_point.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/analysis/harsh_breaking_point.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/analysis/harsh_steering_point.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/analysis/speeding_info.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/analysis/start_point.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/base_result.dart';

/// 驾驶行为响应结果
class DrivingBehaviourAnalysisResult extends BaseResult {
  /// 行程里程，单位：米
  double ?distance;

  /// 行程耗时，单位：秒
  int ?duration;

  /// 平均时速，单位：km/h
  double ?averageSpeed;

  /// 最高时速，单位：km/h
  double ?maxSpeed;

  /// 超速次数
  int ?speedingNum;

  /// 急加速次数
  int ?harshAccelerationNum;

  /// 急刹车次数
  int ?harshBreakingNum;

  /// 急转弯次数
  int ?harshSteeringNum;

  /// 起点信息
  StartPoint ?startPoint;

  /// 终点信息
  EndPoint ?endPoint;

  /// 超速记录集合
  List<SpeedingInfo> ?speedings;

  /// 急加速记录集合
  List<HarshAccelerationPoint> ?harshAccelerationPoints;

  /// 急刹车记录集合
  List<HarshBreakingPoint> ?harshBreakingPoints;

  /// 急转弯记录集合
  List<HarshSteeringPoint> ?harshSteeringPoints;

  DrivingBehaviourAnalysisResult.fromMap(Map map)
      : assert(map != null),
        super.fromMap(map) {
    distance = map['distance'];
    duration = map['duration'];
    averageSpeed = map['averageSpeed'];
    maxSpeed = map['maxSpeed'];
    speedingNum = map['speedingNum'];
    harshAccelerationNum = map['harshAccelerationNum'];
    harshBreakingNum = map['harshBreakingNum'];
    harshSteeringNum = map['harshSteeringNum'];
    startPoint = map['startPoint'] != null
        ? StartPoint.fromMap(map['startPoint'])
        : null;
    endPoint =
        map['endPoint'] != null ? EndPoint.fromMap(map['endPoint']) : null;
    if (map['speedings'] != null) {
      speedings = <SpeedingInfo>[];
      map['speedings'].forEach((e) {
        speedings!.add(SpeedingInfo.fromMap(e as Map));
      });
    }
    if (map['harshAccelerationPoints'] != null) {
      harshAccelerationPoints = <HarshAccelerationPoint>[];
      map['harshAccelerationPoints'].forEach((e) {
        harshAccelerationPoints!.add(HarshAccelerationPoint.fromMap(e as Map));
      });
    }
    if (map['harshBreakingPoints'] != null) {
      harshBreakingPoints = <HarshBreakingPoint>[];
      map['harshBreakingPoints'].forEach((e) {
        harshBreakingPoints!.add(HarshBreakingPoint.fromMap(e as Map));
      });
    }
    if (map['harshSteeringPoints'] != null) {
      harshSteeringPoints = <HarshSteeringPoint>[];
      map['harshBreakingPoints'].forEach((e) {
        harshSteeringPoints!.add(HarshSteeringPoint.fromMap(e as Map));
      });
    }
  }

  @override
  Map toMap() {
    Map map = super.toMap();
    map['distance'] = this.distance;
    map['duration'] = this.duration;
    map['averageSpeed'] = this.averageSpeed;
    map['maxSpeed'] = this.maxSpeed;
    map['speedingNum'] = this.speedingNum;
    map['harshAccelerationNum'] = this.harshAccelerationNum;
    map['harshBreakingNum'] = this.harshBreakingNum;
    map['harshSteeringNum'] = this.harshSteeringNum;
    map['startPoint'] = this.startPoint?.toMap();
    map['endPoint'] = this.endPoint?.toMap();
    map['speedings'] = this.speedings?.map((e) => e.toMap()).toList();
    map['harshAccelerationPoints'] =
        this.harshAccelerationPoints?.map((e) => e.toMap()).toList();
    map['harshBreakingPoints'] =
        this.harshBreakingPoints?.map((e) => e.toMap()).toList();
    map['harshSteeringPoints'] =
        this.harshSteeringPoints?.map((e) => e.toMap()).toList();
    return map;
  }
}
