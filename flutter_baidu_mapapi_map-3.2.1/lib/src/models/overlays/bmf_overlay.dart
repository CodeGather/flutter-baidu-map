import 'package:flutter/services.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart'
    show BMFModel, BMFCoordinateBounds;

/// overlay的外接矩形 since 3.1.0
/// 仅iOS支持
abstract class BMFOverlayBoundsInterface {
  /// 返回overlay外接矩形 since 3.1.0
  Future<BMFCoordinateBounds?> get bounds async {
    return null;
  }
}

/// 地图覆盖物基类
class BMFOverlay implements BMFModel {
  /// overlay 唯一标识id
  late String _id;

  /// overlay是否可见
  ///
  /// Android独有
  bool? visible;

  /// 元素的堆叠顺序
  ///
  /// Android独有
  int? zIndex;

  /// overlay与native端通信的channel，内部维护
  late MethodChannel _methodChannel;

  BMFOverlay({this.visible, this.zIndex}) {
    var timeStamp = DateTime.now().millisecondsSinceEpoch;
    _id = '$timeStamp' '_' '$hashCode';
  }

  /// map => BMFOverlay
  BMFOverlay.fromMap(Map map) : assert(map.containsKey('id')) {
    _id = map['id'];
    visible = map['visible'];
    zIndex = map['zIndex'];
  }

  /// 获取id
  @Deprecated('Use `id` method instead since 3.2.0')
  String get Id => _id;

  /// 获取id since 3.2.0
  String get id => _id;

  @override
  Map<String, Object?> toMap() {
    return {'id': this.id, 'visible': visible, 'zIndex': zIndex};
  }

  @override
  fromMap(Map map) {
    return BMFOverlay.fromMap(map);
  }

  @override
  bool operator ==(Object other) {
    if (other is! BMFOverlay) {
      return false;
    }
    final BMFOverlay overlay = other;
    return _id == overlay.id && _methodChannel == overlay.methodChannel;
  }
}

/// overlay的MethodChannel，内部维护开发者无需关心
extension OverlayMethodChannelExension on BMFOverlay {
  /// 设置channel
  void set methodChannel(MethodChannel methodChannel) =>
      _methodChannel = methodChannel;

  /// 获取channel
  MethodChannel get methodChannel => _methodChannel;
}
