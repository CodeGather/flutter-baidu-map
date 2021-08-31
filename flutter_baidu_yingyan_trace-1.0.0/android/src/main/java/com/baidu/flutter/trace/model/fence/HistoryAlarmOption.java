package com.baidu.flutter.trace.model.fence;

import java.util.List;

import com.baidu.flutter.trace.model.BaseOption;
import com.baidu.trace.api.fence.HistoryAlarmRequest;
import com.baidu.trace.model.CoordType;

/**
 * 查询围栏历史报警请求参数
 *
 * @author baidu
 */
public final class HistoryAlarmOption extends BaseOption {

    /**
     * 开始时间
     */
    private long startTime;

    /**
     * 结束时间
     */
    private long endTime;

    /**
     * 监控对象
     */
    private String monitoredPerson;

    /**
     * 围栏编号列表
     */
    private List<Long> fenceIds;

    /**
     * 返回结果的坐标类型，默认为百度经纬度（暂只支持服务端围栏）
     * <p>
     * <pre>
     * 该字段用于控制返回结果中坐标的类型。可选值为：
     * bd09ll：百度经纬度坐标；
     * gcj02：国测局加密坐标；
     *
     * 注：该字段在国外无效，国外均返回wgs84坐标
     * </pre>
     */
    private int coordTypeOutput = CoordType.bd09ll.ordinal();

    /**
     * 围栏类型
     */
    private int fenceType;

    public long getStartTime() {
        return startTime;
    }

    /**
     * 设置开始时间
     *
     * @param startTime
     */
    public void setStartTime(long startTime) {
        this.startTime = startTime;
    }

    public long getEndTime() {
        return endTime;
    }

    /**
     * 设置结束时间
     *
     * @param endTime
     */
    public void setEndTime(long endTime) {
        this.endTime = endTime;
    }

    public String getMonitoredPerson() {
        return monitoredPerson;
    }

    /**
     * 设置监控对象
     *
     * @param monitoredPerson
     */
    public void setMonitoredPerson(String monitoredPerson) {
        this.monitoredPerson = monitoredPerson;
    }

    public List<Long> getFenceIds() {
        return fenceIds;
    }

    /**
     * 设置围栏编号列表
     *
     * @param fenceIds
     */
    public void setFenceIds(List<Long> fenceIds) {
        this.fenceIds = fenceIds;
    }

    public int getCoordTypeOutput() {
        return coordTypeOutput;
    }

    /**
     * 设置返回信息的坐标类型
     *
     * @param coordTypeOutput
     */
    public void setCoordTypeOutput(int coordTypeOutput) {
        if (FenceType.server.ordinal() == fenceType) {
            this.coordTypeOutput = coordTypeOutput;
        }
    }

    public int getFenceType() {
        return fenceType;
    }
    
    public HistoryAlarmOption() {
        super();
    }

    /**
     * 查询历史报警构造方法
     *
     * @param tag             请求标识
     * @param serviceId       轨迹服务ID
     * @param startTime       开始时间
     * @param endTime         结束时间
     * @param monitoredPerson 监控对象
     * @param coordTypeOutput 返回信息的坐标类型（暂只支持服务端围栏）
     * @param fenceIds        围栏编号列表
     * @return
     */
    public HistoryAlarmOption(int tag, long serviceId, long startTime, long endTime,
                               String monitoredPerson,
                               List<Long> fenceIds, int coordTypeOutput, int fenceType) {
        super(tag, serviceId);
        this.startTime = startTime;
        this.endTime = endTime;
        this.monitoredPerson = monitoredPerson;
        this.fenceIds = fenceIds;
        this.coordTypeOutput = coordTypeOutput;
        this.fenceType = fenceType;
    }

    public HistoryAlarmRequest toHistoryAlarmRequest() {
        HistoryAlarmRequest historyAlarmRequest = null;
        if (fenceType == FenceType.local.ordinal()) {
            historyAlarmRequest = com.baidu.trace.api.fence.HistoryAlarmRequest
                    .buildLocalRequest(tag, serviceId, startTime, endTime, monitoredPerson,
                            fenceIds);
        } else if (fenceType == FenceType.server.ordinal()) {
            historyAlarmRequest = com.baidu.trace.api.fence.HistoryAlarmRequest
                    .buildServerRequest(tag, serviceId, startTime, endTime, monitoredPerson,
                            fenceIds, CoordType.values()[coordTypeOutput]);
        }
        return historyAlarmRequest;
    }

    @Override
    public String toString() {
        return "HistoryAlarmRequest [tag=" + tag + ", serviceId=" + serviceId + ", startTime="
                + startTime
                + ", endTime=" + endTime + ", monitoredPerson=" + monitoredPerson + ", fenceIds="
                + fenceIds
                + ", coordTypeOutput=" + coordTypeOutput + ", fenceType=" + fenceType + "]";
    }

}
