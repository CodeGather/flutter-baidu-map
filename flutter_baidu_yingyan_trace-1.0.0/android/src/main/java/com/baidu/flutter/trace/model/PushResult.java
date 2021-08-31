package com.baidu.flutter.trace.model;

import com.baidu.flutter.trace.model.fence.FenceAlarmPushInfo;

public class PushResult {
    
    private int messageType;

    /**
     * 其他消息（开发者自定义消息、系统预留消息），v3.0.0版本该字段为空
     */
    private String message;

    /**
     * 围栏报警推送信息（本地围栏、服务端围栏）
     */
    private FenceAlarmPushInfo fenceAlarmPushInfo;
    
    public PushResult() {
        
    }
    
    public PushResult(int messageType, String message,
                      com.baidu.trace.api.fence.FenceAlarmPushInfo fenceAlarmPushInfo) {
        this.messageType = messageType;
        this.message = message;
        if (fenceAlarmPushInfo != null) {
            this.fenceAlarmPushInfo = FenceAlarmPushInfo.fromSDKObject(fenceAlarmPushInfo);
        }
    }

    public int getMessageType() {
        return messageType;
    }

    public void setMessageType(int messageType) {
        this.messageType = messageType;
    }

    /**
     * 获取其他消息（v3.0.0版本该字段为空）
     * 
     * @return
     */
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    /**
     * 获取围栏报警推送消息（本地围栏、服务端围栏）
     * 
     * @return
     */
    public FenceAlarmPushInfo getFenceAlarmPushInfo() {
        return fenceAlarmPushInfo;
    }

    public void setFenceAlarmPushInfo(FenceAlarmPushInfo fenceAlarmPushInfo) {
        this.fenceAlarmPushInfo = fenceAlarmPushInfo;
    }

    @Override
    public String toString() {
        return "PushMessage [fenceAlarmPushInfo=" + fenceAlarmPushInfo + "]";
    }

}
