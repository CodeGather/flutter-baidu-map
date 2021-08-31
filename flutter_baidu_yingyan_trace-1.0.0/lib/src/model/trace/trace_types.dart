/// 改变采集和打包间隔的执行结果的错误码
enum SetIntervalErrorCode {
  /// 成功
  NO_ERROR,

  /// 参数错误
  PARAM_ERROR
}

///  设置缓存占用的最大磁盘空间的执行结果的错误码
enum SetCacheMaxSizeErrorCode {
  /// 成功
  NO_ERROR,

  /// 服务内部错误
  INTERNAL_ERROR,

  /// 参数错误
  PARAM_ERROR
}
