//
//  BTFStartServiceOption.h
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/10.
//

#import "BTFModel.h"
@class BTKStartServiceOption;
NS_ASSUME_NONNULL_BEGIN

@interface BTFStartServiceOption : BTFModel

/// 终端实体的名称
@property (nonatomic, copy) NSString *entityName;

- (BTKStartServiceOption *)toBTKStartServiceOption;
@end

NS_ASSUME_NONNULL_END
