package com.baidu.flutter.trace.model.fence;

/**
 * 围栏报警信息（封装查询围栏历史报警时返回的报警信息）
 *
 * @author baidu
 */
public final class FenceAlarmInfo extends FenceAlarmPushInfo {

    public FenceAlarmInfo() {
    }

    /**
     * @param fenceId         围栏编号
     * @param fenceName       围栏名称
     * @param monitoredPerson 监控对象
     * @param monitoredAction 监控动作
     * @param currentPoint    当前报警点轨迹信息
     * @param prePoint        上一个轨迹点信息
     */
    public FenceAlarmInfo(long fenceId, String fenceName, String monitoredPerson,
                          int monitoredAction,
                          com.baidu.trace.api.fence.AlarmPoint currentPoint,
                          com.baidu.trace.api.fence.AlarmPoint prePoint) {
        super(fenceId, fenceName, monitoredPerson, monitoredAction, currentPoint, prePoint);
    }

    public static FenceAlarmInfo fromSDKObject(
            com.baidu.trace.api.fence.FenceAlarmInfo fenceAlarmInfo) {
        if (fenceAlarmInfo == null) {
            return null;
        }
        FenceAlarmInfo fenceAlarmInfoTmp = new FenceAlarmInfo();
        fenceAlarmInfoTmp.setFenceId(fenceAlarmInfo.getFenceId());
        fenceAlarmInfoTmp.setFenceName(fenceAlarmInfo.getFenceName());
        fenceAlarmInfoTmp.setMonitoredPerson(fenceAlarmInfo.getMonitoredPerson());
        if (fenceAlarmInfo.getMonitoredAction() != null) {
            fenceAlarmInfoTmp.setMonitoredAction(fenceAlarmInfo.getMonitoredAction().ordinal());
        }
        fenceAlarmInfoTmp
                .setCurrentPoint(AlarmPoint.fromSDKObject(fenceAlarmInfo.getCurrentPoint()));
        fenceAlarmInfoTmp.setPrePoint(AlarmPoint.fromSDKObject(fenceAlarmInfo.getPrePoint()));
        return fenceAlarmInfoTmp;
    }

    @Override
    public String toString() {
        return "FenceAlarmInfo [fenceId=" + fenceId + ", fenceName=" + fenceName
                + ", monitoredPerson="
                + monitoredPerson + ", monitoredAction=" + monitoredAction + ", currentPoint="
                + currentPoint
                + ", prePoint=" + prePoint + "]";
    }

}
