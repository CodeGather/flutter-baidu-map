//
//  BTFTrackHandlers.h
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/1.
//

/// 轨迹纠偏与里程计算操作类
#import "BTFYingYanHandler.h"

NS_ASSUME_NONNULL_BEGIN

@interface BTFTrackHandlers : NSObject<BTFYingYanHandler>
/// BTFTrackHandlers管理中心
+ (instancetype)defalutCenter;

@end

NS_ASSUME_NONNULL_END
