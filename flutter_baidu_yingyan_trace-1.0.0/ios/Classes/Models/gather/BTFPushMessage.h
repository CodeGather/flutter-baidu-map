//
//  BTFPushMessage.h
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/28.
//

#import "BTFModel.h"

@class BTFAlarmPoint;
@class BTKPushMessage;
@class BTKPushMessageFenceAlarmContent;

NS_ASSUME_NONNULL_BEGIN

@interface BTFFenceAlarmPushInfo : BTFModel
/// 围栏编号
@property (nonatomic, assign) NSUInteger fenceId;

/// 围栏名称
@property (nonatomic, copy) NSString *fenceName;

/// 监控对象
@property (nonatomic, copy) NSString *monitoredPerson;

/// 监控动作
/// BTKFenceMonitoredObjectActionType 原生sdk初始值为1
@property (nonatomic, assign) NSUInteger monitoredAction;

/// 当前报警点轨迹信息
@property (nonatomic, strong) BTFAlarmPoint *currentPoint;

/// 上一个轨迹点信息
@property (nonatomic, strong) BTFAlarmPoint *prePoint;

+ (instancetype)from:(BTKPushMessageFenceAlarmContent *)content;

@end

@interface BTFPushMessage : BTFModel
/// 消息类型
@property (nonatomic, assign) int messageType;

/// 其他消息（开发者自定义消息、系统预留消息）
@property (nonatomic, copy) NSString *message;

/// 围栏报警推送信息（本地围栏、服务端围栏）
@property (nonatomic, strong) BTFFenceAlarmPushInfo *fenceAlarmPushInfo;

+ (instancetype)from:(BTKPushMessage *)pushMessage;

@end

NS_ASSUME_NONNULL_END
