# 2.0.0

新增功能：
1、新增检索组件；
2、Circle、Polygon 增加镂空效果；
3、Circle、Polygon、Arcline、Dot、Ground、Text 支持属性更新。
问题修复：
1、规范了包名；
2、Marker、Polyline 事件回调返回完整了 Marker 和 Polyline 对象；
3、iOS 端兼容 swift、swift 与 Object-C 混编；
4、解决了部分 Android 机型上卫星图、路况图、百度城市热力图、自定义在线瓦片图不显示的问题；
5、Android 花屏问题解决；
6、全新 Demo。

## 3.0.0

1、适配 null-safe

## 3.0.0+2

1、修复方法名错误

## 3.1.0

地图Flutter插件3.1更新日志 


新增： 

1、新增大地曲线绘制，polyline新增跨经度180属性； 

2、新增渐变线绘制； 

3、新增3D棱柱绘制； 

4、新增海量点绘制； 

5、新增3D模型绘制； 

6、新增动态轨迹绘制； 

7、overlay新增获取外接矩形bounds接口； 

8、marker新增customMap字段，iconData构造方法； 

9、map新增showmarkers接口（仅支持iOS端）； 

9、map新增language，fontsizelevel属性，驾车检索step节点下新增roadname字段 

10、map新增坐标换接口(地理坐标 <=> 屏幕坐标)； 


修复： 

Android端修复多地图页面切换删除overlay失效问题。 

Android端修复自定义定位图层样式设置方向不旋转问题。 

Android端修复LatLngBounds返回地理坐标问题。 
 

优化： 

升级引擎，提高引擎稳定性 


变更： 

1、增加隐私政策接口，BMFMapSDK.setAgreePrivacy(bool); 

2、BMFMarker()构造废弃，变更为BMFMarker.icon()和BMFMarker.iconData()构造 

3、新增删除traceOverlay接口，MapController.removeTraceOverlay(traceOverlay_id)；

## 3.2.0

地图Flutter插件3.2更新日志 

新增： 

1、Utils组件百度地图客户端调起新增摩托车、新能源车、货车导航调起；新能源，货车络线调起； 

2、map图层相关接口（switchOverlayLayerAndPOILayer）； 

3、mapOptions新增showOperateLayer属性；

4、marker新增碰撞策略；

5、marker新增updateIconData接口； 

6、overlay的属性更新接口（3D棱柱，大地曲线，渐变线，3D模型，polyline）； 

7、海量点新增点击回调，动态轨迹新增动画回调；

修复： 

Android修改屏幕坐标转换地理坐标失败问题  

变更： 

1、overlay，infoWindow的属性Id改为id;

2、废弃BMFMapAPI_Base类请使用BMFMapBaseVersion；

3、废弃BMFMapAPI_Map类请使用BMFMapVersion；

4、废弃BMFMapAPI_Search类请使用BMFMapSearchVersion；

5、废弃BMFMapAPI_Utils类请使用BMFMapUtilsVersion；

## 3.2.1

地图Flutter插件3.2.1更新日志 

修复： 

Android端marker点击失效问题修复