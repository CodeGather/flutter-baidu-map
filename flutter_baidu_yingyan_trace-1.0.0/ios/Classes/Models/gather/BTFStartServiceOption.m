//
//  BTFStartServiceOption.m
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/10.
//

#import "BTFStartServiceOption.h"
#import <BaiduTraceSDK/BaiduTraceSDK.h>

@implementation BTFStartServiceOption

- (BTKStartServiceOption *)toBTKStartServiceOption {
    if (!self.entityName) {
        return nil;
    }
    return [[BTKStartServiceOption alloc] initWithEntityName:self.entityName];
}
@end
