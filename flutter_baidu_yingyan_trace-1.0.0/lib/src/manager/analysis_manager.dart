import 'package:flutter_baidu_yingyan_trace/src/callback/analysis_callback.dart';
import 'package:flutter_baidu_yingyan_trace/src/interface/analysis_interface.dart';
import 'package:flutter_baidu_yingyan_trace/src/manager/base_manager.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/analysis/stay_point_analysis_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/analysis/driving_behavior_option.dart';

class AnalysisManager extends BaseManager implements AnalysisInterface {
  static final AnalysisManager _instance = AnalysisManager._internal();

  factory AnalysisManager() => _instance;

  AnalysisManager._internal();

  @override
  Future<bool> analyzeDrivingBehaviour(
      {required DrivingBehaviourAnalysisOption ?drivingBehaviourAnalysisOption,
      AnalysisCallBack ?analysisCallBack}) async {
    if (drivingBehaviourAnalysisOption == null) {
      return false;
    }
    return await this.baiduYingYanMethodChannel.analyzeDrivingBehaviour(
        drivingBehaviourAnalysisOption: drivingBehaviourAnalysisOption,
        analysisCallBack: analysisCallBack);
  }

  @override
  Future<bool> analyzeStayPoint(
      {required StayPointAnalysisOption ?stayPointAnalysisOption,
      AnalysisCallBack ?analysisCallBack}) async {
    if (stayPointAnalysisOption == null) {
      return false;
    }
    return await this.baiduYingYanMethodChannel.analyzeStayPoint(
        stayPointAnalysisOption: stayPointAnalysisOption,
        analysisCallBack: analysisCallBack);
  }
}
