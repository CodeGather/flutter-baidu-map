//
//  BTFFenceResult.m
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/14.
//

#import "BTFFenceResult.h"
#import <BaiduTraceSDK/BaiduTraceSDK.h>

#import "BTFModels.h"
#import "NSObject+BTFVerify.h"
#import "NSObject+BTFTime.h"
#import "BTFFence.h"

@implementation BTFFenceCreateResult

+ (instancetype)fromDict:(NSDictionary *)dict {
    if (!dict) return nil;
    BTFFenceCreateResult *result = [BTFFenceCreateResult btf_modelWith:dict];
    if ([dict.allKeys containsObject:@"fence_id"]) {
        result.fenceId = [[dict btf_safeObjectForKey:@"fence_id"] intValue];
    } else {
        result.fenceId = -1;
    }
    return result;
}

@end

@implementation BTFFenceDelereResult

+ (NSDictionary *)btf_setupObjectClassInArray {
    return @{@"fenceIds" : @"NSNumber"};
}

+ (instancetype)fromDict:(NSDictionary *)dict {
    if (!dict) return nil;
    BTFFenceDelereResult *result = [BTFFenceDelereResult btf_modelWith:dict];
    if ([dict.allKeys containsObject:@"fence_ids"]) {
        result.fenceIds = (NSArray<NSNumber *> *)[dict btf_safeObjectForKey:@"fence_ids"];
    }
    return result;
}
@end


@implementation BTFFenceUpdateResult

+ (instancetype)fromDict:(NSDictionary *)dict {
    if (!dict) return nil;
    BTFFenceUpdateResult *result = [BTFFenceUpdateResult btf_modelWith:dict];
    return result;
}

@end
#pragma mark - query

@implementation BTFLocalCircleResult

+ (instancetype)fromDict:(NSDictionary *)dict {
    if (!dict || dict.allKeys.count <= 0) return nil;
    BTFLocalCircleResult *result = [BTFLocalCircleResult new];
    NSArray<NSString *> *keys = dict.allKeys;
    BTFCircleFence *fence = [BTFCircleFence new];
    
    if ([keys containsObject:@"create_time"]) {
        // 返回结果为时间戳，与服务端统一返回时间字符串
        NSUInteger time = [[dict btf_safeObjectForKey:@"create_time"] integerValue];
        result.createTime = [self btf_timeIntervalToTimeString:time timeFormat:@""];
    }
    if ([keys containsObject:@"modify_time"]) {
        // 返回结果为时间戳，与服务端统一返回时间字符串
        NSUInteger time = [[dict btf_safeObjectForKey:@"modify_time"] integerValue];
        result.modifyTime = [self btf_timeIntervalToTimeString:time timeFormat:@""];
    }
    if ([keys containsObject:@"denoise_accuracy"]) {
        fence.deNoise = [[dict btf_safeObjectForKey:@"denoise_accuracy"] integerValue];
    }
    if ([keys containsObject:@"id"]) {
        fence.fenceId = [[dict btf_safeObjectForKey:@"id"] intValue];
    }
    if ([keys containsObject:@"latitude"] && [keys containsObject:@"longitude"]) {
        BTFCoordinate *center = [BTFCoordinate new];
        center.latitude = [[dict btf_safeObjectForKey:@"latitude"] doubleValue];
        center.longitude = [[dict btf_safeObjectForKey:@"longitude"] doubleValue];
        fence.center = center;
    }
    if ([keys containsObject:@"monitored_object"]) {
        fence.monitoredPerson = [dict btf_safeObjectForKey:@"monitored_object"];
    }
    if ([keys containsObject:@"name"]) {
        fence.fenceName = [dict btf_safeObjectForKey:@"name"];
    }
    if ([keys containsObject:@"radius"]) {
        fence.radius = [[dict btf_safeObjectForKey:@"radius"] doubleValue];
    }
     // 0: local; 1: server
    fence.fenceType = 0;
    // 不返回经纬度类型
    fence.coordType = -1;
    // (0：circle，1：polygon，2：polyline，3：district，-1: fence为无效数据)
    result.fenceShape = 0;
    result.circleFence = fence;
    return result;
}

@end


@implementation BTFFenceQueryLocalFenceResult
+ (NSDictionary *)btf_setupObjectClassInArray {
    return @{@"fenceInfos" : @"BTFLocalCircleResult"};
}
+ (instancetype)fromDict:(NSDictionary *)dict {
    if (!dict || dict.allKeys.count <= 0) return nil;
    BTFFenceQueryLocalFenceResult *result = [BTFFenceQueryLocalFenceResult new];
    NSArray<NSString *> *keys = dict.allKeys;
    
    if ([keys containsObject:@"message"]) {
        result.message = [dict btf_safeObjectForKey:@"message"];
    }
    if ([keys containsObject:@"size"]) {
        result.size = [[dict btf_safeObjectForKey:@"size"] intValue];
    }
    if ([keys containsObject:@"status"]) {
        result.status = [[dict btf_safeObjectForKey:@"status"] intValue];
    }
    if ([keys containsObject:@"tag"]) {
        result.tag = [[dict btf_safeObjectForKey:@"tag"] intValue];
    }
    if ([keys containsObject:@"fences"]) {
        NSArray<NSDictionary *> *fences = (NSArray <NSDictionary *>*)[dict btf_safeObjectForKey:@"fences"];
        if (!fences || fences.count <= 0) return result;
        
        NSMutableArray<BTFLocalCircleResult *> *circleResults = [NSMutableArray array];
        for (NSDictionary *dic in fences) {
            BTFLocalCircleResult *circleResult = [BTFLocalCircleResult fromDict:dic];
            if (!circleResult) continue;
            [circleResults addObject:circleResult];
        }
        result.fenceInfos = [circleResults copy];
    }
    // 0: local; 1: server
    result.fenceType = 0;
    return result;
}

@end

#pragma mark - query server result

@implementation BTFServerCircleResult

+ (instancetype)fromDict:(NSDictionary *)dict {
    if (!dict || dict.allKeys.count <= 0) return nil;
    BTFServerCircleResult *result = [BTFServerCircleResult new];
    NSArray<NSString *> *keys = dict.allKeys;
    BTFCircleFence *fence = [BTFCircleFence new];
     
    if ([keys containsObject:@"create_time"]) {
        result.createTime = [dict btf_safeObjectForKey:@"create_time"];
    }
    if ([keys containsObject:@"modify_time"]) {
        result.modifyTime = [dict btf_safeObjectForKey:@"modify_time"];
    }
    if ([keys containsObject:@"fence_id"]) {
        fence.fenceId = [[dict btf_safeObjectForKey:@"fence_id"] intValue];
    }
    if ([keys containsObject:@"latitude"] && [keys containsObject:@"longitude"]) {
     BTFCoordinate *center = [BTFCoordinate new];
     center.latitude = [[dict btf_safeObjectForKey:@"latitude"] doubleValue];
     center.longitude = [[dict btf_safeObjectForKey:@"longitude"] doubleValue];
     fence.center = center;
    }
    if ([keys containsObject:@"monitored_person"]) {
     fence.monitoredPerson = [dict btf_safeObjectForKey:@"monitored_person"];
    }
    if ([keys containsObject:@"fence_name"]) {
        fence.fenceName = [dict btf_safeObjectForKey:@"fence_name"];
    }
    if ([keys containsObject:@"denoise"]) {
        fence.deNoise = [[dict btf_safeObjectForKey:@"denoise"] integerValue];
    }
    if ([keys containsObject:@"radius"]) {
        fence.radius = [[dict btf_safeObjectForKey:@"radius"] doubleValue];
    }
    // 0: local; 1: server
    fence.fenceType = 1;
    // 不返回经纬度类型
    fence.coordType = -1;
    // (0：circle，1：polygon，2：polyline，3：district，-1: fence为无效数据)
    result.fenceShape = 0;
    result.circleFence = fence;
    return result;
}

@end


@implementation BTFServerPolygonResult

+ (instancetype)fromDict:(NSDictionary *)dict {
    if (!dict || dict.allKeys.count <= 0) return nil;
    BTFServerPolygonResult *result = [BTFServerPolygonResult new];
    NSArray<NSString *> *keys = dict.allKeys;
    BTFPolygonFence *fence = [BTFPolygonFence new];
        
    if ([keys containsObject:@"create_time"]) {
        result.createTime = [dict btf_safeObjectForKey:@"create_time"];
    }
    if ([keys containsObject:@"modify_time"]) {
        result.modifyTime = [dict btf_safeObjectForKey:@"modify_time"];
    }
    if ([keys containsObject:@"fence_id"]) {
        fence.fenceId = [[dict btf_safeObjectForKey:@"fence_id"] intValue];
    }
    if ([keys containsObject:@"monitored_person"]) {
        fence.monitoredPerson = [dict btf_safeObjectForKey:@"monitored_person"];
    }
    if ([keys containsObject:@"fence_name"]) {
        fence.fenceName = [dict btf_safeObjectForKey:@"fence_name"];
    }
    if ([keys containsObject:@"denoise"]) {
        fence.deNoise = [[dict btf_safeObjectForKey:@"denoise"] integerValue];
    }
    if ([keys containsObject:@"vertexes"]) {
        NSArray<NSDictionary *> *vertexes = (NSArray<NSDictionary *> *)[dict btf_safeObjectForKey:@"vertexes"];
        if (vertexes && vertexes.count >= 3) {
            NSMutableArray<BTFCoordinate *> *coords = [NSMutableArray array];
            for (NSDictionary *dic in vertexes) {
                BTFCoordinate *coord = [BTFCoordinate btf_modelWith:dic];
                if (!coord) continue;
                [coords addObject:coord];
            }
            fence.vertexes = [coords copy];
        }
    }
    // 0: local; 1: server
    fence.fenceType = 1;
    // 不返回经纬度类型
    fence.coordType = -1;
    // (0：circle，1：polygon，2：polyline，3：district，-1: fence为无效数据)
    result.fenceShape = 1;
    result.polygonFence = fence;
    return result;
}

@end

@implementation BTFServerPolylineResult

+ (instancetype)fromDict:(NSDictionary *)dict {
    if (!dict || dict.allKeys.count <= 0) return nil;
    BTFServerPolylineResult *result = [BTFServerPolylineResult new];
    NSArray<NSString *> *keys = dict.allKeys;
    BTFPolylineFence *fence = [BTFPolylineFence new];
        
    if ([keys containsObject:@"create_time"]) {
        result.createTime = [dict btf_safeObjectForKey:@"create_time"];
    }
    if ([keys containsObject:@"modify_time"]) {
        result.modifyTime = [dict btf_safeObjectForKey:@"modify_time"];
    }
    if ([keys containsObject:@"denoise_accuracy"]) {
        fence.deNoise = [[dict btf_safeObjectForKey:@"denoise_accuracy"] doubleValue];
    }
    if ([keys containsObject:@"fence_id"]) {
        fence.fenceId = [[dict btf_safeObjectForKey:@"fence_id"] intValue];
    }
    if ([keys containsObject:@"monitored_person"]) {
        fence.monitoredPerson = [dict btf_safeObjectForKey:@"monitored_person"];
    }
    if ([keys containsObject:@"fence_name"]) {
        fence.fenceName = [dict btf_safeObjectForKey:@"fence_name"];
    }
    if ([keys containsObject:@"denoise"]) {
      fence.deNoise = [[dict btf_safeObjectForKey:@"denoise"] integerValue];
    }
    if ([keys containsObject:@"offset"]) {
        fence.offset = [[dict btf_safeObjectForKey:@"offset"] integerValue];
    }
    if ([keys containsObject:@"vertexes"]) {
        NSArray<NSDictionary *> *vertexes = (NSArray<NSDictionary *> *)[dict btf_safeObjectForKey:@"vertexes"];
        if (vertexes && vertexes.count >= 2) {
            NSMutableArray<BTFCoordinate *> *coords = [NSMutableArray array];
            for (NSDictionary *dic in vertexes) {
                BTFCoordinate *coord = [BTFCoordinate btf_modelWith:dic];
                if (!coord) continue;
                [coords addObject:coord];
            }
            fence.vertexes = [coords copy];
        }
    }
    // 0: local; 1: server
    fence.fenceType = 1;
    // 不返回经纬度类型
    fence.coordType = -1;
    // (0：circle，1：polygon，2：polyline，3：district，-1: fence为无效数据)
    result.fenceShape = 2;
    result.polylineFence = fence;
    return result;
}

@end


@implementation BTFServerDistrictResult

+ (instancetype)fromDict:(NSDictionary *)dict {
    if (!dict || dict.allKeys.count <= 0) return nil;
    BTFServerDistrictResult *result = [BTFServerDistrictResult new];
    NSArray<NSString *> *keys = dict.allKeys;
    BTFDistrictFence *fence = [BTFDistrictFence new];
        
    if ([keys containsObject:@"create_time"]) {
        result.createTime = [dict btf_safeObjectForKey:@"create_time"];
    }
    if ([keys containsObject:@"modify_time"]) {
        result.modifyTime = [dict btf_safeObjectForKey:@"modify_time"];
    }
    if ([keys containsObject:@"fence_id"]) {
        fence.fenceId = [[dict btf_safeObjectForKey:@"fence_id"] intValue];
    }
    if ([keys containsObject:@"monitored_person"]) {
        fence.monitoredPerson = [dict btf_safeObjectForKey:@"monitored_person"];
    }
    if ([keys containsObject:@"fence_name"]) {
        fence.fenceName = [dict btf_safeObjectForKey:@"fence_name"];
    }
    if ([keys containsObject:@"district"]) {
        fence.district = [dict btf_safeObjectForKey:@"district"];
    }
    if ([keys containsObject:@"denoise"]) {
        fence.deNoise = [[dict btf_safeObjectForKey:@"denoise"] integerValue];
    }
    // 0: local; 1: server
    fence.fenceType = 1;
    // (0：circle，1：polygon，2：polyline，3：district，-1: fence为无效数据)
    result.fenceShape = 3;
    result.districtFence = fence;
    return result;
}

@end


@implementation BTFQueryServerResult

+ (instancetype)fromDict:(NSDictionary *)dict {
    if (!dict || dict.allKeys.count <= 0) return nil;
    BTFQueryServerResult *result = [BTFQueryServerResult new];
    NSArray<NSString *> *keys = dict.allKeys;
    
    if ([keys containsObject:@"message"]) {
        result.message = [dict btf_safeObjectForKey:@"message"];
    }
    if ([keys containsObject:@"size"]) {
        result.size = [[dict btf_safeObjectForKey:@"size"] intValue];
    }
    if ([keys containsObject:@"total"]) {
        result.totalSize = [[dict btf_safeObjectForKey:@"total"] intValue];
    }
    if ([keys containsObject:@"status"]) {
        result.status = [[dict btf_safeObjectForKey:@"status"] intValue];
    }
    if ([keys containsObject:@"tag"]) {
        result.tag = [[dict btf_safeObjectForKey:@"tag"] intValue];
    }
    if ([keys containsObject:@"fences"]) {
        NSArray<NSDictionary *> *fences = (NSArray <NSDictionary *>*)[dict btf_safeObjectForKey:@"fences"];
        if (!fences || fences.count <= 0) return result;
        
        NSMutableArray *fencesReslut = [NSMutableArray array];
        NSString *shape = nil;
        for (NSDictionary *dic in fences) {
           shape = [dic btf_safeObjectForKey:@"shape"];
           if ([shape isEqualToString:@"circle"]) {
               BTFServerCircleResult *fence = [BTFServerCircleResult fromDict:dic];
               if (!fence) continue;
               [fencesReslut addObject:fence];
           } else if ([shape isEqualToString:@"polygon"]) {
               BTFServerPolygonResult *fence = [BTFServerPolygonResult fromDict:dic];
               if (!fence) continue;
               [fencesReslut addObject:fence];
           } else if ([shape isEqualToString:@"polyline"]) {
               BTFServerPolylineResult *fence = [BTFServerPolylineResult fromDict:dic];
               if (!fence) continue;
               [fencesReslut addObject:fence];
           } else if ([shape isEqualToString:@"district"]) {
               BTFServerDistrictResult *fence = [BTFServerDistrictResult fromDict:dic];
               if (!fence) continue;
               [fencesReslut addObject:fence];
           } else {
               continue;
           }
           
        }
        result.fenceInfos = [fencesReslut copy];
    }
    // 0: local; 1: server
    result.fenceType = 1;
    return result;
}

- (NSDictionary *)toDict {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"tag"] = @(self.tag);
    dict[@"status"] = @(self.status);
    dict[@"message"] = self.message;
    dict[@"size"] = @(self.size);
    dict[@"totalSize"] = @(self.totalSize);
    dict[@"fenceType"] = @(self.fenceType);
    
    NSMutableArray<NSDictionary *> *fences = [NSMutableArray array];
    for (BTFModel *fence in self.fenceInfos) {
        if ([fence isMemberOfClass:[BTFServerCircleResult class]]) {
            [fences addObject:[(BTFServerCircleResult *)fence btf_toDictionary]];
        } else if ([fence isMemberOfClass:[BTFServerPolygonResult class]]) {
             [fences addObject:[(BTFServerPolygonResult *)fence btf_toDictionary]];
        } else if ([fence isMemberOfClass:[BTFServerPolylineResult class]]) {
             [fences addObject:[(BTFServerPolylineResult *)fence btf_toDictionary]];
        } else if ([fence isMemberOfClass:[BTFServerDistrictResult class]]) {
             [fences addObject:[(BTFServerDistrictResult *)fence btf_toDictionary]];
        } else {
            continue;
        }
    }
    dict[@"fenceInfos"] = [fences copy];
    
    return [dict copy];
}
@end


#pragma mark - query monitored status

@implementation BTFMonitoredStatusInfo

+ (BTFMonitoredStatusInfo *)fromLocalDict:(NSDictionary *)dict {
    if (!dict || dict.allKeys.count <= 0) return nil;
    BTFMonitoredStatusInfo *result = [BTFMonitoredStatusInfo new];
    NSArray<NSString *> *keys = dict.allKeys;
    if ([keys containsObject:@"fence_id"]) {
        result.fenceId = [[dict btf_safeObjectForKey:@"fence_id"] intValue];
    }
    if ([keys containsObject:@"monitored_status"]) {
        // BTKFenceMonitoredObjectStatus
        NSUInteger status = [[dict btf_safeObjectForKey:@"monitored_status"] integerValue];
        if (status == 0) { // in
            result.monitoredStatus = status + 1;
        } else if (status == 1) { // out
            result.monitoredStatus = status + 1;
        } else if (status == 2) { // unknow
            result.monitoredStatus = 0;
        } else {
            result.monitoredStatus = 0;
        }
    }
    return result;
}
+ (BTFMonitoredStatusInfo *)fromServerDict:(NSDictionary *)dict {
    if (!dict || dict.allKeys.count <= 0) return nil;
    BTFMonitoredStatusInfo *result = [BTFMonitoredStatusInfo new];
    NSArray<NSString *> *keys = dict.allKeys;
    if ([keys containsObject:@"fence_id"]) {
        result.fenceId = [[dict btf_safeObjectForKey:@"fence_id"] intValue];
    }
    if ([keys containsObject:@"monitored_status"]) {
        NSString *status = [dict btf_safeObjectForKey:@"monitored_status"];
        if ([status isEqualToString:@"unknown"]) {
            result.monitoredStatus = 0;
        } else if ([status isEqualToString:@"in"]) {
            result.monitoredStatus = 1;
        } else if ([status isEqualToString:@"out"]) {
            result.monitoredStatus = 2;
        } else {
            result.monitoredStatus = 0;
        }
        
    }
    return result;
}
@end

@implementation BTFQueryLocalMonitoredStatusResult
+ (NSDictionary *)btf_setupObjectClassInArray {
    return @{@"monitoredStatusInfos" : @"BTFMonitoredStatusInfo"};
}
+ (instancetype)fromDict:(NSDictionary *)dict {
    if (!dict || dict.allKeys.count <= 0) return nil;
    BTFQueryLocalMonitoredStatusResult *result = [BTFQueryLocalMonitoredStatusResult new];
    NSArray<NSString *> *keys = dict.allKeys;
    if ([keys containsObject:@"message"]) {
        result.message = [dict btf_safeObjectForKey:@"message"];
    }
    if ([keys containsObject:@"size"]) {
        result.size = [[dict btf_safeObjectForKey:@"size"] intValue];
    }
    if ([keys containsObject:@"status"]) {
        result.status = [[dict btf_safeObjectForKey:@"status"] intValue];
    }
    if ([keys containsObject:@"tag"]) {
        result.tag = [[dict btf_safeObjectForKey:@"tag"] intValue];
    }
    if ([keys containsObject:@"monitored_statuses"]) {
        NSMutableArray<BTFMonitoredStatusInfo *> *statuses = [NSMutableArray array];
        for (NSDictionary *dic in [dict btf_safeObjectForKey:@"monitored_statuses"]) {
            BTFMonitoredStatusInfo *info = [BTFMonitoredStatusInfo fromLocalDict:dic];
            if (!info) continue;
            [statuses addObject:info];
        }
        result.monitoredStatusInfos = [statuses copy];
    }
     // 0: local; 1: server
    result.fenceType = 0;
    return result;
}

@end


@implementation BTFQueryServerMonitoredStatusResult
+ (NSDictionary *)btf_setupObjectClassInArray {
    return @{@"monitoredStatusInfos" : @"BTFMonitoredStatusInfo"};
}
+ (instancetype)fromDict:(NSDictionary *)dict {
    if (!dict || dict.allKeys.count <= 0) return nil;
    BTFQueryServerMonitoredStatusResult *result = [BTFQueryServerMonitoredStatusResult new];
    NSArray<NSString *> *keys = dict.allKeys;
    if ([keys containsObject:@"message"]) {
        result.message = [dict btf_safeObjectForKey:@"message"];
    }
    if ([keys containsObject:@"size"]) {
        result.size = [[dict btf_safeObjectForKey:@"size"] intValue];
    }
    if ([keys containsObject:@"total"]) {
        result.totalSize = [[dict btf_safeObjectForKey:@"total"] intValue];
    }
    if ([keys containsObject:@"status"]) {
        result.status = [[dict btf_safeObjectForKey:@"status"] intValue];
    }
    if ([keys containsObject:@"tag"]) {
        result.tag = [[dict btf_safeObjectForKey:@"tag"] intValue];
    }
    if ([keys containsObject:@"monitored_statuses"]) {
        NSMutableArray<BTFMonitoredStatusInfo *> *statuses = [NSMutableArray array];
        for (NSDictionary *dic in [dict btf_safeObjectForKey:@"monitored_statuses"]) {
            BTFMonitoredStatusInfo *info = [BTFMonitoredStatusInfo fromServerDict:dic];
            if (!info) continue;
            [statuses addObject:info];
        }
        result.monitoredStatusInfos = [statuses copy];
    }
     // 0: local; 1: server
    result.fenceType = 0;
    return result;
    return result;
}

@end


#pragma mark - query local history alarm

@implementation BTFAlarmPoint

+ (instancetype)fromDict:(NSDictionary *)dict {
    if (!dict || dict.allKeys.count <= 0) return nil;
    BTFAlarmPoint *result = [BTFAlarmPoint new];
    NSArray<NSString *> *keys = dict.allKeys;
    if ([keys containsObject:@"radius"]) {
        result.radius = [[dict btf_safeObjectForKey:@"radius"] doubleValue];
    }
    if ([keys containsObject:@"coord_type"]) {
        NSString *coordType = [dict btf_safeObjectForKey:@"coord_type"];
        if ([coordType isEqualToString:@"wgs84"]) {
            result.coordType = 0;
        } else if ([coordType isEqualToString:@"gcj02"]) {
            result.coordType = 1;
        } else if ([coordType isEqualToString:@"bd09ll"]) {
            result.coordType = 2;
        } else {
            // 不返回经纬度类型
            result.coordType = -1;
        }
        
    }
    if ([keys containsObject:@"loc_time"]) {
        result.locTime = [[dict btf_safeObjectForKey:@"loc_time"] integerValue];
    }
    if ([keys containsObject:@"create_time"]) {
        result.createTime = [[dict btf_safeObjectForKey:@"create_time"] integerValue];
    }
    if ([keys containsObject:@"longitude"] && [keys containsObject:@"latitude"]) {
        BTFCoordinate *coord = [BTFCoordinate btf_modelWith:dict];
        result.location = coord;
    }
    return result;
}
+ (instancetype)from:(BTKFenceAlarmLocationPoint *)point {
    BTFAlarmPoint *pt = [BTFAlarmPoint new];
    pt.location = [BTFCoordinate fromCLLocationCoordinate2D:point.coordinate];
    // iOS原生SDK初始值为1
    pt.coordType = point.coordType - 1;
    pt.locTime = (NSUInteger)point.loctime;
    pt.createTime = (NSUInteger)point.createTime;
    pt.radius = point.radius;
    return pt;
}
@end

@implementation BTFFenceAlarmInfo

+ (instancetype)fromDict:(NSDictionary *)dict {
    if (!dict || dict.allKeys.count <= 0) return nil;
    BTFFenceAlarmInfo *result = [BTFFenceAlarmInfo new];
    NSArray<NSString *> *keys = dict.allKeys;
    if ([keys containsObject:@"fence_id"]) {
        result.fenceId = [[dict btf_safeObjectForKey:@"fence_id"] intValue];
    }
    if ([keys containsObject:@"fence_name"]) {
        result.fenceName = [dict btf_safeObjectForKey:@"fence_name"];
    }
    if ([keys containsObject:@"monitored_person"]) {
        result.monitoredPerson = [dict btf_safeObjectForKey:@"monitored_person"];
    }
    if ([keys containsObject:@"action"]) {
        NSString *action = [dict btf_safeObjectForKey:@"action"];
        if ([action isEqualToString:@"enter"]) {
            result.monitoredAction = 0;
        } else if ([action isEqualToString:@"exit"]) {
            result.monitoredAction = 1;
        } else {
             result.monitoredAction = -1; // -1：无效数据
        }
    }
    if ([keys containsObject:@"alarm_point"]) {
        result.currentPoint = [BTFAlarmPoint fromDict:[dict btf_safeObjectForKey:@"alarm_point"]];
    }
    if ([keys containsObject:@"pre_point"]) {
        result.prePoint = [BTFAlarmPoint fromDict:[dict btf_safeObjectForKey:@"pre_point"]];
    }
 
    return result;
}

@end
@implementation BTFQueryLocalHistoryAlarmResult
+ (NSDictionary *)btf_setupObjectClassInArray {
    return @{@"fenceAlarmInfos" : @"BTFFenceAlarmInfo"};
}
+ (instancetype)fromDict:(NSDictionary *)dict {
    if (!dict || dict.allKeys.count <= 0) return nil;
    BTFQueryLocalHistoryAlarmResult *result = [BTFQueryLocalHistoryAlarmResult new];
    NSArray<NSString *> *keys = dict.allKeys;
    if ([keys containsObject:@"message"]) {
        result.message = [dict btf_safeObjectForKey:@"message"];
    }
    if ([keys containsObject:@"size"]) {
        result.size = [[dict btf_safeObjectForKey:@"size"] intValue];
    }
    if ([keys containsObject:@"status"]) {
        result.status = [[dict btf_safeObjectForKey:@"status"] intValue];
    }
    if ([keys containsObject:@"tag"]) {
        result.tag = [[dict btf_safeObjectForKey:@"tag"] intValue];
    }
    if ([keys containsObject:@"alarms"]) {
        NSMutableArray<BTFFenceAlarmInfo *> *infos = [NSMutableArray array];
        for (NSDictionary *dic in [dict btf_safeObjectForKey:@"alarms"]) {
            BTFFenceAlarmInfo *info = [BTFFenceAlarmInfo fromDict:dic];
            if (!info) continue;
            [infos addObject:info];
        }
        result.fenceAlarmInfos = [infos copy];
    }
     // 0: local; 1: server
    result.fenceType = 0;
    return result;
}

@end


@implementation BTFQueryServerHistoryAlarmResult
+ (NSDictionary *)btf_setupObjectClassInArray {
    return @{@"fenceAlarmInfos" : @"BTFFenceAlarmInfo"};
}
+ (instancetype)fromDict:(NSDictionary *)dict {
    if (!dict || dict.allKeys.count <= 0) return nil;
    BTFQueryServerHistoryAlarmResult *result = [BTFQueryServerHistoryAlarmResult new];
    NSArray<NSString *> *keys = dict.allKeys;
    if ([keys containsObject:@"message"]) {
        result.message = [dict btf_safeObjectForKey:@"message"];
    }
    if ([keys containsObject:@"size"]) {
        result.size = [[dict btf_safeObjectForKey:@"size"] intValue];
    }
    if ([keys containsObject:@"total"]) {
        result.totalSize = [[dict btf_safeObjectForKey:@"total"] intValue];
    }
    if ([keys containsObject:@"status"]) {
        result.status = [[dict btf_safeObjectForKey:@"status"] intValue];
    }
    if ([keys containsObject:@"tag"]) {
        result.tag = [[dict btf_safeObjectForKey:@"tag"] intValue];
    }
    if ([keys containsObject:@"alarms"]) {
        NSMutableArray<BTFFenceAlarmInfo *> *infos = [NSMutableArray array];
        for (NSDictionary *dic in [dict btf_safeObjectForKey:@"alarms"]) {
            BTFFenceAlarmInfo *info = [BTFFenceAlarmInfo fromDict:dic];
            if (!info) continue;
            [infos addObject:info];
        }
        result.fenceAlarmInfos = [infos copy];
    }
     // 0: local; 1: server
    result.fenceType = 1;
    return result;
}

@end

#pragma mark - query list monitored person

@implementation BTFQueryListMonitoredPersonResult
+ (NSDictionary *)btf_setupObjectClassInArray {
    return @{@"monitoredPersons" : @"NSString"};
}
+ (instancetype)fromDict:(NSDictionary *)dict {
    if (!dict || dict.allKeys.count <= 0) return nil;
    BTFQueryListMonitoredPersonResult *result = [BTFQueryListMonitoredPersonResult new];
    NSArray<NSString *> *keys = dict.allKeys;
    if ([keys containsObject:@"message"]) {
        result.message = [dict btf_safeObjectForKey:@"message"];
    }
    if ([keys containsObject:@"size"]) {
        result.size = [[dict btf_safeObjectForKey:@"size"] intValue];
    }
    if ([keys containsObject:@"total"]) {
        result.totalSize = [[dict btf_safeObjectForKey:@"total"] intValue];
    }
    if ([keys containsObject:@"status"]) {
        result.status = [[dict btf_safeObjectForKey:@"status"] intValue];
    }
    if ([keys containsObject:@"tag"]) {
        result.tag = [[dict btf_safeObjectForKey:@"tag"] intValue];
    }
    if ([keys containsObject:@"monitored_person"]) {
        result.monitoredPersons = [(NSArray<NSString *> *)[dict btf_safeObjectForKey:@"monitored_person"] copy];
    }
    return result;
}

@end
