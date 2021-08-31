package com.baidu.flutter.trace.model.analysis;

import com.baidu.flutter.trace.model.LatLng;
import com.baidu.flutter.trace.model.Point;

/**
 * 停留点
 *
 * @author baidu
 */
public class StayPoint extends Point {

    /**
     * 停留开始时间
     */
    private long startTime;

    /**
     * 停留结束时间
     */
    private long endTime;

    /**
     * 停留时长，单位：秒
     */
    private int duration;

    /**
     * 获取停留开始时间
     *
     * @return
     */
    public long getStartTime() {
        return startTime;
    }

    public void setStartTime(long startTime) {
        this.startTime = startTime;
    }

    /**
     * 获取停留结束时间
     *
     * @return
     */
    public long getEndTime() {
        return endTime;
    }

    public void setEndTime(long endTime) {
        this.endTime = endTime;
    }

    /**
     * 获取停留时长
     *
     * @return
     */
    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    /**
     * 获取停留点经纬度坐标
     *
     * @return
     */
    public LatLng getLocation() {
        return location;
    }

    public void setLocation(LatLng location) {
        this.location = location;
    }

    public StayPoint() {
        super();
    }

    /**
     * @param startTime 停留开始时间
     * @param endTime   停留结束时间
     * @param duration  停留时长，单位：秒
     * @param location  经纬度坐标
     * @param coordType 坐标类型
     */
    public StayPoint(long startTime, long endTime, int duration, LatLng location, int coordType) {
        super();
        this.startTime = startTime;
        this.endTime = endTime;
        this.duration = duration;
        this.location = location;
        this.coordType = coordType;
    }

    @Override
    public String toString() {
        return "StayPoint [startTime=" + startTime + ", endTime=" + endTime + ", duration="
                + duration + ", location="
                + location + ", coordType=" + coordType + "]";
    }

}
