package com.baidu.flutter.trace.model.entity;

import java.util.List;
import java.util.Map;

/**
 * 过滤条件
 *
 * @author baidu
 */
public class FilterCondition {
    /**
     * entityName列表
     */
    public List<String> entityNames;

    /**
     * 活跃时间，在此时间之后有定位信息上传的entity（locTime >= activeTime）
     * <p>
     * 注：不能与inActiveTime同时使用
     */
    public long activeTime;

    /**
     * 不活跃时间，在此时间之后无定位信息上传的entity（locTime < inActiveTime）
     * <p>
     * 注：不能与activeTime同时使用
     */
    public long inActiveTime;

    /**
     * 自定义可筛选的entity属性字段
     */
    public Map<String, String> columns;

    public List<String> getEntityNames() {
        return entityNames;
    }

    /**
     * 设置entityName列表
     *
     * @param entityNames
     */
    public void setEntityNames(List<String> entityNames) {
        this.entityNames = entityNames;
    }

    public long getActiveTime() {
        return activeTime;
    }

    /**
     * 设置活跃时间，在此时间之后有定位信息上传的entity（locTime >= activeTime）
     * <p>
     * 注：不能与inActiveTime同时使用
     *
     * @param activeTime
     */
    public void setActiveTime(long activeTime) {
        this.activeTime = activeTime;
    }

    public long getInActiveTime() {
        return inActiveTime;
    }

    /**
     * 设置不活跃时间，在此时间之后无定位信息上传的entity（locTime < inActiveTime）
     * <p>
     * 注：不能与activeTime同时使用
     *
     * @param inActiveTime
     */
    public void setInActiveTime(long inActiveTime) {
        this.inActiveTime = inActiveTime;
    }

    public Map<String, String> getColumns() {
        return columns;
    }

    /**
     * 设置自定义可筛选的entity属性字段
     *
     * @param columns
     */
    public void setColumns(Map<String, String> columns) {
        this.columns = columns;
    }

    public FilterCondition() {
        super();
    }

    /**
     * @param entityNames  entity列表
     * @param activeTime   活跃时间，在此时间之后有定位信息上传的entity（locTime >= activeTime）
     * @param inActiveTime 不活跃时间，在此时间之后无定位信息上传的entity（locTime < inActiveTime）
     * @param columns      自定义属性字段
     */
    public FilterCondition(List<String> entityNames, long activeTime, long inActiveTime,
                           Map<String, String> columns) {
        super();
        this.entityNames = entityNames;
        this.activeTime = activeTime;
        this.inActiveTime = inActiveTime;
        this.columns = columns;
    }

    public com.baidu.trace.api.entity.FilterCondition toFilterCondition() {
        com.baidu.trace.api.entity.FilterCondition filterCondition =
                new com.baidu.trace.api.entity.FilterCondition();
        filterCondition.setEntityNames(entityNames);
        filterCondition.setActiveTime(activeTime);
        filterCondition.setInActiveTime(inActiveTime);
        filterCondition.setColumns(columns);
        return filterCondition;
    }

    @Override
    public String toString() {
        return "FilterCondition [entityNames=" + entityNames + ", activeTime=" + activeTime
                + ", inActiveTime="
                + inActiveTime + ", columns=" + columns + "]";
    }

}
