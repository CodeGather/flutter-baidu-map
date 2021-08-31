//
//  BTFEntityResult.h
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/16.
//

#import "BTFModel.h"

@class BTFCoordinate;
NS_ASSUME_NONNULL_BEGIN


@interface BTFLatestLocation : BTFModel

/// 经纬度
@property (nonatomic, strong) BTFCoordinate *location;
/// 楼层
@property (nonatomic, copy) NSString *floor;

/// 距中心点距离
@property (nonatomic, assign) double distance;

/// 对象名称
@property (nonatomic, copy) NSString *objectName;

/// 经纬度类型
@property (nonatomic, assign) NSUInteger coordType;

/// 定位精度
@property (nonatomic, assign) double radius;

/// 定位时间
@property (nonatomic, assign) NSUInteger locTime;

/// 方向（范围为[0,359]，0度为正北方向，顺时针）
@property (nonatomic, assign) int direction;


/// 速度（单位：km/h）
@property (nonatomic, assign) double speed;

/// 高度（单位： m）
@property (nonatomic, assign) double height;

/// 自定义轨迹属性（track attribute）
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> *columns;

@end

@interface BTFEntityInfo : BTFModel

/// entity名称，其唯一标识
@property (nonatomic, copy) NSString *entityName;

/// entity 可读性描述
@property (nonatomic, copy) NSString *entityDesc;

/// entity属性修改时间
@property (nonatomic, copy) NSString *modifyTime;

/// entity创建时间
@property (nonatomic, copy) NSString *createTime;


/// 开发者自定义的entity属性信息
@property (nonatomic, strong) NSDictionary *customColumns;

/// 最新的轨迹点信息
@property (nonatomic, strong) BTFLatestLocation *latestLocation;

@end

@interface BTFQueryEntityListResult : BTFModel
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

/// entity详细信息列表
@property (nonatomic, strong) NSArray<BTFEntityInfo *> *entities;

@end

NS_ASSUME_NONNULL_END
