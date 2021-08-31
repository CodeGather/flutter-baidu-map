import 'package:flutter_baidu_yingyan_trace/src/model/coord_type.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/fence_types.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/lat_lng.dart';

/// 围栏对象
class Fence {
  /// 围栏编号（服务端返回）
  int ?fenceId;

  /// 围栏名称
  String ?fenceName;

  /// 监控对象
  /// 新建地理围栏时必填，必须为非空字符串。
  /// 更新地理围栏时选填。
  /// 地理围栏支持监控一至多个entity，用法如下：
  /// 1. 监控一个entity，直接设置该字段的值为被监控对象的entityName即可
  /// 2. 监控多个entity，先按照情况1创建一个监控单个entity的围栏，再调用addmonitoredperson接口添加其他被监控对象
  /// 3. 监控全部entity，将此字段的值设置为'#allentity'
  String ?monitoredPerson;

  /// 围栏去噪参数
  /// 地理围栏的去燥精度。
  /// 每个轨迹点都有一个定位误差半径radius，这个值越大，代表定位越不准确，可能是噪点。围栏计算时，如果噪点也参与计算，会造成误报的情况。设置denoise可控制，当轨迹点的定位误差半径大于设置值时，就会把该轨迹点当做噪点，不参与围栏计算。
  /// 可选，如果不设置，该值默认为0，不去噪。
  /// 单位：米。
  /// 精度的值必须为正整数。
  int ?deNoise;

  /// 围栏类型（本地围栏、服务端围栏）
  FenceType ?fenceType;

  /// 围栏形状
  FenceShape ?fenceShape;

  Fence(
      {required this.fenceType,
      required this.fenceShape,
      this.fenceId,
      this.fenceName,
      this.monitoredPerson,
      this.deNoise: 0});

  Fence.fromMap(Map map) {
    fenceId = map['fenceId'];
    fenceName = map['fenceName'];
    monitoredPerson = map['monitoredPerson'];
    fenceType = map['fenceType'] == null
        ? null
        : FenceType.values[map['fenceType'] as int];
    deNoise = map['deNoise'];
    fenceShape = map['fenceShape'] == null
        ? null
        : FenceShape.values[map['fenceShape'] as int];
  }

  Map toMap() {
    return {
      'fenceId': this.fenceId,
      'fenceName': this.fenceName,
      'monitoredPerson': this.monitoredPerson,
      'fenceType': this.fenceType?.index,
      'deNoise': this.deNoise,
      'fenceShape': this.fenceShape?.index
    };
  }
}

/// 圆形围栏对象
class CircleFence extends Fence {
  /// 圆心坐标 （必填）
  LatLng ?center;

  /// 半径(单位:米）（必填）
  double ?radius;

  /// 坐标类型，默认百度经纬度 （必填）
  CoordType ?coordType;

  CircleFence.buildLocalFence(
      {required this.center,
      required this.radius,
        required int fenceId,
        required String fenceName,
        required String monitoredPerson,
      int deNoise: 0,
      this.coordType: CoordType.BD09LL})
      : assert(center != null),
        assert(radius != null),
        super(
            fenceId: fenceId,
            fenceName: fenceName,
            monitoredPerson: monitoredPerson,
            deNoise: deNoise,
            fenceType: FenceType.local,
            fenceShape: FenceShape.circle);

  CircleFence.buildServerFence({
    required this.center,
    required this.radius,
    required int fenceId,
    required String fenceName,
    required String monitoredPerson,
    int deNoise: 0,
    this.coordType: CoordType.BD09LL,
  })  : assert(center != null),
        assert(radius != null),
        super(
            fenceId: fenceId,
            fenceName: fenceName,
            monitoredPerson: monitoredPerson,
            deNoise: deNoise,
            fenceType: FenceType.server,
            fenceShape: FenceShape.circle);

  CircleFence.fromMap(Map map)
      : assert(map != null),
        super.fromMap(map) {
    center = map['center'] == null ? null : LatLng.fromMap(map['center']);
    radius = map['radius'];

    if (map['coordType'] != null) {
      int value = map['coordType'] as int;
      if (value >= 0 && value <= 2) {
        coordType = CoordType.values[value];
      }
    }
  }

  @override
  Map toMap() {
    Map map = super.toMap();
    map['center'] = this.center?.toMap();
    map['radius'] = this.radius;
    map['coordType'] = this.coordType?.index;
    return map;
  }
}

/// 多边形围栏对象
class PolygonFence extends Fence {
  /// 顶点坐标集（必填）
  List<LatLng> ?vertexes;

  /// 坐标类型，默认百度经纬度（必填）
  CoordType ?coordType;

  PolygonFence.buildServerFence(
      {required this.vertexes,
        required int fenceId,
        String ?fenceName,
        required String monitoredPerson,
      int deNoise: 0,
      this.coordType: CoordType.BD09LL})
      : assert(vertexes != null),
        super(
            fenceId: fenceId,
            fenceName: fenceName,
            monitoredPerson: monitoredPerson,
            deNoise: deNoise,
            fenceType: FenceType.server,
            fenceShape: FenceShape.polygon);

  PolygonFence.fromMap(Map map)
      : assert(map != null),
        super.fromMap(map) {
    if (map['vertexes'] != null) {
      vertexes = <LatLng>[];
      map['vertexes'].forEach((e) {
        vertexes!.add(LatLng.fromMap(e as Map));
      });
    }
    if (map['coordType'] != null) {
      int value = map['coordType'] as int;
      if (value >= 0 && value <= 2) {
        coordType = CoordType.values[value];
      }
    }
  }

  @override
  Map toMap() {
    Map map = super.toMap();
    map['vertexes'] = this.vertexes?.map((e) => e.toMap()).toList();
    map['coordType'] = this.coordType?.index;
    return map;
  }
}

/// 多段线围栏
class PolylineFence extends Fence {
  /// 顶点坐标集 （必填）
  List<LatLng> ?vertexes;

  /// 偏离距离 （必填）
  int ?offset;

  /// 坐标类型，默认百度经纬度 （必填）
  CoordType ?coordType;

  PolylineFence.buildServerFence(
      {required this.vertexes,
      required this.offset,
        required int fenceId,
        String ?fenceName,
        required String monitoredPerson,
      int deNoise: 0,
      this.coordType: CoordType.BD09LL})
      : assert(vertexes != null),
        super(
            fenceId: fenceId,
            fenceName: fenceName,
            monitoredPerson: monitoredPerson,
            deNoise: deNoise,
            fenceType: FenceType.server,
            fenceShape: FenceShape.polyline);

  PolylineFence.fromMap(Map map)
      : assert(map != null),
        super.fromMap(map) {
    if (map['vertexes'] != null) {
      vertexes = <LatLng>[];
      map['vertexes'].forEach((e) {
        vertexes!.add(LatLng.fromMap(e as Map));
      });
    }
    offset = map['offset'];
    if (map['coordType'] != null) {
      int value = map['coordType'] as int;
      if (value >= 0 && value <= 2) {
        coordType = CoordType.values[value];
      }
    }
  }

  @override
  Map toMap() {
    Map map = super.toMap();
    map['vertexes'] = this.vertexes?.map((e) => e.toMap()).toList();
    map['offset'] = this.offset;
    map['coordType'] = this.coordType?.index;
    return map;
  }
}

/// 行政区划围栏围栏对象
class DistrictFence extends Fence {
  /// 行政区划关键字（必填）
  /// 行政区划关键字，必填。
  /// 支持中国国家、省、市、区/县名称。请尽量输入完整的行政区层级和名称，保证名称的唯一性。
  /// 若输入的行政区名称匹配多个行政区，围栏将创建失败。示例： 中国 北京市 湖南省长沙市 湖南省长沙市雨花区
  String ?keyword;

  /// 结构化的行政区划描述
  /// 注：仅在查询行政区域围栏时，该字段有值。
  String ?district;

  /// 坐标类型，默认百度经纬度（必填）
  CoordType ?coordType;

  DistrictFence.buildServerFence(
      {required this.keyword,
        required int fenceId,
         String ?fenceName,
        required String monitoredPerson,
      int deNoise: 0,
      this.coordType: CoordType.BD09LL,
      this.district})
      : assert(keyword != null),
        super(
            fenceId: fenceId,
            fenceName: fenceName,
            monitoredPerson: monitoredPerson,
            deNoise: deNoise,
            fenceType: FenceType.server,
            fenceShape: FenceShape.district);

  DistrictFence.fromMap(Map map)
      : assert(map != null),
        super.fromMap(map) {
    keyword = map['keyword'];
    district = map['district'];
    if (map['coordType'] != null) {
      int value = map['coordType'] as int;
      if (value >= 0 && value <= 2) {
        coordType = CoordType.values[value];
      }
    }
  }

  @override
  Map toMap() {
    Map map = super.toMap();
    map['keyword'] = this.keyword;
    map['district'] = this.district;
    map['coordType'] = this.coordType?.index;
    return map;
  }
}
