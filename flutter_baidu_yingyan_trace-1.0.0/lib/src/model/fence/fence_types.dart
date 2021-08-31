/// 围栏类型（本地围栏、服务端围栏）
enum FenceType {
  /// 本地围栏
  local,

  /// 服务端围栏
  server
}

/// 围栏形状（圆形、多边形、多段线、行政区划）
enum FenceShape {
  /// 圆形
  circle,

  /// 多边形
  polygon,

  /// 多线段
  polyline,

  /// 行政区划
  district
}

/// 监控动作
enum MonitoredAction {
  /// 进入围栏
  enter,

  /// 离开围栏
  exit
}

/// 监控状态
enum MonitoredStatus {
  /// 未知状态
  UNKNOWN,

  /// 在围栏内
  IN,

  /// 在围栏外
  OUT,
}
