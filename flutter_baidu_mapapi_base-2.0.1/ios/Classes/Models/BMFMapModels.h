//
//  BMFMapModels.h
//  flutter_baidu_mapapi_base
//
//  Created by zbj on 2020/2/10.
//

#import <BaiduMapAPI_Base/BMKBaseComponent.h>
#import "NSObject+BMFVerify.h"
#import "BMFModel.h"

NS_ASSUME_NONNULL_BEGIN

/// 经纬度
@interface BMFCoordinate : BMFModel

/// 纬度
@property(nonatomic, assign) double latitude;

/// 经度
@property(nonatomic, assign) double longitude;

/// 经纬度结构体数组
+ (CLLocationCoordinate2D *)fromData:(NSArray<NSDictionary *> *)data;

/// 释放经纬度结构体数组
+ (BOOL)freeCoords:(CLLocationCoordinate2D *_Nonnull*_Nullable)coords;

/// BMKMapPoint结构体数组
+ (BMKMapPoint *)fromPoints:(NSArray<NSDictionary *> *)data;

/// 释放BMKMapPoint结构体数组
+ (BOOL)freePoints:(BMKMapPoint *_Nonnull*_Nullable)points;

/// BMFCoordinate对象数组
+ (NSArray<BMFCoordinate *> *)coordinatesWith:(NSArray<NSDictionary *> *)data;

/// BMFCoordinate  ->  CLLocationCoordinate2D
- (CLLocationCoordinate2D)toCLLocationCoordinate2D;

/// BMFCoordinate ->  BMKMapPoint
- (BMKMapPoint)toBMKMapPoint;

/// CLLocationCoordinate2D -> BMFCoordinate
+ (BMFCoordinate *)fromCLLocationCoordinate2D:(CLLocationCoordinate2D)coord;

+ (BMFCoordinate *)fromBMKMapPoint:(BMKMapPoint)mapPoint;

@end

/// 地理坐标点，用直角地理坐标表示
@interface BMFMapPoint : BMFModel

/// 横坐标
@property (nonatomic, assign) double x;

/// 纵坐标
@property (nonatomic, assign) double y;


/// BMFMapPoint -> CGPoint
- (CGPoint)toCGPoint;

/// CGPoint -> BMFMapPoint
+ (BMFMapPoint *)fromCGPoint:(CGPoint)point;

/// BMFMapPoint -> BMKMapPoint
- (BMKMapPoint)toBMKMapPoint;

/// BMKMapPoint -> BMFMapPoint
+ (BMFMapPoint *)fromBMKMapPoint:(BMKMapPoint)point;
@end

/// 矩形大小，用直角地理坐标表示
@interface BMFMapSize : BMFModel

/// 宽度
@property (nonatomic, assign) CGFloat width;

/// 高度
@property (nonatomic, assign) CGFloat height;

/// BMFMapSize -> BMKMapSize
- (BMKMapSize)toBMKMapSize;

/// BMKMapSize -> BMFMapSize
+ (BMFMapSize *)fromBMKMapSize:(BMKMapSize)mapSize;

@end

/// 表示一个经纬度范围
@interface BMFCoordinateSpan : BMFModel

/// 纬度范围
@property (nonatomic, assign) double latitudeDelta;

/// 经度范围
@property (nonatomic, assign) double longitudeDelta;

/// BMFCoordinateSpan -> BMKCoordinateSpan
- (BMKCoordinateSpan)toBMKCoordinateSpan;

/// BMKCoordinateSpan -> BMFCoordinateSpan
+ (BMFCoordinateSpan *)fromBMKCoordinateSpan:(BMKCoordinateSpan)span;

@end

/// 表示一个经纬度区域
@interface BMFCoordinateRegion : BMFModel

/// 中心点经纬度坐标
@property (nonatomic, strong) BMFCoordinate *center;

/// 经纬度范围
@property (nonatomic, strong) BMFCoordinateSpan *span;

/// BMFCoordinateRegion -> BMKCoordinateRegion
- (BMKCoordinateRegion)toCoordinateRegion;

/// BMKCoordinateBounds -> BMFCoordinateRegion
+ (BMFCoordinateRegion *)fromBMKCoordinateBounds:(BMKCoordinateBounds)bounds;
@end

/// 表示一个经纬度区域
@interface BMFCoordinateBounds : BMFModel

/// 东北角点经纬度坐标
@property (nonatomic, strong) BMFCoordinate *northeast;

/// 西南角点经纬度坐标
@property (nonatomic, strong) BMFCoordinate *southwest;

/// BMFCoordinateBounds -->  BMKCoordinateBounds
- (BMKCoordinateBounds)toBMKCoordinateBounds;

/// BMFCoordinateBounds -->  BMKMapRect
- (BMKMapRect)toBMKMapRect;

/// BMFCoordinateBounds -->  BMKCoordinateRegion
- (BMKCoordinateRegion)toCoordinateRegion;

@end

/// 矩形，用直角地理坐标表示
@interface BMFMapRect : BMFModel

/// 屏幕左上点对应的直角地理坐标
@property (nonatomic, strong) BMFMapPoint *origin;

/// 坐标范围
@property (nonatomic, strong) BMFMapSize *size;

/// BMFMapRect -> BMKMapRect
- (BMKMapRect)toBMKMapRect;
/// BMFMapRect -> CGRect
- (CGRect)toCGRect;
/// BMFMapRect -> BMFCoordinateBounds
- (BMFCoordinateBounds *)toBMFCoordinateBounds;

/// BMKMapRect -> BMFMapRect
+ (BMFMapRect *)fromBMKMapRect:(BMKMapRect)rect;
@end

NS_ASSUME_NONNULL_END
