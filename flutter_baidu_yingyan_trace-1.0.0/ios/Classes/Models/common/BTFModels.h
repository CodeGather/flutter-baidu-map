//
//  BTFModels.h
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/1.
//

#import "BTFModel.h"
#import <CoreLocation/CLLocation.h>
NS_ASSUME_NONNULL_BEGIN

@interface BTFCoordinate : BTFModel

/// 纬度
@property(nonatomic, assign) double latitude;

/// 经度
@property(nonatomic, assign) double longitude;

/// 经纬度结构体数组
+ (CLLocationCoordinate2D *)fromData:(NSArray<NSDictionary *> *)data;

/// 释放经纬度结构体数组
+ (BOOL)freeCoords:(CLLocationCoordinate2D *_Nonnull*_Nullable)coords;


/// BTFCoordinate对象数组
+ (NSArray<BTFCoordinate *> *)coordinatesWith:(NSArray<NSDictionary *> *)data;

/// BTFCoordinate  ->  CLLocationCoordinate2D
- (CLLocationCoordinate2D)toCLLocationCoordinate2D;


/// CLLocationCoordinate2D -> BTFCoordinate
+ (BTFCoordinate *)fromCLLocationCoordinate2D:(CLLocationCoordinate2D)coord;


@end

/// 轨迹点的基类
@interface BTFPoint : BTFModel

/// 经纬度
@property (nonatomic, strong) BTFCoordinate *location;

/// 轨迹点的坐标类型
/// iOS原生SDK初始值为1
@property (nonatomic, assign) NSUInteger coordType;


/// 轨迹点的定位时间
@property (nonatomic, assign) NSUInteger locTime;

///  方向
@property (nonatomic, assign) NSUInteger direction;

/// 高度
@property (nonatomic, assign) double height;

/// 定位精度
@property (nonatomic, assign) double radius;

/// 速度
@property (nonatomic, assign) double speed;
@end

NS_ASSUME_NONNULL_END
