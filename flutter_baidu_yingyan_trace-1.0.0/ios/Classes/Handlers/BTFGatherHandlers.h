//
//  BTFGatherHandlers.h
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/1.
//

/// 轨迹服务与采集的操作类
#import "BTFYingYanHandler.h"
#import <UserNotifications/UserNotifications.h>

NS_ASSUME_NONNULL_BEGIN

@interface BTFGatherHandlers : NSObject<BTFYingYanHandler>

+ (instancetype)defalutCenter;
@end

NS_ASSUME_NONNULL_END
