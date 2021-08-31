//
//  BMFOverlayHandles.m
//  flutter_baidu_mapapi_map
//
//  Created by zhangbaojin on 2020/2/12.
//

#import "BMFOverlayHandles.h"
#import <flutter_baidu_mapapi_base/UIColor+BMFString.h>
#import <flutter_baidu_mapapi_base/BMFMapModels.h>
#import <flutter_baidu_mapapi_base/BMFDefine.h>

#import "BMFMapView.h"
#import "BMFOverlayMethodConst.h"
#import "BMFFileManager.h"
#import "BMFPolyline.h"
#import "BMFArcline.h"
#import "BMFPolygon.h"
#import "BMFCircle.h"
#import "BMFTileModel.h"
#import "BMKSportNode.h"
#import "BMKGeometry.h"
#import "BMFURLTileLayer.h"
#import "BMFAsyncTileLayer.h"
#import "BMFSyncTileLayer.h"
#import "BMFGroundOverlay.h"
#import "BMFHollowShapeModel.h"
#import "BMFAnnotation.h"
#import "BMFAnnotationHandles.h"
#import "BMFAnnotationMethodConst.h"

@interface BMFOverlayHandles ()
{
    NSDictionary *_handles;
}
@end

@implementation BMFOverlayHandles

static  BMFOverlayHandles *_instance = nil;
+ (instancetype)defalutCenter{
    if (!_instance) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _instance = [[BMFOverlayHandles alloc] init];
        });
    }
    return _instance;
}

- (NSDictionary<NSString *, NSString *> *)overlayHandles{
    if (!_handles) {
        _handles = @{
            kBMFMapAddPolylineMethod: NSStringFromClass([BMFAddPolyline class]),
            kBMFMapAddArcineMethod: NSStringFromClass([BMFAddArcline class]),
            kBMFMapAddPolygonMethod: NSStringFromClass([BMFAddPolygon class]),
            kBMFMapAddCircleMethod: NSStringFromClass([BMFAddCircle class]),
            kBMFMapAddTileMethod: NSStringFromClass([BMFAddTile class]),
            kBMFMapAddGroundMethod: NSStringFromClass([BMFAddGround class]),
            kBMFMapRemoveOverlayMethod: NSStringFromClass([BMFRemoveOverlay class]),
            kBMFMapRemoveTileMethod: NSStringFromClass([BMFRemoveTileOverlay class]),
            kBMFMapUpdatePolylineMemberMethod: NSStringFromClass([BMFUpdatePolyline class]),
            kBMFMapUpdateArclineMemberMethod: NSStringFromClass([BMFUpdateArcline class]),
            kBMFMapUpdateCircleMemberMethod: NSStringFromClass([BMFUpdateCircle class]),
            kBMFMapUpdatePolygonMemberMethod: NSStringFromClass([BMFUpdatePolygon class])
        };
    }
    return _handles;
}
@end


#pragma mark - overlay

@interface BMFAddPolyline ()
{
  BMKPointAnnotation *annotation;
  int sumDistance;
  int currentIndex;
  NSMutableArray *sportNodes;
}
@end

@implementation BMFAddPolyline

@synthesize _mapView;

- (nonnull NSObject<BMFMapViewHandler> *)initWith:(nonnull BMFMapView *)mapView {
    _mapView = mapView;
    return self;
}

- (void)handleMethodCall:(nonnull FlutterMethodCall *)call result:(nonnull FlutterResult)result {
    BMKPolyline *polyline = [BMKPolyline polylineWith:call.arguments];
    if (polyline) {
      [_mapView addOverlay:polyline];
      
      NSDictionary *dic = call.arguments;
      
      if (dic[@"isMove"] != nil && [dic[@"isMove"] boolValue]) {
        NSDictionary *marker = dic[@"marker"];
        annotation = [BMKPointAnnotation annotationWith: marker];
        [_mapView addAnnotation:annotation];
        [self fetchSportNodes: dic[@"coordinates"]];
      }
      
      result(@YES);
    } else {
        result(@NO);
    }
}

#pragma mark - 动画相关
- (void)fetchSportNodes:(NSArray*) array{
  sumDistance = 0;
  sportNodes = [NSMutableArray array];
  for (int i = 0; i < array.count; i ++) {
      NSDictionary *current = array[i];
      CLLocationCoordinate2D startCoor = CLLocationCoordinate2DMake([current[@"latitude"] doubleValue], [current[@"longitude"] doubleValue]);
      NSDictionary *next = array[(i + 1) % array.count];
      CLLocationCoordinate2D endCoor = CLLocationCoordinate2DMake([next[@"latitude"] doubleValue], [next[@"longitude"] doubleValue]);
      CLLocation *begin = [[CLLocation alloc] initWithLatitude:startCoor.latitude longitude:startCoor.longitude];
      CLLocation *end = [[CLLocation alloc] initWithLatitude:endCoor.latitude longitude:endCoor.longitude];
      CLLocationDistance distance = [end distanceFromLocation:begin];
      CLLocationDirection direction = BMKGetDirectionFromCoords(begin.coordinate, end.coordinate);
      sumDistance += distance;
    
      BMKSportNode *sportNode = [[BMKSportNode alloc] init];
      sportNode.coordinate = startCoor;
      sportNode.distance = distance;
      sportNode.direction = direction / 180 * M_PI;
      [sportNodes addObject:sportNode];
  }
  
  NSLog(@"ios - 总长度：%d", sumDistance);
  
  // [_mapView setZoomLevel: [self getZoomLavel]];
  
  currentIndex = 0;
  [self startAnimationAnnotation];
}

- (float) getZoomLavel{
  NSArray* ConstData = @[
    @{
      @"value": @1000000,
      @"level": @4
    }, @{
      @"value": @500000,
      @"level": @5
    }, @{
      @"value": @200000,
      @"level": @6
    }, @{
      @"value": @100000,
      @"level": @7
    }, @{
      @"value": @50000,
      @"level": @8
    }, @{
      @"value": @25000,
      @"level": @9
    }, @{
      @"value": @20000,
      @"level": @10
    }, @{
      @"value": @10000,
      @"level": @11
    }, @{
      @"value": @5000,
      @"level": @12
    }, @{
      @"value": @2000,
      @"level": @13
    }, @{
      @"value": @1000,
      @"level": @14
    }, @{
      @"value": @500,
      @"level": @15
    }, @{
      @"value": @200,
      @"level": @16
    }, @{
      @"value": @100,
      @"level": @17
    }, @{
      @"value": @50,
      @"level": @18
    }, @{
      @"value": @20,
      @"level": @19
    }, @{
      @"value": @10,
      @"level": @20
    }, @{
      @"value": @5,
      @"level": @21
    }
  ];
  float itemLevel = 15;
  
  for (int i = 0 ; i < ConstData.count; i++) {
    /// 动态生成imageView 并且加入到 imageView数组中以备使用
    NSDictionary * item = (NSDictionary*) ConstData[i];
    if ([[item objectForKey: @"value"] floatValue] < sumDistance) {
      itemLevel = [[item objectForKey: @"level"] floatValue];
      break;
    }
  }
  return itemLevel;
}

#pragma mark - 动画相关
- (void)startAnimationAnnotation {
  // 小车的方向
  // self.imageView.transform = CGAffineTransformMakeRotation(node.direction);
  // [UIView setAnimationRepeatCount:MAXFLOAT];
  [UIView animateWithDuration: 1.0f
                        delay: 0
                      options: UIViewAnimationOptionCurveLinear
                   animations: ^{
    // [self->annotation setCoordinate:((BMKSportNode *)self->sportNodes[(self->currentIndex + 1) % self->sportNodeNum]).coordinate];
    [self->annotation setCoordinate:((BMKSportNode *)self->sportNodes[(self->currentIndex)]).coordinate];
  } completion:^(BOOL finished) {
    self->currentIndex ++;
    // self->currentIndex %= self->sportNodes.count;
    if (self->currentIndex < self->sportNodes.count) {
      [self startAnimationAnnotation];
    }
  }];
}

@end

@implementation BMFAddArcline

@synthesize _mapView;

- (nonnull NSObject<BMFMapViewHandler> *)initWith:(nonnull BMFMapView *)mapView {
    _mapView = mapView;
    return self;
}

- (void)handleMethodCall:(nonnull FlutterMethodCall *)call result:(nonnull FlutterResult)result {
    BMKArcline *arcline = [BMKArcline arclineWith:call.arguments];
    if (arcline) {
        [_mapView addOverlay:arcline];
        result(@YES);
    } else {
        result(@NO);
    }
}

@end


@implementation BMFAddPolygon

@synthesize _mapView;

- (nonnull NSObject<BMFMapViewHandler> *)initWith:(nonnull BMFMapView *)mapView {
    _mapView = mapView;
    return self;
}

- (void)handleMethodCall:(nonnull FlutterMethodCall *)call result:(nonnull FlutterResult)result {
    BMKPolygon *polygon = [BMKPolygon polygonWith:call.arguments];
    if (polygon) {
        [_mapView addOverlay:polygon];
        result(@YES);
    } else {
        result(@NO);
    }
}

@end


@implementation BMFAddCircle

@synthesize _mapView;

- (nonnull NSObject<BMFMapViewHandler> *)initWith:(nonnull BMFMapView *)mapView {
    _mapView = mapView;
    return self;
}

- (void)handleMethodCall:(nonnull FlutterMethodCall *)call result:(nonnull FlutterResult)result {
    BMKCircle *circle = [BMKCircle circlelineWith:call.arguments];
    if (circle) {
        [_mapView addOverlay:circle];
        result(@YES);
        return;
    } else {
        result(@NO);
    }
}

@end

@implementation BMFAddTile

@synthesize _mapView;

- (nonnull NSObject<BMFMapViewHandler> *)initWith:(nonnull BMFMapView *)mapView {
    _mapView = mapView;
    return self;
}

- (void)handleMethodCall:(nonnull FlutterMethodCall *)call result:(nonnull FlutterResult)result {
    if (!call.arguments) {
        result(@NO);
        return;
    }
    BMFTileModel *model = [BMFTileModel bmf_modelWith:call.arguments];
    model.tileOptions = [BMFTileModelOptions bmf_modelWith:call.arguments];
    //    NSLog(@"%@", [model bmf_toDictionary]);
    if (!model) {
        result(@NO);
        return;
    }
    if (model.tileOptions.tileLoadType == kBMFTileLoadUrl && model.tileOptions.url) {
        BMFURLTileLayer *urlTileLayer = [BMFURLTileLayer urlTileLayerWith:model];
        [_mapView addOverlay:urlTileLayer];
        result(@YES);
        return;
    } else if (model.tileOptions.tileLoadType == kBMFTileLoadLocalAsync) {
        BMFAsyncTileLayer *asyncTileLayer = [BMFAsyncTileLayer asyncTileLayerWith:model];
        [_mapView addOverlay:asyncTileLayer];
        result(@YES);
        return;
    } else if (model.tileOptions.tileLoadType == kBMFTileLoadLocalSync) {
        BMFSyncTileLayer *syncTileLayer = [BMFSyncTileLayer syncTileLayerWith:model];
        [_mapView addOverlay:syncTileLayer];
        result(@YES);
        return;
    } else {
        result(@NO);
        return;
    }
}

@end

@implementation BMFAddGround

@synthesize _mapView;

- (nonnull NSObject<BMFMapViewHandler> *)initWith:(nonnull BMFMapView *)mapView {
    _mapView = mapView;
    return self;
}

- (void)handleMethodCall:(nonnull FlutterMethodCall *)call result:(nonnull FlutterResult)result {
    BMKGroundOverlay *ground = [BMKGroundOverlay groundOverlayWith:call.arguments];
    if (ground) {
        [_mapView addOverlay:ground];
        result(@YES);
        return;
    } else {
        result(@NO);
    }
}

@end

@implementation BMFRemoveOverlay

@synthesize _mapView;

- (nonnull NSObject<BMFMapViewHandler> *)initWith:(nonnull BMFMapView *)mapView {
    _mapView = mapView;
    return self;
}

- (void)handleMethodCall:(nonnull FlutterMethodCall *)call result:(nonnull FlutterResult)result {
    if (!call.arguments || !call.arguments[@"id"]) {
        result(@NO);
        return;
    }
    NSString *ID = [call.arguments safeObjectForKey:@"id"];
    __weak __typeof__(_mapView) weakMapView = _mapView;
    [_mapView.overlays enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        // 折线
        if ([obj isKindOfClass:[BMKPolyline class]]) {
            BMKPolyline *overlay = (BMKPolyline *)obj;
            if ([ID isEqualToString:overlay.Id]) {
                [weakMapView removeOverlay:obj];
                result(@YES);
                *stop = YES;
                return;
            }
        }
        // 多边形
        if ([obj isKindOfClass:[BMKPolygon class]]) {
            BMKPolygon  *overlay = (BMKPolygon *)obj;
            if ([ID isEqualToString:overlay.Id]) {
                [weakMapView removeOverlay:obj];
                result(@YES);
                *stop = YES;
                return;
            }
        }
        // 弧线
        if ([obj isKindOfClass:[BMKArcline class]]) {
            BMKArcline *overlay = (BMKArcline *)obj;
            if ([ID isEqualToString:overlay.Id]) {
                [weakMapView removeOverlay:obj];
                result(@YES);
                *stop = YES;
                return;
            }
        }
        // 圆
        if ([obj isKindOfClass:[BMKCircle class]]) {
            BMKCircle *overlay = (BMKCircle *)obj;
            if ([ID isEqualToString:overlay.Id]) {
                [weakMapView removeOverlay:obj];
                result(@YES);
                *stop = YES;
                return;
            }
        }
        // ground
        if ([obj isKindOfClass:[BMKGroundOverlay class]]) {
            BMKGroundOverlay *overlay = (BMKGroundOverlay *)obj;
            if ([ID isEqualToString:overlay.Id]) {
                [weakMapView removeOverlay:obj];
                result(@YES);
                *stop = YES;
                return;
            }
        }
        // 瓦片图
        if ([obj isKindOfClass:[BMFURLTileLayer class]]) {
            BMFURLTileLayer *overlay = (BMFURLTileLayer *)obj;
            if ([ID isEqualToString:overlay.Id]) {
                [weakMapView removeOverlay:obj];
                result(@YES);
                *stop = YES;
                return;
            }
        }
        if ([obj isKindOfClass:[BMFAsyncTileLayer class]]) {
            BMFAsyncTileLayer *overlay = (BMFAsyncTileLayer *)obj;
            if ([ID isEqualToString:overlay.Id]) {
                [weakMapView removeOverlay:obj];
                result(@YES);
                *stop = YES;
                return;
            }
        }
        if ([obj isKindOfClass:[BMFSyncTileLayer class]]) {
            BMFSyncTileLayer *overlay = (BMFSyncTileLayer *)obj;
            if ([ID isEqualToString:overlay.Id]) {
                [weakMapView removeOverlay:obj];
                result(@YES);
                *stop = YES;
                return;
            }
        }
        
    }];
}


@end

@implementation BMFRemoveTileOverlay

@synthesize _mapView;

- (nonnull NSObject<BMFMapViewHandler> *)initWith:(nonnull BMFMapView *)mapView {
    _mapView = mapView;
    return self;
}

- (void)handleMethodCall:(nonnull FlutterMethodCall *)call result:(nonnull FlutterResult)result {
    if (!call.arguments || !call.arguments[@"id"]) {
        result(@NO);
        return;
    }
    NSString *ID = [call.arguments safeObjectForKey:@"id"];
    __weak __typeof__(_mapView) weakMapView = _mapView;
    [_mapView.overlays enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        // 瓦片图
        if ([obj isKindOfClass:[BMFURLTileLayer class]]) {
            BMFURLTileLayer *overlay = (BMFURLTileLayer *)obj;
            if ([ID isEqualToString:overlay.Id]) {
                [weakMapView removeOverlay:obj];
                result(@YES);
                *stop = YES;
                return;
            }
        }
        if ([obj isKindOfClass:[BMFAsyncTileLayer class]]) {
            BMFAsyncTileLayer *overlay = (BMFAsyncTileLayer *)obj;
            if ([ID isEqualToString:overlay.Id]) {
                [weakMapView removeOverlay:obj];
                result(@YES);
                *stop = YES;
                return;
            }
        }
        if ([obj isKindOfClass:[BMFSyncTileLayer class]]) {
            BMFSyncTileLayer *overlay = (BMFSyncTileLayer *)obj;
            if ([ID isEqualToString:overlay.Id]) {
                [weakMapView removeOverlay:obj];
                result(@YES);
                *stop = YES;
                return;
            }
        }
        
    }];
}

@end

#pragma mark - Update
@implementation BMFUpdatePolyline

@synthesize _mapView;

- (nonnull NSObject<BMFMapViewHandler> *)initWith:(nonnull BMFMapView *)mapView {
    _mapView = mapView;
    return self;
}

- (void)handleMethodCall:(nonnull FlutterMethodCall *)call result:(nonnull FlutterResult)result {
    if (!call.arguments || !call.arguments[@"id"]) {
        result(@NO);
        return;
    }
    NSString *ID = [call.arguments safeObjectForKey:@"id"];
    __block  BMKPolyline *polyline;
    [_mapView.overlays enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[BMKPolyline class]]) {
            BMKPolyline *line = (BMKPolyline *)obj;
            if ([ID isEqualToString:line.Id]) {
                polyline = line;
                *stop = YES;
            }
        }
    }];
    if (!polyline) {
        result(@NO);
        return;
    }
    NSString *member = [call.arguments safeObjectForKey:@"member"];
    
    //        kBMFColorLine = 0,   ///< 单色折线
    //        kBMFColorsLine,      ///< 多色折线
    //        kBMFTextureLine,     ///< 单纹理折线
    //        kBMFTexturesLine,    ///< 多纹理折线
    //        kBMFDashLine,        ///< 虚线
    //        kBMFMultiDashLine    ///< 多色虚线
    
    if ([member isEqualToString:@"coordinates"]) {
        
        NSArray<NSDictionary *> *coordinates = [call.arguments safeObjectForKey:@"value"];
        if (!coordinates || coordinates.count <= 1) {
            result(@NO);
            return;
        }
        
        CLLocationCoordinate2D coords[coordinates.count];
        for (size_t i = 0, count = coordinates.count; i < count; i++) {
            BMFCoordinate *coord = [BMFCoordinate bmf_modelWith:coordinates[i]];
            coords[i] = [coord toCLLocationCoordinate2D];
        }
        switch (polyline.lineType) {
            case kBMFColorLine:
            case kBMFTextureLine:
            case kBMFDashLine: {
                [polyline setPolylineWithCoordinates:coords count:coordinates.count];
                result(@YES);
            }
                break;
            case kBMFColorsLine:
            case kBMFTexturesLine:
            case kBMFMultiDashLine: {
                if (![call.arguments safeObjectForKey:@"indexs"]) {
                    result(@NO);
                    return;
                }
                NSMutableArray<NSNumber *> *indexs = [NSMutableArray array];
                for (NSNumber *value in call.arguments[@"indexs"]) {
                    [indexs addObject:value];
                }
                [polyline setPolylineWithCoordinates:coords count:coordinates.count textureIndex:indexs];
                
                result(@YES);
            }
                
                break;
            default:
                break;
        }
        
    } else if ([member isEqualToString:@"width"]) {
        BMKPolylineView *view = (BMKPolylineView *)[_mapView viewForOverlay:polyline];
        view.lineWidth = [[call.arguments safeObjectForKey:@"value"] floatValue];
        result(@YES);
        return;
        
    } else if ([member isEqualToString:@"colors"]) {
        NSArray *colorsData = [call.arguments safeObjectForKey:@"value"];
        if (!colorsData || colorsData.count <= 0) {
            result(@NO);
            return;
        }
        BMKPolylineView *view = (BMKPolylineView *)[_mapView viewForOverlay:polyline];
        NSMutableArray<UIColor *> *colors = [NSMutableArray array];
        for (NSString *color in colorsData) {
            [colors addObject:[UIColor fromColorString:color]];
        }
        if (polyline.lineType == kBMFColorsLine || polyline.lineType == kBMFMultiDashLine) {
            view.colors = [colors copy];
            result(@YES);
            return;
            
        } else if (polyline.lineType ==kBMFColorLine || polyline.lineType == kBMFDashLine) {
            view.strokeColor = [colors firstObject];
            result(@YES);
            return;
        } else {
            NSLog(@"ios - 纹理折线不支持更新colors");
            result(@NO);
            return;
        }
        
        
    } else if ([member isEqualToString:@"lineDashType"]) {
        if (polyline.lineType == kBMFTextureLine || polyline.lineType == kBMFTexturesLine) {
            NSLog(@"ios - 纹理折线不支持虚线类型");
            result(@NO);
            return;
        }
        BMKPolylineView *view = (BMKPolylineView *)[_mapView viewForOverlay:polyline];
        view.lineDashType = [[call.arguments safeObjectForKey:@"value"] intValue];
        result(@YES);
        return;
        
    } else if ([member isEqualToString:@"lineCapType"]) {
        BMKPolylineView *view = (BMKPolylineView *)[_mapView viewForOverlay:polyline];
        if (view.lineDashType != kBMKLineDashTypeNone) {
            NSLog(@"ios - lineCapType不支持虚线");
            result(@NO);
            return;
        }
        view.lineCapType = [[call.arguments safeObjectForKey:@"value"] intValue];
        result(@YES);
        return;
        
    } else if ([member isEqualToString:@"lineJoinType"]) {
        if (polyline.lineType == kBMFDashLine || polyline.lineType == kBMFMultiDashLine) {
            NSLog(@"ios - lineJoinType不支持虚线");
            result(@NO);
            return;
        }
        BMKPolylineView *view = (BMKPolylineView *)[_mapView viewForOverlay:polyline];
        view.lineJoinType = [[call.arguments safeObjectForKey:@"value"] intValue];
        result(@YES);
        return;
        
    } else if ([member isEqualToString:@"isThined"]) {
        polyline.isThined = [[call.arguments safeObjectForKey:@"value"] boolValue];
        result(@YES);
        return;
        
    } else {
        NSLog(@"ios -polyline- 暂不支持设置%@", member);
        result(@YES);
        return;
    }
    
}

@end


@implementation  BMFUpdateArcline

@synthesize _mapView;

- (nonnull NSObject<BMFMapViewHandler> *)initWith:(nonnull BMFMapView *)mapView {
    _mapView = mapView;
    return self;
}

- (void)handleMethodCall:(nonnull FlutterMethodCall *)call result:(nonnull FlutterResult)result {
    if (!call.arguments || !call.arguments[@"id"]) {
        result(@NO);
        return;
    }
    NSString *ID = [call.arguments safeObjectForKey:@"id"];
    __block BMKArcline *arcline;
    [_mapView.overlays enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[BMKArcline class]]) {
            BMKArcline *aline = (BMKArcline *)obj;
            if ([ID isEqualToString:aline.Id]) {
                arcline = aline;
                *stop = YES;
            }
        }
    }];
    if (!arcline) {
        result(@NO);
        return;
    }
    NSString *member = [call.arguments safeObjectForKey:@"member"];
    
    if ([member isEqualToString:@"coordinates"]) {
        NSArray<NSDictionary *> *coordinates = [call.arguments safeObjectForKey:@"value"];
        if (!coordinates || coordinates.count <= 2) {
            result(@NO);
            return;
        }
        
        CLLocationCoordinate2D coords[coordinates.count];
        for (size_t i = 0, count = coordinates.count; i < count; i++) {
            BMFCoordinate *coord = [BMFCoordinate bmf_modelWith:coordinates[i]];
            coords[i] = [coord toCLLocationCoordinate2D];
        }
        [arcline setArclineWithCoordinates:coords];
        result(@YES);
    } else if ([member isEqualToString:@"width"]){
        BMKArclineView *view = (BMKArclineView *)[_mapView viewForOverlay:arcline];
        view.lineWidth = [[call.arguments safeObjectForKey:@"value"] floatValue];
        result(@YES);
        return;
    } else if ([member isEqualToString:@"color"]){
        BMKArclineView *view = (BMKArclineView *)[_mapView viewForOverlay:arcline];
        NSString *colorStr = [call.arguments safeObjectForKey:@"value"];
        view.strokeColor = [UIColor fromColorString:colorStr];
        result(@YES);
    } else if ([member isEqualToString:@"lineDashType"]){
        BMKArclineView *view = (BMKArclineView *)[_mapView viewForOverlay:arcline];
        view.lineDashType = [[call.arguments safeObjectForKey:@"value"] intValue];
        result(@YES);
        return;
    } else {
        NSLog(@"ios -arcline- 暂不支持设置%@", member);
        result(@YES);
        return;
    }
}

@end


@implementation BMFUpdateCircle

@synthesize _mapView;

- (nonnull NSObject<BMFMapViewHandler> *)initWith:(nonnull BMFMapView *)mapView {
    _mapView = mapView;
    return self;
}

- (void)handleMethodCall:(nonnull FlutterMethodCall *)call result:(nonnull FlutterResult)result {
    if (!call.arguments || !call.arguments[@"id"]) {
        result(@NO);
        return;
    }
    NSString *ID = [call.arguments safeObjectForKey:@"id"];
    __block BMKCircle *circle;
    [_mapView.overlays enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[BMKCircle class]]) {
            BMKCircle *aCircle = (BMKCircle *)obj;
            if ([ID isEqualToString:aCircle.Id]) {
                circle = aCircle;
                *stop = YES;
            }
        }
    }];
    if (!circle) {
        result(@NO);
        return;
    }
    NSString *member = [call.arguments safeObjectForKey:@"member"];
    
    if ([member isEqualToString:@"center"]) {
        BMFCoordinate *center = [BMFCoordinate bmf_modelWith:[call.arguments safeObjectForKey:@"value"]];
        [circle setCoordinate:[center toCLLocationCoordinate2D]];
        result(@YES);
    } else if ([member isEqualToString:@"radius"]) {
        double radius = [[call.arguments safeObjectForKey:@"value"] doubleValue];
        [circle setRadius:radius];
        result(@YES);
        return;
    } else if ([member isEqualToString:@"width"]) {
        BMKCircleView *view = (BMKCircleView *)[_mapView viewForOverlay:circle];
        view.lineWidth = [[call.arguments safeObjectForKey:@"value"] floatValue];
        result(@YES);
        return;
    } else if ([member isEqualToString:@"strokeColor"]) {
        BMKCircleView *view = (BMKCircleView *)[_mapView viewForOverlay:circle];
        NSString *colorStr = [call.arguments safeObjectForKey:@"value"];
        view.strokeColor = [UIColor fromColorString:colorStr];
        result(@YES);
    } else if ([member isEqualToString:@"fillColor"]) {
        BMKCircleView *view = (BMKCircleView *)[_mapView viewForOverlay:circle];
        NSString *colorStr = [call.arguments safeObjectForKey:@"value"];
        view.fillColor = [UIColor fromColorString:colorStr];
        result(@YES);
    } else if ([member isEqualToString:@"lineDashType"]) {
        BMKCircleView *view = (BMKCircleView *)[_mapView viewForOverlay:circle];
        view.lineDashType = [[call.arguments safeObjectForKey:@"value"] intValue];
        result(@YES);
        return;
    } else if ([member isEqualToString:@"hollowShapes"]) {
        NSArray<id<BMKOverlay>> *hollowShapes = [BMFHollowShapeModel fromDictionaryArray:(NSArray<NSDictionary *> *)[call.arguments safeObjectForKey:@"value"]];
        circle.hollowShapes = hollowShapes;
        result(@YES);
        return;
        
    } else {
        NSLog(@"ios -circle- 暂不支持设置%@", member);
        result(@YES);
        return;
    }
}

@end


@implementation BMFUpdatePolygon

@synthesize _mapView;

- (nonnull NSObject<BMFMapViewHandler> *)initWith:(nonnull BMFMapView *)mapView {
    _mapView = mapView;
    return self;
}

- (void)handleMethodCall:(nonnull FlutterMethodCall *)call result:(nonnull FlutterResult)result {
    if (!call.arguments || !call.arguments[@"id"]) {
        result(@NO);
        return;
    }
    NSString *ID = [call.arguments safeObjectForKey:@"id"];
    __block BMKPolygon *polygon;
    [_mapView.overlays enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[BMKPolygon class]]) {
            BMKPolygon *aPolygon = (BMKPolygon *)obj;
            if ([ID isEqualToString:aPolygon.Id]) {
                polygon = aPolygon;
                *stop = YES;
            }
        }
    }];
    if (!polygon) {
        result(@NO);
        return;
    }
    NSString *member = [call.arguments safeObjectForKey:@"member"];
    
    if ([member isEqualToString:@"coordinates"]) {
        NSArray<NSDictionary *> *coordinates = [call.arguments safeObjectForKey:@"value"];
        if (!coordinates || coordinates.count <= 1) {
            result(@NO);
            return;
        }
        
        CLLocationCoordinate2D coords[coordinates.count];
        for (size_t i = 0, count = coordinates.count; i < count; i++) {
            BMFCoordinate *coord = [BMFCoordinate bmf_modelWith:coordinates[i]];
            coords[i] = [coord toCLLocationCoordinate2D];
        }
        [polygon setPolygonWithCoordinates:coords count:coordinates.count];
        result(@YES);
        
    } else if ([member isEqualToString:@"width"]) {
        BMKPolygonView *view = (BMKPolygonView *)[_mapView viewForOverlay:polygon];
        view.lineWidth = [[call.arguments safeObjectForKey:@"value"] floatValue];
        result(@YES);
        return;
    } else if ([member isEqualToString:@"strokeColor"]) {
        BMKPolygonView *view = (BMKPolygonView *)[_mapView viewForOverlay:polygon];
        NSString *colorStr = [call.arguments safeObjectForKey:@"value"];
        view.strokeColor = [UIColor fromColorString:colorStr];
        result(@YES);
    } else if ([member isEqualToString:@"fillColor"]) {
        BMKPolygonView *view = (BMKPolygonView *)[_mapView viewForOverlay:polygon];
        NSString *colorStr = [call.arguments safeObjectForKey:@"value"];
        view.fillColor = [UIColor fromColorString:colorStr];
        result(@YES);
    } else if ([member isEqualToString:@"lineDashType"]) {
        BMKPolygonView *view = (BMKPolygonView *)[_mapView viewForOverlay:polygon];
        view.lineDashType = [[call.arguments safeObjectForKey:@"value"] intValue];
        result(@YES);
        return;
    } else if ([member isEqualToString:@"hollowShapes"]) {
        NSArray<id<BMKOverlay>> *hollowShapes = [BMFHollowShapeModel fromDictionaryArray:(NSArray<NSDictionary *> *)[call.arguments safeObjectForKey:@"value"]];
        polygon.hollowShapes = hollowShapes;
        result(@YES);
        return;
        
    } else {
        NSLog(@"ios -polygon- 暂不支持设置%@", member);
        result(@YES);
        return;
    }
    
}

@end
