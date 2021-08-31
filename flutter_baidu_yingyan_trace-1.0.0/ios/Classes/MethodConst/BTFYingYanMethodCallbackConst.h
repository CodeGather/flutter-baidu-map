
#ifndef __BTFYingYanMethodCallbackConst__H__
#define __BTFYingYanMethodCallbackConst__H__

#import <Foundation/Foundation.h>


/// 停留点分析回调
FOUNDATION_EXPORT NSString *const kAnalyzeStayPointCallback;
/// 驾驶行为分析回调
FOUNDATION_EXPORT NSString *const kAnalyzeDrivingBehaviourCallback;

/// 创建Entity终端实体，并赋属性信息回调
FOUNDATION_EXPORT NSString *const kAddEntityCallback;
/// 删除Entity终端实体回调
FOUNDATION_EXPORT NSString *const kDeleteEntityCallback;
/// 更新Entity终端实体属性信息回调
FOUNDATION_EXPORT NSString *const kUpdateEntityCallback;
/// 检索符合过滤条件的Entity终端实体，返回Entity属性信息和最新位置回调
/// 可用于列出Entity，也可用于批量查询多个Entity的位置
FOUNDATION_EXPORT NSString *const kQueryEntityListCallback;
/// 根据关键字搜索Entity终端实体，并返回实时位置 回调
FOUNDATION_EXPORT NSString *const kSearchEntityCallback;
///  根据矩形地理范围搜索Entity终端实体，并返回实时位置回调
FOUNDATION_EXPORT NSString *const kBoundSearchEntityCallback;
/// 根据圆心半径搜索Entity终端实体，并返回实时位置回调
FOUNDATION_EXPORT NSString *const kAroundSearchEntityCallback;
/// 在多边形区域内搜索Entity终端实体，并返回实时位置回调
FOUNDATION_EXPORT NSString *const kPolygonSearchEntityCallback;
/// 在行政区域内搜索Entity终端实体，并返回实时位置回调
FOUNDATION_EXPORT NSString *const kDistrictSearchEntityCallback;

/// 新建围栏
FOUNDATION_EXPORT NSString *const kCreateFenceCallback;
/// 删除围栏
FOUNDATION_EXPORT NSString *const kDeleteFenceCallback;
/// 更新围栏
FOUNDATION_EXPORT NSString *const kUpdateFenceCallback;
/// 查询围栏
FOUNDATION_EXPORT NSString *const kQueryFenceListCallback;
///  查询被监控对象和地理围栏的位置关系
FOUNDATION_EXPORT NSString *const kQueryMonitoredStatusCallback;
/// 查询被监控对象，在指定的坐标时，和地理围栏的位置关系
FOUNDATION_EXPORT NSString *const kQueryMonitoredStatusByLocationCallback;
/// 查询指定监控对象的地理围栏历史报警信息
FOUNDATION_EXPORT NSString *const kQueryHistoryAlarmCallback;
/// 给服务端地理围栏添加监控对象
FOUNDATION_EXPORT NSString *const kAddMonitoredPersonCallback;
/// 移除指定服务端地理围栏上的监控对象
FOUNDATION_EXPORT NSString *const kDeleteMonitoredPersonCallback;
/// 查询指定的服务端地理围栏上的监控对象
FOUNDATION_EXPORT NSString *const kQueryListMonitoredPersonCallback;


/// 开启轨迹服务回调
FOUNDATION_EXPORT NSString *const kStartTraceServiceCallback;
/// 停止轨迹服务回调
FOUNDATION_EXPORT NSString *const kStopTraceServiceCallback;
/// 开始采集回调
FOUNDATION_EXPORT NSString *const kStartGatherCallback;
/// 停止采集回调
FOUNDATION_EXPORT NSString *const kStopGatherCallback;
/// 设置采集周期和打包上传的周期回调
FOUNDATION_EXPORT NSString *const kSetIntervalCallback;
/// 设置SDK缓存所占磁盘空间的最大值回调
FOUNDATION_EXPORT NSString *const kSetCacheSizeCallback;
/// 推送消息回调
FOUNDATION_EXPORT NSString *const kPushCallback;



/// 上传某个开发者自定义的轨迹点回调
/// 除了SDK自动的轨迹采集上传外，开发者可以通过此方法上传自定义的轨迹点。
/// 比如在两个采集周期之间，上传某个轨迹点作为补充。或者上传非当前登陆的entity的其他终端的轨迹点等。
FOUNDATION_EXPORT NSString *const kAddCustomPointCallback;

/// 批量上传若干个开发者自定义的轨迹点回调
/// 除了SDK自动的轨迹采集上传外，开发者可以通过此方法批量上传自定义的轨迹点。
/// 这些轨迹点可以属于不同的终端实体。
FOUNDATION_EXPORT NSString *const kBatchAddCustomPointCallback;

///  查询某终端实体的实时位置回调
FOUNDATION_EXPORT NSString *const kQueryTrackLatestPointCallback;

/// 查询某终端实体在一段时间内的里程回调
FOUNDATION_EXPORT NSString *const kQueryTrackDistanceCallback;
/// 查询某终端实体在一段时间内的轨迹回调
FOUNDATION_EXPORT NSString *const kQueryHistoryTrackCallback;
/// 查询客户端缓存的轨迹信息回调
FOUNDATION_EXPORT NSString *const kQueryTrackCacheInfoCallback;

/// 清空客户端缓存的轨迹信息回调
FOUNDATION_EXPORT NSString *const kClearTrackCacheCallback;

#endif
