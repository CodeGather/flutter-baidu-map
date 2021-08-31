package com.baidu.flutter.trace.model.fence;

import java.util.List;

import com.baidu.flutter.trace.model.BaseOption;
import com.baidu.flutter.trace.model.LatLng;
import com.baidu.trace.api.fence.MonitoredStatusByLocationRequest;
import com.baidu.trace.model.CoordType;

/**
 * 查询指定位置监控对象的状态
 *
 * @author baidu
 */
public final class MonitoredStatusByLocationOption extends BaseOption {

    /**
     * 监控对象
     */
    private String monitoredPerson;

    /**
     * 围栏编号列表
     */
    private List<Long> fenceIds;

    /**
     * 指定位置坐标
     */
    private LatLng latLng;

    /**
     * 坐标类型
     */
    private int coordType;

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

    public LatLng getLatLng() {
        return latLng;
    }

    /**
     * 设置指定位置坐标
     *
     * @param latLng
     */
    public void setLatLng(LatLng latLng) {
        this.latLng = latLng;
    }

    public int getCoordType() {
        return coordType;
    }

    /**
     * 设置坐标类型
     *
     * @param coordType
     */
    public void setCoordType(int coordType) {
        this.coordType = coordType;
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
     * V3.1.0新增字段
     *
     * @return 服务端围栏状态查询当前页欲返回条目数量
     */
    public int getPageSize() {
        return pageSize;
    }

    /**
     * 设置服务端围栏状态查询当前页欲返回条目数量
     * V3.1.0新增字段
     *
     * @param pageSize 服务端围栏状态查询当前页欲返回条目数量
     */
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
    
    public MonitoredStatusByLocationOption() {
        super();
    }

    /**
     * 查询围栏指定位置监控对象状态
     *
     * @param tag             请求标识
     * @param serviceId       轨迹服务ID
     * @param monitoredPerson 监控对象
     * @param fenceIds        围栏编号列表
     * @param latLng          位置坐标
     * @param coordType       坐标类型
     * @param fenceType       围栏类型
     */
    public MonitoredStatusByLocationOption(int tag, long serviceId, String monitoredPerson,
                                            List<Long> fenceIds,
                                            LatLng latLng, int coordType, int fenceType) {
        super(tag, serviceId);
        this.monitoredPerson = monitoredPerson;
        this.fenceIds = fenceIds;
        this.latLng = latLng;
        this.coordType = coordType;
        this.fenceType = fenceType;
    }

    public MonitoredStatusByLocationRequest toMonitoredStatusByLocationRequest() {
        if (latLng == null) {
            return null;
        }
        MonitoredStatusByLocationRequest monitoredStatusByLocationRequest = null;
        if (fenceType == FenceType.local.ordinal()) {
            monitoredStatusByLocationRequest =
                    com.baidu.trace.api.fence.MonitoredStatusByLocationRequest
                            .buildLocalRequest(tag, serviceId, monitoredPerson, fenceIds,
                                    latLng.toLatLng(),
                                    CoordType.values()[coordType]);
        } else if (fenceType == FenceType.server.ordinal()) {
            monitoredStatusByLocationRequest =
                    com.baidu.trace.api.fence.MonitoredStatusByLocationRequest
                            .buildServerRequest(tag, serviceId, monitoredPerson, fenceIds,
                                    latLng.toLatLng(), CoordType.values()[coordType], pageIndex,
                                    pageSize);
        }
        return monitoredStatusByLocationRequest;
    }

    @Override
    public String toString() {
        if (0 == fenceType) {
            return "MonitoredStatusByLocationRequest [tag=" + tag + ", serviceId=" + serviceId
                    + ", fenceIds="
                    + fenceIds + ", latLng=" + latLng + ", coordType=" + coordType + ", fenceType="
                    + fenceType + "]";
        } else {
            return "MonitoredStatusByLocationRequest [tag=" + tag + ", serviceId=" + serviceId
                    + ", monitoredPerson="
                    + monitoredPerson + ", fenceIds=" + fenceIds + ", latLng=" + latLng
                    + ", coordType=" + coordType
                    + ", fenceType=" + fenceType + ", pageIndex = " + pageIndex + ", pageSize = "
                    + pageSize + "]";
        }
    }

}
