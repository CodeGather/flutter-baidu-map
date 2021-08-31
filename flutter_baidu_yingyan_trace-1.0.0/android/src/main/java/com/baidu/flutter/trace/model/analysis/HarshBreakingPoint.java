package com.baidu.flutter.trace.model.analysis;

import com.baidu.flutter.trace.model.LatLng;
import com.baidu.flutter.trace.model.Point;

/**
 * 急刹车点
 *
 * @author baidu
 */
public class HarshBreakingPoint extends Point {

    /**
     * 实际加速度，单位：m/s^2
     */
    private double acceleration;

    /**
     * 刹车前时速，单位：km/h
     */
    private double initialSpeed;

    /**
     * 刹车后时速，单位：km/h
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
     * 获取刹车前时速，单位：km/h
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
     * 获取刹车后时速，单位：km/h
     *
     * @return
     */
    public double getEndSpeed() {
        return endSpeed;
    }

    public void setEndSpeed(double endSpeed) {
        this.endSpeed = endSpeed;
    }

    public HarshBreakingPoint() {
        super();
    }

    /**
     * @param coordType 坐标类型
     */
    public HarshBreakingPoint(int coordType) {
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
    public HarshBreakingPoint(LatLng location, int coordType, long locTime,
                              double acceleration, double initialSpeed, double endSpeed) {
        super();
        this.location = location;
        this.coordType = coordType;
        this.locTime = locTime;
        this.acceleration = acceleration;
        this.initialSpeed = initialSpeed;
        this.endSpeed = endSpeed;
    }

    public static HarshBreakingPoint fromSDKObject(
            com.baidu.trace.api.analysis.HarshBreakingPoint harshBreakingPoint) {
        if (harshBreakingPoint == null) {
            return null;
        }
        HarshBreakingPoint harshBreakingPointTmp = new HarshBreakingPoint();
        harshBreakingPointTmp.setLocation(harshBreakingPoint.getLocation());
        harshBreakingPointTmp.setCoordType(harshBreakingPoint.getCoordType().ordinal());
        harshBreakingPointTmp.setRadius(harshBreakingPoint.getRadius());
        harshBreakingPointTmp.setLocTime(harshBreakingPoint.getLocTime());
        harshBreakingPointTmp.setDirection(harshBreakingPoint.getDirection());
        harshBreakingPointTmp.setSpeed(harshBreakingPoint.getSpeed());
        harshBreakingPointTmp.setHeight(harshBreakingPoint.getHeight());
        harshBreakingPointTmp.setAcceleration(harshBreakingPoint.getAcceleration());
        harshBreakingPointTmp.setInitialSpeed(harshBreakingPoint.getInitialSpeed());
        harshBreakingPointTmp.setEndSpeed(harshBreakingPoint.getEndSpeed());
        return harshBreakingPointTmp;
    }

    @Override
    public String toString() {
        return "HarshBreakingPoint [location=" + location + ", coordType=" + coordType
                + ", locTime=" + locTime
                + ", acceleration=" + acceleration + ", initialSpeed=" + initialSpeed
                + ", endSpeed=" + endSpeed + "]";
    }

}
