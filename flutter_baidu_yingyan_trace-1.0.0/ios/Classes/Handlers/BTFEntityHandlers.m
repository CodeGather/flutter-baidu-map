//
//  BTFEntityHandlers.m
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/1.
//

#import "BTFEntityHandlers.h"
#import "BTFYingYanMethodConst.h"
#import "BTFYingYanMethodCallbackConst.h"
#import <BaiduTraceSDK/BaiduTraceSDK.h>

#import "BTFDefine.h"
#import "NSObject+BTFVerify.h"
#import "NSObject+BTFThread.h"

#import "BTFEntityOption.h"
#import "BTFQueryEntityFilterOption.h"
#import "BTFEntityResult.h"

@interface BTFEntityHandlers ()<BTKEntityDelegate>

@end
static BTFEntityHandlers *_instance = nil;
@implementation BTFEntityHandlers
/// BTFEntityHandlers管理中心
+ (instancetype)defalutCenter {
    if (!_instance) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _instance = [[BTFEntityHandlers alloc] init];
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
    NSLog(@"iOS - EntityHandlers - call.method = %@ call.arguments = %@", call.method, call.arguments);
    if ([call.method isEqualToString:kAddEntity]) {
        BTFAddEntityOption *addEntityOption = [BTFAddEntityOption btf_modelWith:call.arguments];
        if (!addEntityOption) result(@NO);
        [[BTKEntityAction sharedInstance] addEntityWith:[addEntityOption toBTKAddEntityRequest] delegate:self];
        result(@YES);
        
    } else if ([call.method isEqualToString:kDeleteEntity]) {
        BTFDeleteEntityOption *deleteEntityOption = [BTFDeleteEntityOption btf_modelWith:call.arguments];
        if (!deleteEntityOption) result(@NO);
        [[BTKEntityAction sharedInstance] deleteEntityWith:[deleteEntityOption toBTKDeleteEntityRequest] delegate:self];
        result(@YES);
    } else if ([call.method isEqualToString:kUpdateEntity]) {
        BTFUpdateEntityOption *updateEntityOption = [BTFUpdateEntityOption btf_modelWith:call.arguments];
        if (!updateEntityOption) result(@NO);
        [[BTKEntityAction sharedInstance] updateEntityWith:[updateEntityOption toBTKUpdateEntityRequest] delegate:self];
        result(@YES);
    } else if ([call.method isEqualToString:kQueryEntityList]) {
        BTFQueryEntityOption *queryEntityOption = [BTFQueryEntityOption btf_modelWith:call.arguments];
        if (!queryEntityOption) result(@NO);
        [[BTKEntityAction sharedInstance] queryEntityWith:[queryEntityOption toBTKQueryEntityRequest] delegate:self];
        result(@YES);
    } else if ([call.method isEqualToString:kSearchEntity]) {
        BTFSearchEntityOption *keyWordSearchEntityOption = [BTFSearchEntityOption btf_modelWith:call.arguments];
        if (!keyWordSearchEntityOption) result(@NO);
        [[BTKEntityAction sharedInstance] searchEntityWith:[keyWordSearchEntityOption toBTKSearchEntityRequest] delegate:self];
        result(@YES);
    } else if ([call.method isEqualToString:kBoundSearchEntity]) {
        BTFBoundSearchEntityOption *boundSearchEntityOption = [BTFBoundSearchEntityOption btf_modelWith:call.arguments];
        if (!boundSearchEntityOption) result(@NO);
        [[BTKEntityAction sharedInstance] boundSearchEntityWith:[boundSearchEntityOption toBTKBoundSearchEntityRequest] delegate:self];
        result(@YES);
    } else if ([call.method isEqualToString:kAroundSearchEntity]) {
        BTFAroundSearchEntityOption *aroundSearchEntityOption = [BTFAroundSearchEntityOption btf_modelWith:call.arguments];
        if (!aroundSearchEntityOption) result(@NO);
        [[BTKEntityAction sharedInstance] aroundSearchEntityWith:[aroundSearchEntityOption toBTKAroundSearchEntityRequest] delegate:self];
        result(@YES);
    } else if ([call.method isEqualToString:kPolygonSearchEntity]) {
        BTFPolygonSearchEntityOption *polygonSearchEntityOption = [BTFPolygonSearchEntityOption btf_modelWith:call.arguments];
        if (!polygonSearchEntityOption) result(@NO);
        [[BTKEntityAction sharedInstance] polygonSearchEntityWith:[polygonSearchEntityOption toBTKPolygonSearchEntityRequest] delegate:self];
        result(@YES);
    } else if ([call.method isEqualToString:kDistrictSearchEntity]) {
        BTFDistrictSearchEntityOption *districtSearchEntityOption = [BTFDistrictSearchEntityOption btf_modelWith:call.arguments];
        if (!districtSearchEntityOption)  result(@NO);
        [[BTKEntityAction sharedInstance] districtSearchEntityWith:[districtSearchEntityOption toBTKDistrictSearchEntityRequest] delegate:self];
         result(@YES);
    } else {
       result(FlutterMethodNotImplemented);
    }
}


#pragma mark - BTKEntityDelegate

/**
 创建Entity终端实体的回调方法

 @param response 创建结果
 */
- (void)onAddEntity:(NSData *)response {
    if (!_channel) return;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"add entity response: %@", dict);
    [_channel invokeMethod:kAddEntityCallback arguments:dict];
}

/**
 删除Entity终端实体的回调方法

 @param response 删除结果
 */
- (void)onDeleteEntity:(NSData *)response {
    if (!_channel) return;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"delete entity response: %@", dict);
    [_channel invokeMethod:kDeleteEntityCallback arguments:dict];
}

/**
 更新Entity终端实体的回调方法

 @param response 更新结果
 */
- (void)onUpdateEntity:(NSData *)response {
    if (!_channel) return;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"update entity response: %@", dict);
    [_channel invokeMethod:kUpdateEntityCallback arguments:dict];

}

/**
 查询Entity终端实体的回调方法

 @param response 查询结果
 */
- (void)onQueryEntity:(NSData *)response {
    if (!_channel) return;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"query entity response: %@", dict);
    BTFQueryEntityListResult *result = [BTFQueryEntityListResult fromDict:dict];
    [_channel invokeMethod:kQueryEntityListCallback arguments:[result btf_toDictionary]];
}

#pragma mark - entity终端检索

/**
 关键字检索Entity终端实体的回调方法

 @param response 检索结果
 */
- (void)onEntitySearch:(NSData *)response {
    if (!_channel) return;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"search entity response: %@", dict);
    BTFQueryEntityListResult *result = [BTFQueryEntityListResult fromDict:dict];
    [_channel invokeMethod:kSearchEntityCallback arguments:[result btf_toDictionary]];

}

/**
 矩形区域检索Entity终端实体的回调方法

 @param response 检索结果
 */
- (void)onEntityBoundSearch:(NSData *)response {
    if (!_channel) return;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"bound search entity response: %@", dict);
    BTFQueryEntityListResult *result = [BTFQueryEntityListResult fromDict:dict];
    [_channel invokeMethod:kBoundSearchEntityCallback arguments:[result btf_toDictionary]];

}

/**
 圆形区域检索Entity终端实体的回调方法

 @param response 检索结果
 */
- (void)onEntityAroundSearch:(NSData *)response {
    if (!_channel) return;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"around search entity response: %@", dict);
    BTFQueryEntityListResult *result = [BTFQueryEntityListResult fromDict:dict];
    [_channel invokeMethod:kAroundSearchEntityCallback arguments:[result btf_toDictionary]];

}

/**
 多边形区域检索Entity终端实体的回调方法

 @param response 检索结果
 */
- (void)onEntityPolygonSearch:(NSData *)response {
    if (!_channel) return;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"polygon search entity response: %@", dict);
    BTFQueryEntityListResult *result = [BTFQueryEntityListResult fromDict:dict];
    [_channel invokeMethod:kPolygonSearchEntityCallback arguments:[result btf_toDictionary]];

}

/**
 行政区域内检索Entity终端实体的回调方法

 @param response 检索结果
 */
- (void)onEntityDistrictSearch:(NSData *)response {
    if (!_channel) return;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"district search entity response: %@", dict);
    BTFQueryEntityListResult *result = [BTFQueryEntityListResult fromDict:dict];
    [_channel invokeMethod:kDistrictSearchEntityCallback arguments:[result btf_toDictionary]];

}

@end
