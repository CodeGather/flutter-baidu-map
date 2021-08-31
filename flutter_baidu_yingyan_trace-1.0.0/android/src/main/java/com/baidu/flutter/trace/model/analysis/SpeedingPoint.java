package com.baidu.flutter.trace.model.analysis;

import com.baidu.flutter.trace.model.LatLng;
import com.baidu.flutter.trace.model.Point;

/**
 * 超速点
 *
 * @author baidu
 */
public class SpeedingPoint extends Point {

    /**
     * 实际行使时速，单位：km/h
     */
    private double actualSpeed;

    /**
     * 所在道路限定最高时速，单位：km/h
     */
    private double limitSpeed;

    /**
     * 获取实际行使时速，单位：km/h
     *
     * @return
     */
    public double getActualSpeed() {
        return actualSpeed;
    }

    public void setActualSpeed(double actualSpeed) {
        this.actualSpeed = actualSpeed;
    }

    /**
     * 获取所在道路限定最高时速，单位：km/h
     *
     * @return
     */
    public double getLimitSpeed() {
        return limitSpeed;
    }

    public void setLimitSpeed(double limitSpeed) {
        this.limitSpeed = limitSpeed;
    }

    public SpeedingPoint() {
        super();
    }

    /**
     * @param coordType 坐标类型
     */
    public SpeedingPoint(int coordType) {
        this.coordType = coordType;
    }

    /**
     * @param location    经纬度坐标
     * @param coordType   坐标类型
     * @param locTime     定位时间
     * @param actualSpeed 实际行使时速，单位：km/h
     * @param limitSpeed  所在道路限定最高时速，单位：km/h
     */
    public SpeedingPoint(LatLng location, int coordType, long locTime, double actualSpeed,
                         double limitSpeed) {
        super();
        this.location = location;
        this.coordType = coordType;
        this.locTime = locTime;
        this.actualSpeed = actualSpeed;
        this.limitSpeed = limitSpeed;
    }

    public static SpeedingPoint fromSDKObject(
            com.baidu.trace.api.analysis.SpeedingPoint speedingPoint) {
        if (speedingPoint == null) {
            return null;
        }
        SpeedingPoint speedingPointTmp = new SpeedingPoint();
        speedingPointTmp.setLocation(speedingPoint.getLocation());
        speedingPointTmp.setCoordType(speedingPoint.getCoordType().ordinal());
        speedingPointTmp.setRadius(speedingPoint.getRadius());
        speedingPointTmp.setLocTime(speedingPoint.getLocTime());
        speedingPointTmp.setDirection(speedingPoint.getDirection());
        speedingPointTmp.setSpeed(speedingPoint.getSpeed());
        speedingPointTmp.setHeight(speedingPoint.getHeight());
        speedingPointTmp.setActualSpeed(speedingPoint.getActualSpeed());
        speedingPointTmp.setLimitSpeed(speedingPoint.getLimitSpeed());
        return speedingPointTmp;
    }

    @Override
    public String toString() {
        return "SpeedingPoint [location=" + location + ", coordType=" + coordType + ", locTime="
                + locTime
                + ", actualSpeed=" + actualSpeed + ", limitSpeed=" + limitSpeed + "]";
    }

}
