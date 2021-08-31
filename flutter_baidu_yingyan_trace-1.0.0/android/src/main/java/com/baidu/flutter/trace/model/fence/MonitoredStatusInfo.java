package com.baidu.flutter.trace.model.fence;

/**
 * 监控状态信息（封装查询监控对象状态时返回的状态信息）
 *
 * @author baidu
 */
public final class MonitoredStatusInfo {

    /**
     * 围栏编号
     */
    private long fenceId;

    /**
     * 监控状态
     */
    private int monitoredStatus = MonitoredStatus.unknown.ordinal();

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
     * 获取监控状态
     *
     * @return
     */
    public int getMonitoredStatus() {
        return monitoredStatus;
    }

    public void setMonitoredStatus(int monitoredStatus) {
        this.monitoredStatus = monitoredStatus;
    }

    public MonitoredStatusInfo() {
    }

    /**
     * @param fenceId         围栏标号
     * @param monitoredStatus 监控状态
     */
    public MonitoredStatusInfo(long fenceId, int monitoredStatus) {
        this.fenceId = fenceId;
        this.monitoredStatus = monitoredStatus;
    }

    public static MonitoredStatusInfo fromSDKObject(
            com.baidu.trace.api.fence.MonitoredStatusInfo monitoredStatusInfo) {
        if (monitoredStatusInfo == null) {
            return null;
        }
        MonitoredStatusInfo monitoredStatusInfoTmp = new MonitoredStatusInfo();
        monitoredStatusInfoTmp.setFenceId(monitoredStatusInfo.getFenceId());
        if (monitoredStatusInfo.getMonitoredStatus() != null) {
            monitoredStatusInfoTmp
                    .setMonitoredStatus(monitoredStatusInfo.getMonitoredStatus().ordinal());
        }
        return monitoredStatusInfoTmp;
    }

    @Override
    public String toString() {
        return "MonitoredStatusInfo [fenceId=" + fenceId + ", monitoredStatus=" + monitoredStatus
                + "]";
    }

}
