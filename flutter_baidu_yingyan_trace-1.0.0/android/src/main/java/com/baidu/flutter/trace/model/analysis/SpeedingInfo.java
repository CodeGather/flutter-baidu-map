package com.baidu.flutter.trace.model.analysis;

import java.util.ArrayList;
import java.util.List;

/**
 * 超速信息
 *
 * @author baidu
 */
public class SpeedingInfo {

    /**
     * 超速里程，单位：米
     */
    private double distance;

    /**
     * 超速点集合
     */
    private List<SpeedingPoint> points;

    /**
     * 获取超速里程，单位：米
     *
     * @return
     */
    public double getDistance() {
        return distance;
    }

    public void setDistance(double distance) {
        this.distance = distance;
    }

    /**
     * 获取超速点集合
     *
     * @return
     */
    public List<SpeedingPoint> getPoints() {
        return points;
    }

    public void setPoints(List<SpeedingPoint> points) {
        this.points = points;
    }

    public SpeedingInfo() {
        super();
    }

    /**
     * @param distance 超速里程，单位：米
     * @param points   超速点集合
     */
    public SpeedingInfo(double distance, List<SpeedingPoint> points) {
        super();
        this.distance = distance;
        this.points = points;
    }

    public static SpeedingInfo fromSDKObject(
            com.baidu.trace.api.analysis.SpeedingInfo speedingInfo) {
        if (speedingInfo == null) {
            return null;
        }
        SpeedingInfo speedingInfoTmp = new SpeedingInfo();
        speedingInfoTmp.setDistance(speedingInfo.getDistance());
        if (speedingInfo.getPoints() != null) {
            List<SpeedingPoint> speedingPoints = new ArrayList<>();
            for (com.baidu.trace.api.analysis.SpeedingPoint speedingPoint :
                    speedingInfo.getPoints()) {
                SpeedingPoint speedingPointTmp = SpeedingPoint.fromSDKObject(speedingPoint);
                speedingPoints.add(speedingPointTmp);
            }
            speedingInfoTmp.setPoints(speedingPoints);
        }
        return speedingInfoTmp;
    }

    @Override
    public String toString() {
        return "SpeedingInfo [distance=" + distance + ", points=" + points + "]";
    }

}
