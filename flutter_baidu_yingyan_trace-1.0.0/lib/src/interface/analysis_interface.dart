import 'package:flutter/foundation.dart';
import 'package:flutter_baidu_yingyan_trace/src/callback/analysis_callback.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/analysis/driving_behavior_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/analysis/stay_point_analysis_option.dart';

/// 轨迹分析相关操接口
abstract class AnalysisInterface {
  /// 停留点分析
  @required
  Future<bool> analyzeStayPoint(
      {required StayPointAnalysisOption stayPointAnalysisOption,
      AnalysisCallBack analysisCallBack});

  /// 驾驶行为分析
  @required
  Future<bool> analyzeDrivingBehaviour(
      {required DrivingBehaviourAnalysisOption drivingBehaviourAnalysisOption,
      AnalysisCallBack analysisCallBack});
}
