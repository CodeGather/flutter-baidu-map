//
//  BTFDicModel.h
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/11/30.
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol BTFDicModel <NSObject>

@optional
/// 数组中需要转换的模型类
/// array model class配置
+ (NSDictionary *)btf_setupObjectClassInArray;

/// 将属性名换为其他key去字典中取值
+ (NSDictionary *)btf_setupReplacedKeyFromPropertyName;

/// 数组中的属性将忽略转换(dic -> model)
+ (NSArray *)btf_setupIgnorePropertyNames;

/// 手动实现dict --> model
+ (instancetype)fromDict:(NSDictionary *)dict;
@required

/// dic -- > model
+ (instancetype)btf_modelWith:(NSDictionary *)dic;

/// model -- > dic
- (NSDictionary *)btf_toDictionary;

@end

NS_ASSUME_NONNULL_END
