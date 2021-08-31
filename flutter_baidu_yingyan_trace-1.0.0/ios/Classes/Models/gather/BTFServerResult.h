//
//  BTFServerResult.h
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/11.
//

#import "BTFModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BTFServerResult : BTFModel

/// 服务result
+ (NSDictionary *)fromServiceCode:(NSUInteger)errorCode;

/// 采集result
+ (NSDictionary *)fromGatherCode:(NSUInteger)errorCode;


@end

NS_ASSUME_NONNULL_END
