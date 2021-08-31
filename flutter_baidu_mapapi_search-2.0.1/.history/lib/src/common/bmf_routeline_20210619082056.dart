/// routeLine类型定义

import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart' show BMFModel;
import './bmf_routesearch_type.dart';
import './bmf_routestep.dart';

/// 此类表示路线数据结构的基类,表示一条路线，路线可能包括：路线规划中的换乘/驾车/步行路线
/// 此类为路线数据结构的基类，一般关注其子类对象即可，无需直接生成该类对象
class BMFRouteLine implements BMFModel {
  /// 路线长度 单位： 米
  int ?distance;

  /// 路线耗时 单位： 秒
  BMFTime ?duration;

  /// 路线起点信息
  BMFRouteNode ?starting;

  /// 路线终点信息
  BMFRouteNode ?terminal;

  /// 路线名称(预留字段，现为空)
  String ?title;

  /// 有参构造
  BMFRouteLine(
      {this.distance, this.duration, this.starting, this.terminal, this.title});

  /// map => BMFRouteLine
  BMFRouteLine.fromMap(Map map)
      : assert(map != null,
            'Construct a BMFRouteLine，The parameter map cannot be null !') {
    distance = map['distance'];
    duration =
        map['duration'] == null ? null : BMFTime.fromMap(map['duration']);
    starting =
        map['starting'] == null ? null : BMFRouteNode.fromMap(map['starting']);
    terminal =
        map['terminal'] == null ? null : BMFRouteNode.fromMap(map['terminal']);
    title = map['title'];
  }
  @override
  fromMap(Map map) {
    if (map == null) {
      return null;
    }
    return BMFRouteLine(
        distance: map['distance'],
        duration: BMFTime.fromMap(map['duration']),
        starting: BMFRouteNode.fromMap(map['starting']),
        terminal: BMFRouteNode.fromMap(map['terminal']),
        title: map['title']);
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'distance': this.distance,
      'duration': this.duration?.toMap(),
      'starting': this.starting?.toMap(),
      'terminal': this.terminal?.toMap(),
      'title': this.title
    };
  }
}

/// 此类表示一个换乘路线，换乘路线将根据既定策略调配多种交通工具
class BMFTransitRouteLine extends BMFRouteLine implements BMFModel {
  /// 路线中的所有路段
  List<BMFTransitStep> ?steps;

  /// 有参构造
  BMFTransitRouteLine(
      {required int distance,
      required BMFTime duration,
      required BMFRouteNode starting,
      required BMFRouteNode terminal,
      required String title,
      this.steps})
      : super(
            distance: distance,
            duration: duration,
            starting: starting,
            terminal: terminal,
            title: title);

  /// map => BMFTransitRouteLine
  BMFTransitRouteLine.fromMap(Map map) : super.fromMap(map) {
    if (map['steps'] != null) {
      steps = [] as List<BMFTransitStep>;
      map['steps'].forEach((v) {
        steps!.add(BMFTransitStep.fromMap(v as Map));
      });
    }
  }

  @override
  fromMap(Map map) {
    return BMFTransitRouteLine.fromMap(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'distance': this.distance,
      'duration': this.duration?.toMap(),
      'starting': this.starting?.toMap(),
      'terminal': this.terminal?.toMap(),
      'title': this.title,
      'steps': this.steps?.map((e) => e.toMap()).toList()
    };
  }
}

/// 此类表示一条公共交通路线
class BMFMassTransitRouteLine extends BMFRouteLine implements BMFModel {
  /// 路线中的所有路段
  List<BMFMassTransitStep> ?steps;

  /// 路线花费
  double ?price;

  /// 有参构造
  BMFMassTransitRouteLine(
      {required int distance,
      required BMFTime duration,
      required BMFRouteNode starting,
      required BMFRouteNode terminal,
      required String title,
      this.steps,
      this.price})
      : super(
            distance: distance,
            duration: duration,
            starting: starting,
            terminal: terminal,
            title: title);

  /// map => BMFMassTransitRouteLine
  BMFMassTransitRouteLine.fromMap(Map map) : super.fromMap(map) {
    if (map['steps'] != null) {
      steps = [] as List<BMFMassTransitStep>;
      map['steps'].forEach((v) {
        steps!.add(BMFMassTransitStep.fromMap(v as Map));
      });
    }
    price = map['price'];
  }

  @override
  fromMap(Map map) {
    return BMFMassTransitRouteLine.fromMap(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'distance': this.distance,
      'duration': this.duration?.toMap(),
      'starting': this.starting?.toMap(),
      'terminal': this.terminal?.toMap(),
      'title': this.title,
      'steps': this.steps?.map((e) => e.toMap()).toList(),
      'price': this.price
    };
  }
}

/// 此类表示一条步行路线
class BMFWalkingRouteLine extends BMFRouteLine implements BMFModel {
  /// 路线中的所有路段
  List<BMFWalkingStep> ?steps;

  /// 有参构造
  BMFWalkingRouteLine({
    required int distance,
    required BMFTime duration,
    required BMFRouteNode starting,
    required BMFRouteNode terminal,
    required String title,
    this.steps,
  }) : super(
            distance: distance,
            duration: duration,
            starting: starting,
            terminal: terminal,
            title: title);

  /// map => BMFWalkingRouteLine
  BMFWalkingRouteLine.fromMap(Map map) : super.fromMap(map) {
    if (map['steps'] != null) {
      steps = [] as List<BMFWalkingStep>;
      map['steps'].forEach((v) {
        steps.add(BMFWalkingStep.fromMap(v as Map));
      });
    }
  }

  @override
  fromMap(Map map) {
    return BMFWalkingRouteLine.fromMap(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'distance': this.distance,
      'duration': this.duration?.toMap(),
      'starting': this.starting?.toMap(),
      'terminal': this.terminal?.toMap(),
      'title': this.title,
      'steps': this.steps?.map((e) => e.toMap()).toList(),
    };
  }
}

/// 此类表示一条骑行路线
class BMFRidingRouteLine extends BMFRouteLine implements BMFModel {
  /// 路线中的所有路段
  List<BMFRidingStep> steps;

  /// 有参构造
  BMFRidingRouteLine({
    required int distance,
    required BMFTime duration,
    required BMFRouteNode starting,
    required BMFRouteNode terminal,
    required String title,
    this.steps,
  }) : super(
            distance: distance,
            duration: duration,
            starting: starting,
            terminal: terminal,
            title: title);

  /// map => BMFRidingRouteLine
  BMFRidingRouteLine.fromMap(Map map) : super.fromMap(map) {
    if (map['steps'] != null) {
      steps = [] as List<BMFRidingStep>;
      map['steps'].forEach((v) {
        steps.add(BMFRidingStep.fromMap(v as Map));
      });
    }
  }

  @override
  fromMap(Map map) {
    return BMFRidingRouteLine.fromMap(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'distance': this.distance,
      'duration': this.duration?.toMap(),
      'starting': this.starting?.toMap(),
      'terminal': this.terminal?.toMap(),
      'title': this.title,
      'steps': this.steps.map((e) => e.toMap()).toList(),
    };
  }
}

/// 此类表示一条驾车路线
class BMFDrivingRouteLine extends BMFRouteLine {
  /// 路线中的所有路段
  List<BMFDrivingStep> steps;

  /// 路线途经点列表，成员类型为BMFPlanNode
  List<BMFPlanNode> wayPoints;

  /// 路线红绿灯个数
  int lightNum;

  /// 路线拥堵米数，发起请求时需设置参数 drivingRequestTrafficType = BMF_DRIVING_REQUEST_TRAFFICE_TYPE_PATH_AND_TRAFFICE 才有值
  int congestionMetres;

  /// 路线预估打车费(元)，负数表示无打车费信息
  int taxiFares;

  /// 有参构造
  BMFDrivingRouteLine(
      {required int distance,
      required BMFTime duration,
      required BMFRouteNode starting,
      required BMFRouteNode terminal,
      required String title,
      this.steps,
      this.wayPoints,
      this.lightNum,
      this.congestionMetres,
      this.taxiFares})
      : super(
            distance: distance,
            duration: duration,
            starting: starting,
            terminal: terminal,
            title: title);

  /// map => BMFDrivingRouteLine
  BMFDrivingRouteLine.fromMap(Map map) : super.fromMap(map) {
    if (map['steps'] != null) {
      steps = [] as List<BMFDrivingStep>;
      map['steps'].forEach((v) {
        steps.add(BMFDrivingStep.fromMap(v as Map));
      });
    }
    if (map['wayPoints'] != null) {
      wayPoints = [] as List<BMFPlanNode>;
      map['wayPoints'].forEach((v) {
        wayPoints.add(BMFPlanNode.fromMap(v as Map));
      });
    }
    lightNum = map['lightNum'];
    congestionMetres = map['congestionMetres'];
    taxiFares = map['taxiFares'];
  }

  @override
  fromMap(Map map) {
    return BMFDrivingRouteLine.fromMap(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'distance': this.distance,
      'duration': this.duration?.toMap(),
      'starting': this.starting?.toMap(),
      'terminal': this.terminal?.toMap(),
      'title': this.title,
      'steps': this.steps.map((e) => e.toMap()).toList(),
      'wayPoints': this.wayPoints.map((e) => e.toMap()).toList(),
      'lightNum': this.lightNum,
      'congestionMetres': this.congestionMetres,
      'taxiFares': this.taxiFares
    };
  }
}

/// 此类表示一个室内路线
class BMFIndoorRouteLine extends BMFRouteLine implements BMFModel {
  /// 路线中的所有路段
  List<BMFIndoorRouteStep> steps;

  /// 有参构造
  BMFIndoorRouteLine(
      {required int distance,
      required BMFTime duration,
      required BMFRouteNode starting,
      required BMFRouteNode terminal,
      required String title,
      this.steps})
      : super(
            distance: distance,
            duration: duration,
            starting: starting,
            terminal: terminal,
            title: title);

  /// map => BMFIndoorRouteLine
  BMFIndoorRouteLine.fromMap(Map map) : super.fromMap(map) {
    if (map['steps'] != null) {
      steps = [] as List<BMFIndoorRouteStep>;
      map['steps'].forEach((v) {
        steps.add(BMFIndoorRouteStep.fromMap(v as Map));
      });
    }
  }

  @override
  fromMap(Map map) {
    return BMFIndoorRouteLine.fromMap(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'distance': this.distance,
      'duration': this.duration?.toMap(),
      'starting': this.starting?.toMap(),
      'terminal': this.terminal?.toMap(),
      'title': this.title,
      'steps': this.steps.map((e) => e.toMap()).toList()
    };
  }
}
