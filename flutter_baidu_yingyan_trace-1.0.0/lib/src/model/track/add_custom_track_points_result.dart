import 'package:flutter_baidu_yingyan_trace/src/model/base_result.dart';

import 'fail _info.dart';

/// 批量添加轨迹点响应类
class AddCustomTrackPointsResult extends BaseResult {
  /// 上传成功的点个数
  int ?successNum;

  /// 上传失败的点信息
  FailInfo ?failInfo;

  AddCustomTrackPointsResult.fromMap(Map map) : super.fromMap(map) {
    successNum = map['successNum'];
    if (map['failInfo'] != null) {
      failInfo = FailInfo.fromMap(map['failInfo'] as Map);
    }
  }

  @override
  Map toMap() {
    Map map = super.toMap();
    map['successNum'] = successNum;
    map['failInfo'] = failInfo?.toMap();
    return map;
  }
}
