package com.baidu.flutter.trace.model.analysis;

import java.util.ArrayList;
import java.util.List;

import com.baidu.flutter.trace.model.BaseResult;

/**
 * 驾驶行为响应结果
 *
 * @author baidu
 */
public final class DrivingBehaviorResult extends BaseResult {

    /**
     * 行程里程，单位：米
     */
    private double distance;

    /**
     * 行程耗时，单位：秒
     */
    private int duration;

    /**
     * 平均时速，单位：km/h
     */
    private double averageSpeed;

    /**
     * 最高时速，单位：km/h
     */
    private double maxSpeed;

    /**
     * 超速次数
     */
    private int speedingNum;

    /**
     * 急加速次数
     */
    private int harshAccelerationNum;

    /**
     * 急刹车次数
     */
    private int harshBreakingNum;

    /**
     * 急转弯次数
     */
    private int harshSteeringNum;

    /**
     * 起点信息
     */
    private StartPoint startPoint;

    /**
     * 终点信息
     */
    private EndPoint endPoint;

    /**
     * 超速记录集合
     */
    private List<SpeedingInfo> speedings;

    /**
     * 急加速记录集合
     */
    private List<HarshAccelerationPoint> harshAccelerationPoints;

    /**
     * 急刹车记录集合
     */
    private List<HarshBreakingPoint> harshBreakingPoints;

    /**
     * 急转弯记录集合
     */
    private List<HarshSteeringPoint> harshSteeringPoints;

    /**
     * 获取行程里程，单位：米
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
     * 获取行程耗时，单位：秒
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
     * 获取平均时速，单位：km/h
     *
     * @return
     */
    public double getAverageSpeed() {
        return averageSpeed;
    }

    public void setAverageSpeed(double averageSpeed) {
        this.averageSpeed = averageSpeed;
    }

    /**
     * 获取最高时速，单位：km/h
     *
     * @return
     */
    public double getMaxSpeed() {
        return maxSpeed;
    }

    public void setMaxSpeed(double maxSpeed) {
        this.maxSpeed = maxSpeed;
    }

    /**
     * 获取超速次数
     *
     * @return
     */
    public int getSpeedingNum() {
        return speedingNum;
    }

    public void setSpeedingNum(int speedingNum) {
        this.speedingNum = speedingNum;
    }

    /**
     * 获取急加速次数
     *
     * @return
     */
    public int getHarshAccelerationNum() {
        return harshAccelerationNum;
    }

    public void setHarshAccelerationNum(int harshAccelerationNum) {
        this.harshAccelerationNum = harshAccelerationNum;
    }

    /**
     * 获取急刹车次数
     */
    public int getHarshBreakingNum() {
        return harshBreakingNum;
    }

    public void setHarshBreakingNum(int harshBreakingNum) {
        this.harshBreakingNum = harshBreakingNum;
    }

    /**
     * 获取急转弯次数
     *
     * @return
     */
    public int getHarshSteeringNum() {
        return harshSteeringNum;
    }

    public void setHarshSteeringNum(int harshSteeringNum) {
        this.harshSteeringNum = harshSteeringNum;
    }

    /**
     * 获取起点信息
     *
     * @return
     */
    public StartPoint getStartPoint() {
        return startPoint;
    }

    public void setStartPoint(StartPoint startPoint) {
        this.startPoint = startPoint;
    }

    /**
     * 获取终点信息
     *
     * @return
     */
    public EndPoint getEndPoint() {
        return endPoint;
    }

    public void setEndPoint(EndPoint endPoint) {
        this.endPoint = endPoint;
    }

    /**
     * 获取超速记录集合
     *
     * @return
     */
    public List<SpeedingInfo> getSpeedings() {
        return speedings;
    }

    public void setSpeedings(List<SpeedingInfo> speedings) {
        this.speedings = speedings;
    }

    /**
     * 获取急加速记录集合
     *
     * @return
     */
    public List<HarshAccelerationPoint> getHarshAccelerationPoints() {
        return harshAccelerationPoints;
    }

    public void setHarshAccelerationPoints(List<HarshAccelerationPoint> harshAccelerationPoints) {
        this.harshAccelerationPoints = harshAccelerationPoints;
    }

    /**
     * 获取急刹车记录集合
     *
     * @return
     */
    public List<HarshBreakingPoint> getHarshBreakingPoints() {
        return harshBreakingPoints;
    }

    public void setHarshBreakingPoints(List<HarshBreakingPoint> harshBreakingPoints) {
        this.harshBreakingPoints = harshBreakingPoints;
    }

    /**
     * 获取急转弯记录集合
     *
     * @return
     */
    public List<HarshSteeringPoint> getHarshSteeringPoints() {
        return harshSteeringPoints;
    }

    public void setHarshSteeringPoints(List<HarshSteeringPoint> harshSteeringPoints) {
        this.harshSteeringPoints = harshSteeringPoints;
    }

    public DrivingBehaviorResult() {
        super();
    }

    /**
     * @param tag     响应标识
     * @param status  状态码
     * @param message 状态信息
     */
    public DrivingBehaviorResult(int tag, int status, String message) {
        super(tag, status, message);
    }

    /**
     * @param tag                     响应标识（与请求标识对应）
     * @param status                  状态码
     * @param message                 状态信息
     * @param distance                行程里程，单位：米
     * @param duration                行程耗时，单位：秒
     * @param averageSpeed            平均时速，单位：km/h
     * @param maxSpeed                最高时速，单位：km/h
     * @param speedingNum             超速次数
     * @param harshAccelerationNum    急加速次数
     * @param harshBreakingNum        急刹车次数
     * @param harshSteeringNum        急转弯次数
     * @param startPoint              起点信息
     * @param endPoint                终点信息
     * @param speedings               超速记录集合
     * @param harshAccelerationPoints 急加速记录集合
     * @param harshBreakingPoints     急刹车记录集合
     * @param harshSteeringPoints     急转弯记录集合
     */
    public DrivingBehaviorResult(int tag, int status, String message, double distance, int duration,
                                 double averageSpeed, double maxSpeed, int speedingNum,
                                 int harshAccelerationNum,
                                 int harshBreakingNum,
                                 int harshSteeringNum,
                                 com.baidu.trace.api.analysis.StartPoint startPoint,
                                 com.baidu.trace.api.analysis.EndPoint endPoint,
                                 List<com.baidu.trace.api.analysis.SpeedingInfo> speedings,
                                 List<com.baidu.trace.api.analysis.HarshAccelerationPoint> harshAccelerationPoints,
                                 List<com.baidu.trace.api.analysis.HarshBreakingPoint> harshBreakingPoints,
                                 List<com.baidu.trace.api.analysis.HarshSteeringPoint> harshSteeringPoints) {
        super(tag, status, message);
        this.distance = distance;
        this.duration = duration;
        this.averageSpeed = averageSpeed;
        this.maxSpeed = maxSpeed;
        this.speedingNum = speedingNum;
        this.harshAccelerationNum = harshAccelerationNum;
        this.harshBreakingNum = harshBreakingNum;
        this.harshSteeringNum = harshSteeringNum;
        if (startPoint != null) {
            this.startPoint = StartPoint.fromSDKObject(startPoint);
        }

        if (endPoint != null) {
            this.endPoint = EndPoint.fromSDKObject(endPoint);
        }

        if (speedings != null) {
            List<SpeedingInfo> flutterSpeedingInfos = new ArrayList<>();
            for (com.baidu.trace.api.analysis.SpeedingInfo speedingInfo : speedings) {
                flutterSpeedingInfos.add(SpeedingInfo.fromSDKObject(speedingInfo));
            }
            this.speedings = flutterSpeedingInfos;
        }

        if (harshAccelerationPoints != null) {
            List<HarshAccelerationPoint> flutterHarshAccelerationPoints = new ArrayList<>();
            for (com.baidu.trace.api.analysis.HarshAccelerationPoint harshAccelerationPoint :
                    harshAccelerationPoints) {
                flutterHarshAccelerationPoints
                        .add(HarshAccelerationPoint.fromSDKObject(harshAccelerationPoint));
            }
            this.harshAccelerationPoints = flutterHarshAccelerationPoints;
        }

        if (harshBreakingPoints != null) {
            List<HarshBreakingPoint> flutterHarshBreakingPoints = new ArrayList<>();
            for (com.baidu.trace.api.analysis.HarshBreakingPoint harshBreakingPoint :
                    harshBreakingPoints) {
                flutterHarshBreakingPoints
                        .add(HarshBreakingPoint.fromSDKObject(harshBreakingPoint));
            }
            this.harshBreakingPoints = flutterHarshBreakingPoints;
        }

        if (harshSteeringPoints != null) {
            List<HarshSteeringPoint> flutterHarshSteeringPoints = new ArrayList<>();
            for (com.baidu.trace.api.analysis.HarshSteeringPoint harshSteeringPoint :
                    harshSteeringPoints) {
                flutterHarshSteeringPoints
                        .add(HarshSteeringPoint.fromSDKObject(harshSteeringPoint));
            }
            this.harshSteeringPoints = flutterHarshSteeringPoints;
        }
    }

    @Override
    public String toString() {
        StringBuffer speedingPointsStr = new StringBuffer("[");
        if (null != speedings && speedings.size() > 0) {
            int size = speedings.size();
            for (int i = 0; i < size; ++i) {
                speedingPointsStr.append("[");
                SpeedingInfo info = speedings.get(i);
                if (null == info || null == info.getPoints() || 0 == info.getPoints().size()) {
                    continue;
                }
                List<SpeedingPoint> points = info.getPoints();
                int pSize = points.size();
                for (int j = 0; j < pSize; ++j) {
                    speedingPointsStr.append(points.get(j).toString());
                    if (j < pSize - 1) {
                        speedingPointsStr.append(",");
                    }
                }
                speedingPointsStr.append("]");
                if (i < size - 1) {
                    speedingPointsStr.append(",");
                }
            }
        }
        speedingPointsStr.append("]");

        return "DrivingBehaviorResponse [tag=" + tag + ", status=" + status + ", message=" + message
                + ", distance="
                + distance + ", duration=" + duration + ", averageSpeed=" + averageSpeed
                + ", maxSpeed=" + maxSpeed
                + ", speedingNum=" + speedingNum + ", harshAccelerationNum=" + harshAccelerationNum
                + ", harshBreakingNum=" + harshBreakingNum + ", harshSteeringNum="
                + harshSteeringNum + ", startPoint="
                + startPoint + ", endPoint=" + endPoint + ", speedingPoints=" + speedingPointsStr
                .toString()
                + ", harshAccelerationPoints=" + harshAccelerationPoints + ", harshBreakingPoints="
                + harshBreakingPoints + ", harshSteeringPoints=" + harshSteeringPoints + "]";
    }
}
