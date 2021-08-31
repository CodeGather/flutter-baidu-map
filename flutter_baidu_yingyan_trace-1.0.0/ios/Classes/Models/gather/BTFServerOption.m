//
//  BTFServerOption.m
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/7.
//

#import "BTFServerOption.h"
#import <BaiduTraceSDK/BaiduTraceSDK.h>

@implementation BTFServerOption

-(BTKServiceOption *)toBTKServiceOption {
    if (!self.ak || !self.mcode || self.serviceId <= 0) {
        return nil;
    }
    BTKServiceOption *option = [[BTKServiceOption alloc] initWithAK:self.ak mcode:self.mcode serviceID:self.serviceId keepAlive:self.keepAlive];
    return option;
}
@end
