//
//  BTFEntityResult.m
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/16.
//

#import "BTFEntityResult.h"
#import "BTFModels.h"
#import "NSObject+BTFVerify.h"
#import "NSObject+BTFTime.h"

@implementation BTFLatestLocation

+ (instancetype)fromDict:(NSDictionary *)dict {
    if (!dict || dict.allKeys.count <= 0) return nil;
    BTFLatestLocation *location = [BTFLatestLocation new];
    NSArray<NSString *> *keys = dict.allKeys;
    NSMutableArray<NSString *> *customKeys = [NSMutableArray arrayWithArray:keys];

    if ([keys containsObject:@"latitude"] && [keys containsObject:@"longitude"]) {
        BTFCoordinate *coord = [BTFCoordinate btf_modelWith:dict];
        location.location = coord;
        [customKeys removeObject:@"latitude"];
        [customKeys removeObject:@"longitude"];
    }
    if ([keys containsObject:@"radius"]) {
        location.radius = [[dict btf_safeObjectForKey:@"radius"] doubleValue];
        [customKeys removeObject:@"radius"];
    }
    if ([keys containsObject:@"loc_time"]) {
        location.locTime = [[dict btf_safeObjectForKey:@"loc_time"] integerValue];
        [customKeys removeObject:@"loc_time"];
    }
    if ([keys containsObject:@"direction"]) {
        location.direction = [[dict btf_safeObjectForKey:@"direction"] intValue];
        [customKeys removeObject:@"direction"];
    }
    if ([keys containsObject:@"speed"]) {
        location.speed = [[dict btf_safeObjectForKey:@"speed"] doubleValue];
        [customKeys removeObject:@"speed"];
    }
    if ([keys componentsJoinedByString:@"height"]) {
        location.height = [[dict btf_safeObjectForKey:@"height"] doubleValue];
        [customKeys removeObject:@"height"];
    }
    if ([keys containsObject:@"coord_type"]) {
        NSString *coordType = [dict btf_safeObjectForKey:@"coord_type"];
        if ([coordType isEqualToString:@"wgs84"]) {
            location.coordType = 0;
        } else if ([coordType isEqualToString:@"gcj02"]) {
            location.coordType = 1;
        } else if ([coordType isEqualToString:@"bd09ll"]) {
            location.coordType = 2;
        } else {
            // 不返回经纬度类型
            location.coordType = -1;
        }
        [customKeys removeObject:@"coord_type"];
    }
    if ([keys containsObject:@"object_name"]) {
        location.objectName = [dict btf_safeObjectForKey:@"object_name"];
        [customKeys removeObject:@"object_name"];
    }
    if ([keys containsObject:@"floor"]) {
        location.floor =[dict btf_safeObjectForKey:@"floor"];
        [customKeys removeObject:@"floor"];
    }
    if ([keys containsObject:@"distance"]) {
        location.distance = [[dict btf_safeObjectForKey:@"distance"] doubleValue];
        [customKeys removeObject:@"distance"];
    }
    
     // 有自定义字段
    if (customKeys.count > 0) {
        NSMutableDictionary *customDict = [NSMutableDictionary dictionary];
        for (NSString *key in customKeys) {
            // 自定义字段不能以_开头
            if ([key hasPrefix:@"_"]) continue;
            [customDict setValue:[dict btf_safeObjectForKey:key] forKey:key];
        }
        location.columns = [customDict copy];
    }
    return location;
}

@end

@implementation BTFEntityInfo

+ (instancetype)fromDict:(NSDictionary *)dict {
    if (!dict || dict.allKeys.count <= 0) return nil;
    BTFEntityInfo *info = [BTFEntityInfo new];
    NSArray<NSString *> *keys = dict.allKeys;
    NSMutableArray<NSString *> *customKeys = [NSMutableArray arrayWithArray:keys];
    if ([keys containsObject:@"entity_name"]) {
        info.entityName = [dict btf_safeObjectForKey:@"entity_name"];
        [customKeys removeObject:@"entity_name"];
    }
    if ([keys containsObject:@"entity_desc"]) {
        info.entityDesc = [dict btf_safeObjectForKey:@"entity_desc"];
        [customKeys removeObject:@"entity_desc"];
    }
    if ([keys containsObject:@"modify_time"]) {
        info.modifyTime = [dict btf_safeObjectForKey:@"modify_time"];
        [customKeys removeObject:@"modify_time"];
    }
    if ([keys containsObject:@"create_time"]) {
        info.createTime = [dict btf_safeObjectForKey:@"create_time"];
        [customKeys removeObject:@"create_time"];
    }
    if ([keys containsObject:@"latest_location"]) {
        info.latestLocation = [BTFLatestLocation fromDict:(NSDictionary *)[dict btf_safeObjectForKey:@"latest_location"]];
        [customKeys removeObject:@"latest_location"];
    }
    
    // 有自定义字段
    if (customKeys.count > 0) {
        NSMutableDictionary *customDict = [NSMutableDictionary dictionary];
        for (NSString *key in customKeys) {
            // 自定义字段不能以_开头
            if ([key hasPrefix:@"_"]) continue;
            [customDict setValue:[dict btf_safeObjectForKey:key] forKey:key];
        }
        info.customColumns = [customDict copy];
    }
    return info;
}

@end

@implementation BTFQueryEntityListResult
+ (NSDictionary *)btf_setupObjectClassInArray {
    return @{@"entities" : @"BTFEntityInfo"};
}
+ (instancetype)fromDict:(NSDictionary *)dict {
    if (!dict || dict.allKeys.count <= 0) return nil;
    BTFQueryEntityListResult *result = [BTFQueryEntityListResult new];
    NSArray<NSString *> *keys = dict.allKeys;
    if ([keys containsObject:@"size"]) {
        result.size = [[dict btf_safeObjectForKey:@"size"] intValue];
    }
    if ([keys containsObject:@"total"]) {
        result.totalSize = [[dict btf_safeObjectForKey:@"total"] intValue];
    }
    if ([keys containsObject:@"status"]) {
        result.status = [[dict btf_safeObjectForKey:@"status"] intValue];
    }
    if ([keys containsObject:@"message"]) {
        result.message = [dict btf_safeObjectForKey:@"message"];
    }
    if ([keys containsObject:@"tag"]) {
        result.tag = [[dict btf_safeObjectForKey:@"tag"] intValue];
    }
    if ([keys containsObject:@"entities"]) {
        NSMutableArray<BTFEntityInfo *> *infos = [NSMutableArray array];
        
        for (NSDictionary *dic in (NSArray<NSDictionary *> *)[dict btf_safeObjectForKey:@"entities"]) {
            BTFEntityInfo *info = [BTFEntityInfo fromDict:dic];
            if (!info) continue;
            [infos addObject:info];
        }
        result.entities = [infos copy];
    }
    return result;
}
@end
