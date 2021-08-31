//
//  BTFYingYanHandler.h
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/1.
//

#import <Flutter/Flutter.h>

NS_ASSUME_NONNULL_BEGIN

@protocol BTFYingYanHandler <NSObject>

@required

/// chennel
@property (nonatomic, weak) FlutterMethodChannel *_channel;

/// flutter --> ios
- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result;

/// 配置channel
- (void)configChannel:(FlutterMethodChannel *)channel;

@end

NS_ASSUME_NONNULL_END


