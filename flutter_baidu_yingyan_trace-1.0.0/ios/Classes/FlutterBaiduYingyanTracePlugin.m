#import "FlutterBaiduYingyanTracePlugin.h"
#import "BTFYingYanManager.h"

@interface FlutterBaiduYingyanTracePlugin ()
@end

@implementation FlutterBaiduYingyanTracePlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar {
    /// 注册鹰眼管理
    [BTFYingYanManager registerWithRegistrar:registrar];
}

@end
