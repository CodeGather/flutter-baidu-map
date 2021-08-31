package com.baidu.flutter.trace.model.analysis;

import com.baidu.flutter.trace.model.Point;

/**
 * 终点信息
 *
 * @author baidu
 */
public class EndPoint extends Point {

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

    public EndPoint() {
        super();
    }

    /**
     * @param coordType 坐标类型
     */
    public EndPoint(int coordType) {
        this.coordType = coordType;
    }

    /**
     * @param address 地址信息
     */
    public EndPoint(String address) {
        super();
        this.address = address;
    }

    public static EndPoint fromSDKObject(com.baidu.trace.api.analysis.EndPoint endPoint) {
        if (endPoint == null) {
            return null;
        }
        EndPoint flutterEndPoint = new EndPoint();
        flutterEndPoint.setLocation(endPoint.getLocation());
        flutterEndPoint.setCoordType(endPoint.getCoordType().ordinal());
        flutterEndPoint.setRadius(endPoint.getRadius());
        flutterEndPoint.setLocTime(endPoint.getLocTime());
        flutterEndPoint.setDirection(endPoint.getDirection());
        flutterEndPoint.setSpeed(endPoint.getSpeed());
        flutterEndPoint.setHeight(endPoint.getHeight());
        flutterEndPoint.setAddress(endPoint.getAddress());
        return flutterEndPoint;
    }

    @Override
    public String toString() {
        return "EndPoint [location=" + location + ", coordType=" + coordType + ", locTime="
                + locTime + ", address=" + address + "]";
    }

}
