import 'package:flutter_baidu_yingyan_trace/src/model/base_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/cache_track_info.dart';

/// 查询缓存轨迹请求
class QueryTrackCacheInfoResult extends BaseResult {
  /// 查询结果
  List<CacheTrackInfo> ?cacheInfoResult;

  /// map => QueryTrackCacheInfoResult
  QueryTrackCacheInfoResult.fromMap(Map map)
      : assert(map != null,
            'Construct a QueryTrackCacheInfoResult，The parameter map cannot be null !'),
        super.fromMap(map) {
    if (map['cacheInfoResult'] != null) {
      cacheInfoResult = <CacheTrackInfo>[];
      map['cacheInfoResult'].forEach((e) {
        cacheInfoResult!.add(CacheTrackInfo.fromMap(e as Map));
      });
    }
  }

  @override
  Map toMap() {
    Map map = super.toMap();
    map['cacheInfoResult'] =
        this.cacheInfoResult?.map((e) => e.toMap()).toList();
    return map;
  }
}
