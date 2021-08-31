//
//  BTFTrackResult.h
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/16.
//

#import "BTFModel.h"

@class BTFTrackPoint;
@class BTFCoordinate;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - 批量添加点
@interface BTFParamError : BTFModel

/// 错误信息
@property (nonatomic, copy) NSString *error;

/// Entity唯一标识
@property (nonatomic, copy) NSString *entityName;

/// 轨迹点信息
@property (nonatomic, strong) BTFTrackPoint *trackPoint;
@end

@interface BTFInternalError : BTFModel

/// Entity唯一标识
@property (nonatomic, copy) NSString *entityName;

/// 轨迹点信息
@property (nonatomic, strong) BTFTrackPoint *trackPoint;


@end

@interface BTFFailInfo : BTFModel

/// 输入参数不正确导致上传失败的点集
@property (nonatomic, copy) NSArray<BTFParamError *> *paramErrors;

/// 服务器内部错误导致上传失败的点集
@property (nonatomic, copy) NSArray<BTFInternalError *> *internalErrors;


@end

@interface BTFAddTrackPointsResult : BTFModel
/// 请求标识
@property (nonatomic, assign) int tag;

/// 状态码
@property (nonatomic, assign) int status;

/// 状态消息
@property (nonatomic, copy) NSString *message;

/// 上传成功的点个数
@property (nonatomic, assign) int successNum;

/// 上传失败的点信息
@property (nonatomic, strong) BTFFailInfo *failInfo;

@end


#pragma mark -  query track latest point

@interface BTFLatestPoint  : BTFModel

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


/// 楼层
@property (nonatomic, copy) NSString *floor;

/// 对象名称
@property (nonatomic, copy) NSString *objectName;

/// 创建时间（该时间为服务端时间）
/// 注：仅在查询历史轨迹时有值；批量添加轨迹点时，无须设置该字段。
@property (nonatomic, copy) NSString *createTime;

/// 自定义数据字典。可选。
/// key为开发者添加的自定义字段；
/// value为该字段对应的值。
@property (nonatomic, copy) NSDictionary<NSString *, NSString *> *columns;


/// 轨迹对应的道路等级
@property (nonatomic, copy) NSString *roadGrade;

/// 轨迹对应的道路名称
@property (nonatomic, copy) NSString *roadName;

/// 轨迹对应的定位方式（鹰眼分析得出）
@property (nonatomic, copy) NSString *locateMode;

/// 轨迹对应的交通方式（鹰眼分析得出）
@property (nonatomic, copy) NSString *transportMode;


@end


@interface BTFQueryTrackLatestPointResult : BTFModel
/// 请求标识
@property (nonatomic, assign) int tag;

/// 状态码
@property (nonatomic, assign) int status;

/// 状态消息
@property (nonatomic, copy) NSString *message;

/// Entity唯一标识
@property (nonatomic, copy) NSString *entityName;

/// 最新轨迹点
@property (nonatomic, strong) BTFLatestPoint *latestPoint;

/// 道路限速（单位：km/h）
@property (nonatomic, assign) double limitSpeed;


@end

#pragma mark - query track distance result

@interface BTFQueryTrackDistanceResult : BTFModel
/// 请求标识
@property (nonatomic, assign) int tag;

/// 状态码
@property (nonatomic, assign) int status;

/// 状态消息
@property (nonatomic, copy) NSString *message;

/// Entity唯一标识
@property (nonatomic, copy) NSString *entityName;

/// 符合条件的轨迹点的里程
@property (nonatomic, assign) double distance;

/// 低速里程, 单位米
@property (nonatomic, assign) double lowSpeedDistance;



@end


#pragma mark - query history track
@interface BTFPointInfo : BTFModel

/// 经纬度
@property (nonatomic, strong) BTFCoordinate *location;

/// 定位时间
@property (nonatomic, assign) NSUInteger locTime;

/// 轨迹点的坐标类型
/// iOS原生SDK初始值为1
@property (nonatomic, assign) NSUInteger coordType;



@end

@interface BTFTrackPointInfo : BTFModel 

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

/// 创建时间（该时间为服务端时间）
@property (nonatomic, copy) NSString *createTime;

/// 对象名称
@property (nonatomic, copy) NSString *objectName;

/// 自定义数据字典。可选。
/// key为开发者添加的自定义字段；
/// value为该字段对应的值。
@property (nonatomic, copy) NSDictionary<NSString *, NSString *> *columns;

/// 轨迹对应的道路等级
@property (nonatomic, copy) NSString *roadGrade;

/// 轨迹对应的道路名称
@property (nonatomic, copy) NSString *roadName;

/// 轨迹对应的定位方式（鹰眼分析得出）
@property (nonatomic, copy) NSString *locateMode;

/// 轨迹对应的交通方式（鹰眼分析得出）
@property (nonatomic, copy) NSString *transportMode;

/// 楼层
/// 仅在百度地图高精室内定位合作区域返回
@property (nonatomic, copy) NSString *floor;

/// 是否为补充的点
/// 若为原始轨迹点位置纠正后的点，则不返回该字段；
/// 若该点为鹰眼纠偏绑路时自动补充的道路形状点，则supplement=1；
/// 若该点为通过supplement_mode和supplement_content在长距离中断区间使用路线规划补偿的轨迹点，则_supplement=2；
@property (nonatomic, assign) int supplement;


@end

@interface BTFQueryHistoryTrackResult : BTFModel
/// 请求标识
@property (nonatomic, assign) int tag;

/// 状态码
@property (nonatomic, assign) int status;

/// 状态消息
@property (nonatomic, copy) NSString *message;

/// 总数
@property (nonatomic, assign) int totalSize;

/// 返回结果条数
@property (nonatomic, assign) int size;

/// Entity唯一标识
@property (nonatomic, copy) NSString *entityName;

/// 此段轨迹的里程数
@property (nonatomic, assign) double distance;

/// 此段轨迹的收费里程数，单位：米
@property (nonatomic, assign) double tollDistance;


/// 起点信息
@property (nonatomic, strong) BTFPointInfo *startPoint;

/// 终点信息
@property (nonatomic, strong) BTFPointInfo *endPoint;

/// 低速里程
@property (nonatomic, assign) double lowSpeedDistance;

/// 历史轨迹点列表
@property (nonatomic, copy) NSArray<BTFTrackPointInfo *> *trackPoints;



@end

#pragma mark - QueryTrackCacheInfoResult

@interface BTFCacheTrackInfo : BTFModel


/// Entity唯一标识
@property (nonatomic, copy) NSString *entityName;

/// 所属entity对应的缓存数据量。
@property (nonatomic, assign) int total;

/// 查询指定时间段内缓存的轨迹，时间段起点的UNIX时间戳，选填
/// 若单独指定startTime，不指定endTime，则查询startTime至当前的缓存轨迹
@property (nonatomic, assign) NSUInteger startTime;

/// 查询指定时间段内缓存的轨迹，时间段终点的UNIX时间戳，选填
/// 如果设置endTime，则endTime必须大于startTime
/// 若单独指定endTime，不指定startTime，则查询endTime之前的所有缓存轨迹
@property (nonatomic, assign) NSUInteger endTime;

/// 缓存轨迹的距离，单位：米
/// 查询轨迹时，为所属entity对应缓存轨迹的距离；
/// entityName为null或空串时，表示查询所有entity的缓存轨迹的距离
@property (nonatomic, assign) double cacheDistance;

@end

@interface BTFQueryTrackCacheInfoResult : BTFModel
/// 请求标识
@property (nonatomic, assign) int tag;

/// 状态码
@property (nonatomic, assign) int status;

/// 状态消息
@property (nonatomic, copy) NSString *message;

/// 查询结果
@property (nonatomic, copy) NSArray<BTFCacheTrackInfo *> *cacheInfoResult;
@end
NS_ASSUME_NONNULL_END
