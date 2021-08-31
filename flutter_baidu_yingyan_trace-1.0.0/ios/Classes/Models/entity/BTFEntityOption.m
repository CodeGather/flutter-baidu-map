//
//  BTFAddEntityOption.m
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/1.
//

#import "BTFEntityOption.h"
#import "BTFModels.h"
#import <BaiduTraceSDK/BaiduTraceSDK.h>
#import "BTFQueryTrackProcessOption.h"
#import "BTFQueryEntityFilterOption.h"

@implementation BTFAddEntityOption
- (BTKAddEntityRequest *)toBTKAddEntityRequest {
    if (!self.entityName) {
        return nil;
    }
    BTKAddEntityRequest *request = [[BTKAddEntityRequest alloc] initWithEntityName:self.entityName entityDesc:self.entityDesc columnKey:self.customColumns serviceID:self.serviceId tag:self.tag];
    return request;
}
@end

@implementation BTFDeleteEntityOption

- (BTKDeleteEntityRequest *)toBTKDeleteEntityRequest {
    if (!self.entityName) {
        return nil;
    }
    BTKDeleteEntityRequest *request = [[BTKDeleteEntityRequest alloc] initWithEntityName:self.entityName serviceID:self.serviceId tag:self.tag];
    return request;
}

@end

@implementation BTFUpdateEntityOption

- (BTKUpdateEntityRequest *)toBTKUpdateEntityRequest {
    if (!self.entityName) {
        return nil;
    }
    BTKUpdateEntityRequest *request = [[BTKUpdateEntityRequest alloc] initWithEntityName:self.entityName entityDesc:self.entityDesc columnKey:self.customColumns serviceID:self.serviceId tag:self.tag];
    return request;
}

@end

@implementation BTFQueryEntityOption

- (BTKQueryEntityRequest *)toBTKQueryEntityRequest {
    ///  iOS原生SDK,  outputCoordType起始值为1
    BTKQueryEntityRequest *request = [[BTKQueryEntityRequest alloc] init];
    request.tag = self.tag;
    request.serviceID = self.serviceId;
    request.filter = [self.searchFilterCondition toBTKQueryEntityFilterOption];
    request.outputCoordType = self.coordType + 1;
    request.pageIndex = self.pageIndex;
    request.pageSize = self.pageSize;
    return request;
}

@end


@implementation BTFSearchEntityOption

- (BTKSearchEntityRequest *)toBTKSearchEntityRequest {
    if (!self.keyword) {
        return nil;
    }
    // iOS原生SDK, coordType起始值为1
    BTKSearchEntityRequest *request = [[BTKSearchEntityRequest alloc] init];
    request.tag = self.tag;
    request.serviceID = self.serviceId;
    request.query = self.keyword;
    request.outputCoordType = (UInt8)(self.coordType + 1);
    request.filter = [self.searchFilterCondition toBTKQueryEntityFilterOption];
    request.sortby = [self.sortBy toBTKSearchEntitySortByOption];
    request.pageIndex = self.pageIndex;
    request.pageSize = self.pageSize;
    return request;
}

@end

@implementation BTFBoundSearchEntityOption

- (BTKBoundSearchEntityRequest *)toBTKBoundSearchEntityRequest {
    if (!self.lowerLeft || !self.upperRight) {
        return nil;
    }
    NSMutableArray<NSValue *> *bounds = [NSMutableArray array];
    CLLocationCoordinate2D left = [self.lowerLeft toCLLocationCoordinate2D];
    CLLocationCoordinate2D right = [self.upperRight toCLLocationCoordinate2D];

    [bounds addObject:[NSValue valueWithBytes:&left objCType:@encode(CLLocationCoordinate2D)]];
    [bounds addObject:[NSValue valueWithBytes:&right objCType:@encode(CLLocationCoordinate2D)]];
    // iOS原生SDK, coordType, coordTypeInput 起始值为1
    BTKBoundSearchEntityRequest *request = [[BTKBoundSearchEntityRequest alloc] init];
    request.tag =self.tag;
    request.serviceID = self.serviceId;
    request.bounds = [bounds copy];
    request.inputCoordType = (UInt8)(self.coordTypeInput + 1);
    request.outputCoordType = (UInt8)(self.coordType + 1);
    request.filter = [self.searchFilterCondition toBTKQueryEntityFilterOption];
    request.sortby = [self.sortBy toBTKSearchEntitySortByOption];
    request.pageIndex = self.pageIndex;
    request.pageSize = self.pageSize;

    return request;
}

@end


@implementation BTFAroundSearchEntityOption

- (BTKAroundSearchEntityRequest *)toBTKAroundSearchEntityRequest {
    if (!self.center) {
        return nil;
    }
    // iOS原生SDK, coordType, coordTypeInput 起始值为1
    BTKAroundSearchEntityRequest *request = [BTKAroundSearchEntityRequest new];
    request.tag =self.tag;
    request.serviceID = self.serviceId;
    request.center = [self.center toCLLocationCoordinate2D];
    request.radius = self.radius;
    request.inputCoordType = (UInt8)(self.coordTypeInput + 1);
    request.outputCoordType = (UInt8)(self.coordType + 1);
    request.filter = [self.searchFilterCondition toBTKQueryEntityFilterOption];
    request.sortby = [self.sortBy toBTKSearchEntitySortByOption];
    request.pageIndex = self.pageIndex;
    request.pageSize = self.pageSize;
    return request;
}

@end

@implementation BTFPolygonSearchEntityOption
+ (NSDictionary *)btf_setupObjectClassInArray {
    return @{@"vertexes" : @"BTFCoordinate"};
}

- (BTKPolygonSearchEntityRequest *)toBTKPolygonSearchEntityRequest {
    if (!self.vertexes || self.vertexes.count <= 2) {
        return nil;
    }
    NSMutableArray *polygons = [NSMutableArray array];
    for (id coord in self.vertexes) {
        if (![coord isKindOfClass:[BTFCoordinate class]]) {
            return nil;
        }
        CLLocationCoordinate2D coordinate = [(BTFCoordinate *)coord toCLLocationCoordinate2D];
        [polygons addObject:[NSValue valueWithBytes:&coordinate objCType:@encode(CLLocationCoordinate2D)]];
    }
    if (polygons.count <= 2) {
        return nil;
    }
    // iOS原生SDK, coordType, coordTypeInput 起始值为1
    BTKPolygonSearchEntityRequest *request = [[BTKPolygonSearchEntityRequest alloc] init];
    request.tag =self.tag;
    request.serviceID = self.serviceId;
    request.vertexes = [polygons copy];
    request.inputCoordType = (UInt8)(self.coordTypeInput + 1);
    request.outputCoordType = (UInt8)(self.coordType + 1);
    request.filter = [self.searchFilterCondition toBTKQueryEntityFilterOption];
    request.sortby = [self.sortBy toBTKSearchEntitySortByOption];
    request.pageIndex = self.pageIndex;
    request.pageSize = self.pageSize;
    return request;
}

@end

@implementation BTFDistrictSearchEntityOption

- (BTKDistrictSearchEntityRequest *)toBTKDistrictSearchEntityRequest {
    if (!self.keyword) {
        return nil;
    }
    //  iOS原生SDK,coordType returnType起始值为1
    BTKDistrictSearchEntityRequest *request = [[BTKDistrictSearchEntityRequest alloc] init];
    request.tag = self.tag;
    request.serviceID = self.serviceId;
    request.keyword = self.keyword;
    request.outputCoordType = (UInt8)(self.coordType + 1);
    request.filter = [self.searchFilterCondition toBTKQueryEntityFilterOption];
    request.sortby = [self.sortBy toBTKSearchEntitySortByOption];
    request.pageIndex = self.pageIndex;
    request.pageSize = self.pageSize;
    request.returnType = self.returnType + 1;
    return request;
}

@end
