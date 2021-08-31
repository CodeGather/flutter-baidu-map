//
//  BTFEntityHandlers.h
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/1.
//

///  entity终端的相关操作，包括entity的增、删、改、查
#import "BTFYingYanHandler.h"

NS_ASSUME_NONNULL_BEGIN

@interface BTFEntityHandlers : NSObject<BTFYingYanHandler>
/// BTFEntityHandlers管理中心
+ (instancetype)defalutCenter;

@end


NS_ASSUME_NONNULL_END
