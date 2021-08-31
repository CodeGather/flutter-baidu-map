//
//  BTFDrivingBehaviourAnalysisOption.h
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/1.
//

#import "BTFModel.h"

@class BTFDrivingBehaviorThresholdOption;
@class BTFQueryTrackProcessOption;
@class BTKDrivingBehaviourAnalysisRequest;
@class BTKDrivingBehaviorThresholdOption;

NS_ASSUME_NONNULL_BEGIN

@interface BTFDrivingBehaviourAnalysisOption : BTFModel
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


/// 固定限速值，可选。
/// 若设置为非0值，则以设置的数值为阈值，轨迹点速度超过该值则认为是超速；
/// 若不设置，或设置为0，则根据百度地图道路限速数据计算超速点。
@property (nonatomic, assign) double speedingThreshold;

/// 自定义轨迹分析时需要的阈值，可选。
/// 若为nil，则使用默认的阈值，若设置，则使用指定的各阈值进行轨迹分析。
@property (nonatomic, strong) BTFDrivingBehaviorThresholdOption *thresholdOption;

/// 纠偏选项，用于控制返回坐标的纠偏处理方式。
/// 在驾驶行为分析方法中，只有其中的mapMatch和transportMode有效。
/// 可选。若不设置或为nil，则采用默认值。不绑路、交通方式为驾车。
@property (nonatomic, strong) BTFQueryTrackProcessOption *processOption;

/// 返回的坐标类型，可选。
/// 该字段用于控制返回结果中的坐标类型。可选值为：
/// BTF_COORDTYPE_GCJ02：国测局加密坐标
/// BTF_COORDTYPE_BD09LL：百度经纬度坐标
/// 该参数仅对国内（包含港、澳、台）轨迹有效，海外区域轨迹均返回 wgs84坐标系
/// iOS原生SDK初始值为1
@property (nonatomic, assign) NSUInteger outputCoordType;

/// BTFDrivingBehaviourAnalysisOption => BTKDrivingBehaviourAnalysisRequest
- (BTKDrivingBehaviourAnalysisRequest *)toBTKDrivingBehaviourAnalysisRequest;
@end

/// 轨迹分析时需要的阈值，各阈值均有默认值。
@interface BTFDrivingBehaviorThresholdOption : BTFModel

/// 固定限速值，可选。
/// 若设置为非0值，则以设置的数值为阈值，轨迹点速度超过该值则认为是超速；
/// 若不设置，或设置为0，则根据百度地图道路限速数据计算超速点。
@property (nonatomic, assign) double speedingThreshold;

/// 急加速的水平加速度阈值。
/// 单位：m^2/s，默认值：1.67，仅支持正数
@property (nonatomic, assign) double harshAccelerationThreshold;

/// 急减速的水平加速度阈值。
/// 单位：m^2/s，默认值：-1.67，仅支持负数
@property (nonatomic, assign) double harshBreakingThreshold;

/// 急转弯的向心加速度阈值。
/// 单位：m^2/s，默认值：5，仅支持正数
@property (nonatomic, assign) double harshSteeringThreshold;

/// BTFDrivingBehaviorThresholdOption  =>  BTKDrivingBehaviorThresholdOption
- (BTKDrivingBehaviorThresholdOption *)toBTKDrivingBehaviorThresholdOption;
@end

NS_ASSUME_NONNULL_END
