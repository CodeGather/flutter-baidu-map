package com.baidu.flutter.trace.model;

/**
 * 经纬度坐标：用于封装鹰眼SDK中各接口使用到的经纬度信息
 *
 * @author baidu
 */
public final class LatLng {

    /**
     * 纬度
     */
    public double latitude;

    /**
     * 经度
     */
    public double longitude;

    public double getLatitude() {
        return latitude;
    }

    /**
     * 设置坐标纬度
     *
     * @param latitude
     */
    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public double getLongitude() {
        return longitude;
    }

    /**
     * 设置坐标经度
     *
     * @param longitude
     */
    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    public LatLng() {
        super();
    }

    /**
     * @param latitude  纬度
     * @param longitude 经度
     */
    public LatLng(double latitude, double longitude) {
        super();
        this.latitude = latitude;
        this.longitude = longitude;
    }

    public static LatLng fromSDKObject(com.baidu.trace.model.LatLng latLng) {
        if (latLng == null) {
            return null;
        }
        LatLng latLngTmp = new LatLng();
        latLngTmp.latitude = latLng.getLatitude();
        latLngTmp.longitude = latLng.getLongitude();
        return latLngTmp;
    }

    public com.baidu.trace.model.LatLng toLatLng() {
        com.baidu.trace.model.LatLng latLng = new com.baidu.trace.model.LatLng();
        latLng.latitude = latitude;
        latLng.longitude = longitude;
        return latLng;
    }

    @Override
    public String toString() {
        return "LatLng [latitude=" + latitude + ", longitude=" + longitude + "]";
    }

}
