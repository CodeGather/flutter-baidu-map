package com.baidu.flutter.trace.model;

/**
 * 位置点信息
 *
 * @author baidu
 */
public class Point {

    /**
     * 经纬度
     */
    public LatLng location;

    /**
     * 坐标类型，默认为百度经纬度
     */
    public int coordType = CoordType.bd09ll.ordinal();

    /**
     * 定位精度（单位：m）
     */
    public double radius;

    /**
     * 定位时间
     */
    public long locTime;

    /**
     * 方向（范围为[0,359]，0度为正北方向，顺时针）
     */
    public int direction;

    /**
     * 速度（单位：km/h）
     */
    public double speed;

    /**
     * 高度（单位： m）
     */
    public double height;

    /**
     * 获取经纬度
     *
     * @return
     */
    public LatLng getLocation() {
        return location;
    }

    public void setLocation(com.baidu.trace.model.LatLng location) {
        this.location = LatLng.fromSDKObject(location);
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
     * 获取定位精度
     *
     * @return
     */
    public double getRadius() {
        return radius;
    }

    public void setRadius(double radius) {
        this.radius = radius;
    }

    /**
     * 获取定位时间
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
     * 获取方向
     *
     * @return
     */
    public int getDirection() {
        return direction;
    }

    public void setDirection(int direction) {
        this.direction = direction;
    }

    /**
     * 获取速度
     *
     * @return
     */
    public double getSpeed() {
        return speed;
    }

    public void setSpeed(double speed) {
        this.speed = speed;
    }

    /**
     * 获取高度
     *
     * @return
     */
    public double getHeight() {
        return height;
    }

    public void setHeight(double height) {
        this.height = height;
    }

    public Point() {
        super();
    }

    /**
     * @param location  经纬度坐标
     * @param coordType 坐标类型
     */
    public Point(LatLng location, int coordType) {
        this.location = location;
        this.coordType = coordType;
    }

    public com.baidu.trace.model.Point toPoint() {
        com.baidu.trace.model.Point point = new com.baidu.trace.model.Point();
        if (location != null) {
            point.setLocation(
                    new com.baidu.trace.model.LatLng(location.latitude, location.longitude));
        }
        point.setCoordType(com.baidu.trace.model.CoordType.values()[coordType]);
        point.setRadius(radius);
        point.setLocTime(locTime);
        point.setDirection(direction);
        point.setSpeed(speed);
        point.setHeight(height);
        return point;
    }

    public static Point fromSDKObject(com.baidu.trace.model.Point point) {
        if (point == null) {
            return null;
        }
        Point pointTmp = new Point();
        if (point.getLocation() != null) {
            pointTmp.setLocation(new com.baidu.trace.model.LatLng(point.getLocation().latitude,
                    point.getLocation().longitude));
        }
        if (point.getCoordType() != null) {
            pointTmp.setCoordType(point.getCoordType().ordinal());
        }
        pointTmp.setRadius(point.getRadius());
        pointTmp.setLocTime(point.getLocTime());
        pointTmp.setDirection(point.getDirection());
        pointTmp.setSpeed(point.getSpeed());
        pointTmp.setHeight(point.getHeight());
        return pointTmp;
    }

    @Override
    public String toString() {
        return "Point [location=" + location + ", coordType=" + coordType + ", radius=" + radius
                + ", locTime="
                + locTime + ", direction=" + direction + ", speed=" + speed + ", height=" + height
                + "]";
    }

}
