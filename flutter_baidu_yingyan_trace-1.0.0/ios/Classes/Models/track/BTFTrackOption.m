//
//  BTFTrackOption.m
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/4.
//

#import "BTFTrackOption.h"
#import "BTFModels.h"
#import "NSObject+BTFVerify.h"
#import <BaiduTraceSDK/BaiduTraceSDK.h>
#import "BTFQueryTrackProcessOption.h"

@implementation BTFCustomTrackPoint

- (BTKCustomTrackPoint *)toBTKCustomTrackPoint {
    if (!self.point || !self.point.location) {
        return nil;
    }
    /// iOS原生SDK坐标类型初始值为1
    BTKCustomTrackPoint *point = [[BTKCustomTrackPoint alloc] init];
    point.coordinate = [self.point.location toCLLocationCoordinate2D];
    point.coordType = self.point.coordType + 1;
    point.loctime = self.point.locTime;
    point.direction = self.point.direction;
    point.height = self.point.height;
    point.radius = self.point.radius;
    point.speed = self.point.speed;
    point.customData = [self.customData copy];
    point.entityName = self.entityName;
    
    return point;
}

@end


@implementation BTFTrackCacheClearOption

- (BTKClearTrackCacheOption *)toBTKClearTrackCacheOption {
    if (!self.entityName) {
        return nil;
    }
    BTKClearTrackCacheOption *option = [[BTKClearTrackCacheOption alloc] initWithEntityName:self.entityName startTime:self.startTime endTime:self.endTime];
    return option;
}

@end

@implementation BTFAddCustomTrackPointOption
- (BTKAddCustomTrackPointRequest *)toBTKAddCustomTrackPointRequest {
    BTKAddCustomTrackPointRequest *request = [[BTKAddCustomTrackPointRequest alloc] initWithCustomTrackPoint:[self.customTrackPoint toBTKCustomTrackPoint] serviceID:self.serviceId tag:self.tag];
    return request;
}
@end
#pragma mark - 批量上传多个开发者自定义的轨迹点的请求类

@implementation BTFTrackPoint

- (BTKCustomTrackPoint *)toBTKCustomTrackPoint {
    if (!self.location) return nil;
    /// iOS原生SDK坐标类型初始值为1
    BTKCustomTrackPoint *point = [[BTKCustomTrackPoint alloc] init];
    point.coordinate = [self.location toCLLocationCoordinate2D];
    point.coordType = self.coordType + 1;
    point.loctime = self.locTime;
    point.direction = self.direction;
    point.height = self.height;
    point.radius = self.radius;
    point.speed = self.speed;
    point.customData = [self.columns copy];
    point.entityName = self.entityName;
    return point;
}

/// 做为返回点
+ (instancetype)fromDict:(NSDictionary *)dict {
    if (!dict || dict.allKeys.count <= 0) return nil;
    BTFTrackPoint *point = [BTFTrackPoint new];
    NSArray<NSString *> *keys = dict.allKeys;
    NSMutableArray<NSString *> *customKeys = [NSMutableArray arrayWithArray:keys];

    if ([keys containsObject:@"latitude"] && [keys containsObject:@"longitude"]) {
        BTFCoordinate *coord = [BTFCoordinate btf_modelWith:dict];
        point.location = coord;
        [customKeys removeObject:@"latitude"];
        [customKeys removeObject:@"longitude"];
    }
    if ([keys containsObject:@"entity_name"]) {
        point.entityName = [dict btf_safeObjectForKey:@"entity_name"];
        [customKeys removeObject:@"entity_name"];

    }
    if ([keys containsObject:@"loc_time"]) {
         point.locTime = [[dict btf_safeObjectForKey:@"loc_time"] integerValue];
         [customKeys removeObject:@"loc_time"];
    }
    if ([keys containsObject:@"coord_type_input"]) {
        NSString *coordType = [dict btf_safeObjectForKey:@"coord_type_input"];
        if ([coordType isEqualToString:@"wgs84"]) {
            point.coordType = 0;
        } else if ([coordType isEqualToString:@"gcj02"]) {
            point.coordType = 1;
        } else if ([coordType isEqualToString:@"bd09ll"]) {
            point.coordType = 2;
        } else {
            // 不返回经纬度类型
            point.coordType = -1;
        }
        [customKeys removeObject:@"coord_type_input"];
    } else {
        // 不返回经纬度类型
        point.coordType = -1;
    }
    if ([keys containsObject:@"speed"]) {
        point.speed = [[dict btf_safeObjectForKey:@"speed"] doubleValue];
        [customKeys removeObject:@"speed"];
    }
    if ([keys containsObject:@"direction"]) {
        point.direction = [[dict btf_safeObjectForKey:@"direction"] integerValue];
        [customKeys removeObject:@"direction"];
    }
    if ([keys containsObject:@"height"]) {
        point.height = [[dict btf_safeObjectForKey:@"height"] doubleValue];
        [customKeys removeObject:@"height"];
    }
    if ([keys containsObject:@"radius"]) {
        point.radius = [[dict btf_safeObjectForKey:@"radius"] doubleValue];
        [customKeys removeObject:@"radius"];
    }
    if ([keys containsObject:@"object_name"]) {
         [customKeys removeObject:@"object_name"];
    }
    if ([keys containsObject:@"error"]) {
        [customKeys removeObject:@"error"];
    }
   // 有自定义字段
   if (customKeys.count > 0) {
       NSMutableDictionary *customDict = [NSMutableDictionary dictionary];
       for (NSString *key in customKeys) {
           // 自定义字段不能以_开头
           if ([key hasPrefix:@"_"]) continue;
           [customDict setValue:[dict btf_safeObjectForKey:key] forKey:key];
       }
       point.columns = [customDict copy];
   }
    return point;
}
@end

@implementation BTFAddCustomTrackPointsOption

+ (NSDictionary *)btf_setupObjectClassInArray {
    return @{@"customTrackPoints" : @"BTFTrackPoint"};
}
+ (BTFAddCustomTrackPointsOption *)fromDict:(NSDictionary *)dict {
    if (!dict) return nil;
    if (![dict btf_safeValueForKey:@"customTrackPoints"]) return nil;
    BTFAddCustomTrackPointsOption *option = [BTFAddCustomTrackPointsOption new];
    NSArray<NSString *> *keys = dict.allKeys;
    if ([keys containsObject:@"serviceId"]) {
        option.serviceId = [[dict btf_safeValueForKey:@"serviceId"] integerValue];
    }
    if ([keys containsObject:@"tag"]) {
        option.tag = [[dict btf_safeValueForKey:@"tag"] integerValue];
    }
    if ([keys containsObject:@"customTrackPoints"]) {
        NSDictionary *customTrackPointsDict = (NSDictionary *)[dict btf_safeValueForKey:@"customTrackPoints"];
        if (!customTrackPointsDict) return  nil;
        NSMutableArray<BTFTrackPoint *> *points = [NSMutableArray array];
        NSArray<NSString *> *allKeys = [customTrackPointsDict allKeys];
        for (NSString *key in allKeys) {
            NSArray <NSDictionary *> *trackPointsDic = (NSArray<NSDictionary *> *)[customTrackPointsDict btf_safeValueForKey:key];
            if (!trackPointsDic || trackPointsDic.count <= 0) continue;
            for (NSDictionary *dic in trackPointsDic) {
                BTFTrackPoint *point = [BTFTrackPoint btf_modelWith:dic];
                if (!point) continue;
                point.entityName = key;
                [points addObject:point];
            }
        }
        option.customTrackPoints = [points copy];
    }
    return option;
}
- (BTKBatchAddCustomTrackPointRequest *)toBTKBatchAddCustomTrackPointRequest {
    if (!self.customTrackPoints || self.customTrackPoints.count <= 0) {
        return nil;
    }
    NSMutableArray<BTKCustomTrackPoint *> *points = [NSMutableArray array];
    for (id cPoint in self.customTrackPoints) {
        if (![cPoint isKindOfClass:[BTFTrackPoint class]]) {
            return nil;
        }
        BTKCustomTrackPoint *customPoint = [(BTFTrackPoint *)cPoint toBTKCustomTrackPoint];
        if (!customPoint) continue;
    
        [points addObject:customPoint];
    }
    if (points.count <= 0) {
        return nil;
    }
    
    BTKBatchAddCustomTrackPointRequest *request = [[BTKBatchAddCustomTrackPointRequest alloc] initWithCustomTrackPoints:[points copy] serviceID:self.serviceId tag:self.tag];
    
    return request;
}

@end


@implementation BTFQueryTrackLatestPointOption

- (BTKQueryTrackLatestPointRequest *)toBTKQueryTrackLatestPointRequest {
    if (!self.entityName) {
        return nil;
    }
    /// iOS原生SDK坐标类型初始值为1
    BTKQueryTrackLatestPointRequest *request = [[BTKQueryTrackLatestPointRequest alloc] init];
    request.entityName = self.entityName;
    request.processOption = [self.processOption toBTKQueryTrackProcessOption];
    request.outputCoordType = self.outputCoordType + 1;
    request.serviceID = self.serviceId;
    request.tag = self.tag;
    return request;
}

@end


@implementation BTFQueryTrackDistanceOption

- (BTKQueryTrackDistanceRequest *)toBTKQueryTrackDistanceRequest {
    if (!self.entityName || self.startTime < 0 || self.endTime < 0) {
        return nil;
    }
    /// iOS原生SDK, supplementMode起始值为1
    BTKQueryTrackDistanceRequest *request = [[BTKQueryTrackDistanceRequest alloc] init];
    request.entityName = self.entityName;
    request.startTime = self.startTime;
    request.endTime = self.endTime;
    request.isProcessed = self.isProcessed;
    request.processOption = [self.processOption toBTKQueryTrackProcessOption];
    request.supplementMode = self.supplementMode + 1;
    request.lowSpeedThreshold = self.lowSpeedThreshold;
    request.serviceID = self.serviceId;
    request.tag = self.tag;
    
    return request;
}

@end


@implementation BTFQueryHistoryTrackOption

- (BTKQueryHistoryTrackRequest *)toBTKQueryHistoryTrackRequest {
    if (!self.entityName || self.startTime < 0 || self.endTime < 0) {
        return nil;
    }
    /// iOS原生SDK, 坐标类型， supplementMode，sortType 起始值为1
    BTKQueryHistoryTrackRequest *request = [[BTKQueryHistoryTrackRequest alloc] init];
    request.entityName = self.entityName;
    request.startTime = self.startTime;
    request.endTime = self.endTime;
    request.isProcessed = self.isProcessed;
    request.processOption = [self.processOption toBTKQueryTrackProcessOption];
    request.supplementMode = self.supplementMode + 1;
    request.lowSpeedThreshold = self.lowSpeedThreshold;
    request.outputCoordType = self.outputCoordType + 1;
    request.sortType = self.sortType + 1;
    request.pageIndex = self.pageIndex;
    request.pageSize = self.pageSize;
    request.serviceID = self.serviceId;
    request.tag = self.tag;
    
    return request;
}

@end


@implementation BTFQueryTrackCacheInfoOption

+ (NSDictionary *)btf_setupObjectClassInArray {
    return @{@"entityNames" : @"NSString"};
}

- (BTKQueryTrackCacheInfoRequest *)toBTKQueryTrackCacheInfoRequest {
    BTKQueryTrackCacheInfoRequest *request = [BTKQueryTrackCacheInfoRequest new];
    request.serviceID = self.serviceId;
    request.tag = self.tag;
    request.entityNames = [self.entityNames copy];
    request.startTime = (double)self.startTime;
    request.endTime = (double)self.endTime;
    request.needDistance = self.needDistance;
    request.distanceFilter = self.distanceFilter;
    return request;
}

@end


@implementation BTFClearTrackCacheOption
+ (NSDictionary *)btf_setupObjectClassInArray {
    return @{@"options" : @"BTFTrackCacheClearOption"};
}
- (BTKClearTrackCacheRequest *)toBTKClearTrackCacheRequest {
    NSMutableArray <BTKClearTrackCacheOption *> *options = [NSMutableArray array];
    if (self.trackCacheOptions && self.trackCacheOptions.count > 0) {
        for (BTFTrackCacheClearOption *option in self.trackCacheOptions) {
            [options addObject:[option toBTKClearTrackCacheOption]];
        }
    }

    BTKClearTrackCacheRequest *request = [[BTKClearTrackCacheRequest alloc] initWithOptions:[options copy] serviceID:self.serviceId tag:self.tag];
    
    return request;
}

@end
