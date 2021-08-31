package com.baidu.flutter.trace.model.entity;

import com.baidu.flutter.trace.model.CoordType;
import com.baidu.trace.api.entity.EntityListRequest;

/**
 * 查询EntityList请求参数
 *
 * @author baidu
 */
public final class EntityListOption extends CommonOption {

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
    private int coordTypeOutput = CoordType.bd09ll.ordinal();

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

    public EntityListOption() {
        super();
    }

    /**
     * @param tag       请求标识
     * @param serviceId 轨迹服务ID
     */
    public EntityListOption(int tag, long serviceId) {
        super(tag, serviceId);
    }

    /**
     * 查询entity列表请求
     *
     * @param tag             请求标识
     * @param serviceId       轨迹服务ID
     * @param filterCondition 过滤条件
     * @param coordTypeOutput 返回结果坐标类型
     * @param pageIndex       分页索引
     * @param pageSize        分页大小
     */
    public EntityListOption(int tag, long serviceId, FilterCondition filterCondition,
                            int coordTypeOutput,
                            int pageIndex, int pageSize) {
        super(tag, serviceId, filterCondition, coordTypeOutput, pageIndex, pageSize);
    }

    public EntityListRequest toEntityListRequest() {
        EntityListRequest entityListRequest = new EntityListRequest();
        entityListRequest.setTag(tag);
        entityListRequest.setServiceId(serviceId);
        if (filterCondition != null) {
            entityListRequest.setFilterCondition(filterCondition.toFilterCondition());
        }
        if (sortBy != null) {
            entityListRequest.setSortBy(sortBy.toSortBy());
        }
        entityListRequest
                .setCoordTypeOutput(com.baidu.trace.model.CoordType.values()[coordTypeOutput]);
        entityListRequest.setPageIndex(pageIndex);
        entityListRequest.setPageSize(pageSize);
        return entityListRequest;
    }

    @Override
    public String toString() {
        return "EntityListOption [tag=" + tag + ", serviceId=" + serviceId + ", coordTypeOutput="
                + coordTypeOutput
                + ", filterCondition=" + filterCondition + ", pageIndex=" + pageIndex
                + ", pageSize=" + pageSize
                + "]";
    }

}
