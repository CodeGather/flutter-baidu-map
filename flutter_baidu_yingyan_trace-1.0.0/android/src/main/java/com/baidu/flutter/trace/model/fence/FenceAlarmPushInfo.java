package com.baidu.flutter.trace.model.fence;

/**
 * 本地、服务端围栏报警推送消息
 *
 * @author baidu
 */
public class FenceAlarmPushInfo {

    /**
     * 围栏编号
     */
    public long fenceId;

    /**
     * 围栏名称
     */
    public String fenceName;

    /**
     * 监控对象
     */
    public String monitoredPerson;

    /**
     * 监控动作
     */
    public int monitoredAction;

    /**
     * 当前报警点轨迹信息
     */
    public AlarmPoint currentPoint;

    /**
     * 上一个轨迹点信息
     */
    public AlarmPoint prePoint;

    /**
     * 获取围栏编号
     *
     * @return
     */
    public long getFenceId() {
        return fenceId;
    }

    public void setFenceId(long fenceId) {
        this.fenceId = fenceId;
    }

    /**
     * 获取围栏名称
     *
     * @return
     */
    public String getFenceName() {
        return fenceName;
    }

    public void setFenceName(String fenceName) {
        this.fenceName = fenceName;
    }

    /**
     * 获取监控对象
     *
     * @return
     */
    public String getMonitoredPerson() {
        return monitoredPerson;
    }

    public void setMonitoredPerson(String monitoredPerson) {
        this.monitoredPerson = monitoredPerson;
    }

    /**
     * 获取监控动作
     *
     * @return
     */
    public int getMonitoredAction() {
        return monitoredAction;
    }

    public void setMonitoredAction(int monitoredAction) {
        this.monitoredAction = monitoredAction;
    }

    /**
     * 获取当前报警点轨迹信息
     *
     * @return
     */
    public AlarmPoint getCurrentPoint() {
        return currentPoint;
    }

    public void setCurrentPoint(AlarmPoint currentPoint) {
        this.currentPoint = currentPoint;
    }

    /**
     * 获取上一个轨迹点信息
     *
     * @return
     */
    public AlarmPoint getPrePoint() {
        return prePoint;
    }

    public void setPrePoint(AlarmPoint prePoint) {
        this.prePoint = prePoint;
    }

    public FenceAlarmPushInfo() {
        super();
    }

    /**
     * @param fenceId         围栏编号
     * @param fenceName       围栏名称
     * @param monitoredPerson 监控对象
     * @param monitoredAction 监控动作
     * @param currentPoint    当前报警点轨迹信息
     * @param prePoint        上一个轨迹点信息
     */
    public FenceAlarmPushInfo(long fenceId, String fenceName, String monitoredPerson,
                              int monitoredAction,
                              com.baidu.trace.api.fence.AlarmPoint currentPoint,
                              com.baidu.trace.api.fence.AlarmPoint prePoint) {
        super();
        this.fenceId = fenceId;
        this.fenceName = fenceName;
        this.monitoredPerson = monitoredPerson;
        this.monitoredAction = monitoredAction;
        if (currentPoint != null) {
            this.currentPoint = AlarmPoint.fromSDKObject(currentPoint);
        }

        if (prePoint != null) {
            this.prePoint = AlarmPoint.fromSDKObject(currentPoint);
        }
    }
    
    public static FenceAlarmPushInfo fromSDKObject(com.baidu.trace.api.fence.FenceAlarmPushInfo fenceAlarmPushInfo) {
        if (fenceAlarmPushInfo == null) {
            return null;
        }
        FenceAlarmPushInfo fenceAlarmPushInfoTmp = new FenceAlarmPushInfo();
        fenceAlarmPushInfoTmp.setFenceId(fenceAlarmPushInfo.getFenceId());
        fenceAlarmPushInfoTmp.setFenceName(fenceAlarmPushInfo.getFenceName());
        fenceAlarmPushInfoTmp.setMonitoredAction(fenceAlarmPushInfo.getMonitoredAction().ordinal());
        fenceAlarmPushInfoTmp.setMonitoredPerson(fenceAlarmPushInfo.getMonitoredPerson());
        fenceAlarmPushInfoTmp.setCurrentPoint(AlarmPoint.fromSDKObject(fenceAlarmPushInfo.getCurrentPoint()));
        fenceAlarmPushInfoTmp.setPrePoint(AlarmPoint.fromSDKObject(fenceAlarmPushInfo.getPrePoint()));
        return fenceAlarmPushInfoTmp;
    }

    @Override
    public String toString() {
        return "FenceAlarmPushInfo [fenceId=" + fenceId + ", fenceName=" + fenceName
                + ", monitoredPerson="
                + monitoredPerson + ", monitoredAction=" + monitoredAction + ", currentPoint="
                + currentPoint
                + ", prePoint=" + prePoint + "]";
    }

}
