//
//  BTFFenceOption.m
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/10.
//

#import "BTFFenceOption.h"
#import <BaiduTraceSDK/BaiduTraceSDK.h>
#import "BTFFence.h"
#import "BTFModels.h"
@implementation BTFCreateFenceOption

- (NSUInteger)fenceType {
    if (!_fence || !_fence[@"fenceType"]) return -1;
    
    return [_fence[@"fenceType"] intValue];
}
/// 围栏形状
/// (0：circle，1：polygon，2：polyline，3：district，-1: fence为无效数据)
- (NSUInteger)fenceShape {
    if (!_fence || !_fence[@"fenceShape"]) return -1;
     return [_fence[@"fenceShape"] intValue];
}

- (BTKCreateLocalFenceRequest *)toBTKCreateLocalFenceRequest {
    if ([self fenceType] != 0 || [self fenceShape] != 0) return nil;
    
    BTKCreateLocalFenceRequest *request = [BTKCreateLocalFenceRequest new];
    BTFCircleFence *fence = [BTFCircleFence btf_modelWith:self.fence];
    if (!fence) return nil;
    request.fence = [fence toBTKLocalCircleFence];
    return request;
}

- (BTKCreateServerFenceRequest *)toBTKCreateServerFenceRequest {
    if ([self fenceType] != 1) return nil;
    
    BTKCreateServerFenceRequest *request = [BTKCreateServerFenceRequest new];
    request.tag = self.tag;
    request.serviceID = self.serviceId;
    if ([self fenceShape] == 0) { // circle
        BTFCircleFence *fence = [BTFCircleFence btf_modelWith:self.fence];
        request.fence = [fence toBTKServerCircleFence];
    } else if ([self fenceShape] == 1) { // polygon
        BTFPolygonFence *fence = [BTFPolygonFence btf_modelWith:self.fence];
        request.fence = [fence toBTKServerPolygonFence];
    } else if ([self fenceShape] == 2) { // polyline
        BTFPolylineFence *fence  = [BTFPolylineFence btf_modelWith:self.fence];
        request.fence = [fence toBTKServerPolylineFence];
    } else if ([self fenceShape] == 3) { //district
        BTFDistrictFence *fence = [BTFDistrictFence btf_modelWith:self.fence];
        request.fence = [fence toBTKServerDistrictFence];
    } else { // 无效数据
        return nil;
    }
    
    return request;
}
@end


@implementation BTFDeleteFenceOption

+ (NSDictionary *)btf_setupObjectClassInArray {
    return @{@"fenceIds" : @"NSNumber"};
}

- (BTKDeleteLocalFenceRequest *)toBTKDeleteLocalFenceRequest {
    if (self.fenceType != 0) return nil;
    BTKDeleteLocalFenceRequest *request = [BTKDeleteLocalFenceRequest new];
    request.tag = self.tag;
    request.serviceID = self.serviceId;
    request.monitoredObject = self.monitoredPerson;
    request.fenceIDs = [self.fenceIds copy];
    return request;
}

- (BTKDeleteServerFenceRequest *)toBTKDeleteServerFenceRequest {
    if (self.fenceType != 1) return nil;
    BTKDeleteServerFenceRequest *request = [BTKDeleteServerFenceRequest new];
    request.tag = self.tag;
    request.serviceID = self.serviceId;
    request.monitoredObject = self.monitoredPerson;
    request.fenceIDs = [self.fenceIds copy];
    return request;
}
@end

@implementation BTFUpdateFenceOption

- (NSUInteger)fenceType {
    if (!_fence || !_fence[@"fenceType"]) return -1;
    
    return [_fence[@"fenceType"] intValue];
}
/// 围栏形状
/// (0：circle，1：polygon，2：polyline，3：district，-1: fence为无效数据)
- (NSUInteger)fenceShape {
    if (!_fence || !_fence[@"fenceShape"]) return -1;
     return [_fence[@"fenceShape"] intValue];
}

- (BTKUpdateLocalFenceRequest *)toBTKUpdateLocalFenceRequest {
    if (self.fenceType != 0) return nil;
    BTKUpdateLocalFenceRequest *request = [BTKUpdateLocalFenceRequest new];
    BTFCircleFence *fence = [BTFCircleFence btf_modelWith:self.fence];
    if (!fence) return nil;
    request.fence = [fence toBTKLocalCircleFence];
    request.fenceID = fence.fenceId;
    return request;
}

- (BTKUpdateServerFenceRequest *)toBTKUpdateServerFenceRequest {
    if (self.fenceType != 1) return nil;
    BTKUpdateServerFenceRequest *request = [BTKUpdateServerFenceRequest new];
    request.tag = self.tag;
    request.serviceID = self.serviceId;
    if ([self fenceShape] == 0) { // circle
        BTFCircleFence *fence = [BTFCircleFence btf_modelWith:self.fence];
        request.fence = [fence toBTKServerCircleFence];
        request.fenceID = fence.fenceId;
    } else if ([self fenceShape] == 1) { // polygon
        BTFPolygonFence *fence = [BTFPolygonFence btf_modelWith:self.fence];
        request.fence = [fence toBTKServerPolygonFence];
         request.fenceID = fence.fenceId;
    } else if ([self fenceShape] == 2) { // polyline
        BTFPolylineFence *fence  = [BTFPolylineFence btf_modelWith:self.fence];
        request.fence = [fence toBTKServerPolylineFence];
        request.fenceID = fence.fenceId;
    } else if ([self fenceShape] == 3) { //district
        BTFDistrictFence *fence = [BTFDistrictFence btf_modelWith:self.fence];
        request.fence = [fence toBTKServerDistrictFence];
        request.fenceID = fence.fenceId;
    } else { // 无效数据
        return nil;
    }
    return request;
}
@end


@implementation BTFQueryFenceOption
+ (NSDictionary *)btf_setupObjectClassInArray {
    return @{@"fenceIds" : @"NSNumber"};
}
- (BTKQueryLocalFenceRequest *)toBTKQueryLocalFenceRequest {
    if (self.fenceType != 0) return nil;
    BTKQueryLocalFenceRequest *request = [BTKQueryLocalFenceRequest new];
    request.tag = self.tag;
    request.serviceID = self.serviceId;
    request.monitoredObject = self.monitoredPerson;
    request.fenceIDs = [self.fenceIds copy];
    return request;
}

- (BTKQueryServerFenceRequest *)toBTKQueryServerFenceRequest {
    if (self.fenceType != 1) return nil;
    // iOS原生SDK, 坐标类型起始值为1
    BTKQueryServerFenceRequest *request = [BTKQueryServerFenceRequest new];
    request.tag = self.tag;
    request.serviceID = self.serviceId;
    request.monitoredObject = self.monitoredPerson;
    request.fenceIDs = [self.fenceIds copy];
    request.outputCoordType = self.coordTypeOutput + 1;
    request.pageIndex = self.pageIndex;
    request.pageSize = self.pageSize;
    return request;
}

@end

@implementation BTFQueryFenceStatusOption

+ (NSDictionary *)btf_setupObjectClassInArray {
    return @{@"fenceIds" : @"NSNumber"};
}
- (BTKQueryLocalFenceStatusRequest *)toBTKQueryLocalFenceStatusRequest {
    if (self.fenceType != 0) return nil;
    BTKQueryLocalFenceStatusRequest *request = [BTKQueryLocalFenceStatusRequest new];
    request.tag = self.tag;
    request.serviceID = self.serviceId;
    request.monitoredObject = self.monitoredPerson;
    request.fenceIDs = [self.fenceIds copy];
    return request;
}
- (BTKQueryServerFenceStatusRequest *)toBTKQueryServerFenceStatusRequest {
    if (self.fenceType != 1) return nil;
    BTKQueryServerFenceStatusRequest *request = [BTKQueryServerFenceStatusRequest new];
    request.tag = self.tag;
    request.serviceID = self.serviceId;
    request.monitoredObject = self.monitoredPerson;
    request.fenceIDs = [self.fenceIds copy];
    request.pageIndex = self.pageIndex;
    request.pageSize = self.pageSize;
    return request;
}
@end



@implementation BTFQueryFenceStatusByCustomLocation
+ (NSDictionary *)btf_setupObjectClassInArray {
    return @{@"fenceIds" : @"NSNumber"};
}
- (BTKQueryLocalFenceStatusByCustomLocationRequest *)toBTKQueryLocalFenceStatusByCustomLocationRequest {
    if (self.fenceType != 0 || !self.latLng) return nil;
    // iOS原生SDK, 坐标类型起始值为1
    BTKQueryLocalFenceStatusByCustomLocationRequest *request = [BTKQueryLocalFenceStatusByCustomLocationRequest new];
    request.tag = self.tag;
    request.serviceID = self.serviceId;
    request.monitoredObject = self.monitoredPerson;
    request.fenceIDs = [self.fenceIds copy];
    request.customLocation = [self.latLng toCLLocationCoordinate2D];
    request.coordType = self.coordType + 1;
    return request;
}
- (BTKQueryServerFenceStatusByCustomLocationRequest *)toBTKQueryServerFenceStatusByCustomLocationRequest {
    if (self.fenceType != 1 || !self.latLng) return nil;
    // iOS原生SDK, 坐标类型起始值为1
    BTKQueryServerFenceStatusByCustomLocationRequest *request = [BTKQueryServerFenceStatusByCustomLocationRequest new];
    request.tag = self.tag;
    request.serviceID = self.serviceId;
    request.monitoredObject = self.monitoredPerson;
    request.fenceIDs = [self.fenceIds copy];
    request.customLocation = [self.latLng toCLLocationCoordinate2D];
    request.coordType = self.coordType + 1;
    request.pageIndex = self.pageIndex;
    request.pageSize = self.pageSize;
    return request;
}
@end


@implementation BTFQueryFenceHistoryAlarmOption

+ (NSDictionary *)btf_setupObjectClassInArray {
    return @{@"fenceIds" : @"NSNumber"};
}
- (BTKQueryLocalFenceHistoryAlarmRequest *)toBTKQueryLocalFenceHistoryAlarmRequest {
    if (self.fenceType != 0) return nil;
    BTKQueryLocalFenceHistoryAlarmRequest *request = [BTKQueryLocalFenceHistoryAlarmRequest new];
    request.tag = self.tag;
    request.serviceID = self.serviceId;
    request.monitoredObject = self.monitoredPerson;
    request.fenceIDs = [self.fenceIds copy];
    request.startTime = self.startTime;
    request.endTime = self.endTime;
    return request;
}
- (BTKQueryServerFenceHistoryAlarmRequest *)toBTKQueryServerFenceHistoryAlarmRequest {
    if (self.fenceType != 1) return nil;
    // iOS原生SDK, 坐标类型起始值为1
    BTKQueryServerFenceHistoryAlarmRequest *request = [BTKQueryServerFenceHistoryAlarmRequest new];
    request.tag = self.tag;
    request.serviceID = self.serviceId;
    request.monitoredObject = self.monitoredPerson;
    request.fenceIDs = [self.fenceIds copy];
    request.outputCoordType = self.coordTypeOutput + 1;
    request.startTime = self.startTime;
    request.endTime = self.endTime;
    return request;
}
@end

@implementation BTFAddMonitoredObjectOption

+ (NSDictionary *)btf_setupObjectClassInArray {
    return @{@"monitoredPersons" : @"NSString"};
}
- (BTKAddMonitoredObjectRequest *)toBTKAddMonitoredObjectRequest {
    if (!self.monitoredPersons || self.monitoredPersons.count <= 0 || self.fenceId < 0) return nil;
    BTKAddMonitoredObjectRequest *request = [BTKAddMonitoredObjectRequest new];
    request.tag = self.tag;
    request.serviceID = self.serviceId;
    request.monitoredObjects = [self.monitoredPersons copy];
    request.fenceID = self.fenceId;
    return request;
}
@end

@implementation BTFDeleteMonitoredObjectOption

+ (NSDictionary *)btf_setupObjectClassInArray {
    return @{@"monitoredPersons" : @"NSString"};
}
- (BTKDeleteMonitoredObjectRequest *)toBTKDeleteMonitoredObjectRequest {
    if (self.fenceId < 0) return nil;
    BTKDeleteMonitoredObjectRequest *request = [BTKDeleteMonitoredObjectRequest new];
    request.tag = self.tag;
    request.serviceID = self.serviceId;
    request.monitoredObjects = [self.monitoredPersons copy];
    request.fenceID = self.fenceId;
    return request;
}
@end


@implementation BTFListMonitoredObjectOption

- (BTKListMonitoredObjectRequest *)toBTKListMonitoredObjectRequest {
    if (self.serviceId < 0) return nil;
    BTKListMonitoredObjectRequest *request = [BTKListMonitoredObjectRequest new];
    request.tag = self.tag;
    request.serviceID = self.serviceId;
    request.fenceID = self.fenceId;
    request.pageIndex = self.pageIndex;
    request.pageSize = self.pageSize;
    return request;
}

@end
