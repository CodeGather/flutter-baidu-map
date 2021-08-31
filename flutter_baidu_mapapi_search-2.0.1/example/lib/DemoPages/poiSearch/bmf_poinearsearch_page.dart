import 'package:flutter/material.dart';
import 'package:flutter_bmfsearch_example/CustomWidgets/map_appbar.dart';
import 'package:flutter_baidu_mapapi_search/flutter_baidu_mapapi_search.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';

class BMFPoiNearBySearchPage extends StatelessWidget {
  const BMFPoiNearBySearchPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: BMFAppBar(
          title: 'poi周边检索',
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
          child: new Text("百度地图poi周边检索"),
          onPressed: () async {
            /// 构造检索参数
            BMFPoiNearbySearchOption poiNearbySearchOption =
                BMFPoiNearbySearchOption(
                    keywords: <String>['小吃', '酒店'],
                    location: BMFCoordinate(39.915, 116.404),
                    radius: 6000,
                    isRadiusLimit: true);

            /// 检索实例
            BMFPoiNearbySearch nearbySearch = BMFPoiNearbySearch();

            /// 检索回调
            nearbySearch.onGetPoiNearbySearchResult(callback: (BMFPoiSearchResult result, BMFSearchErrorCode errorCode) {
              print(' poi周边检索回调 errorCode = ${errorCode}  \n result = ${result?.toMap()}');
            });

            /// 发起检索
            bool flag = await nearbySearch.poiNearbySearch(poiNearbySearchOption);

            print('flag = $flag');
          })
    ]);
  }
}
