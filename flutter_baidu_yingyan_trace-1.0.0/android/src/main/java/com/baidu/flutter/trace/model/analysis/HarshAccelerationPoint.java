package com.baidu.flutter.trace.model.analysis;

import com.baidu.flutter.trace.model.LatLng;
import com.baidu.flutter.trace.model.Point;

/**
 * 急加速点
 *
 * @author baidu
 */
public class HarshAccelerationPoint extends Point {

    /**
     * 实际加速度，单位：m/s^2
     */
    private double acceleration;

    /**
     * 加速前时速，单位：km/h
     */
    private double initialSpeed;

    /**
     * 加速后时速，单位：km/h
     */
    private double endSpeed;

    /**
     * 获取实际加速度，单位：m/s^2
     *
     * @return
     */
    public double getAcceleration() {
        return acceleration;
    }

    public void setAcceleration(double acceleration) {
        this.acceleration = acceleration;
    }

    /**
     * 获取加速前时速，单位：km/h
     *
     * @return
     */
    public double getInitialSpeed() {
        return initialSpeed;
    }

    public void setInitialSpeed(double initialSpeed) {
        this.initialSpeed = initialSpeed;
    }

    /**
     * 获取加速后时速，单位：km/h
     *
     * @return
     */
    public double getEndSpeed() {
        return endSpeed;
    }

    public void setEndSpeed(double endSpeed) {
        this.endSpeed = endSpeed;
    }

    public HarshAccelerationPoint() {
        super();
    }

    /**
     * @param coordType 坐标类型
     */
    public HarshAccelerationPoint(int coordType) {
        this.coordType = coordType;
    }

    /**
     * @param location     经纬度坐标
     * @param coordType    坐标类型
     * @param locTime      定位时间
     * @param acceleration 实际加速度，单位：m/s^2
     * @param initialSpeed 刹车前时速，单位：km/h
     * @param endSpeed     刹车后时速，单位：km/h
     */
    public HarshAccelerationPoint(LatLng location, int coordType, long locTime,
                                  double acceleration, double initialSpeed, double endSpeed) {
        super();
        this.location = location;
        this.coordType = coordType;
        this.locTime = locTime;
        this.acceleration = acceleration;
        this.initialSpeed = initialSpeed;
        this.endSpeed = endSpeed;
    }

    public static HarshAccelerationPoint fromSDKObject(
            com.baidu.trace.api.analysis.HarshAccelerationPoint harshAccelerationPoint) {
        if (harshAccelerationPoint == null) {
            return null;
        }

        HarshAccelerationPoint harshAccelerationPointTmp = new HarshAccelerationPoint();
        harshAccelerationPointTmp.setLocation(harshAccelerationPoint.getLocation());
        harshAccelerationPointTmp.setCoordType(harshAccelerationPoint.getCoordType().ordinal());
        harshAccelerationPointTmp.setRadius(harshAccelerationPoint.getRadius());
        harshAccelerationPointTmp.setLocTime(harshAccelerationPoint.getLocTime());
        harshAccelerationPointTmp.setDirection(harshAccelerationPoint.getDirection());
        harshAccelerationPointTmp.setSpeed(harshAccelerationPoint.getSpeed());
        harshAccelerationPointTmp.setHeight(harshAccelerationPoint.getHeight());
        harshAccelerationPointTmp.setAcceleration(harshAccelerationPoint.getAcceleration());
        harshAccelerationPointTmp.setInitialSpeed(harshAccelerationPoint.getInitialSpeed());
        harshAccelerationPointTmp.setEndSpeed(harshAccelerationPoint.getEndSpeed());
        return harshAccelerationPointTmp;
    }

    @Override
    public String toString() {
        return "HarshAccelerationPoint [location=" + location + ", coordType=" + coordType
                + ", locTime=" + locTime
                + ", acceleration=" + acceleration + ", initialSpeed=" + initialSpeed
                + ", endSpeed=" + endSpeed + "]";
    }

}
