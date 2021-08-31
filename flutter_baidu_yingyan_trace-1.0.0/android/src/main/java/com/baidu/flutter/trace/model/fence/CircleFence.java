package com.baidu.flutter.trace.model.fence;

import com.baidu.flutter.trace.model.CoordType;
import com.baidu.flutter.trace.model.LatLng;

/**
 * 圆形围栏
 *
 * @author baidu
 */
public final class CircleFence extends Fence {

    /**
     * 圆心坐标
     */
    private LatLng center;

    /**
     * 半径(单位:米）
     */
    private double radius;

    /**
     * 坐标类型，默认百度经纬度
     */
    private int coordType = CoordType.bd09ll.ordinal();

    /**
     * 获取圆心坐标
     *
     * @return
     */
    public LatLng getCenter() {
        return center;
    }

    /**
     * 设置圆心坐标
     *
     * @param center
     */
    public void setCenter(LatLng center) {
        this.center = center;
    }

    /**
     * 获取围栏半径
     *
     * @return
     */
    public double getRadius() {
        return radius;
    }

    /**
     * 设置围栏半径
     *
     * @param radius
     */
    public void setRadius(double radius) {
        this.radius = radius;
    }

    /**
     * 获取圆心坐标类型
     *
     * @return
     */
    public int getCoordType() {
        return coordType;
    }

    /**
     * 设置圆心坐标类型
     *
     * @param coordType
     */
    public void setCoordType(int coordType) {
        this.coordType = coordType;
    }

    /**
     * 圆形围栏
     *
     * @param fenceId         围栏编号
     * @param fenceName       围栏名称
     * @param fenceType       围栏类型
     * @param monitoredPerson 监控对象
     * @param center          圆心坐标
     * @param radius          半径
     * @param denoise         围栏去噪精度
     * @param coordType       坐标类型
     */
    private CircleFence(long fenceId, String fenceName, int fenceType, String monitoredPerson,
                        LatLng center,
                        double radius, int denoise, int coordType) {
        super(fenceId, fenceName, monitoredPerson, denoise, fenceType);
        super.center = center;
        super.radius = radius;
        super.coordType = coordType;
        this.center = center;
        this.radius = radius;
        this.coordType = coordType;
    }

    /**
     * 创建本地圆形围栏
     *
     * @param fenceId         围栏编号
     * @param fenceName       围栏名称
     * @param monitoredPerson 监控对象
     * @param center          圆心坐标
     * @param radius          半径
     * @param denoise         围栏去噪精度
     * @param coordType       坐标类型
     * @return 圆形围栏实例
     */
    public static CircleFence buildLocalFence(long fenceId, String fenceName,
                                              String monitoredPerson, LatLng center,
                                              double radius, int denoise, int coordType) {
        return new CircleFence(fenceId, fenceName, FenceType.local.ordinal(), monitoredPerson,
                center,
                radius, denoise, coordType);
    }

    /**
     * 创建服务端圆形围栏
     *
     * @param fenceId         围栏编号
     * @param fenceName       围栏名称
     * @param monitoredPerson 监控对象
     * @param center          圆心坐标
     * @param radius          半径
     * @param denoise         围栏去噪精度
     * @param coordType       坐标类型
     * @return 圆形围栏实例
     */
    public static CircleFence buildServerFence(long fenceId, String fenceName,
                                               String monitoredPerson,
                                               LatLng center, double radius, int denoise,
                                               int coordType) {
        return new CircleFence(fenceId, fenceName, FenceType.server.ordinal(), monitoredPerson,
                center,
                radius, denoise,
                coordType);
    }

    public static CircleFence fromSDKObject(com.baidu.trace.api.fence.CircleFence circleFence) {
        if (circleFence == null) {
            return null;
        }
        return new CircleFence(circleFence.getFenceId(),
                circleFence.getFenceName(),
                circleFence.getFenceType().ordinal(),
                circleFence.getMonitoredPerson(), LatLng.fromSDKObject(circleFence.getCenter()),
                circleFence.getRadius(), circleFence.getDenoise(),
                circleFence.getCoordType().ordinal());
    }

    @Override
    public String toString() {
        return "CircleFence [fenceId=" + fenceId + ", fenceName=" + fenceName + ", fenceType="
                + fenceType
                + ", monitoredPerson=" + monitoredPerson + ", center=" + center + ", radius="
                + radius
                + ", denoise=" + denoise + ", coordType=" + coordType + "]";
    }
}
