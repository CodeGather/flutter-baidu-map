import 'track_point.dart';

class FailInfo {
  /// 输入参数不正确导致上传失败的点集
  List<ParamError> ?paramErrors;

  /// 服务器内部错误导致上传失败的点集
  List<InternalError> ?internalErrors;

  FailInfo.fromMap(Map map) : assert(map != null) {
    if (map['paramErrors'] != null) {
      paramErrors = <ParamError>[];
      map['paramErrors'].forEach((e) {
        paramErrors!.add(ParamError.fromMap(e as Map));
      });
    }

    if (map['internalErrors'] != null) {
      internalErrors = <InternalError>[];
      map['internalErrors'].forEach((e) {
        internalErrors!.add(InternalError.fromMap(e as Map));
      });
    }
  }

  Map toMap() {
    return {
      "paramErrors": paramErrors?.map((e) => e.toMap()).toList(),
      "internalErrors": internalErrors?.map((e) => e.toMap()).toList()
    };
  }
}

class InternalError {
  /// Entity唯一标识
  String ?entityName;

  /// 轨迹点信息
  TrackPoint ?trackPoint;

  InternalError.fromMap(Map map) : assert(map != null) {
    entityName = map['entityName'];
    trackPoint = map['trackPoint'] == null
        ? null
        : TrackPoint.fromMap(map['trackPoint'] as Map);
  }

  Map toMap() {
    return {
      "entityName": this.entityName,
      "trackPoint": this.trackPoint?.toMap(),
    };
  }
}

class ParamError extends InternalError {
  /// 错误信息
  String ?error;

  ParamError.fromMap(Map map)
      : assert(map != null),
        super.fromMap(map) {
    error = map['error'];
  }

  @override
  Map toMap() {
    Map map = super.toMap();
    map['error'] = this.error;
    return map;
  }
}
