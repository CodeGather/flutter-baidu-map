package com.baidu.flutter.trace.model.fence;

import java.util.ArrayList;
import java.util.List;

import com.baidu.flutter.trace.model.BaseResult;

/**
 * 查询监控对象状态响应结果
 *
 * @author baidu
 */
public final class MonitoredStatusResult extends BaseResult {

    /**
     * 所有结果条数（忽略pageIndex，pageSize后的本次查询总围栏个数）
     * V3.1.0新增字段
     */
    private int totalSize;

    /**
     * 当前页返回的结果条数
     * V3.1.0版本变更
     */
    private int size;

    /**
     * 围栏类型
     */
    private int fenceType;

    /**
     * 监控状态信息列表
     */
    private List<MonitoredStatusInfo> monitoredStatusInfos;

    /**
     * 获取所有结果条数（忽略pageIndex，pageSize后的本次查询总围栏个数）
     * V3.1.0新增字段
     *
     * @return 所有结果条数（忽略pageIndex，pageSize后的本次查询总围栏个数）
     */
    public int getTotalSize() {
        return totalSize;
    }

    /**
     * 设置所有结果条数（忽略pageIndex，pageSize后的本次查询总围栏个数）
     * V3.1.0新增字段
     *
     * @param totalSize 所有结果条数（忽略pageIndex，pageSize后的本次查询总围栏个数）
     */
    public void setTotalSize(int totalSize) {
        this.totalSize = totalSize;
    }

    /**
     * 获取当前页返回的结果条数
     * V3.1.0版本变更
     *
     * @return 当前页返回的结果条数
     */
    public int getSize() {
        return size;
    }

    /**
     * 设置当前页返回的结果条数
     * V3.1.0版本变更
     *
     * @param size 当前页返回的结果条数
     */
    public void setSize(int size) {
        this.size = size;
    }

    /**
     * 获取围栏类型
     *
     * @return 围栏类型
     */
    public int getFenceType() {
        return fenceType;
    }

    /**
     * 设置围栏类型
     *
     * @param fenceType 围栏类型
     */
    public void setFenceType(int fenceType) {
        this.fenceType = fenceType;
    }

    /**
     * 获取监控信息列表
     *
     * @return 监控信息列表
     */
    public List<MonitoredStatusInfo> getMonitoredStatusInfos() {
        return monitoredStatusInfos;
    }

    /**
     * 设置监控信息列表
     *
     * @param monitoredStatusInfos 监控信息列表
     */
    public void setMonitoredStatusInfos(List<MonitoredStatusInfo> monitoredStatusInfos) {
        this.monitoredStatusInfos = monitoredStatusInfos;
    }

    /**
     * 查询围栏监控对象状态请求构造方法
     *
     * @param tag       响应标识
     * @param status    状态码
     * @param message   状态消息
     * @param fenceType 围栏类型
     */
    public MonitoredStatusResult(int tag, int status, String message, int fenceType) {
        super(tag, status, message);
        this.fenceType = fenceType;
    }

    /**
     * 查询围栏监控对象状态请求构造方法
     *
     * @param tag                  响应标识
     * @param status               状态码
     * @param message              状态消息
     * @param size                 返回的结果条数
     * @param fenceType            围栏类型
     * @param monitoredStatusInfos 监控状态信息列表
     */
    public MonitoredStatusResult(int tag, int status, String message, int size, int fenceType,
                                 List<MonitoredStatusInfo> monitoredStatusInfos) {
        this(tag, status, message, fenceType);
        this.size = size;
        this.monitoredStatusInfos = monitoredStatusInfos;
    }

    /**
     * 查询围栏监控对象状态请求构造方法
     * V3.1.0版本新增
     *
     * @param tag                  响应标识
     * @param status               状态码
     * @param message              状态消息
     * @param totalSize            所有结果条数（忽略pageIndex，pageSize后的本次查询总围栏个数）
     * @param size                 返回的结果条数
     * @param fenceType            围栏类型
     * @param monitoredStatusInfos 监控状态信息列表
     */
    public MonitoredStatusResult(int tag, int status, String message, int totalSize, int size,
                                 int fenceType,
                                 List<com.baidu.trace.api.fence.MonitoredStatusInfo> monitoredStatusInfos) {
        this(tag, status, message, fenceType);
        this.totalSize = totalSize;
        this.size = size;
        if (monitoredStatusInfos != null) {
            List<MonitoredStatusInfo> monitoredStatusInfoList = new ArrayList<>();
            for (com.baidu.trace.api.fence.MonitoredStatusInfo monitoredStatusInfo :
                    monitoredStatusInfos) {
                monitoredStatusInfoList.add(MonitoredStatusInfo.fromSDKObject(monitoredStatusInfo));
            }
            this.monitoredStatusInfos = monitoredStatusInfoList;
        }
    }

    @Override
    public String toString() {
        return "MonitoredStatusResponse [tag=" + tag + ", status=" + status + ", message=" + message
                + ", size=" + size
                + ", fenceType=" + fenceType + ", monitoredStatusInfos=" + monitoredStatusInfos
                + ", totalSize" + totalSize + "]";
    }

}
