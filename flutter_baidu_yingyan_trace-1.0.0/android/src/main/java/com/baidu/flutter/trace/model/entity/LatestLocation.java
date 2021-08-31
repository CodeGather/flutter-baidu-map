package com.baidu.flutter.trace.model.entity;

import java.util.Map;

import com.baidu.flutter.trace.model.Point;

/**
 * 最新轨迹点信息
 *
 * @author baidu
 */
public class LatestLocation extends Point {

    /**
     * 楼层
     */
    public String floor;

    /**
     * 距中心点距离
     */
    public double distance;

    /**
     * 对象名称
     */
    public String objectName;

    /**
     * 自定义轨迹属性（track attribute）
     */
    public Map<String, String> columns;

    /**
     * 获取楼层信息
     *
     * @return
     */
    public String getFloor() {
        return floor;
    }

    public void setFloor(String floor) {
        this.floor = floor;
    }

    /**
     * 获取距中心点距离，仅在周边搜索时该字段有值
     *
     * @return
     */
    public double getDistance() {
        return distance;
    }

    public void setDistance(double distance) {
        this.distance = distance;
    }

    /**
     * 获取对象key
     *
     * @return
     */
    public String getObjectName() {
        return objectName;
    }

    public void setObjectName(String objectName) {
        this.objectName = objectName;
    }

    /**
     * 获取自定义轨迹属性（track attribute）
     *
     * @return
     */
    public Map<String, String> getColumns() {
        return columns;
    }

    public void setColumns(Map<String, String> columns) {
        this.columns = columns;
    }

    public LatestLocation() {
        super();
    }

    /**
     * @param coordType 坐标类型
     */
    public LatestLocation(int coordType) {
        this.coordType = coordType;
    }

    /**
     * @param floor    楼层信息
     * @param distance 距中心点距离，仅在周边搜索时该字段有值
     */
    public LatestLocation(String floor, double distance) {
        super();
        this.floor = floor;
        this.distance = distance;
    }

    @Override
    public String toString() {
        return "LatestLocation [location=" + location + ", coordType=" + coordType + ", radius="
                + radius
                + ", locTime=" + locTime + ", direction=" + direction + ", speed=" + speed
                + ", height=" + height
                + ", floor=" + floor + ", distance=" + distance + ", objectName=" + objectName
                + ", columns=" + columns
                + "]";
    }

}
