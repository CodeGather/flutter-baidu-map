package com.baidu.flutter.trace.model.entity;

import java.util.Map;

/**
 * Entity信息（封装查询Entity列表时返回的Entity信息）
 *
 * @author baidu
 */
public final class EntityInfo {

    /**
     * entity标识
     */
    public String entityName;

    /**
     * entity描述
     */
    public String entityDesc;

    /**
     * entity属性修改时间
     */
    public String modifyTime;

    /**
     * entity创建时间
     */
    public String createTime;

    /**
     * entity自定义属性
     */
    public Map<String, String> customColumns;

    /**
     * 最新位置
     */
    public LatestLocation latestLocation;

    /**
     * 获取entity标识
     *
     * @return
     */
    public String getEntityName() {
        return entityName;
    }

    public void setEntityName(String entityName) {
        this.entityName = entityName;
    }

    /**
     * 获取entity描述
     *
     * @return
     */
    public String getEntityDesc() {
        return entityDesc;
    }

    public void setEntityDesc(String entityDesc) {
        this.entityDesc = entityDesc;
    }

    /**
     * 获取修改时间
     *
     * @return
     */
    public String getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(String modifyTime) {
        this.modifyTime = modifyTime;
    }

    /**
     * 获取创建时间
     *
     * @return
     */
    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    /**
     * 获取entity自定义属性字段
     *
     * @return
     */
    public Map<String, String> getColumns() {
        return customColumns;
    }

    public void setColumns(Map<String, String> columns) {
        this.customColumns = columns;
    }

    /**
     * 获取最新位置
     *
     * @return
     */
    public LatestLocation getLatestLocation() {
        return latestLocation;
    }

    public void setLatestLocation(com.baidu.trace.api.entity.LatestLocation latestLocation) {
        LatestLocation flutterLatestLocation = new LatestLocation();
        flutterLatestLocation.setLocation(latestLocation.getLocation());
        flutterLatestLocation.setCoordType(latestLocation.getCoordType().ordinal());
        flutterLatestLocation.setRadius(latestLocation.getRadius());
        flutterLatestLocation.setLocTime(latestLocation.getLocTime());
        flutterLatestLocation.setDirection(latestLocation.getDirection());
        flutterLatestLocation.setSpeed(latestLocation.getSpeed());
        flutterLatestLocation.setHeight(latestLocation.getHeight());
        flutterLatestLocation.setFloor(latestLocation.getFloor());
        flutterLatestLocation.setDistance(latestLocation.getDistance());
        flutterLatestLocation.setObjectName(latestLocation.getObjectName());
        flutterLatestLocation.setColumns(latestLocation.getColumns());
        this.latestLocation = flutterLatestLocation;
    }

    public EntityInfo() {
        super();
    }

    /**
     * @param entityName     entity标识
     * @param entityDesc     entity描述
     * @param modifyTime     修改时间
     * @param createTime     创建时间
     * @param columns        自定义属性字段
     * @param latestLocation 最新位置
     */
    public EntityInfo(String entityName, String entityDesc, String modifyTime, String createTime,
                      Map<String, String> columns, LatestLocation latestLocation) {
        super();
        this.entityName = entityName;
        this.entityDesc = entityDesc;
        this.modifyTime = modifyTime;
        this.createTime = createTime;
        this.customColumns = columns;
        this.latestLocation = latestLocation;
    }

    @Override
    public String toString() {
        return "EntityInfo [entityName=" + entityName + ", entityDesc=" + entityDesc
                + ", modifyTime=" + modifyTime
                + ", createTime=" + createTime + ", columns=" + customColumns + ", latestLocation="
                + latestLocation + "]";
    }

}
