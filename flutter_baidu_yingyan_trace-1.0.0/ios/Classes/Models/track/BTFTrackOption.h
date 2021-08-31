//
//  BTFTrackOption.h
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/4.
//

#import "BTFModel.h"


@class BTFCoordinate;
@class BTFPoint;

@class BTKClearTrackCacheOption;
@class BTKCustomTrackPoint;
@class BTKAddCustomTrackPointRequest;
@class BTKBatchAddCustomTrackPointRequest;

@class BTFQueryTrackProcessOption;
@class BTKQueryTrackLatestPointRequest;

@class BTKQueryTrackDistanceRequest;
@class BTKQueryHistoryTrackRequest;

@class BTKQueryTrackCacheInfoRequest;

@class BTKClearTrackCacheRequest;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - 自定义轨迹点
/// 自定义轨迹点信息类
@interface BTFCustomTrackPoint : BTFModel

/// 轨迹点
@property (nonatomic, strong) BTFPoint *point;

/// 自定义数据字典。可选。
/// key为开发者添加的自定义字段；
/// value为该字段对应的值。
@property (nonatomic, copy) NSDictionary *customData;

/// 该轨迹点所属的终端实体的名称
@property (nonatomic, copy) NSString *entityName;

- (BTKCustomTrackPoint *)toBTKCustomTrackPoint;

@end
#pragma mark - 删除客户端缓存的轨迹数据时的筛选条件
/// 删除客户端缓存的轨迹数据时的筛选条件
@interface BTFTrackCacheClearOption : BTFModel

/// 需要删除哪个entity的缓存数据，必选。
@property (nonatomic, copy) NSString *entityName;

/// 需要删除的缓存的开始时间，可选。
@property (nonatomic, assign) NSUInteger startTime;

/// 需要删除的缓存的结束时间，可选。
@property (nonatomic, assign) NSUInteger endTime;

- (BTKClearTrackCacheOption *)toBTKClearTrackCacheOption;

@end

#pragma mark - 上传单个轨迹点的请求类

@interface BTFAddCustomTrackPointOption : BTFModel
/// 轨迹服务的ID
@property (nonatomic, assign) NSUInteger serviceId;

/// 请求标志
@property (nonatomic, assign) NSUInteger tag;
/// 自定义轨迹点
@property (nonatomic, strong) BTFCustomTrackPoint *customTrackPoint;

- (BTKAddCustomTrackPointRequest *)toBTKAddCustomTrackPointRequest;

@end

#pragma mark - 批量上传多个开发者自定义的轨迹点的请求类


@interface BTFTrackPoint : BTFModel

/// 经纬度
@property (nonatomic, strong) BTFCoordinate *location;

/// 轨迹点的坐标类型
/// iOS原生SDK初始值为1
@property (nonatomic, assign) NSUInteger coordType;

/// 轨迹点的定位时间
@property (nonatomic, assign) NSUInteger locTime;

///  方向
@property (nonatomic, assign) NSUInteger direction;

/// 高度
@property (nonatomic, assign) double height;

/// 定位精度
@property (nonatomic, assign) double radius;

/// 速度
@property (nonatomic, assign) double speed;
/// 自定义数据字典。可选。
/// key为开发者添加的自定义字段；
/// value为该字段对应的值。
@property (nonatomic, copy) NSDictionary<NSString *, NSString *> *columns;

/// 该轨迹点所属的终端实体的名称
@property (nonatomic, copy) NSString *entityName;

- (BTKCustomTrackPoint *)toBTKCustomTrackPoint;

@end

@interface BTFAddCustomTrackPointsOption : BTFModel

/// 轨迹服务的ID
@property (nonatomic, assign) NSUInteger serviceId;

/// 请求标志
@property (nonatomic, assign) NSUInteger tag;

/// 需要批量上传的轨迹点数组，数组中每一项为BTFTrackPoint类型。
@property (nonatomic, strong) NSArray<BTFTrackPoint *> *customTrackPoints;

///// 需要批量上传的轨迹点集合
//@property (nonatomic, strong) NSDictionary *customTrackPointsDict;

+ (BTFAddCustomTrackPointsOption *)fromDict:(NSDictionary *)dict;

- (BTKBatchAddCustomTrackPointRequest *)toBTKBatchAddCustomTrackPointRequest;

@end

#pragma mark - 查询某entity终端实体的实时位置的请求信息类

/// 查询某entity终端实体的实时位置的请求信息类
@interface BTFQueryTrackLatestPointOption : BTFModel

/// 轨迹服务的ID
@property (nonatomic, assign) NSUInteger serviceId;

/// 请求标志
@property (nonatomic, assign) NSUInteger tag;

/// 需要查询的entity的名称，必填，必须为非空字符串。
@property (nonatomic, copy) NSString *entityName;

/// 纠偏选项，选填。
/// 若设置此选项，则使用开发者指定的选项进行纠偏。
/// 如果不设置，或者值为nil，将使用默认的纠偏选项：去燥、不绑路、不过滤噪点、交通方式为驾车。
@property (nonatomic, strong) BTFQueryTrackProcessOption *processOption;


/// 返回的坐标类型，选填。
/// 该字段用于控制返回结果中的坐标类型。
/// 只允许设置为百度经纬度或者国测局经纬度。
/// 该参数仅对国内（包含港、澳、台）轨迹有效，海外区域轨迹均返回 wgs84坐标系。
/// iOS原生SDK起始值为1
@property (nonatomic, assign) NSUInteger outputCoordType;

- (BTKQueryTrackLatestPointRequest *)toBTKQueryTrackLatestPointRequest;

@end

#pragma mark - 查询某entity终端实体，在指定时间段内的行驶里程的请求信息类
/// 查询某entity终端实体，在指定时间段内的行驶里程的请求信息类
@interface BTFQueryTrackDistanceOption : BTFModel

/// 轨迹服务的ID
@property (nonatomic, assign) NSUInteger serviceId;

/// 请求标志
@property (nonatomic, assign) NSUInteger tag;

/// 需要查询的entity的名称，必填，必须为非空字符串
@property (nonatomic, copy) NSString *entityName;

///开始时间 UNIX时间戳，必填。
@property (nonatomic, assign) NSUInteger startTime;

/// 结束时间 UNIX时间戳，必填。
/// 结束时间不能大于当前时间，且起止时间区间不超过24小时。
@property (nonatomic, assign) NSUInteger endTime;

/// 是否返回纠偏后的里程，选填。
/// TRUE代表返回纠偏后的里程，FALSE代表使用原始轨迹计算里程。
/// 默认值为FALSE。
@property (nonatomic, assign) BOOL isProcessed;

/// 纠偏选项，选填。
/// 若设置此选项，则使用开发者指定的选项进行纠偏。
/// 如果不设置，或者值为nil，将使用默认的纠偏选项：去燥、不绑路、不过滤噪点、交通方式为驾车。
@property (nonatomic, strong) BTFQueryTrackProcessOption *processOption;

/// 里程补偿的方式，选填。
/// 在里程计算时，两个轨迹点定位时间间隔5分钟以上，被认为是中断。中断轨迹可以进行里程补偿，通过此属性设置里程补偿的方式。
/// 默认值为BTK_TRACK_PROCESS_OPTION_NO_SUPPLEMENT 不进行里程补偿。
/// iOS原生SDK起始值为1
@property (nonatomic, assign) NSUInteger supplementMode;

/// 低速阈值，选填。（单位：千米/小时）
/// 若填写该值且isProcessed=true时，则返回结果中将增加low_speed_distance字段，表示速度低于该值的里程。
/// 示例：
/// lowSpeedThreshold=20，则返回结果中将增加low_speed_distance字段表示此段轨迹中速度低于20千米/小时的里程，可用于网约车行业中计算低速里程。
@property (nonatomic, assign) double lowSpeedThreshold;

- (BTKQueryTrackDistanceRequest *)toBTKQueryTrackDistanceRequest;

@end

#pragma mark - 查询某entity终端实体，在一段时间之内的行程信息的请求信息类

/// 查询某entity终端实体，在一段时间之内的行程信息的请求信息类
@interface BTFQueryHistoryTrackOption : BTFModel
/// 轨迹服务的ID
@property (nonatomic, assign) NSUInteger serviceId;

/// 请求标志
@property (nonatomic, assign) NSUInteger tag;

/// 需要查询的entity的名称，必填，必须为非空字符串
@property (nonatomic, copy) NSString *entityName;

/// 开始时间 UNIX时间戳，必填。
@property (nonatomic, assign) NSUInteger startTime;

/// 结束时间 UNIX时间戳，必填。
/// 结束时间不能大于当前时间，且起止时间区间不超过24小时。
@property (nonatomic, assign) NSUInteger endTime;

/// 是否返回纠偏后的里程，选填。
/// TRUE代表返回纠偏后的里程，FALSE代表使用原始轨迹计算里程。
/// 默认值为FALSE。
@property (nonatomic, assign) BOOL isProcessed;

/// 纠偏选项，选填。
/// 该选项只有在isProcessed选项为TRUE时有效。
/// 若设置此选项，则使用开发者指定的选项进行纠偏。
/// 如果不设置，或者值为nil，将使用默认的纠偏选项：去燥、不绑路、不过滤噪点、交通方式为驾车。
@property (nonatomic, strong) BTFQueryTrackProcessOption *processOption;

/// 里程补偿的方式，选填。
/// 在里程计算时，两个轨迹点定位时间间隔5分钟以上，被认为是中断。中断轨迹可以进行里程补偿，通过此属性设置里程补偿的方式。
/// 默认值为BTK_TRACK_PROCESS_OPTION_NO_SUPPLEMENT 不进行里程补偿。
/// iOS原生SDK起始值为1
@property (nonatomic, assign) NSUInteger supplementMode;

/// 轨迹补偿内容 (ios暂不支持该字段)
/// 仅在supplementMode不为no_supplement时生效。
/// 默认值：only_distance。
/// 可选值：
/// 0: only_distance 对于中断区间，只补偿中断的里程，不补偿轨迹点
/// 1: distance_and_points 对于中断区间，既补偿里程，又补偿轨迹点
@property (nonatomic, assign) NSUInteger supplementContent;

/// 低速阈值，选填。（单位：千米/小时）
/// 若填写该值且isProcessed=true时，则返回结果中将增加low_speed_distance字段，表示速度低于该值的里程。
/// 示例：
/// lowSpeedThreshold=20，则返回结果中将增加low_speed_distance字段表示此段轨迹中速度低于20千米/小时的里程，可用于网约车行业中计算低速里程。
@property (nonatomic, assign) double lowSpeedThreshold;

/// 返回的坐标类型，选填。
/// 该字段用于控制返回结果中的坐标类型。
/// 只允许设置为百度经纬度或者国测局经纬度。
/// 该参数仅对国内（包含港、澳、台）轨迹有效，海外区域轨迹均返回 wgs84坐标系。
/// iOS原生SDK起始值为1
@property (nonatomic, assign) NSUInteger outputCoordType;


/// 返回轨迹点的排序规则，选填。
/// 若不设置，则使用默认值BTK_TRACK_SORT_TYPE_ASC，按照定位时间升序排序（旧->新）
/// iOS原生SDK起始值为1
@property (nonatomic, assign) NSUInteger sortType;

/// 分页索引，选填。
/// 默认值为1。
/// pageIndex与pageSize一起计算从第几条结果返回，代表返回第几页。
@property (nonatomic, assign) NSUInteger pageIndex;

/// 分页大小，选填。
/// 默认值为100。
/// pageSize与pageIndex一起计算从第几条结果返回，代表返回结果中每页有几条记录。
@property (nonatomic, assign) NSUInteger pageSize;

- (BTKQueryHistoryTrackRequest *)toBTKQueryHistoryTrackRequest;

@end

#pragma mark - 查询客户端缓存的轨迹数据的请求信息类
/// 查询客户端缓存的轨迹数据的请求信息类
@interface BTFQueryTrackCacheInfoOption : BTFModel
/// 轨迹服务的ID
@property (nonatomic, assign) NSUInteger serviceId;

/// 请求标志
@property (nonatomic, assign) NSUInteger tag;


/// 将轨迹点所属的entity，作为过滤缓存查询的条件。最终查询结果为所有过滤条件的交集。
/// 类型为数组，选填。
/// 若设置，则查询指定entity的缓存数据；
/// 若不设置或设置为nil或为空数组，则查询所有缓存数据。
@property (nonatomic, copy) NSArray<NSString *> *entityNames;


/// 将轨迹点的定位时间戳，作为过滤缓存查询的条件。最终查询结果为所有过滤条件的交集。
/// 查询指定时间段内缓存的轨迹，时间段起点的UNIX时间戳，选填
/// 若单独指定startTime，不指定endTime，则查询startTime至当前的缓存轨迹
@property (nonatomic, assign) NSUInteger startTime;

/// 将轨迹点的定位时间戳，作为过滤缓存查询的条件。最终查询结果为所有过滤条件的交集。
/// 查询指定时间段内缓存的轨迹，时间段终点的UNIX时间戳，选填
/// 如果设置endTime，则endTime必须大于startTime
/// 若单独指定endTime，不指定startTime，则查询endTime之前的所有缓存轨迹
@property (nonatomic, assign) NSUInteger endTime;

/// 是否返回每个entity的缓存轨迹的里程，选填，默认为false。
/// 若设置为true，则返回的缓存信息中，包含该entity的所有缓存轨迹的里程信息；
/// 若不设置，或设置为false，则返回的缓存信息中，不包括里程信息。
@property (nonatomic, assign) BOOL needDistance;

/// 精度过滤阈值，单位：米
/// 当缓存的轨迹点的定位精度超过此阈值时，此点不参与离线里程计算
@property (nonatomic, assign) double distanceFilter;

- (BTKQueryTrackCacheInfoRequest *)toBTKQueryTrackCacheInfoRequest;

@end

@interface BTFClearTrackCacheOption : BTFModel

/// 轨迹服务的ID
@property (nonatomic, assign) NSUInteger serviceId;

/// 请求标志
@property (nonatomic, assign) NSUInteger tag;

/// 需要清空的缓存数据的筛选条件数组，选填。
/// 数组中每个option用于指定一个筛选条件，类型为BTKClearTrackCacheOption。
/// 若设置，则清空符合条件的缓存数据；
/// 若不设置或设置为nil或为空数组，则清空所有的缓存数据。
@property (nonatomic, copy) NSArray<BTFTrackCacheClearOption *> *trackCacheOptions;

- (BTKClearTrackCacheRequest *)toBTKClearTrackCacheRequest;

@end
NS_ASSUME_NONNULL_END
