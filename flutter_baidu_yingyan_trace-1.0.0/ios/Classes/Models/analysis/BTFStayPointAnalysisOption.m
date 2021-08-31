//
//  BTFStayPointAnalysisOption.m
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/1.
//

#import "BTFStayPointAnalysisOption.h"
#import <BaiduTraceSDK/BaiduTraceSDK.h>

#import "BTFQueryTrackProcessOption.h"

@implementation BTFStayPointAnalysisOption
- (BTKStayPointAnalysisRequest *)toBTKStayPointAnalysisRequest {
    // outputCoordType坐标类型枚举+1 flutter初始值为0
    BTKStayPointAnalysisRequest *request = [[BTKStayPointAnalysisRequest alloc] init];
    request.entityName = self.entityName;
    request.startTime = self.startTime;
    request.endTime = self.endTime;
    request.stayRadius = self.stayRadius;
    request.processOption = [self.processOption toBTKQueryTrackProcessOption];
    request.outputCoordType = self.outputCoordType + 1;
    request.serviceID = self.serviceId;
    request.tag = self.tag;
    return request;
}
@end
