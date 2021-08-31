/// 缓存轨迹信息
class CacheTrackInfo {

  /// 缓存轨迹所属entity
  String ?entityName;

  /// 所属entity对应的缓存数据量。
  ///
  /// 仅在查询缓存轨迹时，该字段有效；
  /// 删除缓存轨迹时，该字段无效。
  int ?total;

  /// 开始时间
  ///
  /// 查询缓存轨迹时，为所属entity对应缓存轨迹的开始时间；
  /// 删除缓存轨迹时，为要删除缓存轨迹的开始时间。
  int ?startTime;

  /// 结束时间
  ///
  /// 查询轨迹时，为所属entity对应缓存轨迹的结束时间；
  ///
  /// 删除缓存轨迹时，为要删除缓存轨迹的结束时间。
  int ?endTime;

  /// 缓存轨迹的距离，单位：米
  ///
  /// 查询轨迹时，为所属entity对应缓存轨迹的距离；
  /// entityName为null或空串时，表示查询所有entity的缓存轨迹的距离
  double cacheDistance = 0;

  CacheTrackInfo.fromMap(Map map) : assert(map != null) {
    entityName = map['entityName'];
    total = map['total'];
    startTime = map['startTime'];
    endTime = map['endTime'];
    cacheDistance = map['cacheDistance'];
  }

  Map toMap() {
    return {
      "entityName": this.entityName,
      "total": this.total,
      "startTime": this.startTime,
      "endTime": this.endTime,
      "cacheDistance": this.cacheDistance
    };
  }

}
