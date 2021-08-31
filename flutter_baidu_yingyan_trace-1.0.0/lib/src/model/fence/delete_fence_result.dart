import 'package:flutter_baidu_yingyan_trace/src/model/base_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/fence_types.dart';

/// 删除围栏响应结果
class DeleteFenceResult extends BaseResult {
  /// 围栏类型 (android）
  FenceType ?fenceType;

  /// 删除成功的地理围栏的ID数组
  List<String> ?fenceIds;

  /// 关键字匹配的行政区划列表
  /// 注：只在行政区划围栏创建失败时（关键字匹配至多个行政区），该字段有值。
  List<String> ?districtList;

  DeleteFenceResult.fromMap(Map map)
      : assert(map != null),
        super.fromMap(map) {
    fenceType = map['fenceType'] == null
        ? null
        : FenceType.values[map['fenceType'] as int];
    if (map['fenceIds'] != null) {
      fenceIds = List.generate(0, (index) => "");
      map['fenceIds'].forEach((e) {
        fenceIds!.add(e);
      });
    }
  }

  @override
  Map toMap() {
    Map map = super.toMap();
    map['fenceType'] = this.fenceType?.index;
    map['fenceIds'] = this.fenceIds?.map((e) => e).toList();
    return map;
  }
}
