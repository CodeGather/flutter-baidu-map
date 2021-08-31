package com.baidu.flutter.trace.model.track;

import com.baidu.flutter.trace.model.BaseResult;

/**
 * 查询最新轨迹点请求参数
 *
 * @author baidu
 */
public final class LatestPointResult extends BaseResult {

    /**
     * Entity名称
     */
    private String entityName;

    /**
     * 最新轨迹点
     */
    private LatestPoint latestPoint;

    /**
     * 道路限速（单位：km/h）
     */
    private double limitSpeed;

    /**
     * 获取Entity名称
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
     * 获取最新轨迹点
     *
     * @return
     */
    public LatestPoint getLatestPoint() {
        return latestPoint;
    }

    public void setLatestPoint(LatestPoint latestPoint) {
        this.latestPoint = latestPoint;
    }

    /**
     * 获取道路限速（单位：km/h）
     *
     * @return
     */
    public double getLimitSpeed() {
        return limitSpeed;
    }

    public void setLimitSpeed(double limitSpeed) {
        this.limitSpeed = limitSpeed;
    }

    public LatestPointResult() {
        super();
    }

    /**
     * @param tag     响应标识
     * @param status  状态码
     * @param message 状态消息
     */
    public LatestPointResult(int tag, int status, String message) {
        super(tag, status, message);
    }

    /**
     * @param tag         响应标识
     * @param status      状态码
     * @param message     状态消息
     * @param entityName  entity标识
     * @param latestPoint 最新轨迹点
     * @param limitSpeed  道路限速（单位：km/h）
     */
    public LatestPointResult(int tag, int status, String message, String entityName,
                             com.baidu.trace.api.track.LatestPoint latestPoint,
                             double limitSpeed) {
        super(tag, status, message);
        this.entityName = entityName;
        this.latestPoint = LatestPoint.fromSDKObject(latestPoint);
        this.limitSpeed = limitSpeed;
    }

    @Override
    public String toString() {
        return "LatestPointResponse [tag=" + tag + ", status=" + status + ", message=" + message
                + ", entityName="
                + entityName + ", latestPoint=" + latestPoint + ", limitSpeed=" + limitSpeed + "]";
    }

}
