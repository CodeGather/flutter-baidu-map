import 'package:flutter_baidu_yingyan_trace/src/model/base_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/fence_types.dart';

/// 更新围栏响应结果
class UpdateFenceResult extends BaseResult {
  /// 围栏ID (android）
  int ?fenceId;

  /// 围栏名称 (android）
  String ?fenceName;

  /// 围栏类型 (android）
  FenceType ?fenceType;

  /// 围栏形状 (android）
  FenceShape ?fenceShape;

  /// 结构化的行政区划描述
  /// 注：只在行政区划围栏创建成功时，该字段有值。
  String ?district;

  /// 关键字匹配的行政区划列表
  /// 注：只在行政区划围栏创建失败时（关键字匹配至多个行政区），该字段有值。
  List<String> ?districtList;

  UpdateFenceResult.fromMap(Map map)
      : assert(map != null),
        super.fromMap(map) {
    fenceId = map['fenceId'];
    fenceName = map['fenceName'];
    fenceType = map['fenceType'] == null
        ? null
        : FenceType.values[map['fenceType'] as int];
    fenceShape = map['fenceShape'] == null
        ? null
        : FenceShape.values[map['fenceShape'] as int];
    district = map['district'];
    if (map['districtList'] != null) {
      districtList = [] as List<String>;
      map['districtList'].forEach((e) {
        districtList!.add(e as String);
      });
    }
  }

  @override
  Map toMap() {
    Map map = super.toMap();
    map['fenceId'] = this.fenceId;
    map['fenceName'] = this.fenceName;
    map['fenceType'] = this.fenceType?.index;
    map['fenceShape'] = this.fenceShape?.index;
    map['district'] = this.district;
    map['districtList'] = this.districtList?.map((e) => e)?.toList();
    return map;
  }
}
