import 'package:flutter_baidu_yingyan_trace/src/model/base_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/fence.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/fence_types.dart';

/// 查询围栏响应结果
class QueryFenceListResult extends BaseResult {
  /// 返回的结果条数
  int ?size;

  /// 所有围栏的个数。 服务端围栏查询使用
  int ?totalSize;

  /// 围栏类型
  FenceType ?fenceType;

  /// 围栏信息列表
  List<FenceInfo> ?fenceInfos;

  QueryFenceListResult.fromMap(Map map)
      : assert(map != null),
        super.fromMap(map) {
    size = map['size'];
    totalSize = map['totalSize'];
    fenceType = map['fenceType'] == null
        ? null
        : FenceType.values[map['fenceType'] as int];
    if (map['fenceInfos'] != null) {
      fenceInfos = <FenceInfo>[];
      map['fenceInfos'].forEach((e) {
        fenceInfos!.add(FenceInfo.fromMap(e as Map));
      });
    }
  }

  @override
  Map toMap() {
    Map map = super.toMap();
    map['size'] = this.size;
    map['totalSize'] = this.totalSize;
    map['fenceType'] = this.fenceType?.index;
    map['fenceInfos'] = this.fenceInfos?.map((e) => e.toMap()).toList();
    return map;
  }
}

/// 围栏信息
class FenceInfo {
  /// 围栏形状
  FenceShape ?fenceShape;

  /// 圆形围栏：仅当围栏形状(fenceShape)为圆形(circle)时，circleFence才有值
  CircleFence ?circleFence;

  /// 多边形围栏：仅当围栏形状(fenceShape)为多边形(polygon)时，polygonFence才有值
  PolygonFence ?polygonFence;

  /// 多段线围栏：仅当围栏形状(fenceShape)为多段线(polyline)时，polylineFence才有值
  PolylineFence ?polylineFence;

  /// 行政区划围栏：仅当围栏形状(fenceShape)为行政区划(district)时，districtFence才有值
  DistrictFence ?districtFence;

  /// 创建时间
  String ?createTime;

  /// 修改时间
  String ?modifyTime;

  FenceInfo.fromMap(Map map) : assert(map != null) {
    fenceShape = map['fenceShape'] == null
        ? null
        : FenceShape.values[map['fenceShape'] as int];
    circleFence = map['circleFence'] == null
        ? null
        : CircleFence.fromMap(map['circleFence']);
    polygonFence = map['polygonFence'] == null
        ? null
        : PolygonFence.fromMap(map['polygonFence']);
    polylineFence = map['polylineFence'] == null
        ? null
        : PolylineFence.fromMap(map['polylineFence']);
    districtFence = map['districtFence'] == null
        ? null
        : DistrictFence.fromMap(map['districtFence']);
    createTime = map['createTime'];
    modifyTime = map['modifyTime'];
  }

  Map toMap() {
    return {
      'fenceShape': this.fenceShape?.index,
      'circleFence': this.circleFence?.toMap(),
      'polygonFence': this.polygonFence?.toMap(),
      'polylineFence': this.polylineFence?.toMap(),
      'districtFence': this.districtFence?.toMap(),
      'createTime': this.createTime,
      'modifyTime': this.modifyTime
    };
  }
}
