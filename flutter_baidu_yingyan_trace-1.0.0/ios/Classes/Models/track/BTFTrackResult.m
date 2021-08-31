//
//  BTFTrackResult.m
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/16.
//

#import "BTFTrackResult.h"
#import "NSObject+BTFVerify.h"
#import "BTFModels.h"
#import "NSObject+BTFVerify.h"
#import "BTFTrackOption.h"

@implementation BTFParamError

+ (instancetype)fromDict:(NSDictionary *)dict {
    if (!dict || dict.allKeys.count <= 0) return nil;
    BTFParamError *error = [BTFParamError new];
    error.error = [dict btf_safeObjectForKey:@"error"];
    error.entityName = [dict btf_safeObjectForKey:@"entity_name"];
    error.trackPoint = [BTFTrackPoint fromDict:dict];
    return error;
}

@end


@implementation BTFInternalError

 + (instancetype)fromDict:(NSDictionary *)dict {
    if (!dict || dict.allKeys.count <= 0) return nil;
    BTFInternalError *error = [BTFInternalError new];
    error.entityName = [dict btf_safeObjectForKey:@"entity_name"];
    error.trackPoint = [BTFTrackPoint fromDict:dict];
    return error;
}

@end

@implementation BTFFailInfo
+ (NSDictionary *)btf_setupObjectClassInArray {
    return @{@"paramErrors" : @"BTFParamError",
             @"internalErrors" : @"BTFInternalError"
    };
}
 + (instancetype)fromDict:(NSDictionary *)dict {
    if (!dict || dict.allKeys.count <= 0) return nil;
    BTFFailInfo *info = [BTFFailInfo new];
    NSArray<NSString *> *keys = dict.allKeys;
    if ([keys containsObject:@"param_error"]) {
        NSMutableArray<BTFParamError *> *param_errors = [NSMutableArray array];
        for (NSDictionary *dic in (NSArray<NSDictionary *> *)[dict btf_safeObjectForKey:@"param_error"]) {
            BTFParamError *param_error = [BTFParamError fromDict:dic];
            if (!param_error) continue;
            [param_errors addObject:param_error];
        }
        info.paramErrors = [param_errors copy];
    }
    if ([keys containsObject:@"internal_error"]) {
        NSMutableArray<BTFInternalError *> *internal_errors = [NSMutableArray array];
        for (NSDictionary *dic in (NSArray<NSDictionary *> *)[dict btf_safeObjectForKey:@"internal_error"]) {
            BTFInternalError *internal_error = [BTFInternalError fromDict:dic];
            if (!internal_error) continue;
            [internal_errors addObject:internal_error];
        }
        info.internalErrors = [internal_errors copy];
    }
    return info;
}

@end

@implementation BTFAddTrackPointsResult
+ (instancetype)fromDict:(NSDictionary *)dict {
    if (!dict || dict.allKeys.count <= 0) return nil;
    BTFAddTrackPointsResult *result = [BTFAddTrackPointsResult new];
    NSArray<NSString *> *keys = dict.allKeys;
 
    if ([keys containsObject:@"status"]) {
        result.status = [[dict btf_safeObjectForKey:@"status"] intValue];
    }
    if ([keys containsObject:@"message"]) {
        result.message = [dict btf_safeObjectForKey:@"message"];
    }
    if ([keys containsObject:@"tag"]) {
        result.tag = [[dict btf_safeObjectForKey:@"tag"] intValue];
    }
    if ([keys containsObject:@"success_num"]) {
        result.successNum = [[dict btf_safeObjectForKey:@"success_num"] intValue];
    }
    if ([keys containsObject:@"fail_info"]) {
        BTFFailInfo *info = [BTFFailInfo fromDict:(NSDictionary *)[dict btf_safeObjectForKey:@"fail_info"]];
        if (info) {
            result.failInfo = info;
        }
    }

    return result;
}
@end

@implementation BTFLatestPoint

+ (instancetype)fromDict:(NSDictionary *)dict {
    if (!dict || dict.allKeys.count <= 0) return nil;
    BTFLatestPoint *point = [BTFLatestPoint new];
    NSArray<NSString *> *keys = dict.allKeys;
    NSMutableArray<NSString *> *customKeys = [NSMutableArray arrayWithArray:keys];
   
    if ([keys containsObject:@"longitude"] && [keys containsObject:@"latitude"]) {
        BTFCoordinate *coord = [BTFCoordinate btf_modelWith:dict];
        point.location = coord;
        [customKeys removeObject:@"longitude"];
        [customKeys removeObject:@"latitude"];
    }
    if ([keys containsObject:@"loc_time"]) {
        point.locTime = [[dict btf_safeObjectForKey:@"loc_time"] integerValue];
        [customKeys removeObject:@"loc_time"];
    }
    if ([keys containsObject:@"radius"]) {
        point.radius = [[dict btf_safeObjectForKey:@"radius"] doubleValue];
        [customKeys removeObject:@"radius"];
    }
    if ([keys containsObject:@"coord_type"]) {
        NSString *coordType = [dict btf_safeObjectForKey:@"coord_type"];
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
        [customKeys removeObject:@"coord_type"];
    } else {
        // 不返回经纬度类型
        point.coordType = -1;
    }
    
    if ([keys containsObject:@"direction"]) {
        point.direction = [[dict btf_safeObjectForKey:@"direction"] integerValue];
        [customKeys removeObject:@"direction"];
    }
    if ([keys containsObject:@"height"]) {
        point.height = [[dict btf_safeObjectForKey:@"height"] doubleValue];
        [customKeys removeObject:@"height"];
    }
    if ([keys containsObject:@"speed"]) {
        point.speed = [[dict btf_safeObjectForKey:@"speed"] doubleValue];
        [customKeys removeObject:@"speed"];
    }
    if ([keys containsObject:@"floor"]) {
        point.floor = [dict btf_safeObjectForKey:@"floor"];
        [customKeys removeObject:@"floor"];
    }
    if ([keys containsObject:@"road_grade"]) {
        point.roadGrade = [dict btf_safeObjectForKey:@"road_grade"];
        [customKeys removeObject:@"road_grade"];
    }
    if ([keys containsObject:@"road_name"]) {
        point.roadName = [dict btf_safeObjectForKey:@"road_name"];
        [customKeys removeObject:@"road_name"];
    }
    if ([keys containsObject:@"car_limit_speed"]) {
        
        [customKeys removeObject:@"car_limit_speed"];
    }
    if ([keys containsObject:@"locate_mode"]) {
        point.locateMode = [dict btf_safeObjectForKey:@"locate_mode"];
        [customKeys removeObject:@"locate_mode"];
    }
    if ([keys containsObject:@"transport_mode"]) {
        point.objectName = [dict btf_safeObjectForKey:@"transport_mode"];
        [customKeys removeObject:@"transport_mode"];
    }
    if ([keys containsObject:@"object_name"]) {
        point.objectName = [dict btf_safeObjectForKey:@"object_name"];
        [customKeys removeObject:@"object_name"];
    }
    if ([keys containsObject:@""]) {
        
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


@implementation BTFQueryTrackLatestPointResult
+ (instancetype)fromDict:(NSDictionary *)dict {
    if (!dict || dict.allKeys.count <= 0) return nil;
    BTFQueryTrackLatestPointResult *result = [BTFQueryTrackLatestPointResult new];
    NSArray<NSString *> *keys = dict.allKeys;
    if ([keys containsObject:@"status"]) {
        result.status = [[dict btf_safeObjectForKey:@"status"] intValue];
    }
    if ([keys containsObject:@"message"]) {
        result.message = [dict btf_safeObjectForKey:@"message"];
    }
    if ([keys containsObject:@"tag"]) {
        result.tag = [[dict btf_safeObjectForKey:@"tag"] intValue];
    }
    if ([keys containsObject:@"latest_point"]) {
        BTFLatestPoint *point = [BTFLatestPoint fromDict:[dict btf_safeObjectForKey:@"latest_point"]];
        result.latestPoint = point;
    }
    if ([keys containsObject:@"entity_name"]) {
        result.entityName = [dict btf_safeObjectForKey:@"entity_name"];
    }
//    if ([keys containsObject:@""]) {
//
//    }
    
    return result;
}

@end


#pragma mark - query track distance result

@implementation BTFQueryTrackDistanceResult

+ (instancetype)fromDict:(NSDictionary *)dict {
    if (!dict || dict.allKeys.count <= 0) return nil;
    BTFQueryTrackDistanceResult *result = [BTFQueryTrackDistanceResult new];
    NSArray<NSString *> *keys = dict.allKeys;
    if ([keys containsObject:@"status"]) {
        result.status = [[dict btf_safeObjectForKey:@"status"] intValue];
    }
    if ([keys containsObject:@"message"]) {
        result.message = [dict btf_safeObjectForKey:@"message"];
    }
    if ([keys containsObject:@"tag"]) {
        result.tag = [[dict btf_safeObjectForKey:@"tag"] intValue];
    }
    if ([keys containsObject:@"distance"]) {
        result.distance = [[dict btf_safeObjectForKey:@"distance"] doubleValue];
    }
    if ([keys containsObject:@"entity_name"]) {
        result.entityName = [dict btf_safeObjectForKey:@"entity_name"];
    }
    if ([keys containsObject:@"low_speed_distance"]) {
        result.lowSpeedDistance = [[dict btf_safeObjectForKey:@"low_speed_distance"] doubleValue];
    }
    if ([keys containsObject:@"toll_distance"]) {
        
    }
    return result;
}

@end

#pragma mark - query history track

@implementation BTFPointInfo

+ (instancetype)fromDict:(NSDictionary *)dict {
    if (!dict || dict.allKeys.count <= 0) return nil;
    BTFPointInfo *info = [BTFPointInfo new];
    NSArray<NSString *> *keys = dict.allKeys;
    if ([keys containsObject:@"longitude"] && [keys containsObject:@"latitude"]) {
        BTFCoordinate *coord = [BTFCoordinate btf_modelWith:dict];
        info.location = coord;
    }
    if ([keys containsObject:@"loc_time"]) {
        info.locTime = [[dict btf_safeObjectForKey:@"loc_time"] integerValue];
    }
    if ([keys containsObject:@"coord_type"]) {
        NSString *coordType = [dict btf_safeObjectForKey:@"coord_type"];
        if ([coordType isEqualToString:@"wgs84"]) {
            info.coordType = 0;
        } else if ([coordType isEqualToString:@"gcj02"]) {
            info.coordType = 1;
        } else if ([coordType isEqualToString:@"bd09ll"]) {
            info.coordType = 2;
        } else {
            // 不返回经纬度类型
            info.coordType = -1;
        }
    } else {
        // 不返回经纬度类型
        info.coordType = -1;
    }
    return info;
}

@end


@implementation BTFTrackPointInfo

+ (instancetype)fromDict:(NSDictionary *)dict {
    if (!dict || dict.allKeys.count <= 0) return nil;
    BTFTrackPointInfo *info = [BTFTrackPointInfo new];
    NSArray<NSString *> *keys = dict.allKeys;
    NSMutableArray<NSString *> *customKeys = [NSMutableArray arrayWithArray:keys];
    
    if ([keys containsObject:@"longitude"] && [keys containsObject:@"latitude"]) {
        BTFCoordinate *coord = [BTFCoordinate btf_modelWith:dict];
        info.location = coord;
        [customKeys removeObject:@"longitude"];
        [customKeys removeObject:@"latitude"];
    }
    if ([keys containsObject:@"coord_type"]) {
        [customKeys removeObject:@"coord_type"];
    } else {
         // 不返回经纬度类型
        info.coordType = -1;
    }
    
    if ([keys containsObject:@"loc_time"]) {
        info.locTime = [[dict btf_safeObjectForKey:@"loc_time"] integerValue];
        [customKeys removeObject:@"loc_time"];
    }
    if ([keys containsObject:@"direction"]) {
        info.direction = [[dict btf_safeObjectForKey:@"direction"] integerValue];
        [customKeys removeObject:@"direction"];
    }
    if ([keys containsObject:@"create_time"]) {
        info.createTime = [dict btf_safeObjectForKey:@"create_time"];
        [customKeys removeObject:@"create_time"];
    }
    if ([keys containsObject:@"height"]) {
        info.height = [[dict btf_safeObjectForKey:@"height"] doubleValue];
        [customKeys removeObject:@"height"];
    }
    if ([keys containsObject:@"speed"]) {
        info.speed = [[dict btf_safeObjectForKey:@"speed"] doubleValue];
        [customKeys removeObject:@"speed"];
    }
    if ([keys containsObject:@"radius"]) {
        info.radius = [[dict btf_safeObjectForKey:@"radius"] doubleValue];
        [customKeys removeObject:@"radius"];
    }
    if ([keys containsObject:@"road_grade"]) {
        info.roadGrade = [dict btf_safeObjectForKey:@"road_grade"];
        [customKeys removeObject:@"road_grade"];
    }
    if ([keys containsObject:@"road_name"]) {
        info.roadName = [dict btf_safeObjectForKey:@"road_name"];
        [customKeys removeObject:@"road_name"];
    }
    if ([keys containsObject:@"car_limit_speed"]) {
        [customKeys removeObject:@"car_limit_speed"];
    }
    if ([keys containsObject:@"locate_mode"]) {
        info.locateMode = [dict btf_safeObjectForKey:@"locate_mode"];
        [customKeys removeObject:@"locate_mode"];
    }
    if ([keys containsObject:@"transport_mode"]) {
        info.transportMode = [dict btf_safeObjectForKey:@"transport_mode"];
        [customKeys removeObject:@"transport_mode"];
    }
    if ([keys containsObject:@"floor"]) {
        info.floor = [dict btf_safeObjectForKey:@"floor"];
        [customKeys removeObject:@"floor"];
    }
    if ([keys containsObject:@"_supplement"]) {
        [customKeys removeObject:@"_supplement"];
        info.supplement = [[dict btf_safeObjectForKey:@"_supplement"] intValue];
    }
  
    // 有自定义字段
    if (customKeys.count > 0) {
        NSMutableDictionary *customDict = [NSMutableDictionary dictionary];
        for (NSString *key in customKeys) {
            // 自定义字段不能以_开头
            if ([key hasPrefix:@"_"]) continue;
            [customDict setValue:[dict btf_safeObjectForKey:key] forKey:key];
        }
        info.columns = [customDict copy];
    }
    
    return info;
}

@end

@implementation BTFQueryHistoryTrackResult

+ (NSDictionary *)btf_setupObjectClassInArray {
    return @{@"trackPoints" : @"BTFTrackPointInfo"};
}

+ (instancetype)fromDict:(NSDictionary *)dict {
    if (!dict || dict.allKeys.count <= 0) return nil;
    BTFQueryHistoryTrackResult *result = [BTFQueryHistoryTrackResult new];
    NSArray<NSString *> *keys = dict.allKeys;
    if ([keys containsObject:@"status"]) {
        result.status = [[dict btf_safeObjectForKey:@"status"] intValue];
    }
    if ([keys containsObject:@"message"]) {
        result.message = [dict btf_safeObjectForKey:@"message"];
    }
    if ([keys containsObject:@"tag"]) {
        result.tag = [[dict btf_safeObjectForKey:@"tag"] intValue];
    }
    if ([keys containsObject:@"total"]) {
        result.totalSize = [[dict btf_safeObjectForKey:@"total"] intValue];
    }
    if ([keys containsObject:@"size"]) {
        result.size = [[dict btf_safeObjectForKey:@"size"] intValue];
    }
    if ([keys containsObject:@"entity_name"]) {
        result.entityName = [dict btf_safeObjectForKey:@"entity_name"];
    }
    if ([keys containsObject:@"distance"]) {
        result.distance = [[dict btf_safeObjectForKey:@"distance"] doubleValue];
    }
    if ([keys containsObject:@"toll_distance"]) {
        result.tollDistance = [[dict btf_safeObjectForKey:@"toll_distance"] doubleValue];
    }
    if ([keys containsObject:@"low_speed_distance"]) {
        result.lowSpeedDistance = [[dict btf_safeObjectForKey:@"low_speed_distance"] doubleValue];
    }
    if ([keys containsObject:@"start_point"]) {
        BTFPointInfo *info = [BTFPointInfo fromDict:[dict btf_safeObjectForKey:@"start_point"]];
        result.startPoint = info;
    }
    if ([keys containsObject:@"end_point"]) {
        BTFPointInfo *info = [BTFPointInfo fromDict:[dict btf_safeObjectForKey:@"end_point"]];
        result.endPoint = info;
    }
    if ([keys containsObject:@"points"]) {
        NSArray<NSDictionary *> *points = [dict btf_safeObjectForKey:@"points"];
        NSMutableArray<BTFTrackPointInfo *> *pointInfos = [NSMutableArray array];
        for (NSDictionary *dic in points) {
            BTFTrackPointInfo *info = [BTFTrackPointInfo fromDict:dic];
            if (!info) continue;
            [pointInfos addObject:info];
        }
        result.trackPoints = [pointInfos copy];
    }
    return result;
}
@end


#pragma mark - QueryTrackCacheInfoResult

@implementation BTFCacheTrackInfo

+ (instancetype)fromDict:(NSDictionary *)dict {
    if (!dict || dict.allKeys.count <= 0) return nil;
    BTFCacheTrackInfo *info = [BTFCacheTrackInfo new];
    NSArray<NSString *> *keys = dict.allKeys;
    if ([keys containsObject:@"entity_name"]) {
        info.entityName = [dict btf_safeObjectForKey:@"entity_name"];
    }
    if ([keys containsObject:@"total"]) {
        info.total = [[dict btf_safeObjectForKey:@"total"] intValue];
    }
    if ([keys containsObject:@"start_time"]) {
        info.startTime = [[dict btf_safeObjectForKey:@"start_time"] integerValue];
    }
    if ([keys containsObject:@"end_time"]) {
        info.endTime = [[dict btf_safeObjectForKey:@"end_time"] integerValue];
    }
    if ([keys containsObject:@"distance"]) {
        info.cacheDistance = [[dict btf_safeObjectForKey:@"distance"] doubleValue];
    }
    return info;
}

@end

@implementation BTFQueryTrackCacheInfoResult
+ (NSDictionary *)btf_setupObjectClassInArray {
    return @{@"cacheInfoResult" : @"BTFCacheTrackInfo"};
}
+ (instancetype)fromDict:(NSDictionary *)dict {
    if (!dict || dict.allKeys.count <= 0) return nil;
    BTFQueryTrackCacheInfoResult *result = [BTFQueryTrackCacheInfoResult new];
    NSArray<NSString *> *keys = dict.allKeys;
    if ([keys containsObject:@"status"]) {
        result.status = [[dict btf_safeObjectForKey:@"status"] intValue];
    }
    if ([keys containsObject:@"message"]) {
        result.message = [dict btf_safeObjectForKey:@"message"];
    }
    if ([keys containsObject:@"tag"]) {
        result.tag = [[dict btf_safeObjectForKey:@"tag"] intValue];
    }
    if ([keys containsObject:@"result"]) {
        NSMutableArray<BTFCacheTrackInfo *> *infos = [NSMutableArray array];
        for (NSDictionary *dic in (NSArray<NSDictionary *> *)[dict btf_safeObjectForKey:@"result"]) {
            BTFCacheTrackInfo *info = [BTFCacheTrackInfo fromDict:dic];
            if (!info) continue;
            [infos addObject:info];
        }
        result.cacheInfoResult = [infos copy];
    }
    return result;
}

@end
