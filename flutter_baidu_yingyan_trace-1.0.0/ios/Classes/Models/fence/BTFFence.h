//
//  BTFFence.h
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/1.
//

#import "BTFModel.h"
#import "BTFModels.h"

@class BTKLocalCircleFence;
@class BTKServerCircleFence;
@class BTKServerPolygonFence;
@class BTKServerPolylineFence;
@class BTKServerDistrictFence;
NS_ASSUME_NONNULL_BEGIN


#pragma mark - CircleFence

@interface BTFCircleFence : BTFModel

/// 围栏id (更新时赋值)
@property (nonatomic, assign) NSUInteger fenceId;

/// 地理围栏的名称，选填。
@property (nonatomic, copy) NSString *fenceName;

/// 地理围栏监控对象的名称。
/// 新建地理围栏时必填，必须为非空字符串。
/// 更新地理围栏时选填。
/// 地理围栏支持监控一至多个entity，用法如下：
/// 1. 监控一个entity，直接设置该字段的值为被监控对象的entityName即可
/// 2. 监控多个entity，先按照情况1创建一个监控单个entity的围栏，再调用addmonitoredperson接口添加其他被监控对象
/// 3. 监控全部entity，将此字段的值设置为'#allentity'
@property (nonatomic, copy) NSString *monitoredPerson;

/// 围栏类型(0：本地围栏， 1：服务围栏) 暂未用到
@property (nonatomic, assign) NSUInteger fenceType;


/// 圆心坐标
@property (nonatomic, strong) BTFCoordinate *center;

/// 半径
@property (nonatomic, assign) double radius;


/// 坐标类型
/// iOS原生SDK初始值为1
@property (nonatomic, assign) NSUInteger coordType;

/// 服务端地理围栏的去燥精度，选填。
/// 单位：米
/// 每个轨迹点都有一个定位误差半径radius，这个值越大，代表定位越不准确，可能是噪点。围栏计算时，如果噪点也参与计算，会造成误报的情况。
/// 设置denoiseAccuracy可控制，当轨迹点的定位误差半径大于设置值时，就会把该轨迹点当做噪点，不参与围栏计算。
/// 若不想去燥，则不需要设置此选项。
@property (nonatomic, assign) NSUInteger deNoise;

/// 本地圆形围栏
- (BTKLocalCircleFence *)toBTKLocalCircleFence;
/// 服务端圆形围栏
- (BTKServerCircleFence *)toBTKServerCircleFence;

@end

#pragma mark - PolygonFence
@interface BTFPolygonFence : BTFModel
/// 地理围栏的名称，选填。
@property (nonatomic, copy) NSString *fenceName;
/// 围栏id (更新时赋值)
@property (nonatomic, assign) NSUInteger fenceId;
/// 地理围栏监控对象的名称。
/// 新建地理围栏时必填，必须为非空字符串。
/// 更新地理围栏时选填。
/// 地理围栏支持监控一至多个entity，用法如下：
/// 1. 监控一个entity，直接设置该字段的值为被监控对象的entityName即可
/// 2. 监控多个entity，先按照情况1创建一个监控单个entity的围栏，再调用addmonitoredperson接口添加其他被监控对象
/// 3. 监控全部entity，将此字段的值设置为'#allentity'
@property (nonatomic, copy) NSString *monitoredPerson;
/// 围栏类型(0：本地围栏， 1：服务围栏) 暂未用到
@property (nonatomic, assign) NSUInteger fenceType;

/// 服务端线形围栏的形状点的的坐标，必填。
/// 数组中的每一项为CLLocationCoordinate2D类型的坐标点，代表构成线段的一个形状点。
/// 坐标点个数在2个到100个之间。
@property (nonatomic, copy) NSArray<BTFCoordinate *> *vertexes;

/// 坐标类型
/// iOS原生SDK初始值为1
@property (nonatomic, assign) NSUInteger coordType;
/// 服务端地理围栏的去燥精度，选填。
/// 单位：米
/// 每个轨迹点都有一个定位误差半径radius，这个值越大，代表定位越不准确，可能是噪点。围栏计算时，如果噪点也参与计算，会造成误报的情况。
/// 设置denoiseAccuracy可控制，当轨迹点的定位误差半径大于设置值时，就会把该轨迹点当做噪点，不参与围栏计算。
/// 若不想去燥，则不需要设置此选项。
@property (nonatomic, assign) NSUInteger deNoise;

/// 服务端多边形围栏
- (BTKServerPolygonFence *)toBTKServerPolygonFence;

@end


#pragma mark - PolylineFence
@interface BTFPolylineFence : BTFModel

/// 围栏id (更新时赋值)
@property (nonatomic, assign) NSUInteger fenceId;

/// 地理围栏的名称，选填。
@property (nonatomic, copy) NSString *fenceName;

/// 地理围栏监控对象的名称。
/// 新建地理围栏时必填，必须为非空字符串。
/// 更新地理围栏时选填。
/// 地理围栏支持监控一至多个entity，用法如下：
/// 1. 监控一个entity，直接设置该字段的值为被监控对象的entityName即可
/// 2. 监控多个entity，先按照情况1创建一个监控单个entity的围栏，再调用addmonitoredperson接口添加其他被监控对象
/// 3. 监控全部entity，将此字段的值设置为'#allentity'
@property (nonatomic, copy) NSString *monitoredPerson;
/// 围栏类型(0：本地围栏， 1：服务围栏) 暂未用到
@property (nonatomic, assign) NSUInteger fenceType;

/// 服务端线形围栏的形状点的的坐标，必填。
/// 数组中的每一项为CLLocationCoordinate2D类型的坐标点，代表构成线段的一个形状点。
/// 坐标点个数在2个到100个之间。
@property (nonatomic, copy) NSArray<BTFCoordinate *> *vertexes;

/// 服务端线形围栏的报警偏移距离（若偏离折线距离超过该距离即报警），必填。
/// 单位：米
@property (nonatomic, assign) NSInteger offset;
/// 坐标类型
/// iOS原生SDK初始值为1
@property (nonatomic, assign) NSUInteger coordType;
/// 服务端地理围栏的去燥精度，选填。
/// 单位：米
/// 每个轨迹点都有一个定位误差半径radius，这个值越大，代表定位越不准确，可能是噪点。围栏计算时，如果噪点也参与计算，会造成误报的情况。
/// 设置denoiseAccuracy可控制，当轨迹点的定位误差半径大于设置值时，就会把该轨迹点当做噪点，不参与围栏计算。
/// 若不想去燥，则不需要设置此选项。
@property (nonatomic, assign) NSUInteger deNoise;

/// 服务端线形围栏
- (BTKServerPolylineFence *)toBTKServerPolylineFence;
@end


#pragma mark - DistrictFence
@interface BTFDistrictFence : BTFModel
/// 围栏id (更新时赋值)
@property (nonatomic, assign) NSUInteger fenceId;
/// 地理围栏的名称，选填。
@property (nonatomic, copy) NSString *fenceName;

/// 地理围栏监控对象的名称。
/// 新建地理围栏时必填，必须为非空字符串。
/// 更新地理围栏时选填。
/// 地理围栏支持监控一至多个entity，用法如下：
/// 1. 监控一个entity，直接设置该字段的值为被监控对象的entityName即可
/// 2. 监控多个entity，先按照情况1创建一个监控单个entity的围栏，再调用addmonitoredperson接口添加其他被监控对象
/// 3. 监控全部entity，将此字段的值设置为'#allentity'
@property (nonatomic, copy) NSString *monitoredPerson;
/// 围栏类型(0：本地围栏， 1：服务围栏) 暂未用到
@property (nonatomic, assign) NSUInteger fenceType;

/// 行政区划关键字
@property (nonatomic, copy) NSString *keyword;

/// 服务端地理围栏的去燥精度，选填。
/// 单位：米
/// 每个轨迹点都有一个定位误差半径radius，这个值越大，代表定位越不准确，可能是噪点。围栏计算时，如果噪点也参与计算，会造成误报的情况。
/// 设置denoiseAccuracy可控制，当轨迹点的定位误差半径大于设置值时，就会把该轨迹点当做噪点，不参与围栏计算。
/// 若不想去燥，则不需要设置此选项。
@property (nonatomic, assign) NSUInteger deNoise;


/// 结构化的行政区划描述
/// 注：仅在查询行政区域围栏时，该字段有值。
@property (nonatomic, copy) NSString *district;

- (BTKServerDistrictFence *)toBTKServerDistrictFence;

@end
NS_ASSUME_NONNULL_END
