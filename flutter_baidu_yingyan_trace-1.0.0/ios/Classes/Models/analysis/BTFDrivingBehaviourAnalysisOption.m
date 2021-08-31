//
//  BTFDrivingBehaviourAnalysisOption.m
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/1.
//

#import "BTFDrivingBehaviourAnalysisOption.h"
#import <BaiduTraceSDK/BaiduTraceSDK.h>

#import "BTFQueryTrackProcessOption.h"

@implementation BTFDrivingBehaviourAnalysisOption
- (BTKDrivingBehaviourAnalysisRequest *)toBTKDrivingBehaviourAnalysisRequest {
      // outputCoordType坐标类型枚举+1 flutter初始值为0
    BTKDrivingBehaviourAnalysisRequest *request = [[BTKDrivingBehaviourAnalysisRequest alloc] init];
    request.entityName = self.entityName;
    request.startTime = self.startTime;
    request.endTime =self.endTime;
    request.thresholdOption = [self.thresholdOption toBTKDrivingBehaviorThresholdOption];
    request.processOption = [self.processOption toBTKQueryTrackProcessOption];
    request.outputCoordType = self.outputCoordType + 1;
    request.serviceID = self.serviceId;
    request.tag = self.tag;
    return request;
}
@end

@implementation BTFDrivingBehaviorThresholdOption

- (BTKDrivingBehaviorThresholdOption *)toBTKDrivingBehaviorThresholdOption {
    BTKDrivingBehaviorThresholdOption *option = [BTKDrivingBehaviorThresholdOption new];
    /**
     固定限速值，可选。
     若设置为非0值，则以设置的数值为阈值，轨迹点速度超过该值则认为是超速；
     若不设置，或设置为0，则根据百度地图道路限速数据计算超速点。
     */
    option.speedingThreshold = self.speedingThreshold;

    /**
     急加速的水平加速度阈值。
     单位：m^2/s，默认值：1.67，仅支持正数
     */
    option.harshAccelerationThreshold = self.harshAccelerationThreshold;

    /**
     急减速的水平加速度阈值。
     单位：m^2/s，默认值：-1.67，仅支持负数
     */
    option.harshBreakingThreshold = self.harshBreakingThreshold;

    /**
     急转弯的向心加速度阈值。
     单位：m^2/s，默认值：5，仅支持正数
     */
    option.harshSteeringThreshold = self.harshSteeringThreshold;
    return option;
}

@end
