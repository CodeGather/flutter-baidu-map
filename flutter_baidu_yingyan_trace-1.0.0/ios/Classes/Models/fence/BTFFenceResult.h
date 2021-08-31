//
//  BTFFenceResult.h
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/14.
//

#import "BTFModel.h"

@class BTFCoordinate;
@class BTFCircleFence;
@class BTFPolygonFence;
@class BTFPolylineFence;
@class BTFDistrictFence;
@class BTKFenceAlarmLocationPoint;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - create
@interface BTFFenceCreateResult : BTFModel

/// 请求标识
@property (nonatomic, assign) int tag;

/// 状态码
@property (nonatomic, assign) int status;

/// 状态消息
@property (nonatomic, copy) NSString *message;

/// fenceId
@property (nonatomic, assign) int fenceId;

/// district
@property (nonatomic, copy) NSString *district;

@end


#pragma mark - delete

@interface BTFFenceDelereResult : BTFModel
/// 请求标识
@property (nonatomic, assign) int tag;

/// 状态码
@property (nonatomic, assign) int status;

/// 状态消息
@property (nonatomic, copy) NSString *message;

/// fenceIds
@property (nonatomic, copy) NSArray<NSNumber *> *fenceIds;

@end


#pragma mark - update
@interface BTFFenceUpdateResult : BTFModel
/// 请求标识
@property (nonatomic, assign) int tag;

/// 状态码
@property (nonatomic, assign) int status;

/// 状态消息
@property (nonatomic, copy) NSString *message;

/// district
@property (nonatomic, copy) NSString *district;


@end


#pragma mark - query local result

@interface BTFLocalCircleResult : BTFModel

/// circle fence
@property (nonatomic, strong) BTFCircleFence *circleFence;

/// 创建时间
@property (nonatomic, copy) NSString *createTime;

/// 修改时间
@property (nonatomic, copy) NSString *modifyTime;

/// (0：circle，1：polygon，2：polyline，3：district，-1: fence为无效数据)
@property (nonatomic, assign) NSUInteger fenceShape;

@end

@interface BTFFenceQueryLocalFenceResult : BTFModel

/// 请求标识
@property (nonatomic, assign) int tag;

/// 状态码
@property (nonatomic, assign) int status;

/// 状态消息
@property (nonatomic, copy) NSString *message;

/// 返回结果条数
@property (nonatomic, assign) int size;

/// 围栏类型
@property (nonatomic, assign) NSUInteger fenceType;

/// fences
@property (nonatomic, copy) NSArray<BTFLocalCircleResult *> *fenceInfos;

@end


#pragma mark - query server result

@interface BTFServerCircleResult : BTFModel
/// circle fence
@property (nonatomic, strong) BTFCircleFence *circleFence;

/// 创建时间
@property (nonatomic, copy) NSString *createTime;

/// 修改时间
@property (nonatomic, copy) NSString *modifyTime;

/// (0：circle，1：polygon，2：polyline，3：district，-1: fence为无效数据)
@property (nonatomic, assign) NSUInteger fenceShape;

@end



@interface BTFServerPolygonResult : BTFModel

/// 围栏
@property (nonatomic, strong) BTFPolygonFence *polygonFence;
/// 创建时间
@property (nonatomic, copy) NSString *createTime;

/// 修改时间
@property (nonatomic, copy) NSString *modifyTime;

/// (0：circle，1：polygon，2：polyline，3：district，-1: fence为无效数据)
@property (nonatomic, assign) NSUInteger fenceShape;

@end

@interface BTFServerPolylineResult : BTFModel

/// 围栏
@property (nonatomic, strong) BTFPolylineFence *polylineFence;
/// 创建时间
@property (nonatomic, copy) NSString *createTime;

/// 修改时间
@property (nonatomic, copy) NSString *modifyTime;

/// (0：circle，1：polygon，2：polyline，3：district，-1: fence为无效数据)
@property (nonatomic, assign) NSUInteger fenceShape;


@end

@interface BTFServerDistrictResult : BTFModel

/// 围栏
@property (nonatomic, strong) BTFDistrictFence *districtFence;
/// 创建时间
@property (nonatomic, copy) NSString *createTime;

/// 修改时间
@property (nonatomic, copy) NSString *modifyTime;

/// (0：circle，1：polygon，2：polyline，3：district，-1: fence为无效数据)
@property (nonatomic, assign) NSUInteger fenceShape;

@end

@interface BTFQueryServerResult  : BTFModel
/// 请求标识
@property (nonatomic, assign) int tag;

/// 状态码
@property (nonatomic, assign) int status;

/// 状态消息
@property (nonatomic, copy) NSString *message;

/// 返回结果条数
@property (nonatomic, assign) int size;

/// total
@property (nonatomic, assign) int totalSize;

/// 围栏类型
@property (nonatomic, assign) NSUInteger fenceType;

/// fences
@property (nonatomic, copy) NSArray *fenceInfos;


- (NSDictionary *)toDict;
@end


#pragma mark - query monitored status

@interface BTFMonitoredStatusInfo : BTFModel

/// 围栏编号
@property (nonatomic, assign) int fenceId;

/// 监控状态
@property (nonatomic, assign) NSUInteger monitoredStatus;

/// local
+ (BTFMonitoredStatusInfo *)fromLocalDict:(NSDictionary *)dict;

/// server
+ (BTFMonitoredStatusInfo *)fromServerDict:(NSDictionary *)dict;
@end

@interface BTFQueryLocalMonitoredStatusResult : BTFModel
/// 请求标识
@property (nonatomic, assign) int tag;

/// 状态码
@property (nonatomic, assign) int status;

/// 状态消息
@property (nonatomic, copy) NSString *message;

/// 返回结果条数
@property (nonatomic, assign) int size;
/// 围栏类型
@property (nonatomic, assign) NSUInteger fenceType;

/// 监控状态信息列表
@property (nonatomic, strong) NSArray<BTFMonitoredStatusInfo *> *monitoredStatusInfos;

@end


@interface BTFQueryServerMonitoredStatusResult : BTFModel
/// 请求标识
@property (nonatomic, assign) int tag;

/// 状态码
@property (nonatomic, assign) int status;

/// 状态消息
@property (nonatomic, copy) NSString *message;

/// 返回结果条数
@property (nonatomic, assign) int size;

/// 所有结果条数（忽略pageIndex，pageSize后的本次查询总围栏个数）
@property (nonatomic, assign) int totalSize;


/// 围栏类型
@property (nonatomic, assign) NSUInteger fenceType;

/// 监控状态信息列表
@property (nonatomic, strong) NSArray<BTFMonitoredStatusInfo *> *monitoredStatusInfos;

@end


#pragma mark - query local history alarm

@interface BTFAlarmPoint : BTFModel

/// 坐标经纬度信息
@property (nonatomic, strong) BTFCoordinate *location;

/// 坐标类型
@property (nonatomic, assign) NSUInteger coordType;

/// 定位时间（单位：秒）
@property (nonatomic, assign) NSUInteger locTime;

/// 上传到服务端时间（只在查询服务端围栏历史报警信息时，该字段有值）
@property (nonatomic, assign) NSUInteger createTime;

/// 定位精度（单位：米）
@property (nonatomic, assign) double radius;

+ (instancetype)from:(BTKFenceAlarmLocationPoint *)point;
@end

@interface BTFFenceAlarmInfo : BTFModel
/// 围栏编号
@property (nonatomic, assign) int fenceId;

/// 围栏名称
@property (nonatomic, copy) NSString *fenceName;

/// 监控对象
@property (nonatomic, copy) NSString *monitoredPerson;


/// 监控动作
@property (nonatomic, assign) NSUInteger monitoredAction;

///  当前报警点轨迹信息
@property (nonatomic, strong) BTFAlarmPoint *currentPoint;

 /// 上一个轨迹点信息
@property (nonatomic, strong) BTFAlarmPoint *prePoint;

@end

@interface BTFQueryLocalHistoryAlarmResult : BTFModel
/// 请求标识
@property (nonatomic, assign) int tag;

/// 状态码
@property (nonatomic, assign) int status;

/// 状态消息
@property (nonatomic, copy) NSString *message;

/// 返回结果条数
@property (nonatomic, assign) int size;

/// 围栏类型
@property (nonatomic, assign) NSUInteger fenceType;

/// 监控对象历史报警列表
@property (nonatomic, strong) NSArray<BTFFenceAlarmInfo *> *fenceAlarmInfos;

@end


@interface BTFQueryServerHistoryAlarmResult : BTFModel
/// 请求标识
@property (nonatomic, assign) int tag;

/// 状态码
@property (nonatomic, assign) int status;

/// 状态消息
@property (nonatomic, copy) NSString *message;

/// 返回结果条数
@property (nonatomic, assign) int size;

/// 本次查询总报警数
@property (nonatomic, assign) int totalSize;

/// 围栏类型
@property (nonatomic, assign) NSUInteger fenceType;

/// 监控对象历史报警列表
@property (nonatomic, strong) NSArray<BTFFenceAlarmInfo *> *fenceAlarmInfos;

@end


#pragma mark - query list monitored person
@interface BTFQueryListMonitoredPersonResult : BTFModel
/// 请求标识
@property (nonatomic, assign) int tag;

/// 状态码
@property (nonatomic, assign) int status;

/// 状态消息
@property (nonatomic, copy) NSString *message;

/// 返回结果条数
@property (nonatomic, assign) int size;

/// 本次查询总报警数
@property (nonatomic, assign) int totalSize;

@property (nonatomic, strong) NSArray<NSString *> *monitoredPersons;

@end
NS_ASSUME_NONNULL_END
