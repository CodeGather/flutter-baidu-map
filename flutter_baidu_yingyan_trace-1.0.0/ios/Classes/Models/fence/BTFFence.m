//
//  BTFFence.m
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/1.
//

#import "BTFFence.h"
#import <BaiduTraceSDK/BaiduTraceSDK.h>

@implementation BTFCircleFence
/// 本地圆形围栏
- (BTKLocalCircleFence *)toBTKLocalCircleFence {
    if (!self.center || self.radius < 0) return nil;
    // iOS原生SDK, 坐标类型初始值为1
    BTKLocalCircleFence *fence = [BTKLocalCircleFence new];
    fence.center = [self.center toCLLocationCoordinate2D];
    fence.radius = self.radius;
    fence.coordType = self.coordType + 1;
    fence.denoiseAccuracy = self.deNoise;
    fence.fenceName = self.fenceName;
    fence.monitoredObject = self.monitoredPerson;
    return fence;
}
/// 服务端圆形围栏
- (BTKServerCircleFence *)toBTKServerCircleFence {
    if (!self.center || self.radius < 0) return nil;
    // iOS原生SDK, 坐标类型初始值为1
    BTKServerCircleFence *fence = [BTKServerCircleFence new];
    fence.center = [self.center toCLLocationCoordinate2D];
    fence.radius = self.radius;
    fence.coordType = self.coordType + 1;
    fence.denoiseAccuracy = self.deNoise;
    fence.fenceName = self.fenceName;
    fence.monitoredObject = self.monitoredPerson;
    return fence;
}
@end



@implementation BTFPolygonFence
+ (NSDictionary *)btf_setupObjectClassInArray {
    return @{@"vertexes" : @"BTFCoordinate"};
}
- (BTKServerPolygonFence *)toBTKServerPolygonFence {
    if (!self.vertexes || self.vertexes.count <= 2) return nil;
    // iOS原生SDK, 坐标类型初始值为1
    BTKServerPolygonFence *fence = [BTKServerPolygonFence new];
    NSMutableArray<NSValue *> *coords = [NSMutableArray array];
    for (BTFCoordinate *coord in self.vertexes) {
        CLLocationCoordinate2D coordinate = [coord toCLLocationCoordinate2D];
        [coords addObject:[NSValue valueWithBytes:&coordinate objCType:@encode(CLLocationCoordinate2D)]];
    }
    fence.vertexes = [coords copy];
    fence.coordType = self.coordType + 1;
    fence.denoiseAccuracy = self.deNoise;
    fence.fenceName = self.fenceName;
    fence.monitoredObject = self.monitoredPerson;
    return fence;
}
@end



@implementation BTFPolylineFence
+ (NSDictionary *)btf_setupObjectClassInArray {
    return @{@"vertexes" : @"BTFCoordinate"};
}
- (BTKServerPolylineFence *)toBTKServerPolylineFence {
     if (!self.vertexes || self.vertexes.count <= 1) return nil;
    // iOS原生SDK, 坐标类型初始值为1
    BTKServerPolylineFence *fence = [BTKServerPolylineFence new];
    NSMutableArray<NSValue *> *coords = [NSMutableArray array];
    for (BTFCoordinate *coord in self.vertexes) {
        CLLocationCoordinate2D coordinate = [coord toCLLocationCoordinate2D];
        [coords addObject:[NSValue valueWithBytes:&coordinate objCType:@encode(CLLocationCoordinate2D)]];
    }
    fence.vertexes = [coords copy];
    fence.offset = self.offset;
    fence.coordType = self.coordType + 1;
    fence.denoiseAccuracy = self.deNoise;
    fence.fenceName = self.fenceName;
    fence.monitoredObject = self.monitoredPerson;
    return fence;
}
@end



@implementation BTFDistrictFence
- (BTKServerDistrictFence *)toBTKServerDistrictFence {
    if (!self.keyword) return nil;
    BTKServerDistrictFence *fence = [BTKServerDistrictFence new];
    fence.keyword = self.keyword;
    fence.denoiseAccuracy = self.deNoise;
    fence.fenceName = self.fenceName;
    fence.monitoredObject = self.monitoredPerson;
    return fence;
}
@end
