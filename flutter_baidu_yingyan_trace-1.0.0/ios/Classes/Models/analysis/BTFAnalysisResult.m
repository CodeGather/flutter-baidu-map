//
//  BTFAnalysisResult.m
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/17.
//

#import "BTFAnalysisResult.h"
#import "NSObject+BTFVerify.h"
#import "BTFModels.h"
#import "NSObject+BTFVerify.h"


#pragma mark - drive

@implementation BTFDrivePoint

+ (instancetype)fromDict:(NSDictionary *)dict {
    if (!dict || dict.allKeys.count <= 0) return nil;
    BTFDrivePoint *point = [BTFDrivePoint new];
    NSArray<NSString *> *keys = dict.allKeys;
    if ([keys containsObject:@"longitude"] && [keys containsObject:@"latitude"]) {
        BTFCoordinate *coord = [BTFCoordinate btf_modelWith:dict];
        point.location = coord;
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
    } else {
        // 不返回经纬度类型
        point.coordType = -1;
    }
    if ([keys containsObject:@"loc_time"]) {
        point.locTime = [[dict btf_safeObjectForKey:@"loc_time"] integerValue];
    }
    if ([keys containsObject:@"address"]) {
        point.address = [dict btf_safeObjectForKey:@"address"];
    }
    return point;
}

@end


@implementation BTFSpeedingPoint

+ (instancetype)fromDict:(NSDictionary *)dict {
    if (!dict || dict.allKeys.count <= 0) return nil;
    BTFSpeedingPoint *point = [BTFSpeedingPoint new];
    NSArray<NSString *> *keys = dict.allKeys;
    if ([keys containsObject:@"longitude"] && [keys containsObject:@"latitude"]) {
        BTFCoordinate *coord = [BTFCoordinate btf_modelWith:dict];
        point.location = coord;
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
    } else {
        // 不返回经纬度类型
        point.coordType = -1;
    }
    if ([keys containsObject:@"loc_time"]) {
        point.locTime = [[dict btf_safeObjectForKey:@"loc_time"] integerValue];
    }
    if ([keys containsObject:@"actual_speed"]) {
        point.actualSpeed = [[dict btf_safeObjectForKey:@"actual_speed"] doubleValue];
    }
    if ([keys containsObject:@"limit_speed"]) {
        point.limitSpeed = [[dict btf_safeObjectForKey:@"limit_speed"] doubleValue];
    }
    return point;
}

@end

@implementation BTFSpeedingInfo
+ (NSDictionary *)btf_setupObjectClassInArray {
    return @{@"points" : @"BTFSpeedingPoint"};
}
+ (instancetype)fromDict:(NSDictionary *)dict {
    if (!dict || dict.allKeys.count <= 0) return nil;
    BTFSpeedingInfo *info = [BTFSpeedingInfo new];
    NSArray<NSString *> *keys = dict.allKeys;
    if ([keys containsObject:@"speeding_distance"]) {
        info.distance = [[dict btf_safeObjectForKey:@"speeding_distance"] doubleValue];
    }
    if ([keys containsObject:@"speeding_points"]) {
        NSMutableArray<BTFSpeedingPoint *> *points = [NSMutableArray array];
        for (NSDictionary *dic in (NSArray<NSDictionary *> *)[dict btf_safeObjectForKey:@"speeding_points"]) {
            BTFSpeedingPoint *point = [BTFSpeedingPoint fromDict:dic];
            if (!point) continue;
            [points addObject:point];
        }
        info.points = [points copy];
    }
    return info;
}

@end



@implementation BTFHarshAccelerationPoint

+ (instancetype)fromDict:(NSDictionary *)dict {
    if (!dict || dict.allKeys.count <= 0) return nil;
    BTFHarshAccelerationPoint *point =[BTFHarshAccelerationPoint new];
    NSArray<NSString *> *keys = dict.allKeys;
    if ([keys containsObject:@"longitude"] && [keys containsObject:@"latitude"]) {
        BTFCoordinate *coord = [BTFCoordinate btf_modelWith:dict];
        point.location = coord;
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
    } else {
        // 不返回经纬度类型
        point.coordType = -1;
    }
    if ([keys containsObject:@"loc_time"]) {
        point.locTime = [[dict btf_safeObjectForKey:@"loc_time"] integerValue];
    }
    if ([keys containsObject:@"acceleration"]) {
        point.acceleration = [[dict btf_safeObjectForKey:@"acceleration"] doubleValue];
    }
    if ([keys containsObject:@"initial_speed"]) {
        point.initialSpeed = [[dict btf_safeObjectForKey:@"initial_speed"] doubleValue];
    }
    if ([keys containsObject:@"end_speed"]) {
        point.endSpeed = [[dict btf_safeObjectForKey:@"end_speed"] doubleValue];
    }
    return point;
}

@end


@implementation BTFHarshBreakingPoint

+ (instancetype)fromDict:(NSDictionary *)dict {
    if (!dict || dict.allKeys.count <= 0) return nil;
    BTFHarshBreakingPoint *point = [BTFHarshBreakingPoint new];
    NSArray<NSString *> *keys = dict.allKeys;
    if ([keys containsObject:@"longitude"] && [keys containsObject:@"latitude"]) {
        BTFCoordinate *coord = [BTFCoordinate btf_modelWith:dict];
        point.location = coord;
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
    } else {
        // 不返回经纬度类型
        point.coordType = -1;
    }
    if ([keys containsObject:@"loc_time"]) {
        point.locTime = [[dict btf_safeObjectForKey:@"loc_time"] integerValue];
    }
    if ([keys containsObject:@"acceleration"]) {
        point.acceleration = [[dict btf_safeObjectForKey:@"acceleration"] doubleValue];
    }
    if ([keys containsObject:@"initial_speed"]) {
        point.initialSpeed = [[dict btf_safeObjectForKey:@"initial_speed"] doubleValue];
    }
    if ([keys containsObject:@"end_speed"]) {
        point.endSpeed = [[dict btf_safeObjectForKey:@"end_speed"] doubleValue];
    }
    return point;
}

@end


@implementation BTFHarshSteeringPoint

+ (instancetype)fromDict:(NSDictionary *)dict {
    if (!dict || dict.allKeys.count <= 0) return nil;
    BTFHarshSteeringPoint *point = [BTFHarshSteeringPoint new];
    NSArray<NSString *> *keys = dict.allKeys;
    if ([keys containsObject:@"longitude"] && [keys containsObject:@"latitude"]) {
        BTFCoordinate *coord = [BTFCoordinate btf_modelWith:dict];
        point.location = coord;
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
    } else {
        // 不返回经纬度类型
        point.coordType = -1;
    }
    if ([keys containsObject:@"loc_time"]) {
        point.locTime = [[dict btf_safeObjectForKey:@"loc_time"] integerValue];
    }
    if ([keys containsObject:@"centripetal_acceleration"]) {
        point.centripetalAcceleration = [[dict btf_safeObjectForKey:@"centripetal_acceleration"] doubleValue];
    }
    if ([keys containsObject:@"turn_type"]) {
        NSString *turn_type = [dict btf_safeObjectForKey:@"turn_type"];
        if ([turn_type isEqualToString:@"unknow"]) {
            point.turnType = 0;
        } else if ([turn_type isEqualToString:@"left"]) {
             point.turnType = 1;
        } else if ([turn_type isEqualToString:@"right"]) {
             point.turnType = 2;
        } else {
             point.turnType = 0;
        }
    }
    if ([keys containsObject:@"end_speed"]) {
        point.endSpeed = [[dict btf_safeObjectForKey:@"end_speed"] doubleValue];
    }
    
    return point;
}

@end



@implementation BTFDrivingBehaviourAnalysisResult
+ (NSDictionary *)btf_setupObjectClassInArray {
    return @{@"speedings" : @"BTFSpeedingInfo",
             @"harshAccelerationPoints" : @"BTFHarshAccelerationPoint",
             @"harshBreakingPoints" : @"BTFHarshBreakingPoint",
             @"harshSteeringPoints" : @"BTFHarshSteeringPoint"
    };
}

+ (instancetype)fromDict:(NSDictionary *)dict {
    if (!dict || dict.allKeys.count <= 0) return nil;
    BTFDrivingBehaviourAnalysisResult *result = [BTFDrivingBehaviourAnalysisResult new];
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
    if ([keys containsObject:@"duration"]) {
        result.duration = [[dict btf_safeObjectForKey:@"duration"] doubleValue];
    }
    if ([keys containsObject:@"average_speed"]) {
        result.averageSpeed = [[dict btf_safeObjectForKey:@"average_speed"] doubleValue];
    }
    if ([keys containsObject:@"max_speed"]) {
        result.maxSpeed = [[dict btf_safeObjectForKey:@"max_speed"] doubleValue];
    }
    if ([keys containsObject:@"speeding_num"]) {
        result.speedingNum = [[dict btf_safeObjectForKey:@"speeding_num"] intValue];
        
    }
    if ([keys containsObject:@"harsh_acceleration_num"]) {
        result.harshAccelerationNum = [[dict btf_safeObjectForKey:@"harsh_acceleration_num"] intValue];
    }
    if ([keys containsObject:@"harsh_breaking_num"]) {
        result.harshBreakingNum = [[dict btf_safeObjectForKey:@"harsh_breaking_num"] intValue];
    }
    if ([keys containsObject:@"harsh_steering_num"]) {
        result.harshSteeringNum = [[dict btf_safeObjectForKey:@"harsh_steering_num"] intValue];
    }
    if ([keys containsObject:@"start_point"]) {
        BTFDrivePoint *point = [BTFDrivePoint fromDict:[dict btf_safeObjectForKey:@"start_point"]];
        result.startPoint = point;
    }
    if ([keys containsObject:@"end_point"]) {
        BTFDrivePoint *point = [BTFDrivePoint fromDict:[dict btf_safeObjectForKey:@"end_point"]];
        result.endPoint = point;
    }
    if ([keys containsObject:@"speeding"]) {
        NSMutableArray<BTFSpeedingInfo *> *speedings = [NSMutableArray array];
        for (NSDictionary *dic in (NSArray<NSDictionary *> *)[dict btf_safeObjectForKey:@"speeding"]) {
            BTFSpeedingInfo *speeding = [BTFSpeedingInfo fromDict:dic];
            if (!speeding) continue;
            [speedings addObject:speeding];
        }
        result.speedings = [speedings copy];
    }
    if ([keys containsObject:@"harsh_acceleration"]) {
        NSMutableArray<BTFHarshAccelerationPoint *> *harsh_accelerations = [NSMutableArray array];
        for (NSDictionary *dic in (NSArray<NSDictionary *> *)[dict btf_safeObjectForKey:@"harsh_acceleration"]) {
            BTFHarshAccelerationPoint *harsh_acceleration = [BTFHarshAccelerationPoint fromDict:dic];
            if (!harsh_acceleration) continue;
            [harsh_accelerations addObject:harsh_acceleration];
        }
        result.harshAccelerationPoints = [harsh_accelerations copy];
    }
    if ([keys containsObject:@"harsh_breaking"]) {
        NSMutableArray<BTFHarshBreakingPoint *> *harsh_breakings = [NSMutableArray array];
        for (NSDictionary *dic in (NSArray<NSDictionary *> *)[dict btf_safeObjectForKey:@"harsh_breaking"]) {
            BTFHarshBreakingPoint *harsh_breaking = [BTFHarshBreakingPoint fromDict:dic];
            if (!harsh_breaking) continue;
            [harsh_breakings addObject:harsh_breaking];
        }
        result.harshBreakingPoints = [harsh_breakings copy];
    }
    if ([keys containsObject:@"harsh_steering"]) {
        NSMutableArray<BTFHarshSteeringPoint *> *harsh_steerings = [NSMutableArray array];
        for (NSDictionary *dic in (NSArray<NSDictionary *> *)[dict btf_safeObjectForKey:@"harsh_steering"]) {
            BTFHarshSteeringPoint *harsh_steering = [BTFHarshSteeringPoint fromDict:dic];
            if (!harsh_steering) continue;
            [harsh_steerings addObject:harsh_steering];
        }
        result.harshSteeringPoints = [harsh_steerings copy];
    }
    
    return result;
}

@end


#pragma mark - stay point
@implementation BTFStayPoint
+ (instancetype)fromDict:(NSDictionary *)dict {
    if (!dict || dict.allKeys.count <= 0) return nil;
    BTFStayPoint *point = [BTFStayPoint new];
    NSArray<NSString *> *keys = dict.allKeys;
    if ([keys containsObject:@"start_time"]) {
        point.startTime = [[dict btf_safeObjectForKey:@"start_time"] integerValue];
    }
    if ([keys containsObject:@"end_time"]) {
        point.endTime = [[dict btf_safeObjectForKey:@"end_time"] integerValue];
    }
    if ([keys containsObject:@"duration"]) {
        point.duration = [[dict btf_safeObjectForKey:@"duration"] integerValue];
    }
    if ([keys containsObject:@"stay_point"]) {
        NSDictionary *stay_point = [dict btf_safeObjectForKey:@"stay_point"];
        BTFCoordinate *coord = [BTFCoordinate btf_modelWith:stay_point];
        point.location = coord;
        
        NSString *coordType = [stay_point btf_safeObjectForKey:@"coord_type"];
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
    } else {
        // 不返回经纬度类型
        point.coordType = -1;
    }

    return point;
}
@end


@implementation BTFStayPointAnalysisResult
+ (NSDictionary *)btf_setupObjectClassInArray {
    return @{@"stayPoints" : @"BTFStayPoint"};
}
+ (instancetype)fromDict:(NSDictionary *)dict {
    if (!dict || dict.allKeys.count <= 0) return nil;
    BTFStayPointAnalysisResult *result = [BTFStayPointAnalysisResult new];
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
    if ([keys containsObject:@"staypoint_num"]) {
        result.stayPointNum = [[dict btf_safeObjectForKey:@"staypoint_num"] intValue];
    }
    if ([keys containsObject:@"stay_points"]) {
        NSMutableArray<BTFStayPoint *> *points = [NSMutableArray array];
        for (NSDictionary *dic in (NSArray<NSDictionary *> *)[dict btf_safeObjectForKey:@"stay_points"]) {
            BTFStayPoint *point = [BTFStayPoint fromDict:dic];
            if (!point) continue;
            [points addObject:point];
        }
        result.stayPoints = [points copy];
    }
    return result;
}

@end
