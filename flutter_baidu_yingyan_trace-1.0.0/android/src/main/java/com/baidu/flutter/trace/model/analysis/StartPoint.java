package com.baidu.flutter.trace.model.analysis;

import com.baidu.flutter.trace.model.Point;

/**
 * 起点信息
 *
 * @author baidu
 */
public class StartPoint extends Point {

    /**
     * 地址信息
     */
    private String address;

    /**
     * 获取地址信息
     *
     * @return
     */
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public StartPoint() {
        super();
    }

    /**
     * @param coordType 坐标类型
     */
    public StartPoint(int coordType) {
        this.coordType = coordType;
    }

    /**
     * @param address 地址信息
     */
    public StartPoint(String address) {
        super();
        this.address = address;
    }

    public static StartPoint fromSDKObject(com.baidu.trace.api.analysis.StartPoint startPoint) {
        if (startPoint == null) {
            return null;
        }
        StartPoint flutterStartPoint = new StartPoint();
        flutterStartPoint.setLocation(startPoint.getLocation());
        flutterStartPoint.setCoordType(startPoint.getCoordType().ordinal());
        flutterStartPoint.setRadius(startPoint.getRadius());
        flutterStartPoint.setLocTime(startPoint.getLocTime());
        flutterStartPoint.setDirection(startPoint.getDirection());
        flutterStartPoint.setSpeed(startPoint.getSpeed());
        flutterStartPoint.setHeight(startPoint.getHeight());
        flutterStartPoint.setAddress(startPoint.getAddress());
        return flutterStartPoint;
    }

    @Override
    public String toString() {
        return "StartPoint [location=" + location + ", coordType=" + coordType + ", locTime="
                + locTime + ", address=" + address + "]";
    }

}
