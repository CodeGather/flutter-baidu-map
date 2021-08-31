//
//  BTFGatherHandlers.m
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/1.
//

#import "BTFGatherHandlers.h"
#import "BTFYingYanMethodConst.h"
#import "BTFYingYanMethodCallbackConst.h"
#import <BaiduTraceSDK/BaiduTraceSDK.h>
#import "BTFDefine.h"
#import "NSObject+BTFVerify.h"
#import "NSObject+BTFThread.h"

#import "BTFServerOption.h"
#import "BTFStartServiceOption.h"
#import "BTFServerResult.h"
#import "BTFPushMessage.h"
#import "JRNLocalNotificationCenter.h"


@interface BTFGatherHandlers ()<BTKTraceDelegate>

@end
static BTFGatherHandlers *_instance = nil;

static FlutterError *getFlutterError(NSError *error) {
    return [FlutterError errorWithCode:[NSString stringWithFormat:@"Error %d", (int)error.code]
                               message:error.localizedDescription
                               details:error.domain];
}

@implementation BTFGatherHandlers

@synthesize _channel;

/// BTFGatherHandlers管理中心
+ (instancetype)defalutCenter {
    if (!_instance) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _instance = [[BTFGatherHandlers alloc] init];
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
- (void)configChannel:(nonnull FlutterMethodChannel *)channel {
    _channel = channel;
}

- (void)handleMethodCall:(nonnull FlutterMethodCall *)call result:(nonnull FlutterResult)result {
    NSLog(@"iOS -BTFGatherHandlers- call.method = %@ call.arguments = %@", call.method, call.arguments);
    // 设置SDK运行所需的基础信息，调用任何方法之前都需要先调用此方法
    if ([call.method isEqualToString:kConfigServerInfo]) {
        BTFServerOption *option = [BTFServerOption btf_modelWith:call.arguments];
        BTKServiceOption *serverOption = [option toBTKServiceOption];
        if (!serverOption) result(@NO);
        BOOL flag = [[BTKAction sharedInstance] initInfo:serverOption];
        result(@(flag));
    } else if ([call.method isEqualToString:kStartTraceService]) { // 开启轨迹服务
        BTFStartServiceOption *option = [BTFStartServiceOption btf_modelWith:call.arguments];
        if (!option) result(@NO);

        [[JRNLocalNotificationCenter defaultCenter] postNotificationOn:[[NSDate alloc]init]
                                                                forKey:@"踪迹查正在保护您的安全"
                                                             alertBody:@"关闭踪迹查会导致位置丢失，请谨慎操作"
                                                           alertAction:@"Cancel"
                                                             soundName:nil
                                                           launchImage:nil
                                                              userInfo:@{@"test-key": @"test-value"}
                                                            badgeCount:-1
                                                        repeatInterval:0];
      
        [self startServiceWithOption:[option toBTKStartServiceOption]];
        result(@YES);
    } else if ([call.method isEqualToString:kStopTraceService]) { // 停止轨迹服务
        [self stopService];
        result(@YES);
    } else if ([call.method isEqualToString:kStartGather]) { // 开始采集
        [self startGather];
        result(@YES);
    } else if ([call.method isEqualToString:kStopGather]) { // 停止采集
        [self stopGather];
        result(@YES);
    } else if ([call.method isEqualToString:kSetInterval]) { // 设置采集周期和打包上传的周期
        int gatherInterval = [[call.arguments btf_safeObjectForKey:@"gatherInterval"] intValue];
        int packInterval = [[call.arguments btf_safeObjectForKey:@"packInterval"] intValue];
        // [2,300]
        [[BTKAction sharedInstance] changeGatherAndPackIntervals:gatherInterval packInterval:packInterval delegate:self];
        result(@YES);
    } else if ([call.method isEqualToString:kSetCacheSize]) { // 设置SDK缓存所占磁盘空间的最大值。单位：MB。
        int size = [[call.arguments btf_safeObjectForKey:@"size"] intValue];
        // size 缓存占用空间的最大值，最小值为50MB。
        [[BTKAction sharedInstance] setCacheMaxSize:size delegate:self];
        result(@YES);
    } else {
       result(FlutterMethodNotImplemented);
    }
}

#pragma mark - private
- (void)startServiceWithOption:(BTKStartServiceOption *)startServiceOption {
    [self btf_performBlockOnGlobalQueueAsync:^{
        [[BTKAction sharedInstance] startService:startServiceOption delegate:self];
    }];
}

- (void)stopService {
    [self btf_performBlockOnGlobalQueueAsync:^{
        [[BTKAction sharedInstance] stopService:self];
    }];
}

- (void)startGather{
    [self btf_performBlockOnGlobalQueueAsync:^{
      // 启用后台位置指示器，进入后台时保留被授予的临时访问权限（精确位置）
      [[BTKAction sharedInstance] showsBackgroundLocationIndicator:YES];
      [[BTKAction sharedInstance] startGather:self];
    }];
}

- (void)stopGather {
    [self btf_performBlockOnGlobalQueueAsync:^{
        [[BTKAction sharedInstance] stopGather:self];
    }];
}

#pragma mark - BTKTraceDelegate

/**
 开启轨迹服务的回调方法

 @param error 开启轨迹服务的结果
 */
- (void)onStartService:(BTKServiceErrorCode)error {
    if (!_channel) return;
    [_channel invokeMethod:kStartTraceServiceCallback arguments:[BTFServerResult fromServiceCode:error]];
}
/**
 停止轨迹服务的回调方法

 @param error 停止轨迹服务的结果
 */
- (void)onStopService:(BTKServiceErrorCode)error {
    if (!_channel) return;
    [_channel invokeMethod:kStopTraceServiceCallback arguments:[BTFServerResult fromServiceCode:error]];
}

/**
 开始采集的回调方法

 @param error 开始采集的操作结果
 */
- (void)onStartGather:(BTKGatherErrorCode)error {
    if (!_channel) return;
    [_channel invokeMethod:kStartGatherCallback arguments:[BTFServerResult fromGatherCode:error]];
}
/**
 停止采集的回调方法

 @param error 停止采集的操作结果
 */
- (void)onStopGather:(BTKGatherErrorCode)error {
    if (!_channel) return;
    [_channel invokeMethod:kStopGatherCallback arguments:[BTFServerResult fromGatherCode:error]];
}

/**
 收到推送消息的回调方法

 @param message 推送消息的内容
 */
- (void)onGetPushMessage:(BTKPushMessage *)message {
    if (!_channel) return;
    BTFPushMessage *result = [BTFPushMessage from:message];
    [_channel invokeMethod:kPushCallback arguments:[result btf_toDictionary]];
}

/**
 用户自定义信息的设置方法，SDK在每个采集周期会回调此方法，将此方法的返回值作为该定位周期内轨迹点的附加数据
 所有附加数据组成的字典，总的字节数不能超过1024字节。

 @return 当前定位周期内轨迹点的附加数据，key代表自定义字段名称，value代表自定义字段的值。用法见DEMO
 */
//- (NSDictionary *)onGetCustomData {
//
//}

/**
 用户自定义信息设置结果的回调方法

 @param error 自定义信息的设置结果
 */
- (void)onGetCustomDataResult:(BTKGetCustomDataErrorCode)error {
    if (!_channel) return;
}

/**
 更改采集和打包上传周期的结果的回调方法

 @param error 更改周期的结果
 */
- (void)onChangeGatherAndPackIntervals:(BTKChangeIntervalErrorCode)error {
    if (!_channel) return;
    [_channel invokeMethod:kSetIntervalCallback arguments:@{@"errorCode" : @(error)}];
}

/**
 设置缓存占用的最大磁盘空间的结果的回调方法

 @param error 设置的结果
 */
- (void)onSetCacheMaxSize:(BTKSetCacheMaxSizeErrorCode)error {
     if (!_channel) return;
    [_channel invokeMethod:kSetCacheSizeCallback arguments:@{@"errorCode" : @(error)}];
}

@end
