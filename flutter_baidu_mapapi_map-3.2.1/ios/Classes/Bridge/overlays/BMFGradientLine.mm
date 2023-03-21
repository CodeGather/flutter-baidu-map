//
//  BMFGradientLine.m
//  flutter_baidu_mapapi_map
//
//  Created by zhangbaojin on 2021/12/29.
//

#import "BMFGradientLine.h"
#import <objc/runtime.h>
#import <flutter_baidu_mapapi_base/BMFMapModels.h>

static const void *gradientLineModelKey = &gradientLineModelKey;

@implementation BMKGradientLine (BMFGradientLine)

+ (nullable instancetype)overlayWithDictionary:(nullable NSDictionary *)dic {
    if (!dic) return nil;

    BMFGradientLineModel *model = [BMFGradientLineModel bmf_modelWith:dic];
    if (model.coordinates.count <= 1) return nil;

    BMKLineDirectionCross180Type cross180Type = kBMKLineDirectionCross180TypeNone;
    if (model.lineDirectionCross180 == 1) {
        cross180Type = kBMKLineDirectionCross180TypeEAST_TO_WEST;
    } else if (model.lineDirectionCross180 == 2) {
        cross180Type = kBMKLineDirectionCross180TypeWEST_TO_EAST;
    }
    
    size_t _coordsCount = model.coordinates.count;
    CLLocationCoordinate2D *coords = new CLLocationCoordinate2D[_coordsCount];
    for (size_t i = 0; i < _coordsCount; i++) {
     coords[i] = [model.coordinates[i] toCLLocationCoordinate2D];
    }
 
    BMKGradientLine *gradientLine = [BMKGradientLine gradientLineWithCoordinates:coords count:_coordsCount drawIndexs:model.indexs];
    delete [] coords;
    
    gradientLine.lineDirectionCross180 = cross180Type;
    gradientLine.flutterModel = model;
    return gradientLine;
}

- (BMFModel *)flutterModel {
    return objc_getAssociatedObject(self, gradientLineModelKey);
}

- (void)setFlutterModel:(BMFModel * _Nonnull)flutterModel {
    objc_setAssociatedObject(self, gradientLineModelKey, flutterModel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
