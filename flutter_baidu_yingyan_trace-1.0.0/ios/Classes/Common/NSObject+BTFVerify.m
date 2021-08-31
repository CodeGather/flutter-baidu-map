//
//  NSObject+BTFVerify.m
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/1.
//

#import "NSObject+BTFVerify.h"

@implementation NSObject (BTFVerify)
/// null, nil检测
- (BOOL)btf_isValidParam {
    return self != [NSNull null] && self;
}
@end

#define CheckNull(value) value == [NSNull null] ? nil : value
/// 对 value进行  [NSNull null]判断  空值置为nil
@implementation NSDictionary (BTFSafeObjectForKey)

- (id)btf_safeObjectForKey:(NSString *)key {
    return CheckNull([self objectForKey:key]);
}

- (id)btf_safeValueForKey:(NSString *)key{
    return CheckNull([self valueForKey:key]);
}

- (id)btf_safeValueForKeyPath:(NSString *)keyPath {
    return CheckNull([self valueForKeyPath:keyPath]);
}
@end
