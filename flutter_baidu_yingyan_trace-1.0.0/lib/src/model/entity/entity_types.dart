/// 行政区搜索返回值内容
enum ReturnType {
  /// 仅返回 total，即符合本次检索条件的所有entity 数量（若仅需行政区内entity数量，建议选择 simple，将提升检索性能）
  simple,

  /// 返回全部结果
  all
}

/// 排序规则
enum SortType {
  /// 按定位时间升序排序
  asc,

  /// 按定位时间降序排序
  desc
}
