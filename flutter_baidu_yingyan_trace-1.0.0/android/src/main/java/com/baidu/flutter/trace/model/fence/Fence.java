package com.baidu.flutter.trace.model.fence;

import java.util.ArrayList;
import java.util.List;

import com.baidu.flutter.trace.model.CoordType;
import com.baidu.flutter.trace.model.LatLng;

/**
 * 围栏基类
 *
 * @author baidu
 */
public class Fence {

    /**
     * 围栏编号
     */
    public long fenceId;

    /**
     * 围栏名称
     */
    public String fenceName;

    /**
     * 监控对象
     */
    public String monitoredPerson;

    /**
     * 围栏去噪参数
     */
    public int denoise;

    /**
     * 围栏类型（本地围栏、服务端围栏）
     */
    public int fenceType;

    /**
     * 围栏形状
     */
    public int fenceShape;

    /**
     * 圆心坐标
     */
    public LatLng center;

    /**
     * 半径(单位:米）
     */
    public double radius;

    /**
     * 坐标类型，默认百度经纬度
     */
    public int coordType = CoordType.bd09ll.ordinal();

    /**
     * 行政区划关键字
     */
    public String keyword;

    /**
     * 结构化的行政区划描述
     * <p>
     * 注：仅在查询行政区域围栏时，该字段有值。
     */
    public String district;

    /**
     * 顶点坐标集
     */
    public List<LatLng> vertexes;

    /**
     * 偏离距离
     */
    public int offset;

    /**
     * 获取围栏编号
     *
     * @return
     */
    public long getFenceId() {
        return fenceId;
    }

    /**
     * 设置围栏编号
     *
     * @param fenceId
     */
    public void setFenceId(long fenceId) {
        this.fenceId = fenceId;
    }

    /**
     * 获取围栏名称
     */
    public String getFenceName() {
        return fenceName;
    }

    /**
     * 设置围栏名称
     *
     * @param fenceName
     */
    public void setFenceName(String fenceName) {
        this.fenceName = fenceName;
    }

    /**
     * 获取监控对象
     */
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

    /**
     * 获取围栏去噪参数
     */
    public int getDenoise() {
        return denoise;
    }

    /**
     * 设置围栏去噪参数
     *
     * @param denoise
     */
    public void setDenoise(int denoise) {
        this.denoise = denoise;
    }

    /**
     * 获取围栏类型（本地围栏、服务端围栏）
     *
     * @return
     */
    public int getFenceType() {
        return fenceType;
    }

    public int getFenceShape() {
        return fenceShape;
    }

    public void setFenceShape(int fenceShape) {
        this.fenceShape = fenceShape;
    }

    public void setFenceType(int fenceType) {
        this.fenceType = fenceType;
    }

    public LatLng getCenter() {
        return center;
    }

    public void setCenter(LatLng center) {
        this.center = center;
    }

    public double getRadius() {
        return radius;
    }

    public void setRadius(double radius) {
        this.radius = radius;
    }

    public int getCoordType() {
        return coordType;
    }

    public void setCoordType(int coordType) {
        this.coordType = coordType;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public List<LatLng> getVertexes() {
        return vertexes;
    }

    public List<com.baidu.trace.model.LatLng> getSDKVertexes() {
        if (vertexes == null) {
            return null;
        }
        List<com.baidu.trace.model.LatLng> latLngs = new ArrayList<>();
        for (LatLng latLng : vertexes) {
            latLngs.add(latLng.toLatLng());
        }
        return latLngs;
    }

    public void setVertexes(List<LatLng> vertexes) {
        this.vertexes = vertexes;
    }

    public int getOffset() {
        return offset;
    }

    public void setOffset(int offset) {
        this.offset = offset;
    }

    public Fence() {
    }

    /**
     * @param fenceName 围栏名称
     */
    public Fence(String fenceName) {
        this.fenceName = fenceName;
    }

    /**
     * @param fenceName       围栏名称
     * @param monitoredPerson 监控对象
     * @param denoise         围栏去噪参数
     * @param fenceType       围栏类型
     */
    public Fence(String fenceName, String monitoredPerson, int denoise, int fenceType) {
        this.fenceName = fenceName;
        this.fenceType = fenceType;
        this.denoise = denoise;
        this.monitoredPerson = monitoredPerson;
    }

    /**
     * @param fenceId         围栏编号
     * @param fenceName       围栏名称
     * @param monitoredPerson 监控对象
     * @param denoise         围栏去噪参数
     * @param fenceType       围栏类型
     */
    public Fence(long fenceId, String fenceName, String monitoredPerson, int denoise,
                    int fenceType) {
        this.fenceId = fenceId;
        this.fenceName = fenceName;
        this.fenceType = fenceType;
        this.denoise = denoise;
        this.monitoredPerson = monitoredPerson;
    }

    @Override
    public String toString() {
        return "Fence{" +
                "fenceId=" + fenceId +
                ", fenceName='" + fenceName + '\'' +
                ", monitoredPerson='" + monitoredPerson + '\'' +
                ", denoise=" + denoise +
                ", fenceType=" + fenceType +
                ", fenceShape=" + fenceShape +
                ", center=" + center +
                ", radius=" + radius +
                ", coordType=" + coordType +
                ", keyword='" + keyword + '\'' +
                ", district='" + district + '\'' +
                ", vertexes=" + vertexes +
                ", offset=" + offset +
                '}';
    }
}
