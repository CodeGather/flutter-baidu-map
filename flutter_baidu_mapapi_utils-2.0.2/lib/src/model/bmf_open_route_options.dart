import 'package:flutter/material.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart'
    show BMFModel, BMFCoordinate;

/// 调起客户端的导航类型
enum BMFOpenRouteType {
  ///<调起百度地图步行路线
  WalkingRoute,

  ///<调起百度地图驾车路线
  DrivingRoute,

  ///<调起百度地图公共交通路线
  TransitRoute,
}

/// 交通路线策略
enum BMFOpenTransitPolicy {
  ///<推荐
  RECOMMAND,

  ///<少换乘
  TRANSFER_FIRST,

  ///<少步行
  WALK_FIRST,

  ///<不坐地铁
  NO_SUBWAY,

  ///<时间短
  TIME_FIRST,
}

/// 调起客户端路线参数
class BMFOpenRouteOption implements BMFModel {
  /// 路线起点， 经纬度坐标
  late BMFCoordinate startCoord;

  /// 路线起点名称
  String ?startName;

  /// 路线终点， 经纬度坐标
  late BMFCoordinate endCoord;

  /// 路线终点名称
  String ?endName;

  /// 调起路线类型
  late BMFOpenRouteType routeType;

  /// 交通路线策略 默认T: RANSIT_RECOMMAND
  /// 异常值时: 强制使用RECOMMAND
  /// 调起百度地图公共交通路线时必填参数
  BMFOpenTransitPolicy ?transitPolicy;

  /// 指定返回自定义scheme (ios)
  String ?appScheme;

  /// 调起百度地图客户端失败后，是否支持调起web地图，默认：true
  bool ?isSupportWeb;

  /// BMFOpenRouteOption 构造方法
  BMFOpenRouteOption(
      {required this.startCoord,
      this.startName,
      required this.endCoord,
      this.endName,
      required this.routeType,
      this.transitPolicy = BMFOpenTransitPolicy.RECOMMAND,
      this.appScheme,
      this.isSupportWeb = true});

  /// map => BMFOpenRouteOption
  BMFOpenRouteOption.fromMap(Map ?map)
      : assert(map != null,
            'Construct a BMFOpenRouteOption，The parameter map cannot be null !'),
        assert(map!.containsKey('startCoord')),
        assert(map!.containsKey('endCoord')),
        assert(map!.containsKey('routeTyp')) {
    startCoord = (map!['startCoord'] == null
        ? null
        : BMFCoordinate.fromMap(map['startCoord']))!;
    endCoord =
        (map!['endCoord'] == null ? null : BMFCoordinate.fromMap(map['endCoord']))!;
    startName = map['startName'];
    endName = map['endName'];
    routeType = BMFOpenRouteType.values[map['naviType'] as int];
    transitPolicy =
        BMFOpenTransitPolicy.values[(map['transitPolicy'] as int) - 3];
    appScheme = map['appScheme'];
    isSupportWeb = map['isSupportWeb'] as bool;
  }

  @override
  fromMap(Map map) {
    return BMFOpenRouteOption.fromMap(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'startCoord': this.startCoord.toMap(),
      'startName': this.startName,
      'endCoord': this.endCoord.toMap(),
      'endName': this.endName,
      'routeType': this.routeType.index,
      'transitPolicy': this.transitPolicy!.index + 3, // native 初始值为3
      'appScheme': this.appScheme,
      'isSupportWeb': this.isSupportWeb
    };
  }
}
