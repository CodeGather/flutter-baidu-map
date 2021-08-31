/* 
 * @Author: 21克的爱情
 * @Date: 2021-01-19 15:06:04
 * @Email: raohong07@163.com
 * @LastEditors: 21克的爱情
 * @LastEditTime: 2021-06-20 14:06:45
 * @Description: 
 */
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart'
    show BMFCoordinate, BMFModel;

/// 行政区域检索结果
class BMFDistrictSearchResult implements BMFModel {
  /// 行政区域编码
  int ?code;

  /// 行政区边界坐标点数据
  List<List<BMFCoordinate>> ?paths;

  /// 行政区域名称
  String ?name;

  /// 行政区域中心点
  BMFCoordinate ?center;

  /// BMFDistrictSearchResult构造方法
  BMFDistrictSearchResult({this.code, this.paths, this.name, this.center});

  /// map => BMFDistrictSearchResult
  BMFDistrictSearchResult.fromMap(Map map)
      : assert(map != null,
            'Construct a BMFDistrictSearchResult，The parameter map cannot be null !') {
    code = map['code'];
    name = map['name'];
    center =
        map['center'] == null ? null : BMFCoordinate.fromMap(map['center']);

    if (map['paths'] != null) {
      paths = [];
      for (List item in map['paths'] as List) {
        List<BMFCoordinate> list = [];
        for (var ite in item) {
          BMFCoordinate coordinate = BMFCoordinate.fromMap(ite as Map);
          list.add(coordinate);
        }
        paths!.add(list);
      }
    }
  }

  @override
  fromMap(Map map) {
    return BMFDistrictSearchResult.fromMap(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'code': this.code,
      'name': this.name,
      'center': this.center?.toMap(),
      'paths': this
          .paths
          ?.map((list) => list.map((coord) => coord.toMap()).toList()).toList()
    };
  }
}
