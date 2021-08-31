//
//  BTFTrackHandlers.m
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/1.
//

#import "BTFTrackHandlers.h"
#import "BTFYingYanMethodConst.h"
#import "BTFYingYanMethodCallbackConst.h"
#import <BaiduTraceSDK/BaiduTraceSDK.h>
#import "BTFDefine.h"
#import "NSObject+BTFVerify.h"
#import "NSObject+BTFThread.h"

#import "BTFTrackOption.h"
#import "BTFQueryTrackProcessOption.h"
#import "BTFTrackResult.h"

@interface BTFTrackHandlers ()<BTKTrackDelegate>

@end
static BTFTrackHandlers *_instance = nil;
@implementation BTFTrackHandlers
/// BTFTrackHandlers管理中心
+ (instancetype)defalutCenter {
    if (!_instance) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _instance = [[BTFTrackHandlers alloc] init];
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
    // NSLog(@"iOS - call.method = %@ call.arguments = %@", call.method, call.arguments);
    if ([call.method isEqualToString:kAddCustomPoint]) {
        BTFAddCustomTrackPointOption *option = [BTFAddCustomTrackPointOption btf_modelWith:call.arguments];
        if (!option) result(@NO);
        [[BTKTrackAction sharedInstance] addCustomPointWith:[option toBTKAddCustomTrackPointRequest] delegate:self];
        result(@YES);
    } else if ([call.method isEqualToString:kBatchAddCustomPoint]) {
        BTFAddCustomTrackPointsOption *option = [BTFAddCustomTrackPointsOption fromDict:call.arguments];
        if (!option) result(@NO);
        [[BTKTrackAction sharedInstance] batchAddCustomPointWith:[option toBTKBatchAddCustomTrackPointRequest] delegate:self];
        result(@YES);
    } else if ([call.method isEqualToString:kQueryTrackLatestPoint]) {
        BTFQueryTrackLatestPointOption *option = [BTFQueryTrackLatestPointOption btf_modelWith:call.arguments];
        if (!option) result(@NO);
        [[BTKTrackAction sharedInstance] queryTrackLatestPointWith:[option toBTKQueryTrackLatestPointRequest] delegate:self];
        result(@YES);
    } else if ([call.method isEqualToString:kQueryTrackDistance]) {
        BTFQueryTrackDistanceOption *option = [BTFQueryTrackDistanceOption btf_modelWith:call.arguments];
        if (!option) result(@NO);
        [[BTKTrackAction sharedInstance] queryTrackDistanceWith:[option toBTKQueryTrackDistanceRequest] delegate:self];
        result(@YES);
    } else if ([call.method isEqualToString:kQueryHistoryTrack]) {
        BTFQueryHistoryTrackOption *option = [BTFQueryHistoryTrackOption btf_modelWith:call.arguments];
        if (!option) result(@NO);
        [[BTKTrackAction sharedInstance] queryHistoryTrackWith:[option toBTKQueryHistoryTrackRequest] delegate:self];
        result(@YES);
    } else if ([call.method isEqualToString:kQueryTrackCacheInfo]) {
        BTFQueryTrackCacheInfoOption *option = [BTFQueryTrackCacheInfoOption btf_modelWith:call.arguments];
        if (!option) result(@NO);
        [[BTKTrackAction sharedInstance] queryTrackCacheInfoWith:[option toBTKQueryTrackCacheInfoRequest] delegate:self];
        result(@YES);
    } else if ([call.method isEqualToString:kClearTrackCache]) {
        BTFClearTrackCacheOption *option = [BTFClearTrackCacheOption btf_modelWith:call.arguments];
           if (!option) result(@NO);
           [[BTKTrackAction sharedInstance] clearTrackCacheWith:[option toBTKClearTrackCacheRequest] delegate:self];
           result(@YES);
    } else {
       result(FlutterMethodNotImplemented);
    }
}



#pragma mark - BTKTrackDelegate
/**
 上传开发者自定义轨迹点的回调方法

 @param response 上传结果
 */
- (void)onAddCustomTrackPoint:(NSData *)response {
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"add custom track point response: %@", dict);
    [_channel invokeMethod:kAddCustomPointCallback arguments:dict];
}

/**
 批量上传开发者自定义的轨迹点的回调方法

 @param response 上传结果
 */
- (void)onBatchAddCustomTrackPoint:(NSData *)response {
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"add custom track points response: %@", dict);
    BTFAddTrackPointsResult *result = [BTFAddTrackPointsResult fromDict:dict];
    [_channel invokeMethod:kBatchAddCustomPointCallback arguments:[result btf_toDictionary]];
}

/**
 实时位置查询的回调方法

 @param response 查询结果
 */
- (void)onQueryTrackLatestPoint:(NSData *)response {
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"query track latest point response: %@", dict);
    BTFQueryTrackLatestPointResult *result = [BTFQueryTrackLatestPointResult fromDict:dict];
    [_channel invokeMethod:kQueryTrackLatestPointCallback arguments:[result btf_toDictionary]];
}

/**
 里程查询的回调方法

 @param response 查询结果
 */
- (void)onQueryTrackDistance:(NSData *)response {
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"query track distance response: %@", dict);
    BTFQueryTrackDistanceResult *result =[BTFQueryTrackDistanceResult fromDict:dict];
    [_channel invokeMethod:kQueryTrackDistanceCallback arguments:[result btf_toDictionary]];
}

/**
 轨迹查询的回调方法

 @param response 查询结果
 */
- (void)onQueryHistoryTrack:(NSData *)response {
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:nil];
    // NSLog(@"query history track response: %@", dict);
    BTFQueryHistoryTrackResult *result = [BTFQueryHistoryTrackResult fromDict:dict];
    [_channel invokeMethod:kQueryHistoryTrackCallback arguments:[result btf_toDictionary]];
}

/**
 缓存查询的回调方法

 @param response 查询结果
 */
- (void)onQueryTrackCacheInfo:(NSData *)response {
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"query track cache info response: %@", dict);
    [_channel invokeMethod:kQueryTrackCacheInfoCallback arguments:dict];
}

/**
 清空缓存的回调方法

 @param response 清空操作的结果
 */
- (void)onClearTrackCache:(NSData *)response {
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"clear track cache response: %@", dict);
    [_channel invokeMethod:kClearTrackCacheCallback arguments:dict];
}

@end
