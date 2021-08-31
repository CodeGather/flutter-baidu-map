package com.baidu.flutter.trace.model.track;

import java.util.ArrayList;
import java.util.List;

import com.baidu.flutter.trace.model.BaseResult;
import com.baidu.flutter.trace.model.Point;

/**
 * 查询历史轨迹响应结果
 *
 * @author baidu
 */
public final class HistoryTrackResult extends BaseResult {

    /**
     * 忽略掉pageIndex，pageSize后的轨迹点数量
     */
    private int totalSize;

    /**
     * 返回结果条数
     */
    private int size;

    /**
     * entity标识
     */
    private String entityName;

    /**
     * 此段轨迹的里程数，单位：米
     */
    private double distance;

    /**
     * 此段轨迹的收费里程数，单位：米
     */
    private double tollDistance;

    /**
     * 起点信息
     */
    private Point startPoint;

    /**
     * 终点信息
     */
    private Point endPoint;

    /**
     * 轨迹点列表
     */
    public List<TrackPoint> trackPoints;

    /**
     * 低速里程, V3.1.0新增字段
     * <p>
     * 请求参数中填写了lowSpeedThreshold，则返回该字段，否则不返回
     * 代表速度低于low_speed_threshold的轨迹里程
     */
    private double lowSpeedDistance;

    /**
     * 获取轨迹点数量（忽略掉pageIndex，pageSize后的轨迹点数量）
     *
     * @return
     */
    public int getTotalSize() {
        return totalSize;
    }

    public void setTotalSize(int total) {
        this.totalSize = total;
    }

    /**
     * 获取返回结果条数
     *
     * @return
     */
    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    /**
     * 获取Entity标识
     *
     * @return
     */
    public String getEntityName() {
        return entityName;
    }

    public void setEntityName(String entityName) {
        this.entityName = entityName;
    }

    /**
     * 获取此段轨迹的里程数，单位：米
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
     * 获取此段轨迹的收费里程数，单位：米
     *
     * @return
     */
    public double getTollDistance() {
        return tollDistance;
    }

    public void setTollDistance(double tollDistance) {
        this.tollDistance = tollDistance;
    }

    /**
     * 获取起点信息
     *
     * @return
     */
    public Point getStartPoint() {
        return startPoint;
    }

    public void setStartPoint(Point startPoint) {
        this.startPoint = startPoint;
    }

    /**
     * 获取终点信息
     *
     * @return
     */
    public Point getEndPoint() {
        return endPoint;
    }

    public void setEndPoint(Point endPoint) {
        this.endPoint = endPoint;
    }

    /**
     * 获取轨迹点集合
     *
     * @return
     */
    public List<TrackPoint> getTrackPoints() {
        return trackPoints;
    }

    public void setTrackPoints(List<com.baidu.trace.api.track.TrackPoint> trackPoints) {
        if (trackPoints != null) {
            List<TrackPoint> flutterTrackPoints = new ArrayList<>();
            for (com.baidu.trace.api.track.TrackPoint trackPoint : trackPoints) {
                TrackPoint trackPointTmp = new TrackPoint();
                trackPointTmp.setLocation(trackPoint.getLocation());
                trackPointTmp.setCoordType(trackPoint.getCoordType().ordinal());
                trackPointTmp.setRadius(trackPoint.getRadius());
                trackPointTmp.setLocTime(trackPoint.getLocTime());
                trackPointTmp.setDirection(trackPoint.getDirection());
                trackPointTmp.setSpeed(trackPoint.getSpeed());
                trackPointTmp.setCreateTime(trackPoint.getCreateTime());
                trackPointTmp.setObjectName(trackPoint.getObjectName());
                trackPointTmp.setColumns(trackPoint.getColumns());
                trackPointTmp.setRoadGrade(trackPoint.getRoadGrade());
                trackPointTmp.setRoadName(trackPoint.getRoadName());
                trackPointTmp.setLocateMode(trackPoint.getLocateMode());
                trackPointTmp.setTransportMode(trackPoint.getTransportMode());
                flutterTrackPoints.add(trackPointTmp);
            }
            this.trackPoints = flutterTrackPoints;
        }
    }

    /**
     * 获取低速里程
     * V3.1.0新增字段
     * <p>
     * 请求参数中填写了lowSpeedThreshold，则返回该字段，否则不返回
     * 代表速度低于low_speed_threshold的轨迹里程
     *
     * @return 低速里程
     */
    public double getLowSpeedDistance() {
        return lowSpeedDistance;
    }

    /**
     * 设置低速里程
     * V3.1.0新增字段
     * <p>
     * 请求参数中填写了lowSpeedThreshold，则返回该字段，否则不返回
     * 代表速度低于low_speed_threshold的轨迹里程
     *
     * @param lowSpeedDistance 低速里程
     */
    public void setLowSpeedDistance(double lowSpeedDistance) {
        this.lowSpeedDistance = lowSpeedDistance;
    }

    public HistoryTrackResult() {
        super();
    }

    /**
     * @param tag     响应标识（与请求标识一致）
     * @param status  状态码
     * @param message 状态消息
     */
    public HistoryTrackResult(int tag, int status, String message) {
        super(tag, status, message);
    }

    /**
     * @param tag          响应标识（与请求标识一致）
     * @param status       状态码
     * @param message      状态消息
     * @param total        忽略掉pageIndex，pageSize后的轨迹点数量
     * @param size         返回结果条数
     * @param entityName   entity标识
     * @param distance     此段轨迹的里程数，单位：米
     * @param tollDistance 此段轨迹的收费里程数，单位：米
     * @param startPoint   起点信息
     * @param endPoint     终点信息
     * @param trackPoints  轨迹点列表
     */
    public HistoryTrackResult(int tag, int status, String message, int total, int size,
                              String entityName,
                              double distance, double tollDistance,
                              com.baidu.trace.model.Point startPoint,
                              com.baidu.trace.model.Point endPoint,
                              List<com.baidu.trace.api.track.TrackPoint> trackPoints) {
        super(tag, status, message);
        this.totalSize = total;
        this.size = size;
        this.entityName = entityName;
        this.distance = distance;
        this.tollDistance = tollDistance;
        this.startPoint = Point.fromSDKObject(startPoint);
        this.endPoint = Point.fromSDKObject(endPoint);
        if (trackPoints != null) {
            List<TrackPoint> trackPointList = new ArrayList<>();
            for (com.baidu.trace.api.track.TrackPoint trackPoint : trackPoints) {
                trackPointList.add(TrackPoint.fromSDKObject(trackPoint));
            }
            this.trackPoints = trackPointList;
        }
    }

    @Override
    public String toString() {
        return "HistoryTrackResponse [tag=" + tag + ", status=" + status + ", message=" + message
                + ", totalSize=" + totalSize
                + ", size=" + size + ", entityName=" + entityName + ", distance=" + distance
                + ", tollDistance="
                + tollDistance + ", startPoint=" + startPoint + ", endPoint=" + endPoint
                + ", trackPoints="
                + trackPoints + ", lowSpeedDistance=" + lowSpeedDistance + "]";
    }

}
