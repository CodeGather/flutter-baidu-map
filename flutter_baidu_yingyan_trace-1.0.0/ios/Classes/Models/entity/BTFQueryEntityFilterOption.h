//
//  BTFQueryEntityFilterOption.h
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/1.
//

#import "BTFModel.h"

@class BTKQueryEntityFilterOption;
@class BTKSearchEntitySortByOption;

NS_ASSUME_NONNULL_BEGIN
/// 查询Entity的请求对象中的过滤条件
@interface BTFQueryEntityFilterOption : BTFModel

/// entityName列表，精确筛选
/// NSArray数组中，每一项为NSString
@property (nonatomic, copy) NSArray<NSString *> *entityNames;

/// UNIX时间戳，查询在此时间之后有定位信息上传的entity（loc_time>=activeTime）。
/// 如查询2016-8-21 00:00:00之后仍活跃的entity，此字段设置为1471708800。
/// activeTime 和 inactiveTime 不可同时输入
@property (nonatomic, assign) NSUInteger activeTime;

/// UNIX时间戳，查询在此时间之后无定位信息上传的entity（loc_time < inactiveTime）。
/// 如查询2016-8-21 00:00:00之后不活跃的entity，此字段设置为1471708800。
/// activeTime 和 inactiveTime 不可同时输入
@property (nonatomic, assign) NSUInteger inActiveTime;

/// 开发者自定义的可筛选的entity属性字段，示例："team:北京"
@property (nonatomic, copy) NSDictionary<NSString*, NSString*> *customColumns;

/// BTFQueryEntityFilterOption => BTKQueryEntityFilterOption
- (BTKQueryEntityFilterOption *)toBTKQueryEntityFilterOption;
@end


/// 检索Entity时返回结果的排序规则
@interface BTFSearchEntitySortByOption : BTFModel

/// 需要排序的字段。
/// 支持的排序字段有：
/// loc_time：entity 最新定位时间
/// entity_name：entity 唯一标识
/// entity_desc：entity描述信息
/// <custom-key>：开发者自定义的 entity 属性字段
@property (nonatomic, copy) NSString *fieldName;

/// 排序方式。升序或降序。(iOS原生起始值为1)
@property (nonatomic, assign) NSUInteger sortType;

- (BTKSearchEntitySortByOption *)toBTKSearchEntitySortByOption;
@end

NS_ASSUME_NONNULL_END
