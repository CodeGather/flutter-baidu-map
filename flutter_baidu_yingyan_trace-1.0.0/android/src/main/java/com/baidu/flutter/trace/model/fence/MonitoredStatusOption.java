package com.baidu.flutter.trace.model.fence;

import java.util.List;

import com.baidu.flutter.trace.model.BaseOption;
import com.baidu.trace.api.fence.MonitoredStatusRequest;

/**
 * 查询监控对象状态请求参数
 *
 * @author baidu
 */
public final class MonitoredStatusOption extends BaseOption {

    /**
     * 监控对象
     */
    private String monitoredPerson;

    /**
     * 围栏编号列表
     */
    private List<Long> fenceIds;

    /**
     * 围栏类型（本地围栏、服务端围栏）
     */
    private int fenceType;

    /**
     * 服务端围栏状态查询分页请求索引
     */
    private int pageIndex;

    /**
     * 服务端围栏状态查询当前页欲返回条目数量
     */
    private int pageSize;

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

    public int getFenceType() {
        return fenceType;
    }

    /**
     * 获取服务端围栏状态查询分页请求索引
     *
     * @return 服务端围栏状态查询分页请求索引
     */
    public int getPageIndex() {
        return pageIndex;
    }

    /**
     * 设置服务端围栏状态查询分页请求索引
     *
     * @param pageIndex 服务端围栏状态查询分页请求索引
     */
    public void setPageIndex(int pageIndex) {
        this.pageIndex = pageIndex;
    }

    /**
     * 获取服务端围栏状态查询当前页欲返回条目数量
     * V3.0.9新增字段
     *
     * @return 服务端围栏状态查询当前页欲返回条目数量
     */
    public int getPageSize() {
        return pageSize;
    }

    /**
     * 设置服务端围栏状态查询当前页欲返回条目数量
     * V3.0.9新增字段
     *
     * @param pageSize 服务端围栏状态查询当前页欲返回条目数量
     */
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
    
    public MonitoredStatusOption() {
        super();
    }

    /**
     * 查询监控状态请求构造方法
     *
     * @param tag             请求标识
     * @param serviceId       轨迹服务ID
     * @param monitoredPerson 监控对象
     * @param fenceIds        围栏编号列表
     * @param fenceType       围栏类型
     * @return
     */
    public MonitoredStatusOption(int tag, long serviceId, String monitoredPerson,
                                  List<Long> fenceIds,
                                  int fenceType) {
        super(tag, serviceId);
        this.monitoredPerson = monitoredPerson;
        this.fenceIds = fenceIds;
        this.fenceType = fenceType;
    }

    public MonitoredStatusRequest toMonitoredStatusRequest() {
        MonitoredStatusRequest monitoredStatusRequest = null;
        if (fenceType == FenceType.local.ordinal()) {
            monitoredStatusRequest = com.baidu.trace.api.fence.MonitoredStatusRequest
                    .buildLocalRequest(tag, serviceId, monitoredPerson, fenceIds);
        } else if (fenceType == FenceType.server.ordinal()) {
            monitoredStatusRequest = com.baidu.trace.api.fence.MonitoredStatusRequest
                    .buildServerRequest(tag, serviceId, monitoredPerson, fenceIds, pageIndex,
                            pageSize);
        }
        return monitoredStatusRequest;
    }

    @Override
    public String toString() {
        return "MonitoredStatusRequest [tag=" + tag + ", serviceId=" + serviceId
                + ", monitoredPerson="
                + monitoredPerson + ", fenceIds=" + fenceIds + ", fenceType=" + fenceType
                + ", pageIndex = " + pageIndex + ", pageSize = " + pageSize + "]";
    }

}
