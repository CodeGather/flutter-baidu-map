package com.baidu.flutter.trace.model.entity;

import com.baidu.flutter.trace.model.BaseOption;
import com.baidu.flutter.trace.model.CoordType;

/**
 * entity搜索接口通用请求参数
 *
 * @author baidu
 */
public class CommonOption extends BaseOption {

    /**
     * 过滤条件
     */
    public FilterCondition filterCondition;

    /**
     * 排序方法，该字段在查询EntityList(EntityListRequest)时无效
     */
    public SortBy sortBy;

    /**
     * 返回结果的坐标类型，默认为百度经纬度
     * <p>
     * <pre>
     * 该字段用于控制返回结果中坐标的类型。可选值为：
     * bd09ll：百度经纬度坐标；
     * gcj02：国测局加密坐标；
     *
     * 注：该字段在国外无效，国外均返回wgs84坐标
     * </pre>
     */
    public int coordTypeOutput = CoordType.bd09ll.ordinal();

    /**
     * 分页索引，默认值为1
     */
    public int pageIndex = 1;

    /**
     * 分页大小，默认值为100
     */
    public int pageSize = 100;

    public FilterCondition getFilterCondition() {
        return filterCondition;
    }

    /**
     * 设置过滤条件
     *
     * @param filterCondition
     */
    public void setFilterCondition(FilterCondition filterCondition) {
        this.filterCondition = filterCondition;
    }

    /**
     * 获取排序方法
     *
     * @return
     */
    public SortBy getSortBy() {
        return sortBy;
    }

    /**
     * 设置排序方法，在查询EntityList(EntityListRequest)时无效
     *
     * @param sortBy
     */
    public void setSortBy(SortBy sortBy) {
        this.sortBy = sortBy;
    }

    public int getCoordTypeOutput() {
        return coordTypeOutput;
    }

    /**
     * 设置返回结果的坐标类型，默认为百度经纬度
     * <p>
     * <pre>
     * 该字段用于控制返回结果中坐标的类型。可选值为：
     * bd09ll：百度经纬度坐标；
     * gcj02：国测局加密坐标；
     *
     * 注：该字段在国外无效，国外均返回wgs84坐标
     * </pre>
     *
     * @param coordTypeOutput
     */
    public void setCoordTypeOutput(int coordTypeOutput) {
        this.coordTypeOutput = coordTypeOutput;
    }

    public int getPageIndex() {
        return pageIndex;
    }

    /**
     * 设置分页索引
     *
     * @param pageIndex
     */
    public void setPageIndex(int pageIndex) {
        this.pageIndex = pageIndex;
    }

    public int getPageSize() {
        return pageSize;
    }

    /**
     * 设置分页大小
     *
     * @param pageSize
     */
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public CommonOption() {
        super();
    }

    public CommonOption(int tag, long serviceId) {
        super(tag, serviceId);
    }

    /**
     * @param tag             请求标识
     * @param serviceId       轨迹服务ID
     * @param filterCondition 过滤条件
     * @param coordTypeOutput 返回结果的坐标类型
     * @param pageIndex       分页索引
     * @param pageSize        分页大小
     */
    public CommonOption(int tag, long serviceId, FilterCondition filterCondition,
                        int coordTypeOutput,
                        int pageIndex, int pageSize) {
        super(tag, serviceId);
        this.filterCondition = filterCondition;
        this.coordTypeOutput = coordTypeOutput;
        this.pageIndex = pageIndex;
        this.pageSize = pageSize;
    }

    /**
     * @param tag             请求标识
     * @param serviceId       轨迹服务ID
     * @param filterCondition 过滤条件
     * @param sortBy          排序方法
     * @param coordTypeOutput 返回结果的坐标类型
     * @param pageIndex       分页索引
     * @param pageSize        分页大小
     */
    public CommonOption(int tag, long serviceId, FilterCondition filterCondition, SortBy sortBy,
                        int coordTypeOutput, int pageIndex, int pageSize) {
        super(tag, serviceId);
        this.filterCondition = filterCondition;
        this.sortBy = sortBy;
        this.coordTypeOutput = coordTypeOutput;
        this.pageIndex = pageIndex;
        this.pageSize = pageSize;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("CommonOption{");
        sb.append("tag=").append(tag);
        sb.append(", serviceId=").append(serviceId);
        sb.append(", filterCondition=").append(filterCondition);
        sb.append(", sortBy=").append(sortBy);
        sb.append(", coordTypeOutput=").append(coordTypeOutput);
        sb.append(", pageIndex=").append(pageIndex);
        sb.append(", pageSize=").append(pageSize);
        sb.append('}');
        return sb.toString();
    }
}
