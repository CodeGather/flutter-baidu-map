//
//  BTFModels.m
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/1.
//

#import "BTFModels.h"

@implementation BTFCoordinate

+ (BOOL)freeCoords:(CLLocationCoordinate2D *_Nonnull*_Nullable)coords{
    if (*coords) {
        free(*coords);
        return YES;
    }
    return NO;
}

+ (CLLocationCoordinate2D *)fromData:(NSArray<NSDictionary *> *)data {
    NSUInteger count = [data count];
    CLLocationCoordinate2D *coords = new CLLocationCoordinate2D[count];
    for (int i = 0; i < count; i++) {
        coords[i] = [[BTFCoordinate btf_modelWith:data[i]] toCLLocationCoordinate2D];
    }
    return coords;
}
+ (NSArray<BTFCoordinate *> *)coordinatesWith:(NSArray<NSDictionary *> *)data {
    NSMutableArray<BTFCoordinate *> *mut = [NSMutableArray array];
    if (data.count > 0) {
        for (NSDictionary *dic in data) {
            BTFCoordinate *coord = [BTFCoordinate btf_modelWith:dic];
            [mut addObject:coord];
        }
    }
    return mut;
}

- (CLLocationCoordinate2D)toCLLocationCoordinate2D {
    return CLLocationCoordinate2DMake(self.latitude, self.longitude);
}

+ (BTFCoordinate *)fromCLLocationCoordinate2D:(CLLocationCoordinate2D)coord {
    BTFCoordinate *coordinate = [BTFCoordinate new];
    coordinate.latitude = coord.latitude;
    coordinate.longitude = coord.longitude;
    return coordinate;
}

@end

@implementation BTFPoint


@end
