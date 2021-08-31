import 'package:flutter_baidu_yingyan_trace/src/model/base_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/coord_type.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/fence.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/lat_lng.dart';

/// 更新围栏请求参数
class UpdateFenceOption extends BaseOption {
  /// 围栏对象
  Fence ?fence;

  /// 构建更新本地圆形围栏请求参数
  UpdateFenceOption.buildLocalCircleOption(
      {required int tag,
      required int serviceId,
      required int fenceId,
      required LatLng center,
      required double radius,
        required String fenceName,
        required String monitoredPerson,
        required int denoise,
      CoordType coordType: CoordType.BD09LL})
      : super(tag: tag, serviceId: serviceId) {
    fence = CircleFence.buildLocalFence(
        fenceId: fenceId,
        fenceName: fenceName,
        center: center,
        radius: radius,
        deNoise: denoise,
        monitoredPerson: monitoredPerson,
        coordType: coordType);
  }

  /// 构建更新服务端圆形围栏请求参数
  UpdateFenceOption.buildServerCircleFenceOption(
      {required int tag,
      required int serviceId,
      required int fenceId,
      required LatLng center,
      required double radius,
        required String fenceName,
        required String monitoredPerson,
        required int denoise,
      CoordType coordType: CoordType.BD09LL})
      : super(tag: tag, serviceId: serviceId) {
    fence = CircleFence.buildServerFence(
        fenceId: fenceId,
        fenceName: fenceName,
        center: center,
        radius: radius,
        deNoise: denoise,
        monitoredPerson: monitoredPerson,
        coordType: coordType);
  }

  /// 构建更新服务端多边形围栏请求参数
  UpdateFenceOption.buildServerPolygonFenceOption(
      {required int tag,
      required int serviceId,
      required int fenceId,
      required List<LatLng> vertexes,
        required String fenceName,
        required String monitoredPerson,
        required int denoise,
      CoordType coordType: CoordType.BD09LL})
      : super(tag: tag, serviceId: serviceId) {
    fence = PolygonFence.buildServerFence(
        fenceId: fenceId,
        fenceName: fenceName,
        vertexes: vertexes,
        deNoise: denoise,
        monitoredPerson: monitoredPerson,
        coordType: coordType);
  }

  /// 构建更新服务端线形围栏请求参数
  UpdateFenceOption.buildServerPolylineFenceOption(
      {required int tag,
      required int serviceId,
      required int fenceId,
      required List<LatLng> vertexes,
      required int offset,
        required String fenceName,
        required String monitoredPerson,
        required int denoise,
      CoordType coordType: CoordType.BD09LL})
      : super(tag: tag, serviceId: serviceId) {
    fence = PolylineFence.buildServerFence(
        fenceId: fenceId,
        fenceName: fenceName,
        vertexes: vertexes,
        offset: offset,
        deNoise: denoise,
        monitoredPerson: monitoredPerson,
        coordType: coordType);
  }

  /// 构建更新服务端行政区域围栏请求参数
  UpdateFenceOption.buildServerDistrictFenceOption(
      {required int tag,
      required int serviceId,
      required int fenceId,
      required String keyWord,
        required String fenceName,
        required String monitoredPerson,
        required String district,
        required  int denoise,
      CoordType coordType: CoordType.BD09LL})
      : super(tag: tag, serviceId: serviceId) {
    fence = DistrictFence.buildServerFence(
        fenceId: fenceId,
        fenceName: fenceName,
        keyword: keyWord,
        district: district,
        deNoise: denoise,
        monitoredPerson: monitoredPerson,
        coordType: coordType);
  }

  @override
  Map toMap() {
    Map map = super.toMap();
    map['fence'] = this.fence?.toMap();
    return map;
  }
}
