import 'package:flutter_baidu_yingyan_trace/src/model/base_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/coord_type.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/fence.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/lat_lng.dart';

/// 创建围栏请求参数
class CreateFenceOption extends BaseOption {
  /// 围栏对象
  Fence ?fence;

  /// 构建创建本地圆形围栏请求参数
  CreateFenceOption.buildLocalCircleOption(
      {required int tag,
      required int serviceId,
      required LatLng center,
      required double radius,
      required String monitoredPerson,
        required String fenceName,
      int deNoise: 0,
      CoordType coordType: CoordType.BD09LL})
      : super(tag: tag, serviceId: serviceId) {
    fence = CircleFence.buildLocalFence(
        fenceId: 0,
        fenceName: fenceName,
        center: center,
        radius: radius,
        deNoise: deNoise,
        monitoredPerson: monitoredPerson,
        coordType: coordType);
  }

  /// 构建创建服务端圆形围栏请求参数
  CreateFenceOption.buildServerCircleFenceOption(
      {required int tag,
      required int serviceId,
      required LatLng center,
      required double radius,
      required String monitoredPerson,
        required String fenceName,
      int deNoise: 0,
      CoordType coordType: CoordType.BD09LL})
      : super(tag: tag, serviceId: serviceId) {
    fence = CircleFence.buildServerFence(
        fenceId: 0,
        fenceName: fenceName,
        center: center,
        radius: radius,
        deNoise: deNoise,
        monitoredPerson: monitoredPerson,
        coordType: coordType);
  }

  /// 构建创建服务端多边形围栏请求参数
  CreateFenceOption.buildServerPolygonFenceOption(
      {required int tag,
      required int serviceId,
      required List<LatLng> vertexes,
      required String monitoredPerson,
      String ?fenceName,
      int deNoise: 0,
      CoordType coordType: CoordType.BD09LL})
      : super(tag: tag, serviceId: serviceId) {
    fence = PolygonFence.buildServerFence(
        fenceId: 0,
        fenceName: fenceName,
        vertexes: vertexes,
        deNoise: deNoise,
        monitoredPerson: monitoredPerson,
        coordType: coordType);
  }

  /// 构建创建服务端线形围栏请求参数
  CreateFenceOption.buildServerPolylineFenceOption(
      {required int tag,
      required int serviceId,
      required List<LatLng> vertexes,
      required int offset,
      required String monitoredPerson,
      String ?fenceName,
      int deNoise: 0,
      CoordType coordType: CoordType.BD09LL})
      : super(tag: tag, serviceId: serviceId) {
    fence = PolylineFence.buildServerFence(
        fenceId: 0,
        fenceName: fenceName,
        vertexes: vertexes,
        offset: offset,
        deNoise: deNoise,
        monitoredPerson: monitoredPerson,
        coordType: coordType);
  }

  /// 构建创建服务端行政区域围栏请求参数
  CreateFenceOption.buildServerDistrictFenceOption(
      {required int tag,
      required int serviceId,
      required String keyword,
      required String monitoredPerson,
      String ?fenceName,
      String ?district,
      int deNoise: 0,
      CoordType coordType: CoordType.BD09LL})
      : super(tag: tag, serviceId: serviceId) {
    fence = DistrictFence.buildServerFence(
        fenceId: 0,
        fenceName: fenceName,
        keyword: keyword,
        district: district,
        deNoise: deNoise,
        monitoredPerson: monitoredPerson,
        coordType: coordType);
  }

  @override
  Map toMap() {
    Map map = super.toMap();
    map['fence'] = fence?.toMap();
    return map;
  }
}
