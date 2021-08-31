//
//  BTFPushMessage.m
//  flutter_baidu_yingyan_trace
//
//  Created by Zhang,Baojin on 2020/12/28.
//

#import "BTFPushMessage.h"
#import <BaiduTraceSDK/BaiduTraceSDK.h>
#import "BTFFenceResult.h"
#import "BTFDefine.h"
@implementation BTFFenceAlarmPushInfo
+ (instancetype)from:(BTKPushMessageFenceAlarmContent *)content {
    if (!content) return nil;
    BTFFenceAlarmPushInfo *info = [BTFFenceAlarmPushInfo new];
    info.fenceId = content.fenceID;
    info.fenceName = content.fenceName;
    info.monitoredPerson = content.monitoredObject;
    // iOS原生SDK初始值为1
    info.monitoredAction = content.actionType - 1;
    info.currentPoint = [BTFAlarmPoint from:content.currentPoint];
    info.prePoint = [BTFAlarmPoint from:content.previousPoint];
    return info;
}


@end

@implementation BTFPushMessage
+ (instancetype)from:(BTKPushMessage *)pushMessage {
    if (!pushMessage) return nil;
    BTFPushMessage *message = [BTFPushMessage new];
    message.messageType = pushMessage.type;
    // 不是地理围栏的报警，不解析
    if (pushMessage.type == 0x03 || pushMessage.type == 0x04) {
        BTKPushMessageFenceAlarmContent *content = (BTKPushMessageFenceAlarmContent *)pushMessage.content;
        message.fenceAlarmPushInfo = [BTFFenceAlarmPushInfo from:content];
        NSString *fenceName = [NSString stringWithFormat:@"「%@」", content.fenceName];
        NSString *monitoredObject = [NSString stringWithFormat:@"「%@」", content.monitoredObject];
        NSString *action = nil;
        if (content.actionType == BTK_FENCE_MONITORED_OBJECT_ACTION_TYPE_ENTER) {
          action = @"进入";
        } else {
          action = @"离开";
        }
        NSString *fenceType = nil;
        if (pushMessage.type == 0x03) {
          fenceType = @"服务端围栏";
        } else {
          fenceType = @"客户端围栏";
        }
        // 通过触发报警的轨迹点，解析出触发报警的时间
        BTKFenceAlarmLocationPoint *currentPoint = content.currentPoint;
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSDate *alarmDate = [NSDate dateWithTimeIntervalSince1970:currentPoint.loctime];
        NSString *alarmDateStr = [dateFormatter stringFromDate:alarmDate];

        NSString *pushMessageString = [NSString stringWithFormat:@"终端 %@ 在 %@ %@ %@%@", monitoredObject, alarmDateStr, action, fenceType, fenceName];
        message.message = pushMessageString;
        NSLog(@"推送消息: %@", pushMessageString);
        // TODO：待发起本地通知（开发者来做？待定！！！）
        return message;
    }
    return message;
}
@end
