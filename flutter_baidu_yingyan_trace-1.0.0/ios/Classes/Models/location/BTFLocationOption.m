//
//  BTFLocationOption.m
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/8.
//

#import "BTFLocationOption.h"

@implementation BTFLocationOption
/// 定位类型
- (CLActivityType)activityType {
    // flutter初始值为0，iOS起始值为1
    return self.locationActivityType + 1;
}
/// 定位精度
- (CLLocationAccuracy)desiredAccuracy {
    // 默认kCLLocationAccuracyBest
    CLLocationAccuracy _desiredAccuracy = kCLLocationAccuracyBest;
    
    switch (self.locationAccuracy) {
        case 0:
            _desiredAccuracy = kCLLocationAccuracyBestForNavigation;
            break;
        case 1:
             _desiredAccuracy = kCLLocationAccuracyBest;
             break;
        case 2:
             _desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
             break;
        case 3:
             _desiredAccuracy = kCLLocationAccuracyHundredMeters;
             break;
        case 4:
             _desiredAccuracy = kCLLocationAccuracyKilometer;
             break;
        case 5:
             _desiredAccuracy = kCLLocationAccuracyThreeKilometers;
             break;
    }
    return _desiredAccuracy;
}

@end
