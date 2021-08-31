package com.baidu.flutter.trace.model.fence;

import java.util.List;

import com.baidu.flutter.trace.model.BaseResult;

/**
 * 查询服务端围栏监控的所有entity响应封装
 * V3.1.0新增接口
 */
public class ListMonitoredPersonResult extends BaseResult {

    /**
     * 查询监控entity的总个数
     */
    private int totalSize;

    /**
     * 本页返回的entity个数
     */
    private int size;

    /**
     * entity列表
     */
    List<String> monitoredPersons;

    /**
     * 围栏类型
     */
    private int fenceType;

    /**
     * 查询监控entity的总个数
     *
     * @return 监控entity的总个数
     */
    public int getTotalSize() {
        return totalSize;
    }

    /**
     * 设置监控entity的总个数
     *
     * @param totalSize 监控entity的总个数
     */
    public void setTotalSize(int totalSize) {
        this.totalSize = totalSize;
    }

    /**
     * 获取本页返回的entity个数
     *
     * @return 本页返回的entity个数
     */
    public int getPageSize() {
        return size;
    }

    /**
     * 获取本页返回的entity个数
     *
     * @param pageSize 本页返回的entity个数
     */
    public void setPageSize(int pageSize) {
        this.size = pageSize;
    }

    public List<String> getMonitoredPerson() {
        return monitoredPersons;
    }

    public void setMonitoredPerson(List<String> monitoredPerson) {
        this.monitoredPersons = monitoredPerson;
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
     * @param tag       响应标识（与请求标识一致）
     * @param status    状态码
     * @param message   状态消息
     * @param fenceType 围栏类型
     */
    public ListMonitoredPersonResult(int tag, int status, String message, int fenceType) {
        super(tag, status, message);
        this.fenceType = fenceType;
    }

    /**
     * @param tag       响应标识（与请求标识一致）
     * @param status    状态码
     * @param message   状态消息
     * @param totalSize 所有监控的entity数目
     * @param pageSize  本页返回entity数目
     * @param fenceType 围栏类型
     */
    public ListMonitoredPersonResult(int tag, int status, String message, int totalSize,
                                     int pageSize, List<String> monitoredPerson, int fenceType) {
        super(tag, status, message);
        this.totalSize = totalSize;
        this.size = pageSize;
        this.monitoredPersons = monitoredPerson;
        this.fenceType = fenceType;
    }

    @Override
    public String toString() {
        return "ListMonitoredPersonResponse [tag = " + tag + ", status = " + status + ", message = "
                + message + ", totalSize = " + totalSize + ", pageSize = " + size
                + ", fenceType = "
                + fenceType + ", monitoredPersons = "
                + ((null == monitoredPersons || monitoredPersons.isEmpty()) ? "null"
                           : monitoredPersons.toString()) + "]";
    }
}
