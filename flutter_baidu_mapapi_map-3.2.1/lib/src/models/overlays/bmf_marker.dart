import 'dart:typed_data';

import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart'
    show BMFCoordinate, BMFPoint;
import 'package:flutter_baidu_mapapi_map/flutter_baidu_mapapi_map.dart';
import 'package:flutter_baidu_mapapi_map/src/models/overlays/bmf_overlay.dart';
import 'package:flutter_baidu_mapapi_map/src/private/mapdispatcher/bmf_map_dispatcher_factory.dart';

/// marker拖拽状态枚举
enum BMFMarkerDragState {
  ///< 静止状态.
  None,

  ///< 开始拖动
  Starting,

  ///< 拖动中
  Dragging,

  ///< 取消拖动
  Canceling,

  ///< 拖动结束
  Ending
}

/// marker展示优先级 iOS独有
class BMFMarkerDisplayPriority {
  /// 常规marker级别高
  static const int High = 750;

  /// 常规marker级别中，其中罗盘模式下，罗盘中的图片使用本级别,精度圈使用本级别。
  static const int Middle = 500;

  /// 常规marker级别低
  static const int Low = 250;
}

/// 大头针
class BMFMarker extends BMFOverlay {
  /// 标题
  String? title;

  /// 子标题
  ///
  /// iOS独有
  String? subtitle;

  /// marker位置经纬度
  late BMFCoordinate position;

  /// 标注固定在指定屏幕位置,  必须与screenPointToLock一起使用。
  ///
  /// 注意：拖动Marker isLockedToScreen会被设置为false。
  /// 若isLockedToScreen为true，拖动地图时marker不会跟随移动；
  /// 若isLockedToScreen为false，拖动地图时marker会跟随移动。
  bool? isLockedToScreen;

  /// 标注锁定在屏幕上的位置，
  ///
  /// 注意：地图初始化后才能设置screenPointToLock。可以在地图加载完成的回调方法：mapViewDidFinishLoading中使用此属性。
  BMFPoint? screenPointToLock;

  /// markerView的复用标识符
  String? identifier;

  /// markView显示的图片路径
  ///
  /// 与iconData二选一
  String? icon;

  /// markView显示的图片数据流
  ///
  /// 与icon二选一
  Uint8List? iconData;

  /// 默认情况下, marker view的中心位于marker的坐标位置，
  ///
  /// 可以设置centerOffset改变view的位置，正的偏移使view朝右下方移动，负的朝左上方，单位是像素
  ///
  /// 目前Android只支持Y轴设置偏移量对应SDK的 yOffset(int yOffset) 方法
  BMFPoint? centerOffset;

  /// 默认情况下,标注没有3D效果，可以设置enabled3D改变使用3D效果，
  ///
  /// 使得标注在地图旋转和俯视时跟随旋转、俯视
  ///
  /// iOS独有
  bool? enabled3D;

  /// 默认为true,当为false时view忽略触摸事件
  bool? enabled;

  /// 当设为true支持将view在地图上拖动
  bool? draggable;

  /// 默认为false,初始化时设置为true时会默认弹出气泡。设置该值来控制隐藏和弹出气泡
  ///
  /// iOS独有
  bool? selected;

  ///当为true时，view被选中时会弹出气泡，必须实现了title这个字段（iOS）
  bool? canShowCallout;

  /// 当发生单击地图事件时，当前的marker的泡泡是否隐藏，默认值为true
  /// iOS独有
  bool? hidePaopaoWhenSingleTapOnMap;

  /// 当发生双击地图事件时，当前的marker的泡泡是否隐藏，默认值为false
  /// iOS独有
  bool? hidePaopaoWhenDoubleTapOnMap;

  /// 当发生两个手指点击地图（缩小地图）事件时，当前的marker的泡泡是否隐藏，默认值为false
  /// iOS独有
  bool? hidePaopaoWhenTwoFingersTapOnMap;

  /// 当选中其他marker时，当前marker的泡泡是否隐藏，默认值为true
  /// iOS独有
  bool? hidePaopaoWhenSelectOthers;

  /// 当拖拽当前的marker时，当前marker的泡泡是否隐藏，默认值为false
  /// iOS独有
  bool? hidePaopaoWhenDrag;

  /// 当拖拽其他marker时，当前marker的泡泡是否隐藏，默认值为false
  /// iOS独有
  bool? hidePaopaoWhenDragOthers;

  /// marker展示优先级，提供三种级别，其他级别开发者可自行设置，
  /// 默认值为BMFMarkerDisplayPriority.Middle，
  /// 级别数值越大越优先展示，同级别按照添加的先后顺序进行覆盖展示。
  /// iOS独有
  int? displayPriority;

  /// x方向缩放倍数
  ///
  /// Android独有
  double? scaleX;

  /// y方向缩放倍数
  ///
  /// Android独有
  double? scaleY;

  /// 透明度
  ///
  /// Android独有
  double? alpha;

  /// 在有俯仰角的情况下，是否近大远小
  ///
  /// Android独有
  bool? isPerspective;

  /// 开发者自定义marker字段
  ///
  /// since3.1.0
  Map? customMap;

  /// 开启碰撞检测，默认false，关闭。since 3.2.0
  bool? isOpenCollisionDetection;

  /// 碰撞检测优先级，同一优先级后添加的优先展示。since 3.2.0
  ///
  /// 默认为0，优先级设置为NSIntegerMax时将会最优先展示
  int? collisionDetectionPriority;

  /// 开启碰撞检测时，是否强制展示，默认false。since 3.2.0
  bool? isForceDisplay;

  /// BMFMarker构造方法
  @Deprecated(
      'Use `BMFMarker.icon() or BMFMarker.iconData()` method instead since 3.1.0')
  BMFMarker(
      {required this.position,
      this.icon,
      this.iconData,
      this.title,
      this.subtitle,
      this.isLockedToScreen: false,
      this.screenPointToLock,
      this.identifier,
      this.centerOffset,
      this.enabled3D,
      this.enabled: true,
      this.draggable: false,
      this.selected: false,
      this.canShowCallout: true,
      this.hidePaopaoWhenSingleTapOnMap: true,
      this.hidePaopaoWhenDoubleTapOnMap: false,
      this.hidePaopaoWhenTwoFingersTapOnMap: false,
      this.hidePaopaoWhenSelectOthers: true,
      this.hidePaopaoWhenDrag: false,
      this.hidePaopaoWhenDragOthers: false,
      this.displayPriority: BMFMarkerDisplayPriority.Middle,
      this.scaleX: 1.0,
      this.scaleY: 1.0,
      this.alpha: 1.0,
      this.isPerspective,
      int zIndex: 0,
      bool visible: true})
      : super(zIndex: zIndex, visible: visible);

  /// BMFMarker构造方法 since 3.1.0
  BMFMarker.icon(
      {required this.position,
      required this.icon,
      this.title,
      this.subtitle,
      this.isLockedToScreen: false,
      this.screenPointToLock,
      this.identifier,
      this.centerOffset,
      this.enabled3D,
      this.enabled: true,
      this.draggable: false,
      this.selected: false,
      this.canShowCallout: true,
      this.hidePaopaoWhenSingleTapOnMap: true,
      this.hidePaopaoWhenDoubleTapOnMap: false,
      this.hidePaopaoWhenTwoFingersTapOnMap: false,
      this.hidePaopaoWhenSelectOthers: true,
      this.hidePaopaoWhenDrag: false,
      this.hidePaopaoWhenDragOthers: false,
      this.displayPriority: BMFMarkerDisplayPriority.Middle,
      this.scaleX: 1.0,
      this.scaleY: 1.0,
      this.alpha: 1.0,
      this.isPerspective,
      this.customMap,
      this.isOpenCollisionDetection: false,
      this.collisionDetectionPriority: 0,
      this.isForceDisplay: false,
      int zIndex: 0,
      bool visible: true})
      : super(zIndex: zIndex, visible: visible);

  /// BMFMarker构造方法 since 3.1.0
  BMFMarker.iconData(
      {required this.position,
      required this.iconData,
      this.title,
      this.subtitle,
      this.isLockedToScreen: false,
      this.screenPointToLock,
      this.identifier,
      this.centerOffset,
      this.enabled3D,
      this.enabled: true,
      this.draggable: false,
      this.selected: false,
      this.canShowCallout: true,
      this.hidePaopaoWhenSingleTapOnMap: true,
      this.hidePaopaoWhenDoubleTapOnMap: false,
      this.hidePaopaoWhenTwoFingersTapOnMap: false,
      this.hidePaopaoWhenSelectOthers: true,
      this.hidePaopaoWhenDrag: false,
      this.hidePaopaoWhenDragOthers: false,
      this.displayPriority: BMFMarkerDisplayPriority.Middle,
      this.scaleX: 1.0,
      this.scaleY: 1.0,
      this.alpha: 1.0,
      this.isPerspective,
      this.customMap,
      this.isOpenCollisionDetection: false,
      this.collisionDetectionPriority: 0,
      this.isForceDisplay: false,
      int zIndex: 0,
      bool visible: true})
      : super(zIndex: zIndex, visible: visible);

  /// map => BMFMarker
  BMFMarker.fromMap(Map map)
      : assert(map['position'] != null),
        super.fromMap(map) {
    position = BMFCoordinate.fromMap(map['position']);
    title = map['title'];
    subtitle = map["subtitle"];
    isLockedToScreen = map['isLockedToScreen'] as bool?;
    screenPointToLock = map['screenPointToLock'] == null
        ? null
        : BMFPoint.fromMap(map['screenPointToLock']);
    identifier = map['identifier'];
    icon = map['icon'];
    centerOffset = map['centerOffset'] == null
        ? null
        : BMFPoint.fromMap(map['centerOffset']);
    enabled3D = map['enabled3D'];
    enabled = map['enabled'];
    draggable = map['draggable'];
    selected = map['selected'];
    canShowCallout = map['canShowCallout'];
    hidePaopaoWhenSingleTapOnMap = map['hidePaopaoWhenSingleTapOnMap'] as bool?;
    hidePaopaoWhenDoubleTapOnMap = map['hidePaopaoWhenDoubleTapOnMap'] as bool?;
    hidePaopaoWhenTwoFingersTapOnMap =
        map['hidePaopaoWhenTwoFingersTapOnMap'] as bool?;
    hidePaopaoWhenSelectOthers = map['hidePaopaoWhenSelectOthers'] as bool?;
    hidePaopaoWhenDrag = map['hidePaopaoWhenDrag'] as bool?;
    hidePaopaoWhenDragOthers = map['hidePaopaoWhenDragOthers'] as bool?;
    displayPriority = map['displayPriority'] as int?;
    scaleX = map['scaleX'];
    scaleY = map['scaleY'];
    alpha = map['alpha'];
    isPerspective = map['isPerspective'];
    if (map['iconData'] != null) {
      Map iconDataMap = map['iconData'];
      List<dynamic> iconDataList = iconDataMap['data'];
      iconData = Uint8List.fromList(iconDataList.map((i) => i as int).toList());
    }
    if (map['customMap'] != null) {
      customMap = map['customMap'] as Map;
    }
    isOpenCollisionDetection = map['isOpenCollisionDetection'] as bool?;
    collisionDetectionPriority = map['collisionDetectionPriority'] as int?;
    isForceDisplay = map['isForceDisplay'] as bool?;
  }

  @override
  fromMap(Map map) {
    return BMFMarker.fromMap(map);
  }

  @override
  Map<String, Object?> toMap() {
    return {
      'id': this.id,
      'position': this.position.toMap(),
      'title': this.title,
      'subtitle': this.subtitle,
      'isLockedToScreen': this.isLockedToScreen,
      'screenPointToLock': this.screenPointToLock?.toMap(),
      'identifier': this.identifier,
      'icon': this.icon,
      'iconData': this.iconData != null ? this.iconData : null,
      'centerOffset': this.centerOffset?.toMap(),
      'enabled3D': this.enabled3D,
      'enabled': this.enabled,
      'draggable': this.draggable,
      'selected': this.selected,
      'canShowCallout': this.canShowCallout,
      'hidePaopaoWhenSingleTapOnMap': this.hidePaopaoWhenSingleTapOnMap,
      'hidePaopaoWhenDoubleTapOnMap': this.hidePaopaoWhenDoubleTapOnMap,
      'hidePaopaoWhenTwoFingersTapOnMap': this.hidePaopaoWhenTwoFingersTapOnMap,
      'hidePaopaoWhenSelectOthers': this.hidePaopaoWhenSelectOthers,
      'hidePaopaoWhenDrag': this.hidePaopaoWhenDrag,
      'hidePaopaoWhenDragOthers': this.hidePaopaoWhenDragOthers,
      'displayPriority': this.displayPriority,
      'scaleX': this.scaleX,
      'scaleY': this.scaleY,
      'alpha': this.alpha,
      'isPerspective': this.isPerspective,
      'customMap': this.customMap,
      'isOpenCollisionDetection': this.isOpenCollisionDetection,
      'collisionDetectionPriority': this.collisionDetectionPriority,
      'isForceDisplay': this.isForceDisplay,
      'zIndex': this.zIndex,
      'visible': this.visible,
    };
  }
}

/// marker 更新
extension BMFMarkerUpdateExtension on BMFMarker {
  /// 更新title
  Future<bool> updateTitle(String title) async {
    ArgumentError.checkNotNull(title, "title");

    bool ret = await BMFMapDispatcherFactory.instance.markerDispatcher
        .updateMarkerMember(this.methodChannel, {
      'id': this.id,
      'member': 'title',
      'value': title,
    });

    if (ret) {
      this.title = title;
    }

    return ret;
  }

  /// 更新subTitle
  Future<bool> updateSubTitle(String subtitle) async {
    ArgumentError.checkNotNull(subtitle, "subtitle");

    bool ret = await BMFMapDispatcherFactory.instance.markerDispatcher
        .updateMarkerMember(this.methodChannel, {
      'id': this.id,
      'member': 'subtitle',
      'value': subtitle,
    });

    if (ret) {
      this.subtitle = subtitle;
    }

    return ret;
  }

  /// 更新位置经纬度
  Future<bool> updatePosition(BMFCoordinate position) async {
    ArgumentError.checkNotNull(position, "position");

    bool ret = await BMFMapDispatcherFactory.instance.markerDispatcher
        .updateMarkerMember(this.methodChannel, {
      'id': this.id,
      'member': 'position',
      'value': position.toMap(),
    });

    if (ret) {
      this.position = position;
    }

    return ret;
  }

  /// 更新是否锁定在屏幕上的位置
  ///
  /// 如果isLockedToScreen为false,screenPointToLock需要传null
  Future<bool> updateIsLockedToScreen(
      bool isLockedToScreen, BMFPoint screenPointToLock) async {
    bool ret = await BMFMapDispatcherFactory.instance.markerDispatcher
        .updateMarkerMember(this.methodChannel, {
      'id': this.id,
      'member': 'isLockedToScreen',
      'value': isLockedToScreen,
      'screenPointToLock': screenPointToLock.toMap()
    });

    if (ret) {
      this.isLockedToScreen = isLockedToScreen;
      this.screenPointToLock = screenPointToLock;
    }

    return ret;
  }

  /// 更新显示的图片
  Future<bool> updateIcon(String icon) async {
    ArgumentError.checkNotNull(icon, "icon");

    if (icon.isEmpty) {
      return false;
    }

    bool ret = await BMFMapDispatcherFactory.instance.markerDispatcher
        .updateMarkerMember(this.methodChannel, {
      'id': this.id,
      'member': 'icon',
      'value': icon,
    });

    if (ret) {
      this.icon = icon;
    }

    return ret;
  }

  /// 更新显示的图片 since 3.2.0
  Future<bool> updateIconData(Uint8List iconData) async {
    ArgumentError.checkNotNull(iconData, "iconData");

    if (iconData.isEmpty) {
      return false;
    }

    bool ret = await BMFMapDispatcherFactory.instance.markerDispatcher
        .updateMarkerMember(this.methodChannel, {
      'id': this.id,
      'member': 'iconData',
      'value': iconData,
    });

    if (ret) {
      this.iconData = iconData;
    }

    return ret;
  }

  /// 更新marker centerOffset信息
  Future<bool> updateCenterOffset(BMFPoint centerOffset) async {
    ArgumentError.checkNotNull(centerOffset, "centerOffset");

    bool ret = await BMFMapDispatcherFactory.instance.markerDispatcher
        .updateMarkerMember(this.methodChannel, {
      'id': this.id,
      'member': 'centerOffset',
      'value': centerOffset.toMap(),
    });

    if (ret) {
      this.centerOffset = centerOffset;
    }

    return ret;
  }

  /// 更新marker是否显示3D效果
  Future<bool> updateEnabled3D(bool enabled3D) async {
    bool ret = await BMFMapDispatcherFactory.instance.markerDispatcher
        .updateMarkerMember(this.methodChannel, {
      'id': this.id,
      'member': 'enabled3D',
      'value': enabled3D,
    });

    if (ret) {
      this.enabled3D = enabled3D;
    }

    return ret;
  }

  /// 更新marker是否响应触摸事件, true则响应,false则不响应
  Future<bool> updateEnabled(bool enabled) async {
    bool ret = await BMFMapDispatcherFactory.instance.markerDispatcher
        .updateMarkerMember(this.methodChannel, {
      'id': this.id,
      'member': 'enabled',
      'value': enabled,
    });

    if (ret) {
      this.enabled = enabled;
    }

    return ret;
  }

  /// 更新是否可拖拽
  Future<bool> updateDraggable(bool draggable) async {
    bool ret = await BMFMapDispatcherFactory.instance.markerDispatcher
        .updateMarkerMember(this.methodChannel, {
      'id': this.id,
      'member': 'draggable',
      'value': draggable,
    });

    if (ret) {
      this.draggable = draggable;
    }

    return ret;
  }

  /// 更新x方向缩放倍数
  ///
  /// Android独有
  Future<bool> updateScaleX(double scaleX) async {
    bool ret = await BMFMapDispatcherFactory.instance.markerDispatcher
        .updateMarkerMember(this.methodChannel, {
      'id': this.id,
      'member': 'scaleX',
      'value': scaleX,
    });

    if (ret) {
      this.scaleX = scaleX;
    }

    return ret;
  }

  /// 更新y方向缩放倍数
  ///
  /// Android独有
  Future<bool> updateScaleY(double scaleY) async {
    bool ret = await BMFMapDispatcherFactory.instance.markerDispatcher
        .updateMarkerMember(this.methodChannel, {
      'id': this.id,
      'member': 'scaleY',
      'value': scaleY,
    });

    if (ret) {
      this.scaleY = scaleY;
    }

    return ret;
  }

  /// 更新透明度
  ///
  /// Android独有
  Future<bool> updateAlpha(double alpha) async {
    bool ret = await BMFMapDispatcherFactory.instance.markerDispatcher
        .updateMarkerMember(this.methodChannel, {
      'id': this.id,
      'member': 'alpha',
      'value': alpha,
    });

    if (ret) {
      this.alpha = alpha;
    }

    return ret;
  }

  /// 更新近大远小的开关
  ///
  /// Android独有
  Future<bool> updateIsPerspective(bool isPerspective) async {
    bool ret = await BMFMapDispatcherFactory.instance.markerDispatcher
        .updateMarkerMember(this.methodChannel, {
      'id': this.id,
      'member': 'isPerspective',
      'value': isPerspective,
    });

    if (ret) {
      this.isPerspective = isPerspective;
    }

    return ret;
  }

  /// 更新marker是否显示
  ///
  /// Android独有
  Future<bool> updateVisible(bool visible) async {
    bool ret = await BMFMapDispatcherFactory.instance.markerDispatcher
        .updateMarkerMember(this.methodChannel, {
      'id': this.id,
      'member': 'visible',
      'value': visible,
    });

    if (ret) {
      this.visible = visible;
    }

    return ret;
  }

  /// 更新z轴方向上的堆叠顺序
  ///
  /// Android独有
  Future<bool> updateZIndex(int zIndex) async {
    bool ret = await BMFMapDispatcherFactory.instance.markerDispatcher
        .updateMarkerMember(this.methodChannel, {
      'id': this.id,
      'member': 'zIndex',
      'value': zIndex,
    });

    if (ret) {
      this.zIndex = zIndex;
    }

    return ret;
  }
}
