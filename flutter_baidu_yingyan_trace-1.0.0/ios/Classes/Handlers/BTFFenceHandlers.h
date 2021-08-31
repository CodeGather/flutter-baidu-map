//
//  BTFFenceHandlers.h
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/1.
//

/// 地理围栏业务的相关操作
#import "BTFYingYanHandler.h"

NS_ASSUME_NONNULL_BEGIN

@interface BTFFenceHandlers : NSObject<BTFYingYanHandler>
/// BTFFenceHandlers管理中心
+ (instancetype)defalutCenter;

@end

NS_ASSUME_NONNULL_END
