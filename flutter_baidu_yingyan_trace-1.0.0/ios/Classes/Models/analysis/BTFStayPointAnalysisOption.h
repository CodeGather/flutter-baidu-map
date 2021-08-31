//
//  BTFStayPointAnalysisOption.h
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/1.
//

#import "BTFModel.h"

@class BTFQueryTrackProcessOption;
@class BTKStayPointAnalysisRequest;

NS_ASSUME_NONNULL_BEGIN

/// 停留点分析的请求信息类
@interface BTFStayPointAnalysisOption : BTFModel

/// 轨迹服务的ID
@property (nonatomic, assign) NSUInteger serviceId;

/// 请求标志
@property (nonatomic, assign) NSUInteger tag;

/// 需要查询的entity的名称，必填，必须为非空字符串。
@property (nonatomic, copy) NSString *entityName;

/// 开始时间，必选。
@property (nonatomic, assign) NSUInteger startTime;


/// 结束时间，必选。
@property (nonatomic, assign) NSUInteger endTime;

/// 停留时间，可选。
/// 单位：秒，默认值：600。
/// 该字段用于设置停留点判断规则，即若系统判断在半径为stay_radius的圆形范围内停留时间超过stay_time，则被认为是一次停留。
@property (nonatomic, assign) NSUInteger stayTime;


/// 停留半径，可选。
/// 单位：米，取值范围：[1,500]，默认值：20。
/// 该字段用于设置停留点判断规则，即若系统判断在半径为stay_radius的圆形范围内停留时间超过stay_time，则被认为是一次停留。
@property (nonatomic, assign) NSUInteger stayRadius;


/// 纠偏选项，用于控制返回坐标的纠偏处理方式。
/// 在停留点分析方法中，只有其中的mapMatch和transportMode有效。
/// 可选。若不设置或为nil，则采用默认值。不绑路、交通方式为驾车。
@property (nonatomic, strong) BTFQueryTrackProcessOption *processOption;


/// 返回的坐标类型，可选。
/// 该字段用于控制返回结果中的坐标类型。可选值为：
/// BTF_COORDTYPE_GCJ02：国测局加密坐标
/// BTF_COORDTYPE_BD09LL：百度经纬度坐标
/// 该参数仅对国内（包含港、澳、台）轨迹有效，海外区域轨迹均返回 wgs84坐标系
/// iOS原生SDK初始值为1
@property (nonatomic, assign) NSUInteger outputCoordType;

/// BTFStayPointAnalysisOption => BTKStayPointAnalysisRequest
- (BTKStayPointAnalysisRequest *)toBTKStayPointAnalysisRequest;

@end

NS_ASSUME_NONNULL_END
