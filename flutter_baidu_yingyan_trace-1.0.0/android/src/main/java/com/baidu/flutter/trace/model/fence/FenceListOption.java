package com.baidu.flutter.trace.model.fence;

import java.util.List;

import com.baidu.flutter.trace.model.BaseOption;
import com.baidu.flutter.trace.model.CoordType;
import com.baidu.trace.api.fence.FenceListRequest;

/**
 * 查询围栏请求
 *
 * @author baidu
 */
public final class FenceListOption extends BaseOption {

    /**
     * 监控对象
     */
    private String monitoredPerson;

    /**
     * 围栏编号列表
     */
    private List<Long> fenceIds;

    /**
     * 返回结果的坐标类型，默认为百度经纬度（暂支持服务端围栏）
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
     * 围栏类型（本地围栏、服务端围栏）
     */
    private int fenceType;

    /**
     * 分页页码
     * 仅用于服务端围栏查询
     * V3.1.0新增字段
     */
    private int pageIndex;

    /**
     * 单页展示POI数量
     * 仅用于服务端围栏查询
     * V3.1.0新增字段
     */
    private int pageSize;

    public String getMonitoredPerson() {
        return monitoredPerson;
    }

    /**
     * 设置监控对象
     *
     * @param monitoredPerson 监控对象
     */
    public void setMonitoredPerson(String monitoredPerson) {
        this.monitoredPerson = monitoredPerson;
    }

    public List<Long> getFenceIds() {
        return fenceIds;
    }

    /**
     * 设置服务端围栏编号列表
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
     * 设置返回结果的坐标类型
     *
     * @param coordTypeOutput
     */
    public void setCoordTypeOutput(int coordTypeOutput) {
        if (FenceType.server.ordinal() == fenceType) {
            this.coordTypeOutput = coordTypeOutput;
        }
    }

    public int getCoordTypeOutput() {
        return coordTypeOutput;
    }

    /**
     * 获取分页页码
     * V3.1.0新增字段
     *
     * @return 分页页码
     */
    public int getPageIndex() {
        return pageIndex;
    }

    /**
     * 设置分页页码
     * V3.1.0新增字段
     *
     * @param pageIndex 分页页码
     */
    public void setPageIndex(int pageIndex) {
        this.pageIndex = pageIndex;
    }

    /**
     * 获取单页展示POI数量
     * V3.1.0新增字段
     *
     * @return 单页展示POI数量
     */
    public int getPageSize() {
        return pageSize;
    }

    /**
     * 设置单页展示POI数量
     * V3.1.0新增字段
     *
     * @param pageSize 单页展示POI数量
     */
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
    
    public FenceListOption() {
        super();
    }

    /**
     * 查询围栏请求构造方法
     *
     * @param tag             请求标识
     * @param serviceId       轨迹服务ID
     * @param monitoredPerson 监控对象
     * @param fenceIds        围栏编号列表
     * @param coordTypeOutput 返回结果的坐标类型（暂支持服务端围栏）
     * @param fenceType       围栏类型
     * @param pageIndex       当前请求页码，仅用于服务端围栏查询          V3.1.0新增字段
     * @param pageSize        当前页期望返回的个数， 仅用于服务端围栏查询   V3.1.0新增字段
     * @return
     */
    public FenceListOption(int tag, long serviceId, String monitoredPerson, List<Long> fenceIds,
                            int coordTypeOutput, int fenceType, int pageIndex,
                            int pageSize) {
        super(tag, serviceId);
        this.monitoredPerson = monitoredPerson;
        this.fenceIds = fenceIds;
        this.coordTypeOutput = coordTypeOutput;
        this.fenceType = fenceType;
        this.pageIndex = pageIndex;
        this.pageSize = pageSize;
    }

    public FenceListRequest toFenceListRequest() {
        FenceListRequest fenceListRequest = null;
        if (fenceType == FenceType.local.ordinal()) {
            fenceListRequest = com.baidu.trace.api.fence.FenceListRequest
                    .buildLocalRequest(tag, serviceId, monitoredPerson, fenceIds);
        } else if (fenceType == FenceType.server.ordinal()) {
            fenceListRequest = com.baidu.trace.api.fence.FenceListRequest
                    .buildServerRequest(tag, serviceId, monitoredPerson, fenceIds,
                            com.baidu.trace.model.CoordType.values()[coordTypeOutput], pageIndex,
                            pageSize);
        }
        return fenceListRequest;
    }

    @Override
    public String toString() {
        return "FenceListRequest [tag=" + tag + ", serviceId=" + serviceId + ", monitoredPerson="
                + monitoredPerson
                + ", fenceIds=" + fenceIds + ", coordTypeOutput=" + coordTypeOutput
                + ", fenceType=" + fenceType + "pageIndex=" + pageIndex + ", pageSize=" + pageSize
                + "]";
    }

}
