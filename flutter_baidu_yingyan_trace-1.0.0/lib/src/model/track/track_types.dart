/// 查询纠偏后的实时位置时，指定被监控对象的交通方式
enum TrackProcessOptionTransportMode {
  ///  自动（由鹰眼自动识别交通方式）
  AUTO,

  /// 驾车
  DRIVING,

  /// 骑行
  RIDING,

  /// 步行
  WALKING
}

///  查询里程时中断轨迹的里程补偿方式
/// 在里程计算时，两个轨迹点定位时间间隔5分钟以上，被认为是中断。中断轨迹提供以下5种里程补偿方式。
enum TrackProcessOptionSupplementMode {
  /// 不补充，中断两点间距离不记入里程
  NO_SUPPLEMENT,

  /// 使用直线距离补充
  SUPPLEMENT_MODE_STRAIGHT,

  ///  使用最短驾车路线距离补充
  SUPPLEMENT_MODE_DRIVING,

  /// 使用最短骑行路线距离补充
  SUPPLEMENT_MODE_RIDING,

  /// 使用最短步行路线距离补充
  SUPPLEMENT_MODE_WALKING
}

///  轨迹补偿内容
enum TrackProcessOptionSupplementContent {
  /// 对于中断区间，只补偿中断的里程，不补偿轨迹点
  ONLY_DISTANCE,

  /// 对于中断区间，既补偿里程，又补偿轨迹点
  DISTANCE_AND_POINTS
}

/// 查询指定时间段内的轨迹时返回的轨迹点的时间顺序
enum TrackSortType {
  /// 按定位时间升序排序（旧->新）
  ASC,

  /// 按定位时间降序排序（新->旧）
  DESC
}
