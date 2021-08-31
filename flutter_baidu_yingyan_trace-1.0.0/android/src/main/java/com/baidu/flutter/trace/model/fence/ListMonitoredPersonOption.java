package com.baidu.flutter.trace.model.fence;

import com.baidu.flutter.trace.model.BaseOption;
import com.baidu.trace.api.fence.ListMonitoredPersonRequest;

/**
 * 查询服务端围栏监控的所有entity请求封装
 * V3.1.0新增接口
 */
public class ListMonitoredPersonOption extends BaseOption {
    /**
     * 服务端围栏ID
     */
    private int fenceId;

    /**
     * 围栏类型，当前仅支持服务端围栏
     */
    private int fenceType;

    /**
     * 分页请求索引
     * 默认值为1。pageIndex与pageSize一起计算从第几条结果返回，代表返回第几页。
     */
    private int pageIndex;

    /**
     * 分页请求每页返回的条目数
     * 默认值为100
     */
    private int pageSize;

    /**
     * 获取服务端围栏ID
     *
     * @return 服务端围栏ID
     */
    public int getFenceId() {
        return fenceId;
    }

    /**
     * 设置服务端围栏ID
     *
     * @param fenceId 服务端围栏ID
     */
    public void setFenceId(int fenceId) {
        this.fenceId = fenceId;
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
     * 获取围栏类型
     *
     * @param fenceType 围栏类型
     */
    public void setFenceType(int fenceType) {
        this.fenceType = fenceType;
    }

    /**
     * 获取分页请求索引
     * 默认值为1。pageIndex与pageSize一起计算从第几条结果返回，代表返回第几页。
     *
     * @return 分页请求索引
     */
    public int getPageIndex() {
        return pageIndex;
    }

    /**
     * 设置分页请求索引
     * 默认值为1。pageIndex与pageSize一起计算从第几条结果返回，代表返回第几页。
     *
     * @param pageIndex 分页请求索引
     */
    public void setPageIndex(int pageIndex) {
        this.pageIndex = pageIndex;
    }

    /**
     * 获取分页请求当前页返回的条目数
     * 默认值为100
     *
     * @return 分页请求当前页返回的条目数
     */
    public int getPageSize() {
        return pageSize;
    }

    /**
     * 设置分页请求当前页返回的条目数
     * 默认值为100
     *
     * @param pageSize 分页请求当前页返回的条目数
     */
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
    
    public ListMonitoredPersonOption() {
        super();
    }

    /**
     * 查询围栏监控的所有entity请求构造方法
     *
     * @param tag       请求标识
     * @param serviceId 轨迹服务ID
     */
    public ListMonitoredPersonOption(int tag, long serviceId) {
        super(tag, serviceId);
    }

    public ListMonitoredPersonRequest toListMonitoredPersonRequest() {
        ListMonitoredPersonRequest listMonitoredPersonRequest =
                new ListMonitoredPersonRequest(tag, serviceId);
        listMonitoredPersonRequest.setFenceId(fenceId);
        listMonitoredPersonRequest
                .setFenceType(com.baidu.trace.api.fence.FenceType.values()[fenceType]);
        listMonitoredPersonRequest.setPageIndex(pageIndex);
        listMonitoredPersonRequest.setPageSize(pageSize);
        return listMonitoredPersonRequest;
    }

    @Override
    public String toString() {
        return "ListMonitoredPersonRequest [tag = " + tag + ", serviceId = " + serviceId
                + ", fenceId = "
                + fenceId + ", fenceType = " + fenceType + ", pageIndex = " + pageIndex
                + ", pageSize = "
                + pageSize + "]";
    }
}
