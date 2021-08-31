//
//  BTFServerResult.m
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/11.
//

#import "BTFServerResult.h"
#import <BaiduTraceSDK/BaiduTraceSDK.h>
@implementation BTFServerResult
/// 开启服务result
+ (NSDictionary *)fromServiceCode:(NSUInteger)errorCode {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    NSString *message = nil;
    switch (errorCode) {
        case BTK_START_SERVICE_SUCCESS:
            message = @"服务开启成功，并与服务端连接成功";
            break;
        case BTK_START_SERVICE_SUCCESS_BUT_OFFLINE:
            message = @"服务开启成功，但与服务端连接失败，SDK会尝试重连";
            break;
        case BTK_START_SERVICE_PARAM_ERROR:
            message = @"参数错误";
            break;
        case BTK_START_SERVICE_INTERNAL_ERROR:
            message = @"内部错误";
            break;
        case BTK_START_SERVICE_AUTH_ERROR:
            message = @"鉴权不通过导致失败(ak mcode等信息错误)";
            break;
        case BTK_START_SERVICE_IN_PROGRESS:
            message = @"正在开启服务";
            break;
        case BTK_SERVICE_ALREADY_STARTED_ERROR:
            message = @"已经开启服务，请勿重复开启";
            break;
        case BTK_STOP_SERVICE_NO_ERROR:
            message = @"停止服务成功";
            break;
        case BTK_STOP_SERVICE_NOT_YET_STARTED_ERROR:
            message = @"服务还未开启，无法停止";
            break;
        case BTK_STOP_SERVICE_IN_PROGRESS:
            message = @"正在停止服务";
            break;
        case BTK_START_SERVICE_SUCCESS_BUT_NO_AUTH_TO_KEEP_ALIVE:
            message = @"服务开启成功，但是由于没有定位权限，所以无法保活";
            break;
        default:
            message = @"未知错误码";
            break;
    }
    dict[@"status"] = @(errorCode);
    dict[@"message"] = message;
    return [dict copy];
}

/// 采集result
+ (NSDictionary *)fromGatherCode:(NSUInteger)errorCode {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    NSString *message = nil;
    switch (errorCode) {
        case BTK_START_GATHER_SUCCESS:
            message = @"开始采集成功";
            break;
        case BTK_GATHER_ALREADY_STARTED_ERROR:
            message = @"已经在采集，请勿重复开始";
            break;
        case BTK_START_GATHER_BEFORE_START_SERVICE_ERROR:
            message = @"开始采集必须在开始服务之后调用";
            break;
        case BTK_START_GATHER_LOCATION_SERVICE_OFF_ERROR:
            message = @"开始采集由于系统定位服务未开启而失败";
            break;
        case BTK_START_GATHER_LOCATION_ALWAYS_USAGE_AUTH_ERROR:
            message = @"开始采集由于没有后台定位权限而失败";
            break;
        case BTK_START_GATHER_INTERNAL_ERROR:
            message = @"开始采集由于内部错误而失败";
            break;
        case BTK_STOP_GATHER_NO_ERROR:
            message = @"停止采集成功";
            break;
        case BTK_STOP_GATHER_NOT_YET_STARTED_ERROR:
            message = @"停止采集必须在开始采集之后调用";
            break;
        default:
            message = @"未知错误码";
            break;
    }
    dict[@"status"] = @(errorCode);
    dict[@"message"] = message;
    return [dict copy];
}

@end
