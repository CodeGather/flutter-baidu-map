//
//  NSObject+BTFThread.h
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/1.
//
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (BTFThread)

/// 主线程异步执行
- (void)btf_performBlockOnMainThreadAsync:(void (^)(void))block;

/// 全局队列异步并发
- (void)btf_performBlockOnGlobalQueueAsync:(void (^)(void))block;

@end

NS_ASSUME_NONNULL_END
