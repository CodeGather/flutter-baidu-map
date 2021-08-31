//
//  NSObject+BTFTime.h
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (BTFTime)

/// 时间戳转换字符串
+ (NSString *)btf_timeIntervalToTimeString:(NSUInteger)timeInterval timeFormat:(NSString *)timeFormat;

@end

NS_ASSUME_NONNULL_END
