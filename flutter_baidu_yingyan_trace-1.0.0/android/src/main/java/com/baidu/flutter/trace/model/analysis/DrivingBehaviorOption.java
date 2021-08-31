package com.baidu.flutter.trace.model.analysis;

import com.baidu.flutter.trace.model.BaseOption;
import com.baidu.flutter.trace.model.CoordType;
import com.baidu.flutter.trace.model.ProcessOption;
import com.baidu.trace.api.analysis.DrivingBehaviorRequest;

/**
 * 驾驶行为请求
 *
 * @author baidu
 */
public final class DrivingBehaviorOption extends BaseOption {

    /**
     * entity标识
     */
    private String entityName;

    /**
     * 开始时间
     */
    private long startTime;

    /**
     * 结束时间
     */
    private long endTime;

    /**
     * 限速值，用于计算超速，单位为：km/h，取值范围[0,200]，默认值为0
     * <pre>
     * 0：根据百度地图道路限速数据计算超速点；
     * 其他数值：以设置的数值为阈值，轨迹点速度超过该值则认为是超速。
     * </pre>
     *
     * @deprecated
     */
    private double speedingThreshold = 0.0;

    /**
     * 阈值选项
     */
    private ThresholdOption thresholdOption = null;

    /**
     * 纠偏选项，可选项为：
     * <p>
     * <pre>
     * needMapMatch：绑路（false:不需要，true:需要），
     * transportMode：交通方式（driving, riding, walking）
     * </pre>
     */
    private ProcessOption processOption;

    /**
     * 返回结果的坐标类型，默认为百度经纬度
     * <p>
     * <pre>
     * 该字段用于控制返回结果中坐标的类型。可选值为：
     * bd09ll：百度经纬度坐标；
     * gcj02：国测局加密坐标；
     *
     * 注：该字段在国外无效，国外均返回wgs84坐标
     * </pre>
     */
    private int outputCoordType = CoordType.bd09ll.ordinal();

    public String getEntityName() {
        return entityName;
    }

    /**
     * 设置entity标识
     *
     * @param entityName
     */
    public void setEntityName(String entityName) {
        this.entityName = entityName;
    }

    public long getStartTime() {
        return startTime;
    }

    /**
     * 设置开始时间
     *
     * @param startTime
     */
    public void setStartTime(long startTime) {
        this.startTime = startTime;
    }

    public long getEndTime() {
        return endTime;
    }

    /**
     * 设置结束时间
     *
     * @param endTime
     */
    public void setEndTime(long endTime) {
        this.endTime = endTime;
    }

    /**
     * @return
     * @deprecated
     */
    public double getSpeedingThreshold() {
        return speedingThreshold;
    }

    /**
     * 设置限速值，用于计算超速，单位为：km/h，取值范围[0,200]，默认值为0。
     * <p>
     * <pre>
     * 0：根据百度地图道路限速数据计算超速点；
     * 其他数值：以设置的数值为阈值，轨迹点速度超过该值则认为是超速。
     * </pre>
     *
     * @param speedingThreshold
     * @deprecated
     */
    public void setSpeedingThreshold(int speedingThreshold) {
        this.speedingThreshold = speedingThreshold;
    }

    public ThresholdOption getThresholdOption() {
        return thresholdOption;
    }

    /**
     * 设置阈值选项
     *
     * @param thresholdOption
     */
    public void setThresholdOption(ThresholdOption thresholdOption) {
        this.thresholdOption = thresholdOption;
    }

    public ProcessOption getProcessOption() {
        return processOption;
    }

    /**
     * 设置纠偏选项，可选项为：
     * <p>
     * <pre>
     * needMapMatch：绑路（false:不需要，true:需要），
     * transportMode：交通方式（driving, riding, walking）
     * </pre>
     *
     * @param processOption
     */
    public void setProcessOption(ProcessOption processOption) {
        this.processOption = processOption;
    }

    public int getOutputCoordType() {
        return outputCoordType;
    }

    /**
     * 返回结果的坐标类型，默认为百度经纬度
     * <p>
     * <pre>
     * 该字段用于控制返回结果中坐标的类型。可选值为：
     * bd09ll：百度经纬度坐标；
     * gcj02：国测局加密坐标；
     *
     * 注：该字段在国外无效，国外均返回wgs84坐标
     * </pre>
     *
     * @param outputCoordType
     */
    public void setOutputCoordType(int outputCoordType) {
        this.outputCoordType = outputCoordType;
    }

    public DrivingBehaviorOption() {
        super();
    }

    /**
     * @param tag       请求标识
     * @param serviceId 轨迹服务ID
     */
    public DrivingBehaviorOption(int tag, long serviceId) {
        super(tag, serviceId);
    }

    /**
     * @param tag        请求标识
     * @param serviceId  轨迹服务ID
     * @param entityName Entity标识
     */
    public DrivingBehaviorOption(int tag, long serviceId, String entityName) {
        super(tag, serviceId);
        this.entityName = entityName;
    }

    /**
     * @param tag               请求标识
     * @param serviceId         轨迹服务ID
     * @param entityName        Entity标识
     * @param startTime         开始时间
     * @param endTime           结束时间
     * @param speedingThreshold 限速值
     * @param processOption     纠偏选项
     * @param coordTypeOutput   返回结果的坐标类型
     * @deprecated
     */
    public DrivingBehaviorOption(int tag, long serviceId, String entityName, long startTime,
                                 long endTime,
                                 int speedingThreshold, ProcessOption processOption,
                                 int coordTypeOutput) {
        super(tag, serviceId);
        this.entityName = entityName;
        this.startTime = startTime;
        this.endTime = endTime;
        this.speedingThreshold = speedingThreshold;
        this.processOption = processOption;
        this.outputCoordType = coordTypeOutput;
    }

    /**
     * @param tag             请求标识
     * @param serviceId       轨迹服务ID
     * @param entityName      Entity标识
     * @param startTime       开始时间
     * @param endTime         结束时间
     * @param thresholdOption 阈值选项
     * @param processOption   纠偏选项
     * @param coordTypeOutput 返回结果的坐标类型
     */
    public DrivingBehaviorOption(int tag, long serviceId, String entityName, long startTime,
                                 long endTime,
                                 ThresholdOption thresholdOption, ProcessOption processOption,
                                 int coordTypeOutput) {
        super(tag, serviceId);
        this.entityName = entityName;
        this.startTime = startTime;
        this.endTime = endTime;
        this.thresholdOption = thresholdOption;
        this.processOption = processOption;
        this.outputCoordType = coordTypeOutput;
    }

    public DrivingBehaviorRequest toDrivingBehaviorRequest() {
        DrivingBehaviorRequest drivingBehaviorRequest = new DrivingBehaviorRequest();
        drivingBehaviorRequest.setTag(tag);
        drivingBehaviorRequest.setServiceId(serviceId);
        drivingBehaviorRequest.setEntityName(entityName);
        drivingBehaviorRequest.setStartTime(startTime);
        drivingBehaviorRequest.setEndTime(endTime);
        drivingBehaviorRequest
                .setCoordTypeOutput(com.baidu.trace.model.CoordType.values()[outputCoordType]);
        if (thresholdOption != null) {
            drivingBehaviorRequest.setThresholdOption(thresholdOption.toThresholdOption());
        }
        if (processOption != null) {
            drivingBehaviorRequest.setProcessOption(processOption.toProcessOption());
        }
        return drivingBehaviorRequest;
    }

    @Override
    public String toString() {
        return "DrivingBehaviorRequest [tag=" + tag + ", serviceId=" + serviceId + ", entityName="
                + entityName
                + ", startTime=" + startTime + ", endTime=" + endTime + ", thresholdOption="
                + thresholdOption
                + ", processOption=" + processOption + ", coordTypeOutput=" + outputCoordType + "]";
    }

}
