package com.baidu.flutter.trace.model.track;

import com.baidu.flutter.trace.model.BaseResult;

/**
 * 查询里程响应结果
 *
 * @author baidu
 */
public final class DistanceResult extends BaseResult {

    /**
     * entity名称
     */
    private String entityName;

    /**
     * 符合条件的轨迹点的里程
     */
    private double distance;

    /**
     * 低速里程, 单位米
     * V3.1.0新增字段
     * <p>
     * 若请求参数{@link DistanceOption}lowSpeedThreshold，则返回该字段，否则不返回
     * 代表速度低于lowSpeedThreshold的里程
     */
    private double lowSpeedDistance;

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
     * 获取符合条件的轨迹点的里程
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
     * 获取低速里程, 单位米
     * V3.1.0新增字段
     * <p>
     * 若请求参数{@link DistanceOption}lowSpeedThreshold，则返回该字段，否则不返回
     * 代表速度低于lowSpeedThreshold的里程
     *
     * @return 低速里程
     */
    public double getLowSpeedDistance() {
        return lowSpeedDistance;
    }

    /**
     * 设置低速里程, 单位米
     * V3.1.0新增字段
     * <p>
     * 若请求参数{@link DistanceOption}lowSpeedThreshold，则返回该字段，否则不返回
     * 代表速度低于lowSpeedThreshold的里程
     *
     * @param lowSpeedDistance 低速里程
     */
    public void setLowSpeedDistance(double lowSpeedDistance) {
        this.lowSpeedDistance = lowSpeedDistance;
    }

    public DistanceResult() {
        super();
    }

    /**
     * @param tag     响应标识（与请求标识一致）
     * @param status  状态码
     * @param message 状态消息
     */
    public DistanceResult(int tag, int status, String message) {
        super(tag, status, message);
    }

    /**
     * @param tag        响应标识（与请求标识一致）
     * @param status     状态码
     * @param message    状态消息
     * @param entityName entity标识
     * @param distance   里程
     */
    public DistanceResult(int tag, int status, String message, String entityName,
                          double distance, double lowSpeedDistance) {
        super(tag, status, message);
        this.entityName = entityName;
        this.distance = distance;
        this.lowSpeedDistance = lowSpeedDistance;
    }

    @Override
    public String toString() {
        return "DistanceResponse [tag=" + tag + ", status=" + status + ", message=" + message
                + ", entityName="
                + entityName + ", distance=" + distance + ", lowSpeedDistance=" + lowSpeedDistance
                + "]";
    }

}
