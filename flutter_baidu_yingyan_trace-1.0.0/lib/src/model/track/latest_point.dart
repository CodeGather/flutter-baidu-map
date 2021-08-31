import 'package:flutter_baidu_yingyan_trace/src/model/point.dart';

/// 最新轨迹点
class LatestPoint extends Point {
  /// 楼层
  String ?floor;

  /// 创建时间（该时间为服务端时间）
  /// 注：仅在查询历史轨迹时有值；批量添加轨迹点时，无须设置该字段。
  String ?createTime;

  /// 对象名称
  String ?objectName;

  /// 自定义轨迹属性（track attribute）
  Map<String, String> ?columns;

  /// 轨迹对应的道路等级
  ///
  /// 仅当请求参数isProcessed = true 且{@link com.baidu.trace.model.ProcessOption}中needMapMatch=true时，返回该字段
  /// 可能的返回值：高速路；都市高速路；国道；省道；县道；乡镇道路；其他道路；九级路；轮渡；行人道路
  /// 注意：该功能为高级付费服务，需通过反馈平台联系工作人员开通
  String ?roadGrade;

  /// 轨迹对应的道路名称
  ///
  /// 如"信息路"
  /// 若道路未命名或百度地图未采集到该道路名称，则返回"无名路"
  /// 注意：该功能为高级付费服务，需通过反馈平台联系工作人员开通
  String ?roadName;

  /// 轨迹对应的定位方式（鹰眼分析得出）
  ///
  /// 仅当请求参数isProcessed = true时返回。
  /// 可能的返回值：未知；GPS/北斗定位；网络定位；基站定位*
  String ?locateMode;

  /// 轨迹对应的交通方式（鹰眼分析得出）
  ///
  /// 仅当请求参数isProcessed = true且{@link com.baidu.trace.model.ProcessOption}中transport_mode=auto时返回。
  /// 可能的返回值：未知；驾车；骑行；步行；停留
  /// 注意：该功能为高级付费服务，需通过反馈平台联系工作人员开通
  String ?transportMode;

  LatestPoint.fromMap(Map map)
      : assert(map != null),
        super.fromMap(map) {
    floor = map['floor'];
    createTime = map['createTime'];
    objectName = map['objectName'];
    columns = map['columns'] == null
        ? null
        : Map<String, String>.from(map['columns']);
    roadGrade = map['roadGrade'];
    roadName = map['roadName'];
    locateMode = map['locateMode'];
    transportMode = map['transportMode'];
  }

  @override
  Map toMap() {
    Map map = super.toMap();
    map['floor'] = this.floor;
    map['createTime'] = this.createTime;
    map['objectName'] = this.objectName;
    map['columns'] = this.columns;
    map['roadGrade'] = this.roadGrade;
    map['roadName'] = this.roadName;
    map['locateMode'] = this.locateMode;
    map['transportMode'] = this.transportMode;
    return map;
  }
}
