//
//  BTFAnalysisResult.h
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/17.
//

#import "BTFModel.h"

@class BTFCoordinate;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - drive behaviour

/// 驾车点
@interface BTFDrivePoint : BTFModel

/// 经纬度
@property (nonatomic, strong) BTFCoordinate *location;

/// 定位时间
@property (nonatomic, assign) NSUInteger locTime;

/// 轨迹点的坐标类型
/// iOS原生SDK初始值为1
@property (nonatomic, assign) NSUInteger coordType;

/// 地址
@property (nonatomic, copy) NSString *address;


@end

@interface BTFSpeedingPoint : BTFModel

/// 经纬度
@property (nonatomic, strong) BTFCoordinate *location;

/// 定位时间
@property (nonatomic, assign) NSUInteger locTime;

/// 轨迹点的坐标类型
/// iOS原生SDK初始值为1
@property (nonatomic, assign) NSUInteger coordType;

/// 实际行使时速，单位：km/h
@property (nonatomic, assign) double actualSpeed;

/// 所在道路限定最高时速，单位：km/h
@property (nonatomic, assign) double limitSpeed;


@end

@interface BTFSpeedingInfo : BTFModel

/// 超速里程，单位：米
@property (nonatomic, assign) double distance;


/// 超速点集合
@property (nonatomic, copy) NSArray<BTFSpeedingPoint *> *points;


@end

/// 急加速点
@interface BTFHarshAccelerationPoint : BTFModel
/// 经纬度
@property (nonatomic, strong) BTFCoordinate *location;

/// 定位时间
@property (nonatomic, assign) NSUInteger locTime;

/// 轨迹点的坐标类型
/// iOS原生SDK初始值为1
@property (nonatomic, assign) NSUInteger coordType;

/// 实际加速度，单位：m/s^2
@property (nonatomic, assign) double acceleration;

/// 加速前时速，单位：km/h
@property (nonatomic, assign) double initialSpeed;

/// 加速后时速，单位：km/h
@property (nonatomic, assign) double endSpeed;


@end

/// 急刹车点
@interface BTFHarshBreakingPoint : BTFModel
/// 经纬度
@property (nonatomic, strong) BTFCoordinate *location;

/// 定位时间
@property (nonatomic, assign) NSUInteger locTime;

/// 轨迹点的坐标类型
/// iOS原生SDK初始值为1
@property (nonatomic, assign) NSUInteger coordType;

/// 实际加速度，单位：m/s^2
@property (nonatomic, assign) double acceleration;

/// 刹车前时速，单位：km/h
@property (nonatomic, assign) double initialSpeed;

/// 刹车后时速，单位：km/h
@property (nonatomic, assign) double endSpeed;

@end

/// 急转弯点
@interface BTFHarshSteeringPoint : BTFModel
/// 经纬度
@property (nonatomic, strong) BTFCoordinate *location;

/// 定位时间
@property (nonatomic, assign) NSUInteger locTime;

/// 轨迹点的坐标类型
/// iOS原生SDK初始值为1
@property (nonatomic, assign) NSUInteger coordType;

/// 向心加速度，单位：m/s^2
@property (nonatomic, assign) double centripetalAcceleration;

/// 转向类型
@property (nonatomic, assign) NSUInteger turnType;

/// 刹车后时速，单位：km/h
@property (nonatomic, assign) double endSpeed;

@end

@interface BTFDrivingBehaviourAnalysisResult : BTFModel
/// 请求标识
@property (nonatomic, assign) int tag;

/// 状态码
@property (nonatomic, assign) int status;

/// 状态消息
@property (nonatomic, copy) NSString *message;

/// 行程里程，单位：米
@property (nonatomic, assign) double distance;

/// 行程耗时，单位：秒
@property (nonatomic, assign) NSUInteger duration;

/// 平均时速，单位：km/h
@property (nonatomic, assign) double averageSpeed;

/// 最高时速，单位：km/h
@property (nonatomic, assign) double maxSpeed;

/// 超速次数
@property (nonatomic, assign) int speedingNum;

/// 急加速次数
@property (nonatomic, assign) int harshAccelerationNum;

/// 急刹车次数
@property (nonatomic, assign) int harshBreakingNum;

/// 急转弯次数
@property (nonatomic, assign) int harshSteeringNum;

/// 起点信息
@property (nonatomic, strong) BTFDrivePoint *startPoint;

/// 终点信息
@property (nonatomic, strong) BTFDrivePoint *endPoint;

/// 超速记录集
@property (nonatomic, copy) NSArray<BTFSpeedingInfo *> *speedings;

/// 急加速记录集合
@property (nonatomic, copy) NSArray<BTFHarshAccelerationPoint *> *harshAccelerationPoints;

/// 急刹车记录集合
@property (nonatomic, copy) NSArray<BTFHarshBreakingPoint *> *harshBreakingPoints;

/// 急转弯记录集合
@property (nonatomic, copy) NSArray<BTFHarshSteeringPoint *> *harshSteeringPoints;


@end



#pragma mark - stay point

@interface BTFStayPoint : BTFModel
/// 停留开始时间
@property (nonatomic, assign) NSUInteger startTime;

/// 停留结束时间
@property (nonatomic, assign) NSUInteger endTime;


/// 停留时长
@property (nonatomic, assign) NSUInteger duration;

/// 停留点
@property (nonatomic, strong) BTFCoordinate *location;

/// 轨迹点的坐标类型
/// iOS原生SDK初始值为1
@property (nonatomic, assign) NSUInteger coordType;

@end

@interface BTFStayPointAnalysisResult : BTFModel
/// 请求标识
@property (nonatomic, assign) int tag;

/// 状态码
@property (nonatomic, assign) int status;

/// 状态消息
@property (nonatomic, copy) NSString *message;

/// 停留次数
@property (nonatomic, assign) int stayPointNum;

/// 停留记录列表
@property (nonatomic, strong) NSArray<BTFStayPoint *> *stayPoints;

@end
NS_ASSUME_NONNULL_END
