/// 设置定位活动类型的枚举
enum LocationActivityType {
  /// 未知的出行活动类型
  Other,

  /// 车辆导航模式
  AutomotiveNavigation,

  /// 行人模式
  Fitness,

  /// 其他交通工具模式
  OtherNavigation,

  /// 飞行模式（iOS12及以上生效）
  Airborne
}

/// 期望的定位精度枚举
enum LocationAccuracy {
  /// 导航最高精确
  BestForNavigation,

  /// 高精确
  Best,

  /// 十米
  NearestTenMeters,

  /// 百米
  HundredMeters,

  /// 千米
  Kilometer,

  /// 三公里
  ThreeKilometers
}
