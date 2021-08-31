package com.baidu.flutter.trace.model.fence;

import com.baidu.flutter.trace.model.LatLng;

/**
 * 围栏报警时轨迹点信息
 *
 * @author baidu
 */
public class AlarmPoint {

    /**
     * 坐标经纬度信息
     */
    private LatLng location;

    /**
     * 坐标类型
     */
    private int coordType;

    /**
     * 定位时间（单位：秒）
     */
    private long locTime;

    /**
     * 上传到服务端时间（只在查询服务端围栏历史报警信息时，该字段有值）
     */
    private long createTime;

    /**
     * 定位精度（单位：米）
     */
    private double radius;

    /**
     * 获取坐标经纬度信息
     *
     * @return
     */
    public LatLng getLocation() {
        return location;
    }

    public void setLocation(LatLng location) {
        this.location = location;
    }

    /**
     * 获取坐标类型
     *
     * @return
     */
    public int getCoordType() {
        return coordType;
    }

    public void setCoordType(int coordType) {
        this.coordType = coordType;
    }

    /**
     * 获取定位时间（单位：秒）
     *
     * @return
     */
    public long getLocTime() {
        return locTime;
    }

    public void setLocTime(long locTime) {
        this.locTime = locTime;
    }

    /**
     * 获取上传到服务端时间（只在查询服务端围栏历史报警信息时，该字段有值）
     *
     * @return
     */
    public long getCreateTime() {
        return createTime;
    }

    public void setCreateTime(long createTime) {
        this.createTime = createTime;
    }

    /**
     * 获取定位精度（单位：米）
     *
     * @return
     */
    public double getRadius() {
        return radius;
    }

    public void setRadius(double radius) {
        this.radius = radius;
    }

    public AlarmPoint() {
        super();
    }

    /**
     * @param location  经纬度坐标
     * @param coordType 坐标类型
     * @param locTime   定位时间
     * @param radius    定位精度
     */
    public AlarmPoint(LatLng location, int coordType, long locTime, double radius) {
        super();
        this.location = location;
        this.coordType = coordType;
        this.locTime = locTime;
        this.radius = radius;
    }

    /**
     * @param location   经纬度坐标
     * @param coordType  坐标类型
     * @param locTime    定位时间
     * @param createTime 上传到服务端时间（只在查询服务端围栏历史报警信息时，该字段有值）
     * @param radius     定位精度
     */
    public AlarmPoint(LatLng location, int coordType, long locTime, long createTime,
                      double radius) {
        this.location = location;
        this.coordType = coordType;
        this.locTime = locTime;
        this.createTime = createTime;
        this.radius = radius;
    }

    public static AlarmPoint fromSDKObject(com.baidu.trace.api.fence.AlarmPoint alarmPoint) {
        if (alarmPoint == null) {
            return null;
        }
        AlarmPoint alarmPointTmp = new AlarmPoint();
        alarmPointTmp.setLocation(LatLng.fromSDKObject(alarmPoint.getLocation()));
        if (alarmPoint.getCoordType() != null) {
            alarmPointTmp.setCoordType(alarmPoint.getCoordType().ordinal());
        }
        alarmPointTmp.setLocTime(alarmPoint.getLocTime());
        alarmPointTmp.setCreateTime(alarmPoint.getCreateTime());
        alarmPointTmp.setRadius(alarmPoint.getRadius());
        return alarmPointTmp;
    }

    @Override
    public String toString() {
        return "AlarmPoint [location=" + location + ", coordType=" + coordType + ", locTime="
                + locTime
                + ", createTime=" + createTime + ", radius = " + radius + "]";
    }

}
