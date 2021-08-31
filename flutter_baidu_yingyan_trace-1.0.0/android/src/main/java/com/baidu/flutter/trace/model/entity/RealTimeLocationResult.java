package com.baidu.flutter.trace.model.entity;


import com.baidu.flutter.trace.model.BaseResult;
import com.baidu.trace.model.LocType;

/**
 * 实时定位信息
 *
 * @author baidu
 */
public final class RealTimeLocationResult extends BaseResult {

    /**
     * 定位类型
     */
    private int locType = LocType.NONE.ordinal();

    /**
     * 楼层信息
     */
    private String floor = "";

    /**
     * 室内定位结果类型
     */
    private String indoor = "";

    /**
     * 建筑物信息
     */
    private String building = "";

    /**
     * 纬度
     */
    private double latitude = 0;

    /**
     * 经度
     */
    private double longitude = 0;

    /**
     * 坐标类型
     */
    private int coordType = com.baidu.trace.model.CoordType.bd09ll.ordinal();

    /**
     * 精度（单位 : 米）
     */
    private double radius = 0;

    /**
     * 方向（单位 : 度）
     */
    private double direction = 0;

    /**
     * 速度（单位 : 公里/小时）
     */
    private double speed = 0;

    /**
     * 高度（单位 : 米）
     */
    private int altitude = 0;

    /**
     * 定位时间（格式 : yyyy-MM-dd HH:mm:ss, eg : 2015-01-01 14:01:01）
     */
    private String time = "";

    /**
     * 获取定位类型
     *
     * @return
     */
    public int getLocType() {
        return locType;
    }

    public void setLocType(int locType) {
        this.locType = locType;
    }

    /**
     * 获取楼层信息
     *
     * @return
     */
    public String getFloor() {
        return floor;
    }

    public void setFloor(String floor) {
        this.floor = floor;
    }

    /**
     * 获取室内定位结果类型
     *
     * @return
     */
    public String getIndoor() {
        return indoor;
    }

    public void setIndoor(String indoor) {
        this.indoor = indoor;
    }

    /**
     * 获取建筑物信息
     *
     * @return
     */
    public String getBuilding() {
        return building;
    }

    public void setBuilding(String building) {
        this.building = building;
    }

    /**
     * 获取纬度坐标
     *
     * @return
     */
    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    /**
     * 获取经度坐标
     *
     * @return
     */
    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
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
     * 获取定位精度（单位 : 米）
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
     * 当前定位时间（格式 : yyyy-MM-dd HH:mm:ss, eg : 2015-01-01 14:01:01）
     *
     * @return
     */
    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    /**
     * 获取速度方向（行进的方向），仅GPS定位结果时有速度信息，单位 : 度
     *
     * @return
     */
    public double getDirection() {
        return direction;
    }

    public void setDirection(float direction) {
        this.direction = direction;
    }

    /**
     * 获取速度，仅gps定位结果时有速度信息，单位 : 公里/小时
     *
     * @return
     */
    public double getSpeed() {
        return speed;
    }

    public void setSpeed(float speed) {
        this.speed = speed;
    }

    /**
     * 获取高度信息，仅GPS定位结果时有高度信息，单位 : 米
     *
     * @return
     */
    public int getAltitude() {
        return altitude;
    }

    public void setAltitude(int altitude) {
        this.altitude = altitude;
    }

    public RealTimeLocationResult() {
        super();
    }

    /**
     * @param tag     响应标识
     * @param status  状态码
     * @param message 状态信息
     */
    public RealTimeLocationResult(int tag, int status, String message) {
        super(tag, status, message);
    }

    /**
     * @param tag       响应标识
     * @param status    状态码
     * @param message   状态信息
     * @param floor     楼层
     * @param indoor    室内定位结果类型
     * @param building  建筑物
     * @param latitude  纬度
     * @param longitude 经度
     * @param coordType 坐标类型
     * @param radius    精度（单位 : 米）
     * @param direction 方向（单位 : 度）
     * @param speed     速度（单位 : 公里/小时）
     * @param altitude  高度（单位 : 米）
     * @param time      定位时间（格式 : yyyy-MM-dd HH:mm:ss）
     */
    public RealTimeLocationResult(int tag, int status, String message, String floor, String indoor, String building,
                                  double latitude, double longitude, int coordType, double radius,
                                  float direction, float speed, int altitude, String time) {
        super(tag, status, message);
        this.floor = floor;
        this.indoor = indoor;
        this.building = building;
        this.latitude = latitude;
        this.longitude = longitude;
        this.coordType = coordType;
        this.radius = radius;
        this.direction = direction;
        this.speed = speed;
        this.altitude = altitude;
        this.time = time;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("TraceLocation{");
        sb.append("tag=").append(tag);
        sb.append(", status=").append(status);
        sb.append(", message='").append(message).append('\'');
        sb.append(", locType=").append(locType);
        sb.append(", floor='").append(floor).append('\'');
        sb.append(", indoor='").append(indoor).append('\'');
        sb.append(", building='").append(building).append('\'');
        sb.append(", latitude=").append(latitude);
        sb.append(", longitude=").append(longitude);
        sb.append(", coordType=").append(coordType);
        sb.append(", radius=").append(radius);
        sb.append(", direction=").append(direction);
        sb.append(", speed=").append(speed);
        sb.append(", altitude=").append(altitude);
        sb.append(", time='").append(time).append('\'');
        sb.append('}');
        return sb.toString();
    }
}
