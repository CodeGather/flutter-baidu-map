import 'package:flutter_baidu_yingyan_trace/src/model/analysis/driving_behavior_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/analysis/stay_point_analysis_result.dart';

/// 停留点分析回调
typedef StayPointAnalysisCallBack = void Function(
    StayPointAnalysisResult stayPointAnalysisResult);

/// 驾车行为分析回调
typedef DrivingBehaviourAnalysisCallBack = void Function(
    DrivingBehaviourAnalysisResult drivingBehaviorResult);

/// 分析回调
class AnalysisCallBack {
  /// 停留点分析回调
  StayPointAnalysisCallBack ?onStayPointAnalysisCallBack;

  /// 驾车行为分析回调
  DrivingBehaviourAnalysisCallBack ?onDrivingBehaviourAnalysisCallBack;

  AnalysisCallBack({
    this.onStayPointAnalysisCallBack,
    this.onDrivingBehaviourAnalysisCallBack
  });
}
