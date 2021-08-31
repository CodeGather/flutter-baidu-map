//
//  BTFYingYanLocalHandlers.m
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/8.
//

#import "BTFYingYanLocalHandlers.h"
#import <BaiduTraceSDK/BaiduTraceSDK.h>
#import <CoreLocation/CoreLocation.h>
#import "BTFYingYanMethodConst.h"
#import "BTFDefine.h"
#import "NSObject+BTFVerify.h"
#import "NSObject+BTFThread.h"

#import "BTFLocationOption.h"

@interface BTFYingYanLocalHandlers ()<CLLocationManagerDelegate>

/// 定位管理者，用于申请定位权限
@property (nonatomic, strong) CLLocationManager *locationManager;

@end

static BTFYingYanLocalHandlers *_instance = nil;
@implementation BTFYingYanLocalHandlers
+ (instancetype)defalutCenter {
    if (!_instance) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _instance = [[BTFYingYanLocalHandlers alloc] init];
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
    if ([call.method isEqualToString:kRequestLocalPermission]) {
        [self requestLocAuthByPlist];
        result(@{@"result" : @YES});
    } else if ([call.method isEqualToString:kConfigLocationInfo]) {
        BTFLocationOption *option = [BTFLocationOption btf_modelWith:[call.arguments btf_safeObjectForKey:@"locationOption"]];
        if (!option) result(@{@"result" : @NO});
        [[BTKAction sharedInstance] setLocationAttributeWithActivityType:[option activityType] desiredAccuracy:[option desiredAccuracy] distanceFilter:option.distanceFilter];
        result(@{@"result" : @YES});
    } else {
        result(FlutterMethodNotImplemented);
    }
}


/// 根据产品需求申请合适的定位权限
- (void)requestLocAuthByPlist {
    NSBundle *bundle = [NSBundle mainBundle];
    NSObject *accessTypeAlways = [bundle objectForInfoDictionaryKey:@"NSLocationAlwaysUsageDescription"];
    NSObject *accessTypeWhen = [bundle objectForInfoDictionaryKey:@"NSLocationWhenInUseUsageDescription"];
    NSObject *accessTypeBoth = [bundle objectForInfoDictionaryKey:@"NSLocationAlwaysAndWhenInUseUsageDescription"];
    if (accessTypeAlways && accessTypeWhen && accessTypeBoth) {
        // 申请后台定位权限
        [self.locationManager requestAlwaysAuthorization];
    } else if (accessTypeWhen){
        // 申请前台定位权限
        [self.locationManager requestWhenInUseAuthorization];
    }
}


#pragma mark - 定位相关
- (CLLocationManager *)locationManager {
    if (!_locationManager) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        _locationManager.distanceFilter = kCLDistanceFilterNone;
        _locationManager.pausesLocationUpdatesAutomatically = NO;
    }
    return _locationManager;
}
#pragma mark - CLLocationManagerDelegate
/// 适配iOS14
#ifndef __IPHONE_14_0
#define __IPHONE_14_0 140000
#endif
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_14_0
//监听定位权限状态改变，及时采取合理措施
- (void)locationManagerDidChangeAuthorization:(CLLocationManager *)manager {
    if (@available(iOS 14.0, *)) {
        NSObject *temporaryUsageDescription = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"NSLocationTemporaryUsageDescriptionDictionary"];
        if (temporaryUsageDescription && self.locationManager.accuracyAuthorization == CLAccuracyAuthorizationReducedAccuracy) {
            // iOS14之后根据产品需求申请临时访问精确位置权限
            // 1.在info.plist配置
            // <key>NSLocationTemporaryUsageDescriptionDictionary</key>
            // <dict>
            //     <key>WantsToTrace</key>
            //     <string>鹰眼需要高精度定位权限</string>
            // </dict>
            // 2.申请权限
            [self.locationManager requestTemporaryFullAccuracyAuthorizationWithPurposeKey:@"WantsToTrace" completion:^(NSError * _Nullable error) {
                NSLog(@"iOS- locationManagerDidChange error = %@", error);
            }];
        }
    } else {
        // Fallback on earlier versions
    }
}
#endif


@end
