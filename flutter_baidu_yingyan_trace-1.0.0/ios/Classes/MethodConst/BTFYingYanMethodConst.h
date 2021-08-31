
#ifndef __BTFYingYanMethodConst__H__
#define __BTFYingYanMethodConst__H__

#import <Foundation/Foundation.h>

/// 定位权限相关方法
FOUNDATION_EXPORT NSString *const kLocalPermissionMethods;

/// 轨迹分析的相关方法
FOUNDATION_EXPORT NSString *const kAnalysisMethods;
/// entity终端的相关方法
FOUNDATION_EXPORT NSString *const kEntityMethods;
/// 地理围栏业务的相关方法
FOUNDATION_EXPORT NSString *const kFenceyMethods;
/// 轨迹服务与采集的相关方法
FOUNDATION_EXPORT NSString *const kGatherMethods;
/// 轨迹纠偏与里程计算的相关方法
FOUNDATION_EXPORT NSString *const kTrackMethods;



/// 申请定位权限
FOUNDATION_EXPORT NSString *const kRequestLocalPermission;
/// 定位参数配置
FOUNDATION_EXPORT NSString *const kConfigLocationInfo;

/// 停留点分析
FOUNDATION_EXPORT NSString *const kAnalyzeStayPoint;
/// 驾驶行为分析
FOUNDATION_EXPORT NSString *const kAnalyzeDrivingBehaviour;


/// 创建Entity终端实体，并赋属性信息
FOUNDATION_EXPORT NSString *const kAddEntity;
/// 删除Entity终端实体
FOUNDATION_EXPORT NSString *const kDeleteEntity;
/// 更新Entity终端实体属性信息
FOUNDATION_EXPORT NSString *const kUpdateEntity;
/// 检索符合过滤条件的Entity终端实体，返回Entity属性信息和最新位置;
/// 可用于列出Entity，也可用于批量查询多个Entity的位置。
FOUNDATION_EXPORT NSString *const kQueryEntityList;
/// 根据关键字搜索Entity终端实体，并返回实时位置。
FOUNDATION_EXPORT NSString *const kSearchEntity;
///  根据矩形地理范围搜索Entity终端实体，并返回实时位置
FOUNDATION_EXPORT NSString *const kBoundSearchEntity;
/// 根据圆心半径搜索Entity终端实体，并返回实时位置
FOUNDATION_EXPORT NSString *const kAroundSearchEntity;
/// 在多边形区域内搜索Entity终端实体，并返回实时位置
FOUNDATION_EXPORT NSString *const kPolygonSearchEntity;
/// 在行政区域内搜索Entity终端实体，并返回实时位置
FOUNDATION_EXPORT NSString *const kDistrictSearchEntity;



/// 新建围栏
FOUNDATION_EXPORT NSString *const kCreateFence;
/// 删除围栏
FOUNDATION_EXPORT NSString *const kDeleteFence;
/// 更新围栏
FOUNDATION_EXPORT NSString *const kUpdateFence;
/// 查询围栏
FOUNDATION_EXPORT NSString *const kQueryFenceList;
///  查询被监控对象和地理围栏的位置关系
FOUNDATION_EXPORT NSString *const kQueryMonitoredStatus;
/// 查询被监控对象，在指定的坐标时，和地理围栏的位置关系
FOUNDATION_EXPORT NSString *const kQueryMonitoredStatusByLocation;
/// 查询指定监控对象的地理围栏历史报警信息
FOUNDATION_EXPORT NSString *const kQueryHistoryAlarm;
/// 给服务端地理围栏添加监控对象
FOUNDATION_EXPORT NSString *const kAddMonitoredPerson;
/// 移除指定服务端地理围栏上的监控对象
FOUNDATION_EXPORT NSString *const kDeleteMonitoredPerson;
/// 查询指定的服务端地理围栏上的监控对象
FOUNDATION_EXPORT NSString *const kQueryListMonitoredPerson;


/// 设置SDK运行所需的基础信息，调用任何方法之前都需要先调用此方法(ios)
FOUNDATION_EXPORT NSString *const kConfigServerInfo;
/// 开启轨迹服务
FOUNDATION_EXPORT NSString *const kStartTraceService;
/// 停止轨迹服务
FOUNDATION_EXPORT NSString *const kStopTraceService;
/// 开始采集
FOUNDATION_EXPORT NSString *const kStartGather;
/// 停止采集
FOUNDATION_EXPORT NSString *const kStopGather;
/// 设置采集周期和打包上传的周期
FOUNDATION_EXPORT NSString *const kSetInterval;
/// 设置SDK缓存所占磁盘空间的最大值。单位：MB。
FOUNDATION_EXPORT NSString *const kSetCacheSize;



/// 上传某个开发者自定义的轨迹点
/// 除了SDK自动的轨迹采集上传外，开发者可以通过此方法上传自定义的轨迹点。
/// 比如在两个采集周期之间，上传某个轨迹点作为补充。或者上传非当前登陆的entity的其他终端的轨迹点等。
FOUNDATION_EXPORT NSString *const kAddCustomPoint;

/// 批量上传若干个开发者自定义的轨迹点
/// 除了SDK自动的轨迹采集上传外，开发者可以通过此方法批量上传自定义的轨迹点。
/// 这些轨迹点可以属于不同的终端实体。
FOUNDATION_EXPORT NSString *const kBatchAddCustomPoint;

///  查询某终端实体的实时位置
FOUNDATION_EXPORT NSString *const kQueryTrackLatestPoint;

/// 查询某终端实体在一段时间内的里程
FOUNDATION_EXPORT NSString *const kQueryTrackDistance;
/// 查询某终端实体在一段时间内的轨迹
FOUNDATION_EXPORT NSString *const kQueryHistoryTrack;
/// 查询客户端缓存的轨迹信息
FOUNDATION_EXPORT NSString *const kQueryTrackCacheInfo;

/// 清空客户端缓存的轨迹信息
FOUNDATION_EXPORT NSString *const kClearTrackCache;



#endif
