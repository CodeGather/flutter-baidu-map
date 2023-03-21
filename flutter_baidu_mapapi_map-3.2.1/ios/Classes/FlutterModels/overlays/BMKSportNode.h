//
//  BMKSportNode.h
//  Pods
//
//  Created by yau on 2021/7/24.
//

#import <flutter_baidu_mapapi_base/BMFModel.h>
#import <CoreLocation/CLLocation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BMKSportNode : BMFModel

/// 唯一id
@property (nonatomic, copy) NSString *Id;

/// 坐标
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

/// 距离
@property (nonatomic, assign) double distance;

/// 方向
@property (nonatomic, assign) double direction;

@end

NS_ASSUME_NONNULL_END
