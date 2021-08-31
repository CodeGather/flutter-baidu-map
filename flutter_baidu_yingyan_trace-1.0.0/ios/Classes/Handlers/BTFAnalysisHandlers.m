//
//  BTFAnalysisHandlers.m
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/1.
//

#import "BTFAnalysisHandlers.h"
#import "BTFYingYanMethodConst.h"
#import "BTFYingYanMethodCallbackConst.h"
#import <BaiduTraceSDK/BaiduTraceSDK.h>
#import "BTFDefine.h"
#import "NSObject+BTFVerify.h"
#import "NSObject+BTFThread.h"
#import "BTFStayPointAnalysisOption.h"
#import "BTFDrivingBehaviourAnalysisOption.h"
#import "BTFAnalysisResult.h"

@interface BTFAnalysisHandlers ()<BTKAnalysisDelegate>

@end
static BTFAnalysisHandlers *_instance = nil;
@implementation BTFAnalysisHandlers
+ (instancetype)defalutCenter {
    if (!_instance) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _instance = [[BTFAnalysisHandlers alloc] init];
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
    if ([call.method isEqualToString:kAnalyzeStayPoint]) {
        BTFStayPointAnalysisOption *option = [BTFStayPointAnalysisOption btf_modelWith:call.arguments];
        if (!option) result(@NO);
        [[BTKAnalysisAction sharedInstance] analyzeStayPointWith:[option toBTKStayPointAnalysisRequest] delegate:self];
        result(@YES);
    } else if ([call.method isEqualToString:kAnalyzeDrivingBehaviour]) {
        BTFDrivingBehaviourAnalysisOption *option = [BTFDrivingBehaviourAnalysisOption btf_modelWith:call.arguments];
        if (!option) result(@NO);
        [[BTKAnalysisAction sharedInstance] analyzeDrivingBehaviourWith:[option toBTKDrivingBehaviourAnalysisRequest] delegate:self];
        result(@YES);
    } else {
         result(FlutterMethodNotImplemented);
    }
}





#pragma mark - BTKAnalysisDelegate
/**
停留点分析的回调方法

@param response 停留点分析的结果
*/
- (void)onAnalyzeStayPoint:(NSData *)response {
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"analyze stay point response: %@", dict);
    BTFStayPointAnalysisResult *result = [BTFStayPointAnalysisResult fromDict:dict];
    [_channel invokeMethod:kAnalyzeStayPointCallback arguments:[result btf_toDictionary]];

}

/**
 驾驶行为分析的回调方法

 @param response 驾驶行为分析的结果
 */
- (void)onAnalyzeDrivingBehaviour:(NSData *)response {
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"analyze driving behaviour response: %@", dict);
    BTFDrivingBehaviourAnalysisResult *result = [BTFDrivingBehaviourAnalysisResult fromDict:dict];
    [_channel invokeMethod:kAnalyzeDrivingBehaviourCallback arguments:[result btf_toDictionary]];

}


@end
