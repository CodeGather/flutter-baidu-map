//
//  BTFServerOption.h
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/7.
//

#import "BTFModel.h"

@class BTKServiceOption;

NS_ASSUME_NONNULL_BEGIN
/// 轨迹服务运行需要的基础信息类
@interface BTFServerOption : BTFModel

/// AK
@property (nonatomic, copy) NSString *ak;

/// MCODE
@property (nonatomic, copy) NSString *mcode;

/// 轨迹服务的ID
@property (nonatomic, assign) NSUInteger serviceId;

/// 是否保活
@property (nonatomic, assign) BOOL keepAlive;

- (BTKServiceOption *)toBTKServiceOption;

@end


NS_ASSUME_NONNULL_END
