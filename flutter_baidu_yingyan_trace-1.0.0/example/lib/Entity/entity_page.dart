import 'package:flutter/material.dart';
import 'package:flutter_baidu_yingyan_trace/flutter_baidu_yingyan_trace.dart';
import 'package:flutter_baidu_yingyan_trace_example/CustomWidgets/map_appbar.dart';
import 'package:flutter_baidu_yingyan_trace_example/constants.dart';

class EntityPage extends StatelessWidget {
  const EntityPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: BMFAppBar(
          title: '终端实体管理',
          onBack: () {
            Navigator.pop(context);
          },
        ),
        body: Container(child: generateWidgetColumen()),
      ),
    );
  }

  Column generateWidgetColumen() {
    return Column(children: <Widget>[
      FlatButton(
          child: new Text("添加entity"),
          onPressed: () async {
            /// person_name, person_phone, car_brand, car_number, car_color
            /// 上述key必须是已在鹰眼轨迹管理台创建过的属性字段
            AddEntityOption addEntityOption = AddEntityOption(
                tag: 1,
                serviceId: serviceID,
                entityName: 'Modi',
                entityDesc: '鹰眼测试_iOS',
                customColumns: {
                  'person_name': 'bob',
                  'person_phone': '13166668888',
                  'car_brand': '奥迪',
                  'car_number': '京A888888',
                  'car_color': 'black'
                });

            /// 发起添加entity
            bool flag = await TraceController.shareInstance.addEntity(
                addEntityOption: addEntityOption,
                entityCallBack: EntityCallBack(
                    onAddEntityCallBack: (AddEntityResult result) {
                  print('-- 添加entity回调 result = ${result?.toMap()}');
                }));

            print('-- 添加entity flag = $flag');
          }),
      FlatButton(
          child: new Text("删除entity"),
          onPressed: () async {
            /// entityName终端唯一标识
            DeleteEntityOption deleteEntityOption = DeleteEntityOption(
                tag: 1, serviceId: serviceID, entityName: entityName_test);

            /// 发起删除entity
            bool flag = await TraceController.shareInstance.deleteEntity(
                deleteEntityOption: deleteEntityOption,
                entityCallBack: EntityCallBack(
                    onDeleteEntityCallBack: (DeleteEntityResult result) {
                  print('-- 删除entity回调 result = ${result?.toMap()}');
                }));

            print('-- 删除entity flag = $flag');
          }),
      FlatButton(
          child: new Text("更新entity"),
          onPressed: () async {
            /// entityName终端唯一标识
            UpdateEntityOption updateEntityOption = UpdateEntityOption(
                tag: 1,
                serviceId: serviceID,
                entityName: entityName_test,
                entityDesc: '鹰眼测试_iOS',
                customColumns: {
                  'person_name': 'Trump',
                  'person_phone': '13166668888',
                  'car_brand': '奥迪',
                  'car_number': '京A666666',
                  'car_color': 'black'
                });

            /// 发起更新entity
            bool flag = await TraceController.shareInstance.updateEntity(
                updateEntityOption: updateEntityOption,
                entityCallBack: EntityCallBack(
                    onUpdateEntityCallBack: (UpdateEntityResult result) {
                  print('-- 更新entity回调 result = ${result?.toMap()}');
                }));

            print('-- 更新entity flag = $flag');
          }),
      FlatButton(
          child: new Text("查询entity list"),
          onPressed: () async {
            EntityListSearchOption entityListSearchOption =
                EntityListSearchOption(
                    tag: 1,
                    serviceId: serviceID,
                    searchFilterCondition: SearchFilterCondition(
                      entityNames: [entityName_test],
                      // activeTime: 123,
                      // inActiveTime: 321,
                    ),
                    sortBy: SortBy(
                        fieldName: 'entityName', sortType: SortType.asc));

            bool flag = await TraceController.shareInstance.queryEntityList(
                entityListSearchOption: entityListSearchOption,
                entityCallBack: EntityCallBack(onEntitySearchListCallBack:
                    (EntityListSearchResult result) {
                  print('-- 查询entity list回调 result = ${result?.toMap()}');
                }));

            print('-- 查询entity list flag = $flag');
          }),
      FlatButton(
          child: new Text("关键字查询entity"),
          onPressed: () async {
            KeyWordSearchEntityOption keyWordSearchEntityOption =
                KeyWordSearchEntityOption(
                    tag: 1,
                    serviceId: serviceID,
                    keyword: entityName_test,
                    sortBy: SortBy(
                        fieldName: 'entity_name', sortType: SortType.asc));

            bool flag = await TraceController.shareInstance.keyWordSearchEntity(
                keyWordSearchEntityOption: keyWordSearchEntityOption,
                entityCallBack: EntityCallBack(onKeyWordSearchEntityCallBack:
                    (KeyWordSearchEntityResult result) {
                  print('-- 关键字查询entity回调 result = ${result?.toMap()}');
                }));

            print('-- 关键字查询entity flag = $flag');
          }),
      FlatButton(
          child: new Text("Around查询entity"),
          onPressed: () async {
            AroundSearchEntityOption aroundSearchEntityOption =
                AroundSearchEntityOption(
                    center: LatLng(38.0, 116.0),
                    radius: 3000,
                    serviceId: serviceID,
                    tag: 1,
                    searchFilterCondition:
                        SearchFilterCondition(entityNames: [entityName_test]),
                    sortBy: SortBy(
                        fieldName: 'entity_name', sortType: SortType.asc));

            bool flag = await TraceController.shareInstance.aroundSearchEntity(
                aroundSearchEntityOption: aroundSearchEntityOption,
                entityCallBack: EntityCallBack(onAroundSearchEntityCallBack:
                    (AroundSearchEntityResult result) {
                  print('-- Around查询entity回调 result = ${result?.toMap()}');
                }));

            print('-- Around查询entity flag = $flag');
          }),
      FlatButton(
          child: new Text("Bounds查询entity"),
          onPressed: () async {
            BoundSearchEntityOption boundSearchEntityOption =
                BoundSearchEntityOption(
                    tag: 1,
                    serviceId: serviceID,
                    lowerLeft: LatLng(38.0, 116.0),
                    upperRight: LatLng(39.0, 118.0),
                    sortBy: SortBy(
                        fieldName: 'entityName', sortType: SortType.asc));

            bool flag = await TraceController.shareInstance.boundSearchEntity(
                boundSearchEntityOption: boundSearchEntityOption,
                entityCallBack: EntityCallBack(onBoundSearchEntityCallBack:
                    (BoundSearchEntityResult result) {
                  print('-- Bounds查询entity回调 result = ${result?.toMap()}');
                }));

            print('-- Bounds查询entity flag = $flag');
          }),
      FlatButton(
          child: new Text("District查询entity"),
          onPressed: () async {
            DistrictSearchEntityOption districtSearchEntityOption =
                DistrictSearchEntityOption(
                    tag: 1,
                    serviceId: serviceID,
                    keyword: '北京市海淀区',
                    sortBy: SortBy(
                        fieldName: 'entity_name', sortType: SortType.asc));

            bool flag = await TraceController.shareInstance
                .districtSearchEntity(
                    districtSearchEntityOption: districtSearchEntityOption,
                    entityCallBack: EntityCallBack(
                        onDistrictSearchEntityCallBack:
                            (DistrictSearchEntityResult result) {
                      print(
                          '-- District查询entity回调 result = ${result?.toMap()}');
                    }));

            print('-- District查询entity flag = $flag');
          }),
      FlatButton(
          child: new Text("Polygon查询entity"),
          onPressed: () async {
            PolygonSearchEntityOption polygonSearchEntityOption =
                PolygonSearchEntityOption(
                    tag: 1,
                    serviceId: serviceID,
                    vertexes: [
                      LatLng(38, 116),
                      LatLng(38.5, 115),
                      LatLng(38.8, 114),
                      LatLng(38.9, 113),
                      LatLng(39, 112)
                    ],
                    // searchFilterCondition: SearchFilterCondition(entityNames: [
                    //   entityName_test
                    // ],
                    // activeTime: 123,
                    // inActiveTime: 321,
                    // ),
                    sortBy: SortBy(
                        fieldName: 'entity_name', sortType: SortType.asc));

            bool flag = await TraceController.shareInstance.polygonSearchEntity(
                polygonSearchEntityOption: polygonSearchEntityOption,
                entityCallBack: EntityCallBack(onPolygonSearchEntityCallBack:
                    (PolygonSearchEntityResult result) {
                  print('-- Polygon查询entity回调 result = ${result?.toMap()}');
                }));

            print('-- Polygon查询entity flag = $flag');
          }),
    ]);
  }
}
