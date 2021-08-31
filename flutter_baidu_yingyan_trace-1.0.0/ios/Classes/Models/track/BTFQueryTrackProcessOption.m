//
//  BTFQueryTrackProcessOption.m
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/1.
//

#import "BTFQueryTrackProcessOption.h"
#import <BaiduTraceSDK/BaiduTraceSDK.h>

@implementation BTFQueryTrackProcessOption
- (BTKQueryTrackProcessOption *)toBTKQueryTrackProcessOption {
    BTKQueryTrackProcessOption *option = [BTKQueryTrackProcessOption new];
 /// 纠偏时是否需要去噪，TRUE代表去噪
    option.denoise = self.denoise;

    /// 纠偏时是否需要抽稀，TRUE代表抽稀。
    /// 该选项只有在查询行程信息的请求BTKQueryHistoryTrackRequest中有效。
    /// 在BTKQueryTrackLatestPointRequest和BTKQueryTrackDistanceRequest中的processOption选项中设置此属性没有效果。
    option.vacuate = self.vacuate;

    /// 纠偏时是否需要绑路，TRUE代表绑路
    option.mapMatch = self.mapMatch;


    /// 纠偏时的定位精度过滤阀值，用于过滤掉定位精度较差的轨迹点。
    /// 0代表不过滤，100代表过滤掉定位精度大于100米的轨迹点。
    /// 例如：若只需保留 GPS 定位点，则建议设为：20；若需保留 GPS 和 Wi-Fi 定位点，去除基站定位点，则建议设为：100
    option.radiusThreshold = self.radiusThreshold;

    /// 纠偏时的交通方式，鹰眼将根据不同交通工具选择不同的纠偏策略
    option.transportMode = self.transportMode;
    return option;
}
@end
