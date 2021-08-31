//
//  BTFFenceHandlers.m
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/1.
//

#import "BTFFenceHandlers.h"
#import "BTFYingYanMethodConst.h"
#import "BTFYingYanMethodCallbackConst.h"
#import <BaiduTraceSDK/BaiduTraceSDK.h>
#import "BTFDefine.h"
#import "NSObject+BTFVerify.h"
#import "NSObject+BTFThread.h"

#import "BTFFence.h"
#import "BTFFenceOption.h"
#import "BTFFenceResult.h"

@interface BTFFenceHandlers ()<BTKFenceDelegate>

@end
static BTFFenceHandlers *_instance = nil;
@implementation BTFFenceHandlers
/// BTFFenceHandlers管理中心
+ (instancetype)defalutCenter {
    if (!_instance) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _instance = [[BTFFenceHandlers alloc] init];
        });
    }
    return _instance;
}
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    if (!_instance) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _instance = [super allocWithZone:zone];
        });
    }
    return _instance;
}
@synthesize _channel;

- (void)configChannel:(nonnull FlutterMethodChannel *)channel {
    _channel = channel;
}

- (void)handleMethodCall:(nonnull FlutterMethodCall *)call result:(nonnull FlutterResult)result {
    NSLog(@"iOS - fence - call.method = %@ call.arguments = %@", call.method, call.arguments);
    if ([call.method isEqualToString:kCreateFence]) {
        BTFCreateFenceOption *option = [BTFCreateFenceOption btf_modelWith:call.arguments];
        if (!option) result(@NO);
        if ([option fenceType]== 0) {
            [[BTKFenceAction sharedInstance] createLocalFenceWith:[option toBTKCreateLocalFenceRequest] delegate:self];
            result(@YES);
        } else if ([option fenceType] == 1) {
            [[BTKFenceAction sharedInstance] createServerFenceWith:[option toBTKCreateServerFenceRequest] delegate:self];
            result(@YES);
        } else {
           result(@NO);
        }
        
    } else if ([call.method isEqualToString:kDeleteFence]) {
        BTFDeleteFenceOption *option = [BTFDeleteFenceOption btf_modelWith:call.arguments];
        if (!option) result(@NO);
        if ([option fenceType] == 0) {
            [[BTKFenceAction sharedInstance] deleteLocalFenceWith:[option toBTKDeleteLocalFenceRequest] delegate:self];
            result(@YES);
        } else if ([option fenceType] == 1) {
            [[BTKFenceAction sharedInstance] deleteServerFenceWith:[option toBTKDeleteServerFenceRequest] delegate:self];
            result(@YES);
        } else {
            result(@NO);
        }
    } else if ([call.method isEqualToString:kUpdateFence]) {
        BTFUpdateFenceOption *option = [BTFUpdateFenceOption btf_modelWith:call.arguments];
        if (!option) result(@NO);
        if ([option fenceType] == 0) {
            [[BTKFenceAction sharedInstance] updateLocalFenceWith:[option toBTKUpdateLocalFenceRequest] delegate:self];
            result(@YES);
        } else if ([option fenceType] == 1) {
            [[BTKFenceAction sharedInstance] updateServerFenceWith:[option toBTKUpdateServerFenceRequest] delegate:self];
            result(@YES);
        } else {
            result(@NO);
        }
    } else if ([call.method isEqualToString:kQueryFenceList]) {
        BTFQueryFenceOption *option = [BTFQueryFenceOption btf_modelWith:call.arguments];
        if (!option) result(@NO);
        if ([option fenceType] == 0) {
            [[BTKFenceAction sharedInstance] queryLocalFenceWith:[option toBTKQueryLocalFenceRequest] delegate:self];
            result(@YES);
        } else if ([option fenceType] == 1) {
            [[BTKFenceAction sharedInstance] queryServerFenceWith:[option toBTKQueryServerFenceRequest] delegate:self];
            result(@YES);
        } else {
            result(@NO);
        }
    } else if ([call.method isEqualToString:kQueryMonitoredStatus]) {
        BTFQueryFenceStatusOption *option = [BTFQueryFenceStatusOption btf_modelWith:call.arguments];
        if ([option fenceType] == 0) {
            [[BTKFenceAction sharedInstance] queryLocalFenceStatusWith:[option toBTKQueryLocalFenceStatusRequest] delegate:self];
            result(@YES);
        } else if ([option fenceType] == 1) {
            [[BTKFenceAction sharedInstance] queryServerFenceStatusWith:[option toBTKQueryServerFenceStatusRequest] delegate:self];
            result(@YES);
        } else {
            result(@NO);
        }
    } else if ([call.method isEqualToString:kQueryMonitoredStatusByLocation]) {
        BTFQueryFenceStatusByCustomLocation *option = [BTFQueryFenceStatusByCustomLocation btf_modelWith:call.arguments];
           if ([option fenceType] == 0) {
               [[BTKFenceAction sharedInstance] queryLocalFenceStatusByCustomLocationWith:[option toBTKQueryLocalFenceStatusByCustomLocationRequest] delegate:self];
               result(@YES);
           } else if ([option fenceType] == 1) {
               [[BTKFenceAction sharedInstance] queryServerFenceStatusByCustomLocationWith:[option toBTKQueryServerFenceStatusByCustomLocationRequest] delegate:self];
               result(@YES);
           } else {
               result(@NO);
           }
    } else if ([call.method isEqualToString:kQueryHistoryAlarm]) {
        BTFQueryFenceHistoryAlarmOption *option = [BTFQueryFenceHistoryAlarmOption btf_modelWith:call.arguments];
        if ([option fenceType] == 0) {
            [[BTKFenceAction sharedInstance] queryLocalFenceHistoryAlarmWith:[option toBTKQueryLocalFenceHistoryAlarmRequest] delegate:self];
            result(@YES);
        } else if ([option fenceType] == 1) {
            [[BTKFenceAction sharedInstance] queryServerFenceHistoryAlarmWith:[option toBTKQueryServerFenceHistoryAlarmRequest] delegate:self];
            result(@YES);
        } else {
            result(@NO);
        }
    } else if ([call.method isEqualToString:kAddMonitoredPerson]) {
        BTFAddMonitoredObjectOption *option = [BTFAddMonitoredObjectOption btf_modelWith:call.arguments];
        if (!option) result(@NO);
        [[BTKFenceAction sharedInstance] addMonitoredObjectWith:[option toBTKAddMonitoredObjectRequest] delete:self];
        result(@YES);
    } else if ([call.method isEqualToString:kDeleteMonitoredPerson]) {
        BTFDeleteMonitoredObjectOption *option = [BTFDeleteMonitoredObjectOption btf_modelWith:call.arguments];
        if (!option) result(@NO);
        [[BTKFenceAction sharedInstance] deleteMonitoredObjectWith:[option toBTKDeleteMonitoredObjectRequest] delete:self];
        result(@YES);
    } else if ([call.method isEqualToString:kQueryListMonitoredPerson]) {
        BTFListMonitoredObjectOption *option = [BTFListMonitoredObjectOption btf_modelWith:call.arguments];
        if (!option) result(@NO);
        [[BTKFenceAction sharedInstance] listMonitoredObjectWith:[option toBTKListMonitoredObjectRequest] delete:self];
        result(@YES);
    } else {
        result(FlutterMethodNotImplemented);
    }
}
#pragma mark - 客户端围栏 实体管理
/**
 创建客户端地理围栏的回调方法

 @param response 创建客户端围栏的结果
 */
- (void)onCreateLocalFence:(NSData *)response {
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"create local fence response: %@", dict);
    BTFFenceCreateResult *result = [BTFFenceCreateResult fromDict:dict];
    [_channel invokeMethod:kCreateFenceCallback arguments:[result btf_toDictionary]];
}

/**
 删除客户端地理围栏的回调方法

 @param response 创建客户端围栏的结果
 */
- (void)onDeleteLocalFence:(NSData *)response {
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"delete local fence response: %@", dict);
    BTFFenceDelereResult *result = [BTFFenceDelereResult fromDict:dict];
    [_channel invokeMethod:kDeleteFenceCallback arguments:[result btf_toDictionary]];
}

/**
 更新客户端地理围栏的回调方法

 @param response 创建客户端围栏的结果
 */
- (void)onUpdateLocalFence:(NSData *)response {
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"update local fence response: %@", dict);
    [_channel invokeMethod:kUpdateFenceCallback arguments:dict];
}

/**
 查询客户端地理围栏的回调方法

 @param response 创建客户端围栏的结果
 */
- (void)onQueryLocalFence:(NSData *)response {
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"query local fence response: %@", dict);
    BTFFenceQueryLocalFenceResult *result = [BTFFenceQueryLocalFenceResult fromDict:dict];
    NSLog(@"res = %@", [result btf_toDictionary]);
    [_channel invokeMethod:kQueryFenceListCallback arguments:[result btf_toDictionary]];
}


#pragma mark - 客户端围栏 状态与报警查询

/**
 查询监控对象和客户端地理围栏的位置关系的回调方法

 @param response 查询结果
 */
- (void)onQueryLocalFenceStatus:(NSData *)response {
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"queryL local fence status response: %@", dict);
    BTFQueryLocalMonitoredStatusResult *result = [BTFQueryLocalMonitoredStatusResult fromDict:dict];
    [_channel invokeMethod:kQueryMonitoredStatusCallback arguments:[result btf_toDictionary]];
}

/**
 根据自定义位置，查询监控对象和客户端地理围栏的位置关系的回调方法

 @param response 查询结果
 */
- (void)onQueryLocalFenceStatusByCustomLocation:(NSData *)response {
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"query local fence status by custom location response: %@", dict);
    BTFQueryLocalMonitoredStatusResult *result = [BTFQueryLocalMonitoredStatusResult fromDict:dict];
    [_channel invokeMethod:kQueryMonitoredStatusByLocationCallback arguments:[result btf_toDictionary]];
}

/**
 查询客户端地理围栏历史报警信息的回调方法

 @param response 查询结果
 */
- (void)onQueryLocalFenceHistoryAlarm:(NSData *)response {
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"query local fence history alarm response: %@", dict);
    // 数据结构待验证
    BTFQueryLocalHistoryAlarmResult *result = [BTFQueryLocalHistoryAlarmResult fromDict:dict];
    [_channel invokeMethod:kQueryHistoryAlarmCallback arguments:[result btf_toDictionary]];
}


#pragma mark - 服务端围栏 实体管理
/**
 创建服务端地理围栏的回调方法

 @param response 创建服务端围栏的结果
 */
- (void)onCreateServerFence:(NSData *)response {
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"create server fence response: %@", dict);
    BTFFenceCreateResult *result = [BTFFenceCreateResult fromDict:dict];
    [_channel invokeMethod:kCreateFenceCallback arguments:[result btf_toDictionary]];
}

/**
 删除服务端地理围栏的回调方法

 @param response 删除服务端围栏的结果
 */
- (void)onDeleteServerFence:(NSData *)response {
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"delete server fence response: %@", dict);
    BTFFenceDelereResult *result = [BTFFenceDelereResult fromDict:dict];
    [_channel invokeMethod:kDeleteFenceCallback arguments:[result btf_toDictionary]];
}

/**
 修改服务端地理围栏的回调方法

 @param response 修改服务端围栏的结果
 */
- (void)onUpdateServerFence:(NSData *)response {
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"update server fence response: %@", dict);
    [_channel invokeMethod:kUpdateFenceCallback arguments:dict];
}

/**
 查询服务端地理围栏的回调方法

 @param response 查询服务端围栏的结果
 */
- (void)onQueryServerFence:(NSData *)response {
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"query server fence response: %@", dict);
    BTFQueryServerResult *result = [BTFQueryServerResult fromDict:dict];
    [_channel invokeMethod:kQueryFenceListCallback arguments:[result toDict]];
}


#pragma mark - 服务端围栏 状态与报警查询
/**
 查询监控对象在服务端地理围栏内外的回调方法

 @param response 查询结果
 */
- (void)onQueryServerFenceStatus:(NSData *)response {
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"query server fence status response: %@", dict);
    BTFQueryServerMonitoredStatusResult *result = [BTFQueryServerMonitoredStatusResult fromDict:dict];
    [_channel invokeMethod:kQueryMonitoredStatusCallback arguments:[result btf_toDictionary]];
}

/**
 根据指定的位置查询被监控对象的状态的回调方法

 @param response 查询结果
 */
- (void)onQueryServerFenceStatusByCustomLocation:(NSData *)response {
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"query server fence status by custom location response: %@", dict);
    BTFQueryServerMonitoredStatusResult *result = [BTFQueryServerMonitoredStatusResult fromDict:dict];
    [_channel invokeMethod:kQueryMonitoredStatusByLocationCallback arguments:[result btf_toDictionary]];
}

/**
 查询监控对象的服务端围栏报警信息的回调方法

 @param response 查询结果
 */
- (void)onQueryServerFenceHistoryAlarm:(NSData *)response {
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"query server fence history alarm response: %@", dict);
    BTFQueryServerHistoryAlarmResult *result = [BTFQueryServerHistoryAlarmResult fromDict:dict];
    [_channel invokeMethod:kQueryHistoryAlarmCallback arguments:[result btf_toDictionary]];
}

///**
// 批量同步某service的服务端地理围栏报警信息的回调方法
//
// @param response 查询结果
// */
//- (void)onBatchQueryServerFenceHistoryAlarm:(NSData *)response {
//    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:nil];
//    NSLog(@"batch query server fence history alarm response: %@", dict);
//}

#pragma mark - 服务端围栏 监控对象管理
/**
 给服务端围栏添加监控对象的回调方法
 
 @param response 查询结果
 */
- (void)onAddMonitoredObject:(NSData *)response {
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"add monitored object response: %@", dict);
    [_channel invokeMethod:kAddMonitoredPersonCallback arguments:dict];
}

/**
 删除服务端围栏的监控对象的回调方法
 
 @param response 查询结果
 */
- (void)onDeleteMonitoredObject:(NSData *)response {
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"delete monitored object response: %@", dict);
    [_channel invokeMethod:kDeleteMonitoredPersonCallback arguments:dict];
}

/**
 查询服务端围栏的监控对象的回调方法
 
 @param response 查询结果
 */
- (void)onListMonitoredObject:(NSData *)response {
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"list monitored object response: %@", dict);
    BTFQueryListMonitoredPersonResult *result = [BTFQueryListMonitoredPersonResult fromDict:dict];
    [_channel invokeMethod:kQueryListMonitoredPersonCallback arguments:[result btf_toDictionary]];
}


@end
