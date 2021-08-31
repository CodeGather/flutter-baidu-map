//
//  BTFAnalysisHandlers.h
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/1.
//

/// 轨迹分析相关操作类
#import "BTFYingYanHandler.h"

NS_ASSUME_NONNULL_BEGIN

@interface BTFAnalysisHandlers : NSObject<BTFYingYanHandler>
/// BTFAnalysisHandlers管理中心
+ (instancetype)defalutCenter;

@end

NS_ASSUME_NONNULL_END
