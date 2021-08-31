//
//  NSObject+BTFThread.m
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/1.
//

#import "NSObject+BTFThread.h"

@implementation NSObject (BTFThread)

/// 主线程异步执行
- (void)btf_performBlockOnMainThreadAsync:(void(^)(void))block {
    if (!block) {return;}
    dispatch_async(dispatch_get_main_queue(), block);
}

/// 全局队列异步并发
- (void)btf_performBlockOnGlobalQueueAsync:(void (^)(void))block {
    if (!block) {return;}
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
}
@end
