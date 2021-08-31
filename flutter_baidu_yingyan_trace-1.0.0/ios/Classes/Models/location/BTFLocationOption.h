//
//  BTFLocationOption.h
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/8.
//

#import "BTFModel.h"
#import <CoreLocation/CoreLocation.h>
NS_ASSUME_NONNULL_BEGIN

@interface BTFLocationOption : BTFModel
/// 定位类型
@property (nonatomic, assign) NSUInteger locationActivityType;
/// 定位精度
@property (nonatomic, assign) NSUInteger locationAccuracy;
/// 触发定位的距离阀值(多少米定位一次)
@property (nonatomic, assign) double distanceFilter;

/// 定位类型
- (CLActivityType)activityType;
/// 定位精度
- (CLLocationAccuracy)desiredAccuracy;

@end

NS_ASSUME_NONNULL_END
