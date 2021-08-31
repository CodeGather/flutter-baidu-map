//
//  NSObject+BTFVerify.h
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (BTFVerify)

/// null, nil检测
- (BOOL)btf_isValidParam;

@end

@interface NSDictionary (BTFSafeObjectForKey)

/// 对 value进行  [NSNull null]判断  空值置为nil
- (id)btf_safeObjectForKey:(NSString *)key;

/// 对 value进行  [NSNull null]判断  空值置为nil
- (id)btf_safeValueForKey:(NSString *)key;

/// 对 value进行  [NSNull null]判断  空值置为nil
- (id)btf_safeValueForKeyPath:(NSString *)keyPath;

@end
NS_ASSUME_NONNULL_END
