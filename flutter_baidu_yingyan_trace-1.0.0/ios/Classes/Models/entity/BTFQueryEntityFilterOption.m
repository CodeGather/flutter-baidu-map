//
//  BTFQueryEntityFilterOption.m
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/1.
//

#import "BTFQueryEntityFilterOption.h"
#import <BaiduTraceSDK/BaiduTraceSDK.h>

@implementation BTFQueryEntityFilterOption
+ (NSDictionary *)btf_setupObjectClassInArray {
    return @{@"entityNames" : @"NSString"};
}

- (BTKQueryEntityFilterOption *)toBTKQueryEntityFilterOption {
    BTKQueryEntityFilterOption *option = [BTKQueryEntityFilterOption new];

    /**
     entityName列表，精确筛选
     NSArray数组中，每一项为NSString
     */
    option.entityNames = [self.entityNames copy];

    /**
     UNIX时间戳，查询在此时间之后有定位信息上传的entity（loc_time>=activeTime）。
     如查询2016-8-21 00:00:00之后仍活跃的entity，此字段设置为1471708800。
     activeTime 和 inactiveTime 不可同时输入
     */
    option.activeTime = self.activeTime;

    /**
     UNIX时间戳，查询在此时间之后无定位信息上传的entity（loc_time < inactiveTime）。
     如查询2016-8-21 00:00:00之后不活跃的entity，此字段设置为1471708800。
     activeTime 和 inactiveTime 不可同时输入
     */
    option.inactiveTime = self.inActiveTime;

    /**
     开发者自定义的可筛选的entity属性字段，示例："team:北京"
     */
    option.columnKey = [self.customColumns copy];
    return option;
}
@end


@implementation BTFSearchEntitySortByOption

- (BTKSearchEntitySortByOption *)toBTKSearchEntitySortByOption {
    BTKSearchEntitySortByOption *option = [[BTKSearchEntitySortByOption alloc] init];
    option.fieldName = self.fieldName;
    // sortType 原生起始值为1
    option.sortType = self.sortType + 1;
    return option;
}

@end


