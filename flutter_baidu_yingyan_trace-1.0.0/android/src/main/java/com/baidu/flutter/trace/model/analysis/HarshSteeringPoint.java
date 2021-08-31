package com.baidu.flutter.trace.model.analysis;

import com.baidu.flutter.trace.model.LatLng;
import com.baidu.flutter.trace.model.Point;

/**
 * 急转弯点
 *
 * @author baidu
 */
public class HarshSteeringPoint extends Point {

    /**
     * 向心加速度，单位：m/s^2
     */
    private double centripetalAcceleration;

    /**
     * 转向类型
     */
    private int turnType;

    /**
     * 转向时速，单位：km/h
     */
    private double turnSpeed;

    /**
     * 获取向心加速度，单位：m/s^2
     *
     * @return
     */
    public double getCentripetalAcceleration() {
        return centripetalAcceleration;
    }

    public void setCentripetalAcceleration(double centripetalAcceleration) {
        this.centripetalAcceleration = centripetalAcceleration;
    }

    /**
     * 获取转向类型
     *
     * @return
     */
    public int getTurnType() {
        return turnType;
    }

    public void setTurnType(int turnType) {
        this.turnType = turnType;
    }

    /**
     * 获取转向时速，单位：km/h
     *
     * @return
     */
    public double getTurnSpeed() {
        return turnSpeed;
    }

    public void setTurnSpeed(double turnSpeed) {
        this.turnSpeed = turnSpeed;
    }

    public HarshSteeringPoint() {
        super();
    }

    /**
     * @param coordType 坐标类型
     */
    public HarshSteeringPoint(int coordType) {
        this.coordType = coordType;
    }

    /**
     * @param location                经纬度坐标
     * @param coordType               坐标类型
     * @param locTime                 定位时间
     * @param centripetalAcceleration 向心加速度，单位：m/s^2
     * @param turnType                转向类型
     * @param turnSpeed               转向时速，单位：km/h
     */
    public HarshSteeringPoint(LatLng location, int coordType, long locTime,
                              double centripetalAcceleration,
                              int turnType, double turnSpeed) {
        super();
        this.location = location;
        this.coordType = coordType;
        this.locTime = locTime;
        this.centripetalAcceleration = centripetalAcceleration;
        this.turnType = turnType;
        this.turnSpeed = turnSpeed;
    }

    public static HarshSteeringPoint fromSDKObject(
            com.baidu.trace.api.analysis.HarshSteeringPoint harshSteeringPoint) {
        if (harshSteeringPoint == null) {
            return null;
        }
        HarshSteeringPoint harshSteeringPointTmp = new HarshSteeringPoint();
        harshSteeringPointTmp.setLocation(harshSteeringPoint.getLocation());
        harshSteeringPointTmp.setCoordType(harshSteeringPoint.getCoordType().ordinal());
        harshSteeringPointTmp.setRadius(harshSteeringPoint.getRadius());
        harshSteeringPointTmp.setLocTime(harshSteeringPoint.getLocTime());
        harshSteeringPointTmp.setDirection(harshSteeringPoint.getDirection());
        harshSteeringPointTmp.setSpeed(harshSteeringPoint.getSpeed());
        harshSteeringPointTmp.setHeight(harshSteeringPoint.getHeight());
        harshSteeringPointTmp
                .setCentripetalAcceleration(harshSteeringPoint.getCentripetalAcceleration());
        harshSteeringPointTmp.setTurnSpeed(harshSteeringPoint.getTurnSpeed());
        harshSteeringPointTmp.setTurnType(harshSteeringPoint.getTurnType().ordinal());
        return harshSteeringPointTmp;
    }

    @Override
    public String toString() {
        return "HarshSteeringPoint [location=" + location + ", coordType=" + coordType
                + ", locTime=" + locTime
                + ", centripetalAcceleration=" + centripetalAcceleration + ", turnType=" + turnType
                + ", turnSpeed="
                + turnSpeed + "]";
    }

}
