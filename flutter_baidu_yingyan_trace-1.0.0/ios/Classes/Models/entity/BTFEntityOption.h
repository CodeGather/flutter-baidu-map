//
//  BTFAddEntityOption.h
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/1.
//

#import "BTFModel.h"


@class BTFCoordinate;
@class BTKAddEntityRequest;
@class BTKDeleteEntityRequest;
@class BTKUpdateEntityRequest;
@class BTKQueryEntityRequest;
@class BTFQueryEntityFilterOption;

@class BTKSearchEntityRequest;
@class BTFSearchEntitySortByOption;

@class BTKBoundSearchEntityRequest;

@class BTKAroundSearchEntityRequest;
@class BTKPolygonSearchEntityRequest;
@class BTKDistrictSearchEntityRequest;

NS_ASSUME_NONNULL_BEGIN
#pragma mark - add
/// 新建一个entity终端实体操作的请求信息类
/// 新建一个entity终端实体操作的请求信息通过此类设置
@interface BTFAddEntityOption : BTFModel

/// 轨迹服务的ID
@property (nonatomic, assign) NSUInteger serviceId;

/// 请求标志
@property (nonatomic, assign) NSUInteger tag;

/// entity名称，作为终端实体的唯一标识，必填
/// 同一service服务中entity_name不可重复。一旦创建，entity_name 不可更新。
/// 命名规则：仅支持中文、英文大小字母、英文下划线"_"、英文横线"-"和数字。 entity_name 和 entity_desc 支持联合模糊检索。
@property (nonatomic, copy) NSString *entityName;

/// entity的可读性描述，选填。
/// 命名规则：仅支持中文、英文大小字母、英文下划线"_"、英文横线"-"和数字。entity_name 和 entity_desc 支持联合模糊检索
@property (nonatomic, copy) NSString *entityDesc;

/// 开发者自定义字段，选填
/// 字典中的key必须是已经通过鹰眼的轨迹管理台创建过的属性字段才有效
@property (nonatomic, copy) NSDictionary *customColumns;

/// BTFAddEntityOption => BTKAddEntityRequest
- (BTKAddEntityRequest *)toBTKAddEntityRequest;

@end

#pragma mark -delete

/// 删除指定的某个entity终端实体的请求信息类
@interface BTFDeleteEntityOption : BTFModel

/// 轨迹服务的ID
@property (nonatomic, assign) NSUInteger serviceId;

/// 请求标志
@property (nonatomic, assign) NSUInteger tag;

/// entity名称，作为其唯一标识，必填
/// 同一service服务中entity_name不可重复。一旦创建，entity_name 不可更新。
/// 命名规则：仅支持中文、英文大小字母、英文下划线"_"、英文横线"-"和数字。 entity_name 和 entity_desc 支持联合模糊检索。
@property (nonatomic, copy) NSString *entityName;

/// BTFDeleteEntityOption => BTKDeleteEntityRequest
- (BTKDeleteEntityRequest *)toBTKDeleteEntityRequest;
@end

#pragma mark - update
/// 更新某个指定的entity终端实体的请求信息类
@interface BTFUpdateEntityOption : BTFModel

/// 轨迹服务的ID
@property (nonatomic, assign) NSUInteger serviceId;

/// 请求标志
@property (nonatomic, assign) NSUInteger tag;

/// entity名称，必填。不可更新。
/// 同一service服务中entity_name不可重复。一旦创建，entity_name 不可更新。
/// 命名规则：仅支持中文、英文大小字母、英文下划线"_"、英文横线"-"和数字。 entity_name 和 entity_desc 支持联合模糊检索。
@property (nonatomic, copy) NSString *entityName;

/// entity的可读性描述，选填，可更新。
/// 命名规则：仅支持中文、英文大小字母、英文下划线"_"、英文横线"-"和数字。entity_name 和 entity_desc 支持联合模糊检索
@property (nonatomic, copy) NSString *entityDesc;

/// 开发者自定义字段，选填，可更新。
/// 字典中的key必须是已经通过鹰眼的轨迹管理台创建过的属性字段才有效
@property (nonatomic, copy) NSDictionary *customColumns;
/// BTFUpdateEntityOption  => BTKUpdateEntityRequest
- (BTKUpdateEntityRequest *)toBTKUpdateEntityRequest;
@end

#pragma mark - query
/// 查询符合条件的entity终端实体操作的请求信息类
@interface BTFQueryEntityOption : BTFModel

/// 轨迹服务的ID
@property (nonatomic, assign) NSUInteger serviceId;

/// 请求标志
@property (nonatomic, assign) NSUInteger tag;
/// 过滤条件
@property (nonatomic, strong) BTFQueryEntityFilterOption *searchFilterCondition;

/// 返回结果的坐标类型
/// 国内只能选择百度经纬度或者国测局经纬度，该字段在国外无效，国外均返回 wgs84坐标
/// iOS原生SDK起始值为1
@property (nonatomic, assign) NSUInteger coordType;

/// 分页索引，选填。
/// 默认值为1。
/// pageIndex与pageSize一起计算从第几条结果返回，代表返回第几页。
@property (nonatomic, assign) NSUInteger pageIndex;

/// 分页大小，选填。
/// 默认值为100。
/// pageSize与pageIndex一起计算从第几条结果返回，代表返回结果中每页有几条记录。
@property (nonatomic, assign) NSUInteger pageSize;

/// BTFQueryEntityOption =>  BTKQueryEntityRequest
- (BTKQueryEntityRequest *)toBTKQueryEntityRequest;

@end


#pragma mark - 关键字查询entity

@interface BTFSearchEntityOption : BTFModel
/// 轨迹服务的ID
@property (nonatomic, assign) NSUInteger serviceId;

/// 请求标志
@property (nonatomic, assign) NSUInteger tag;
/// keyword
@property (nonatomic, copy) NSString *keyword;
/// 过滤条件，可选。
@property (nonatomic, strong) BTFQueryEntityFilterOption *searchFilterCondition;

/// 排序方法，可选。
@property (nonatomic, strong) BTFSearchEntitySortByOption *sortBy;

/// 返回结果的坐标类型
/// 国内只能选择百度经纬度或者国测局经纬度，该字段在国外无效，国外均返回 wgs84坐标
/// iOS原生SDK起始值为1
@property (nonatomic, assign) NSUInteger coordType;


/// 分页索引，选填。
/// 默认值为1。
/// pageIndex与pageSize一起计算从第几条结果返回，代表返回第几页。
@property (nonatomic, assign) NSUInteger pageIndex;

/// 分页大小，选填。
/// 默认值为100。
/// pageSize与pageIndex一起计算从第几条结果返回，代表返回结果中每页有几个轨迹点。
@property (nonatomic, assign) NSUInteger pageSize;

- (BTKSearchEntityRequest *)toBTKSearchEntityRequest;

@end

#pragma mark - bounds
@interface BTFBoundSearchEntityOption : BTFModel
/// 轨迹服务的ID
@property (nonatomic, assign) NSUInteger serviceId;

/// 请求标志
@property (nonatomic, assign) NSUInteger tag;

/// 矩形区域左下角坐标
@property (nonatomic, strong) BTFCoordinate *lowerLeft;

/// 矩形区域右上角
@property (nonatomic, strong) BTFCoordinate *upperRight;
/// 返回结果的坐标类型
/// 国内只能选择百度经纬度或者国测局经纬度，该字段在国外无效，国外均返回 wgs84坐标
/// iOS原生SDK起始值为1
@property (nonatomic, assign) NSUInteger coordTypeInput;

/// 过滤条件，可选。
@property (nonatomic, strong) BTFQueryEntityFilterOption *searchFilterCondition;
/// 排序方法，可选。
@property (nonatomic, strong) BTFSearchEntitySortByOption *sortBy;
/// 返回结果的坐标类型
/// 国内只能选择百度经纬度或者国测局经纬度，该字段在国外无效，国外均返回 wgs84坐标
/// iOS原生SDK起始值为1
@property (nonatomic, assign) NSUInteger coordType;

/// 分页索引，选填。
/// 默认值为1。
/// pageIndex与pageSize一起计算从第几条结果返回，代表返回第几页。
@property (nonatomic, assign) NSUInteger pageIndex;

/// 分页大小，选填。
/// 默认值为100。
/// pageSize与pageIndex一起计算从第几条结果返回，代表返回结果中每页有几个轨迹点。
@property (nonatomic, assign) NSUInteger pageSize;

- (BTKBoundSearchEntityRequest *)toBTKBoundSearchEntityRequest;

@end

#pragma mark - around

@interface BTFAroundSearchEntityOption : BTFModel
/// 轨迹服务的ID
@property (nonatomic, assign) NSUInteger serviceId;

/// 请求标志
@property (nonatomic, assign) NSUInteger tag;

@property (nonatomic, strong) BTFCoordinate *center;
/// 返回结果的坐标类型
/// 国内只能选择百度经纬度或者国测局经纬度，该字段在国外无效，国外均返回 wgs84坐标
/// iOS原生SDK起始值为1
@property (nonatomic, assign) NSUInteger coordTypeInput;

///  圆形搜索区域的半径。单位：米
@property (nonatomic, assign) double radius;

/// 过滤条件，可选。
@property (nonatomic, strong) BTFQueryEntityFilterOption *searchFilterCondition;
/// 排序方法，可选。
@property (nonatomic, strong) BTFSearchEntitySortByOption *sortBy;
/// 返回结果的坐标类型
/// 国内只能选择百度经纬度或者国测局经纬度，该字段在国外无效，国外均返回 wgs84坐标
/// iOS原生SDK起始值为1
@property (nonatomic, assign) NSUInteger coordType;

///分页索引，选填。
/// 默认值为1。
/// pageIndex与pageSize一起计算从第几条结果返回，代表返回第几页。
@property (nonatomic, assign) NSUInteger pageIndex;

/// 分页大小，选填。
/// 默认值为100。
/// pageSize与pageIndex一起计算从第几条结果返回，代表返回结果中每页有几条记录。
@property (nonatomic, assign) NSUInteger pageSize;

- (BTKAroundSearchEntityRequest *)toBTKAroundSearchEntityRequest;

@end


#pragma mark -polygon

@interface BTFPolygonSearchEntityOption : BTFModel
/// 轨迹服务的ID
@property (nonatomic, assign) NSUInteger serviceId;

/// 请求标志
@property (nonatomic, assign) NSUInteger tag;
/**
 多边形区域的顶点坐标，必填。
 数组中的每一项为CLLocationCoordinate2D类型的坐标点，代表多边形的一个顶点。
 */
@property (nonatomic, copy) NSArray<BTFCoordinate *> *vertexes;

/// 返回结果的坐标类型
/// 国内只能选择百度经纬度或者国测局经纬度，该字段在国外无效，国外均返回 wgs84坐标
/// iOS原生SDK起始值为1
@property (nonatomic, assign) NSUInteger coordTypeInput;

/// 过滤条件，可选
@property (nonatomic, strong) BTFQueryEntityFilterOption *searchFilterCondition;

/// 排序方法，可选。
@property (nonatomic, assign) BTFSearchEntitySortByOption *sortBy;

/// 返回结果的坐标类型
/// 国内只能选择百度经纬度或者国测局经纬度，该字段在国外无效，国外均返回 wgs84坐标
/// iOS原生SDK起始值为1
@property (nonatomic, assign) NSUInteger coordType;

///分页索引，选填。
/// 默认值为1。
/// pageIndex与pageSize一起计算从第几条结果返回，代表返回第几页。
@property (nonatomic, assign) NSUInteger pageIndex;

/// 分页大小，选填。
/// 默认值为100。
/// pageSize与pageIndex一起计算从第几条结果返回，代表返回结果中每页有几条记录。
@property (nonatomic, assign) NSUInteger pageSize;

- (BTKPolygonSearchEntityRequest *)toBTKPolygonSearchEntityRequest;
@end

#pragma mark - district
/// 在指定的行政区域内检索Entity的请求类
@interface BTFDistrictSearchEntityOption : BTFModel
// 轨迹服务的ID
@property (nonatomic, assign) NSUInteger serviceId;

/// 请求标志
@property (nonatomic, assign) NSUInteger tag;

/// 行政区划关键字，必填。
/// 支持中国国家、省、市、区/县名称。请尽量输入完整的行政区层级和名称，保证名称的唯一性。若输入的行政区名称匹配多个行政区，围栏将创建失败。
/// 示例： 中国 北京市 湖南省长沙市 湖南省长沙市雨花区
@property (nonatomic, copy) NSString *keyword;

/// 返回结果的内容（只返回个数还是返回完整结果）
/// 注意：此字段的值会影响返回结果的格式
/// iOS原生SDK起始值为1
@property (nonatomic, assign) NSUInteger returnType;

/// 过滤条件，可选
@property (nonatomic, strong) BTFQueryEntityFilterOption *searchFilterCondition;

/// 排序方法，可选。
@property (nonatomic, assign) BTFSearchEntitySortByOption *sortBy;

/// 返回结果的坐标类型
/// 国内只能选择百度经纬度或者国测局经纬度，该字段在国外无效，国外均返回 wgs84坐标
/// iOS原生SDK起始值为1
@property (nonatomic, assign) NSUInteger coordType;

///分页索引，选填。
/// 默认值为1。
/// pageIndex与pageSize一起计算从第几条结果返回，代表返回第几页。
@property (nonatomic, assign) NSUInteger pageIndex;

/// 分页大小，选填。
/// 默认值为100。
/// pageSize与pageIndex一起计算从第几条结果返回，代表返回结果中每页有几条记录。
@property (nonatomic, assign) NSUInteger pageSize;
- (BTKDistrictSearchEntityRequest *)toBTKDistrictSearchEntityRequest;

@end


NS_ASSUME_NONNULL_END
