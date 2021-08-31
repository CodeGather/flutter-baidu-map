//
//  BTFYingYanBaseResult.h
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/8.
//

#import "BTFModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BTFYingYanBaseResult : BTFModel
/// 请求标识
@property (nonatomic, assign) int tag;

/// 状态码
@property (nonatomic, assign) int status;

/// 状态消息
@property (nonatomic, copy) NSString *message;
@end

NS_ASSUME_NONNULL_END
