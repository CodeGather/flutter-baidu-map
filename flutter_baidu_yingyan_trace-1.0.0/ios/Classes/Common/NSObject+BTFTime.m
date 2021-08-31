//
//  NSObject+BTFTime.m
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/15.
//

#import "NSObject+BTFTime.h"

@implementation NSObject (BTFTime)
/// 时间戳转换字符串
+ (NSString *)btf_timeIntervalToTimeString:(NSUInteger)timeInterval timeFormat:(NSString *)timeFormat {
    if (!timeFormat || [timeFormat isEqualToString:@""]) {
        timeFormat = @"yyyy-MM-dd HH:mm:ss";
    }
    NSTimeInterval _interval = timeInterval;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:_interval];
    NSDateFormatter *objDateformat = [[NSDateFormatter alloc] init];
    [objDateformat setDateFormat:timeFormat];
    
    return [objDateformat stringFromDate: date];
}
@end
