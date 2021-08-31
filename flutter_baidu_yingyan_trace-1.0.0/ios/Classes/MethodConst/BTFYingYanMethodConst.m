
#ifndef __BTFYingYanMethodConst__M__
#define __BTFYingYanMethodConst__M__

#import <Foundation/Foundation.h>

NSString *const kLocalPermissionMethods = @"flutter_baidu_yingyan_trace/localPermission";
NSString *const kAnalysisMethods = @"flutter_baidu_yingyan_trace/analysis/";
NSString *const kEntityMethods = @"flutter_baidu_yingyan_trace/entity/";
NSString *const kFenceyMethods = @"flutter_baidu_yingyan_trace/fence/";
NSString *const kGatherMethods = @"flutter_baidu_yingyan_trace/trace/";
NSString *const kTrackMethods = @"flutter_baidu_yingyan_trace/track/";


/// 申请定位权限
NSString *const kRequestLocalPermission = @"flutter_baidu_yingyan_trace/localPermission/requestLocalPermission";
/// 定位参数配置
NSString *const kConfigLocationInfo = @"flutter_baidu_yingyan_trace/localPermission/configLocationInfo";

/// 停留点分析
 NSString *const kAnalyzeStayPoint = @"flutter_baidu_yingyan_trace/analysis/analyzeStayPoint";
/// 驾驶行为分析
 NSString *const kAnalyzeDrivingBehaviour = @"flutter_baidu_yingyan_trace/analysis/analyzeDrivingBehaviour";


/// 创建Entity终端实体，并赋属性信息
 NSString *const kAddEntity = @"flutter_baidu_yingyan_trace/entity/addEntity";
/// 删除Entity终端实体
 NSString *const kDeleteEntity = @"flutter_baidu_yingyan_trace/entity/deleteEntity";
/// 更新Entity终端实体属性信息
 NSString *const kUpdateEntity = @"flutter_baidu_yingyan_trace/entity/updateEntity";
/// 检索符合过滤条件的Entity终端实体，返回Entity属性信息和最新位置;
/// 可用于列出Entity，也可用于批量查询多个Entity的位置。
 NSString *const kQueryEntityList = @"flutter_baidu_yingyan_trace/entity/queryEntity";
/// 根据关键字搜索Entity终端实体，并返回实时位置。
 NSString *const kSearchEntity = @"flutter_baidu_yingyan_trace/entity/searchEntity";
///  根据矩形地理范围搜索Entity终端实体，并返回实时位置
 NSString *const kBoundSearchEntity = @"flutter_baidu_yingyan_trace/entity/boundSearchEntity";
/// 根据圆心半径搜索Entity终端实体，并返回实时位置
 NSString *const kAroundSearchEntity = @"flutter_baidu_yingyan_trace/entity/aroundSearchEntity";
/// 在多边形区域内搜索Entity终端实体，并返回实时位置
 NSString *const kPolygonSearchEntity = @"flutter_baidu_yingyan_trace/entity/polygonSearchEntity";
/// 在行政区域内搜索Entity终端实体，并返回实时位置
 NSString *const kDistrictSearchEntity = @"flutter_baidu_yingyan_trace/entity/districtSearchEntity";



/// 新建客户端围栏
 NSString *const kCreateFence = @"flutter_baidu_yingyan_trace/fence/createFence";
/// 删除客户端围栏
 NSString *const kDeleteFence = @"flutter_baidu_yingyan_trace/fence/deleteFence";
/// 更新客户端围栏
 NSString *const kUpdateFence = @"flutter_baidu_yingyan_trace/fence/updateFence";
/// 查询客户端围栏
 NSString *const kQueryFenceList = @"flutter_baidu_yingyan_trace/fence/queryFenceList";
///  查询被监控对象和地理围栏的位置关系
 NSString *const kQueryMonitoredStatus = @"flutter_baidu_yingyan_trace/fence/queryMonitoredStatus";
/// 查询被监控对象，在指定的坐标时，和地理围栏的位置关系
 NSString *const kQueryMonitoredStatusByLocation = @"flutter_baidu_yingyan_trace/fence/queryMonitoredStatusByLocation";
/// 查询指定监控对象的地理围栏历史报警信息
 NSString *const kQueryHistoryAlarm = @"flutter_baidu_yingyan_trace/fence/queryHistoryAlarm";

/// 给服务端地理围栏添加监控对象
 NSString *const kAddMonitoredPerson = @"flutter_baidu_yingyan_trace/fence/addMonitoredPerson";
/// 移除指定服务端地理围栏上的监控对象
 NSString *const kDeleteMonitoredPerson = @"flutter_baidu_yingyan_trace/fence/deleteMonitoredPerson";
/// 查询指定的服务端地理围栏上的监控对象
 NSString *const kQueryListMonitoredPerson = @"flutter_baidu_yingyan_trace/fence/queryListMonitoredPerson";



/// 设置SDK运行所需的基础信息，调用任何方法之前都需要先调用此方法(ios)
NSString *const kConfigServerInfo = @"flutter_baidu_yingyan_trace/trace/configServerInfo";
/// 开启轨迹服务
NSString *const kStartTraceService = @"flutter_baidu_yingyan_trace/trace/startTraceService";
/// 停止轨迹服务
NSString *const kStopTraceService = @"flutter_baidu_yingyan_trace/trace/stopTraceService";
/// 开始采集
NSString *const kStartGather = @"flutter_baidu_yingyan_trace/trace/startGather";
/// 停止采集
NSString *const kStopGather = @"flutter_baidu_yingyan_trace/trace/stopGather";
/// 设置采集周期和打包上传的周期
NSString *const kSetInterval = @"flutter_baidu_yingyan_trace/trace/setInterval";
/// 设置SDK缓存所占磁盘空间的最大值。单位：MB。
NSString *const kSetCacheSize = @"flutter_baidu_yingyan_trace/trace/setCacheSize";



/// 上传某个开发者自定义的轨迹点
/// 除了SDK自动的轨迹采集上传外，开发者可以通过此方法上传自定义的轨迹点。
/// 比如在两个采集周期之间，上传某个轨迹点作为补充。或者上传非当前登陆的entity的其他终端的轨迹点等。
 NSString *const kAddCustomPoint = @"flutter_baidu_yingyan_trace/track/addCustomPoint";

/// 批量上传若干个开发者自定义的轨迹点
/// 除了SDK自动的轨迹采集上传外，开发者可以通过此方法批量上传自定义的轨迹点。
/// 这些轨迹点可以属于不同的终端实体。
 NSString *const kBatchAddCustomPoint = @"flutter_baidu_yingyan_trace/track/batchAddCustomPoint";

///  查询某终端实体的实时位置
 NSString *const kQueryTrackLatestPoint = @"flutter_baidu_yingyan_trace/track/queryTrackLatestPoint";

/// 查询某终端实体在一段时间内的里程
 NSString *const kQueryTrackDistance = @"flutter_baidu_yingyan_trace/track/queryTrackDistance";
/// 查询某终端实体在一段时间内的轨迹
 NSString *const kQueryHistoryTrack = @"flutter_baidu_yingyan_trace/track/queryHistoryTrack";
/// 查询客户端缓存的轨迹信息
 NSString *const kQueryTrackCacheInfo = @"flutter_baidu_yingyan_trace/track/queryTrackCacheInfo";

/// 清空客户端缓存的轨迹信息
 NSString *const kClearTrackCache = @"flutter_baidu_yingyan_trace/track/clearTrackCache";

#endif
