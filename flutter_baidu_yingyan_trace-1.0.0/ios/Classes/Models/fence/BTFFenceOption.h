//
//  BTFFenceOption.h
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/10.
//

#import "BTFModel.h"


@class BTFCoordinate;

@class BTKCreateLocalFenceRequest;
@class BTKCreateServerFenceRequest;

@class BTKDeleteLocalFenceRequest;
@class BTKDeleteServerFenceRequest;

@class BTKUpdateLocalFenceRequest;
@class BTKUpdateServerFenceRequest;

@class BTKQueryLocalFenceRequest;
@class BTKQueryServerFenceRequest;

@class BTKQueryLocalFenceStatusRequest;
@class BTKQueryServerFenceStatusRequest;

@class BTKQueryLocalFenceStatusByCustomLocationRequest;
@class BTKQueryServerFenceStatusByCustomLocationRequest;

@class BTKQueryLocalFenceHistoryAlarmRequest;
@class BTKQueryServerFenceHistoryAlarmRequest;

@class BTKAddMonitoredObjectRequest;
@class BTKDeleteMonitoredObjectRequest;
@class BTKListMonitoredObjectRequest;
NS_ASSUME_NONNULL_BEGIN

@interface BTFCreateFenceOption : BTFModel

/// 轨迹服务的ID
@property (nonatomic, assign) NSUInteger serviceId;

/// 请求标志
@property (nonatomic, assign) NSUInteger tag;


/// fence
@property (nonatomic, copy) NSDictionary<NSString *, NSString *> *fence;

/// 围栏类型(用于判断是本地围栏还是服务围栏)
/// (0：本地围栏，1:服务围栏，-1: fence为无效数据)
- (NSUInteger)fenceType;


///创建 客户端地理围栏的请求信息类
- (BTKCreateLocalFenceRequest *)toBTKCreateLocalFenceRequest;

/// 创建服务端端地理围栏的请求信息类
- (BTKCreateServerFenceRequest *)toBTKCreateServerFenceRequest;

@end


#pragma mark - delete

@interface BTFDeleteFenceOption : BTFModel
/// 轨迹服务的ID
@property (nonatomic, assign) NSUInteger serviceId;

/// 请求标志
@property (nonatomic, assign) NSUInteger tag;


/// 删除围栏类型
@property (nonatomic, assign) NSUInteger fenceType;

/// 要删除的地理围栏所监控的对象
@property (nonatomic, copy) NSString *monitoredPerson;

/// 要删除的地理围栏的ID数组，若为nil或空数组则删除监控对象上的所有地理围栏
@property (nonatomic, copy) NSArray<NSNumber *> *fenceIds;

///  删除客户端地理围栏的请求对象
- (BTKDeleteLocalFenceRequest *)toBTKDeleteLocalFenceRequest;
/// 删除服务端地理围栏的请求对象
- (BTKDeleteServerFenceRequest *)toBTKDeleteServerFenceRequest;

@end
#pragma mark - update
@interface BTFUpdateFenceOption : BTFModel

/// 轨迹服务的ID
@property (nonatomic, assign) NSUInteger serviceId;

/// 请求标志
@property (nonatomic, assign) NSUInteger tag;


/// fence
@property (nonatomic, copy) NSDictionary<NSString *, NSString *> *fence;

/// 围栏类型(用于判断是本地围栏还是服务围栏)
/// (0：本地围栏，1:服务围栏，-1: fence为无效数据)
- (NSUInteger)fenceType;


/// 更新客户端地理围栏的请求信息类
- (BTKUpdateLocalFenceRequest *)toBTKUpdateLocalFenceRequest;

/// 更新服务端地理围栏的请求信息类
- (BTKUpdateServerFenceRequest *)toBTKUpdateServerFenceRequest;


@end

#pragma mark - query

@interface BTFQueryFenceOption : BTFModel
/// 轨迹服务的ID
@property (nonatomic, assign) NSUInteger serviceId;

/// 请求标志
@property (nonatomic, assign) NSUInteger tag;
/// 删除围栏类型
@property (nonatomic, assign) NSUInteger fenceType;

/// 要删除的地理围栏所监控的对象
@property (nonatomic, copy) NSString *monitoredPerson;

/// 要删除的地理围栏的ID数组，若为nil或空数组则删除监控对象上的所有地理围栏
@property (nonatomic, copy) NSArray<NSNumber *> *fenceIds;

/// 返回结果的坐标类型
/// 国内只能选择百度经纬度或者国测局经纬度，该字段在国外无效，国外均返回 wgs84坐标
/// iOS原生SDK起始值为1
@property (nonatomic, assign) NSUInteger coordTypeOutput;

/// 分页索引，选填。
/// 默认值为1。
/// pageIndex与pageSize一起计算从第几条结果返回，代表返回第几页。
@property (nonatomic, assign) NSUInteger pageIndex;

/// 分页大小，选填。
/// 默认值为100。
/// pageSize与pageIndex一起计算从第几条结果返回，代表返回结果中每页有几条记录。
@property (nonatomic, assign) NSUInteger pageSize;

/// 查询客户端围栏
- (BTKQueryLocalFenceRequest *)toBTKQueryLocalFenceRequest;
/// 查询服务端地理围栏
- (BTKQueryServerFenceRequest *)toBTKQueryServerFenceRequest;

@end

#pragma mark - 服务端地理围栏的报警查询

@interface BTFQueryFenceStatusOption : BTFModel
/// 轨迹服务的ID
@property (nonatomic, assign) NSUInteger serviceId;

/// 请求标志
@property (nonatomic, assign) NSUInteger tag;
/// 删除围栏类型
@property (nonatomic, assign) NSUInteger fenceType;

/// 要删除的地理围栏所监控的对象
@property (nonatomic, copy) NSString *monitoredPerson;

/// 要删除的地理围栏的ID数组，若为nil或空数组则删除监控对象上的所有地理围栏
@property (nonatomic, copy) NSArray<NSNumber *> *fenceIds;

/// 分页索引，选填。
/// 默认值为1。
/// pageIndex与pageSize一起计算从第几条结果返回，代表返回第几页。
@property (nonatomic, assign) NSUInteger pageIndex;

/// 分页大小，选填。
/// 默认值为100。
/// pageSize与pageIndex一起计算从第几条结果返回，代表返回结果中每页有几条记录。
@property (nonatomic, assign) NSUInteger pageSize;
/// 查询被监控对象和客户端地理围栏的位置关系
- (BTKQueryLocalFenceStatusRequest *)toBTKQueryLocalFenceStatusRequest;

/// 查询监控对象在围栏内或外
- (BTKQueryServerFenceStatusRequest *)toBTKQueryServerFenceStatusRequest;

@end


@interface BTFQueryFenceStatusByCustomLocation : BTFModel
/// 轨迹服务的ID
@property (nonatomic, assign) NSUInteger serviceId;

/// 请求标志
@property (nonatomic, assign) NSUInteger tag;
/// 删除围栏类型
@property (nonatomic, assign) NSUInteger fenceType;

/// 要删除的地理围栏所监控的对象
@property (nonatomic, copy) NSString *monitoredPerson;

/// 要删除的地理围栏的ID数组，若为nil或空数组则删除监控对象上的所有地理围栏
@property (nonatomic, copy) NSArray<NSNumber *> *fenceIds;


/// 指定的坐标位置
@property (nonatomic, strong) BTFCoordinate *latLng;

/// 返回结果的坐标类型
/// 国内只能选择百度经纬度或者国测局经纬度，该字段在国外无效，国外均返回 wgs84坐标
/// iOS原生SDK起始值为1
@property (nonatomic, assign) NSUInteger coordType;

/// 分页索引，选填。
/// 默认值为1。
/// pageIndex与pageSize一起计算从第几条结果返回，代表返回第几页。
@property (nonatomic, assign) NSUInteger pageIndex;

/// 分页大小，选填。
/// 默认值为100。
/// pageSize与pageIndex一起计算从第几条结果返回，代表返回结果中每页有几条记录。
@property (nonatomic, assign) NSUInteger pageSize;


/// 查询被监控对象，在指定的位置时，和客户端地理围栏的位置关系的请求信息类
- (BTKQueryLocalFenceStatusByCustomLocationRequest *)toBTKQueryLocalFenceStatusByCustomLocationRequest;

/// 查询被监控对象，在指定的位置时，和服务端地理围栏的位置关系的请求信息类
- (BTKQueryServerFenceStatusByCustomLocationRequest *)toBTKQueryServerFenceStatusByCustomLocationRequest;
@end


@interface BTFQueryFenceHistoryAlarmOption : BTFModel

/// 轨迹服务的ID
@property (nonatomic, assign) NSUInteger serviceId;

/// 请求标志
@property (nonatomic, assign) NSUInteger tag;
/// 删除围栏类型
@property (nonatomic, assign) NSUInteger fenceType;

/// 要删除的地理围栏所监控的对象
@property (nonatomic, copy) NSString *monitoredPerson;

/// 要删除的地理围栏的ID数组，若为nil或空数组则删除监控对象上的所有地理围栏
@property (nonatomic, copy) NSArray<NSNumber *> *fenceIds;


/// 返回结果的坐标类型
/// 国内只能选择百度经纬度或者国测局经纬度，该字段在国外无效，国外均返回 wgs84坐标
/// iOS原生SDK起始值为1
@property (nonatomic, assign) NSUInteger coordTypeOutput;

/// 开始时间
@property (nonatomic, assign) NSUInteger startTime;

/// 结束时间
@property (nonatomic, assign) NSUInteger endTime;

///  查询指定监控对象的客户端围栏报警信息的请求信息类
- (BTKQueryLocalFenceHistoryAlarmRequest *)toBTKQueryLocalFenceHistoryAlarmRequest;
/// 查询指定监控对象的服务端围栏报警信息的请求信息类
- (BTKQueryServerFenceHistoryAlarmRequest *)toBTKQueryServerFenceHistoryAlarmRequest;
@end


#pragma mark - 服务端围栏监控对象管理

@interface BTFAddMonitoredObjectOption : BTFModel
/// 轨迹服务的ID
@property (nonatomic, assign) NSUInteger serviceId;

/// 请求标志
@property (nonatomic, assign) NSUInteger tag;

/// 要添加监控对象的地理围栏的唯一标识符
@property (nonatomic, assign) NSUInteger fenceId;

/// 需要添加的监控对象的名称数组，必选。
/// 数组中每一项代表一个被监控对象的名称
@property (nonatomic, copy) NSArray <NSString *> *monitoredPersons;

- (BTKAddMonitoredObjectRequest *)toBTKAddMonitoredObjectRequest;

@end


@interface BTFDeleteMonitoredObjectOption : BTFModel
/// 轨迹服务的ID
@property (nonatomic, assign) NSUInteger serviceId;

/// 请求标志
@property (nonatomic, assign) NSUInteger tag;

/// 要添加监控对象的地理围栏的唯一标识符
@property (nonatomic, assign) NSUInteger fenceId;

/// 需要删除的监控对象的名称数组，必选。
/// 数组中每一项代表一个被监控对象的名称。
/// 数组为空或传入nil则删除该围栏的所有监控对象
@property (nonatomic, copy) NSArray <NSString *> *monitoredPersons;

- (BTKDeleteMonitoredObjectRequest *)toBTKDeleteMonitoredObjectRequest;

@end


@interface BTFListMonitoredObjectOption : BTFModel
/// 轨迹服务的ID
@property (nonatomic, assign) NSUInteger serviceId;

/// 请求标志
@property (nonatomic, assign) NSUInteger tag;

/// 地理围栏的唯一标识符
@property (nonatomic, assign) NSUInteger fenceId;

/// 分页索引，选填。
/// pageIndex与pageSize一起计算从第几条结果返回，代表返回第几页。
@property (nonatomic, assign) NSUInteger pageIndex;

/// 分页大小，选填。
/// pageSize与pageIndex一起计算从第几条结果返回，代表返回结果中每页有几条记录。
@property (nonatomic, assign) NSUInteger pageSize;

- (BTKListMonitoredObjectRequest *)toBTKListMonitoredObjectRequest;

@end
NS_ASSUME_NONNULL_END
