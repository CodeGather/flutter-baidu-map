
#ifndef __BTFYingYanMethodCallbackConst__M__
#define __BTFYingYanMethodCallbackConst__M__

#import <Foundation/Foundation.h>


/// 停留点分析回调
 NSString *const kAnalyzeStayPointCallback = @"flutter_baidu_yingyan_trace/analysis/analyzeStayPointCallBack";
/// 驾驶行为分析回调
 NSString *const kAnalyzeDrivingBehaviourCallback = @"flutter_baidu_yingyan_trace/analysis/analyzeDrivingBehaviourCallBack";


/// 创建Entity终端实体，并赋属性信息回调
 NSString *const kAddEntityCallback = @"flutter_baidu_yingyan_trace/entity/addEntityCallBack";
/// 删除Entity终端实体回调
 NSString *const kDeleteEntityCallback = @"flutter_baidu_yingyan_trace/entity/deleteEntityCallBack";
/// 更新Entity终端实体属性信息回调
 NSString *const kUpdateEntityCallback = @"flutter_baidu_yingyan_trace/entity/updateEntityCallBack";
/// 检索符合过滤条件的Entity终端实体，返回Entity属性信息和最新位置回调
/// 可用于列出Entity，也可用于批量查询多个Entity的位置。
 NSString *const kQueryEntityListCallback = @"flutter_baidu_yingyan_trace/entity/queryEntityCallBack";
/// 根据关键字搜索Entity终端实体，并返回实时位置回调
 NSString *const kSearchEntityCallback = @"flutter_baidu_yingyan_trace/entity/searchEntityCallBack";
///  根据矩形地理范围搜索Entity终端实体，并返回实时位置回调
 NSString *const kBoundSearchEntityCallback = @"flutter_baidu_yingyan_trace/entity/boundSearchEntityCallBack";
/// 根据圆心半径搜索Entity终端实体，并返回实时位置回调
 NSString *const kAroundSearchEntityCallback = @"flutter_baidu_yingyan_trace/entity/aroundSearchEntityCallBack";
/// 在多边形区域内搜索Entity终端实体，并返回实时位置回调
 NSString *const kPolygonSearchEntityCallback = @"flutter_baidu_yingyan_trace/entity/polygonSearchEntityCallBack";
/// 在行政区域内搜索Entity终端实体，并返回实时位置回调
 NSString *const kDistrictSearchEntityCallback = @"flutter_baidu_yingyan_trace/entity/districtSearchEntityCallBack";



/// 新建客户端围栏
 NSString *const kCreateFenceCallback = @"flutter_baidu_yingyan_trace/fence/createFenceCallBack";
/// 删除客户端围栏
 NSString *const kDeleteFenceCallback = @"flutter_baidu_yingyan_trace/fence/deleteFenceCallBack";
/// 更新客户端围栏
 NSString *const kUpdateFenceCallback = @"flutter_baidu_yingyan_trace/fence/updateFenceCallBack";
/// 查询客户端围栏
 NSString *const kQueryFenceListCallback = @"flutter_baidu_yingyan_trace/fence/queryFenceListCallBack";
///  查询被监控对象和地理围栏的位置关系
 NSString *const kQueryMonitoredStatusCallback = @"flutter_baidu_yingyan_trace/fence/queryMonitoredStatusCallBack";
/// 查询被监控对象，在指定的坐标时，和地理围栏的位置关系
 NSString *const kQueryMonitoredStatusByLocationCallback = @"flutter_baidu_yingyan_trace/fence/queryMonitoredStatusByLocationCallBack";
/// 查询指定监控对象的地理围栏历史报警信息
 NSString *const kQueryHistoryAlarmCallback = @"flutter_baidu_yingyan_trace/fence/queryHistoryAlarmCallBack";

/// 给服务端地理围栏添加监控对象
 NSString *const kAddMonitoredPersonCallback = @"flutter_baidu_yingyan_trace/fence/addMonitoredPersonCallBack";
/// 移除指定服务端地理围栏上的监控对象
 NSString *const kDeleteMonitoredPersonCallback = @"flutter_baidu_yingyan_trace/fence/deleteMonitoredPersonCallBack";
/// 查询指定的服务端地理围栏上的监控对象
 NSString *const kQueryListMonitoredPersonCallback = @"flutter_baidu_yingyan_trace/fence/queryListMonitoredPersonCallBack";



/// 开启轨迹服务回调
NSString *const kStartTraceServiceCallback = @"flutter_baidu_yingyan_trace/trace/startTraceServiceCallBack";
/// 停止轨迹服务回调
NSString *const kStopTraceServiceCallback = @"flutter_baidu_yingyan_trace/trace/stopTraceServiceCallBack";
/// 开始采集回调
NSString *const kStartGatherCallback = @"flutter_baidu_yingyan_trace/trace/startGatherCallBack";
/// 停止采集回调
NSString *const kStopGatherCallback = @"flutter_baidu_yingyan_trace/trace/stopGatherCallBack";
/// 设置采集周期和打包上传的周期回调
NSString *const kSetIntervalCallback = @"flutter_baidu_yingyan_trace/trace/setIntervalCallBack";
/// 设置SDK缓存所占磁盘空间的最大值回调
NSString *const kSetCacheSizeCallback = @"flutter_baidu_yingyan_trace/trace/setCacheSizeCallBack";
/// 推送消息回调
NSString *const kPushCallback = @"flutter_baidu_yingyan_trace/trace/onPushCallBack";


/// 上传某个开发者自定义的轨迹点回调
/// 除了SDK自动的轨迹采集上传外，开发者可以通过此方法上传自定义的轨迹点。
/// 比如在两个采集周期之间，上传某个轨迹点作为补充。或者上传非当前登陆的entity的其他终端的轨迹点等。
 NSString *const kAddCustomPointCallback = @"flutter_baidu_yingyan_trace/track/addCustomPointCallBack";

/// 批量上传若干个开发者自定义的轨迹点回调
/// 除了SDK自动的轨迹采集上传外，开发者可以通过此方法批量上传自定义的轨迹点。
/// 这些轨迹点可以属于不同的终端实体。
 NSString *const kBatchAddCustomPointCallback = @"flutter_baidu_yingyan_trace/track/batchAddCustomPointCallBack";

///  查询某终端实体的实时位置回调
 NSString *const kQueryTrackLatestPointCallback = @"flutter_baidu_yingyan_trace/track/queryTrackLatestPointCallBack";

/// 查询某终端实体在一段时间内的里程回调
 NSString *const kQueryTrackDistanceCallback = @"flutter_baidu_yingyan_trace/track/queryTrackDistanceCallBack";
/// 查询某终端实体在一段时间内的轨迹回调
 NSString *const kQueryHistoryTrackCallback = @"flutter_baidu_yingyan_trace/track/queryHistoryTrackCallBack";
/// 查询客户端缓存的轨迹信息回调
 NSString *const kQueryTrackCacheInfoCallback = @"flutter_baidu_yingyan_trace/track/queryTrackCacheInfoCallBack";

/// 清空客户端缓存的轨迹信息回调
 NSString *const kClearTrackCacheCallback = @"flutter_baidu_yingyan_trace/track/clearTrackCacheCallBack";

#endif
