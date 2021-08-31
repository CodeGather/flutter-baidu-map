import 'package:flutter_baidu_yingyan_trace/src/model/analysis/stay_point.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/base_result.dart';

/// 停留点响应
class StayPointAnalysisResult extends BaseResult {
  /// 停留次数
  int ?stayPointNum;

  /// 停留记录列表
  List<StayPoint> ?stayPoints;

  StayPointAnalysisResult.fromMap(Map map)
      : assert(map != null),
        super.fromMap(map) {
    stayPointNum = map['stayPointNum'];
    if (map['stayPoints'] != null) {
      stayPoints = <StayPoint>[];
      map['stayPoints'].forEach((e) {
        stayPoints!.add(StayPoint.fromMap(e as Map));
      });
    }
  }

  @override
  Map toMap() {
    Map map = super.toMap();
    map['stayPointNum'] = this.stayPointNum;
    map['stayPoints'] = this.stayPoints?.map((e) => e.toMap()).toList();
    return map;
  }
}
