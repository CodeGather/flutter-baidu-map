package com.baidu.flutter.trace.model.analysis;

import com.baidu.flutter.trace.model.BaseOption;
import com.baidu.flutter.trace.model.CoordType;
import com.baidu.flutter.trace.model.ProcessOption;
import com.baidu.trace.api.analysis.StayPointRequest;

/**
 * 停留点请求
 * <p>
 * <p>
 * 查询entity在指定时间段内的停留点。 注：设备在小范围内滞留10分钟以上，被认为是一次停留，将取一个代表性坐标作为停留点。
 * </p>
 *
 * @author baidu
 */
public final class StayPointOption extends BaseOption {

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
     * 停留时间阈值，即停留多长时间被认为是一次停留，单位：秒，默认值：600，即10分钟
     */
    private int stayTime = 600;

    /**
     * 停留半径：该字段用于设置停留点判断规则，即系统判断在半径为stayRadius的圆形范围内停留时间超过stayTime，则被认为是一次停留。单位：米，取值范围：[1,
     * 500]，默认值：20
     */
    private int stayRadius = 20;

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
    private int coordTypeOutput = CoordType.bd09ll.ordinal();

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

    public int getStayTime() {
        return stayTime;
    }

    /**
     * 设置停留时间阈值
     * <p>
     * 即停留多长时间被认为是一次停留，单位：秒，默认值：600，即10分钟
     *
     * @param stayTime
     */
    public void setStayTime(int stayTime) {
        this.stayTime = stayTime;
    }

    public int getStayRadius() {
        return stayRadius;
    }

    /**
     * 设置停留半径：
     * <p>
     * 即系统判断在半径为stayRadius的圆形范围内停留时间超过stayTime，则被认为是一次停留。单位：米，取值范围：[1,500]，默认值：20
     *
     * @param stayRadius
     */
    public void setStayRadius(int stayRadius) {
        this.stayRadius = stayRadius;
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

    public int getCoordTypeOutput() {
        return coordTypeOutput;
    }

    /**
     * 设置返回结果的坐标类型，默认为百度经纬度
     * <p>
     * <pre>
     * 该字段用于控制返回结果中坐标的类型。可选值为：
     * bd09ll：百度经纬度坐标；
     * gcj02：国测局加密坐标；
     *
     * 注：该字段在国外无效，国外均返回wgs84坐标
     * </pre>
     *
     * @param coordTypeOutput
     */
    public void setCoordTypeOutput(int coordTypeOutput) {
        this.coordTypeOutput = coordTypeOutput;
    }

    public StayPointOption() {
        super();
    }

    /**
     * @param tag       请求标识
     * @param serviceId 轨迹服务ID
     */
    public StayPointOption(int tag, long serviceId) {
        super(tag, serviceId);
    }

    /**
     * @param tag        请求标识
     * @param serviceId  轨迹服务ID
     * @param entityName entity标识
     */
    public StayPointOption(int tag, long serviceId, String entityName) {
        super(tag, serviceId);
        this.entityName = entityName;
    }

    /**
     * @param tag             请求标识
     * @param serviceId       轨迹服务ID
     * @param entityName      entity标识
     * @param startTime       开始时间
     * @param endTime         结束时间
     * @param stayTime        停留时间阈值
     * @param processOption   纠偏选项
     * @param coordTypeOutput 返回结果的坐标类型
     */
    public StayPointOption(int tag, long serviceId, String entityName, long startTime, long endTime,
                           int stayTime,
                           ProcessOption processOption, int coordTypeOutput) {
        super(tag, serviceId);
        this.entityName = entityName;
        this.startTime = startTime;
        this.endTime = endTime;
        this.stayTime = stayTime;
        this.processOption = processOption;
        this.coordTypeOutput = coordTypeOutput;
    }

    /**
     * @param tag             请求标识
     * @param serviceId       轨迹服务ID
     * @param entityName      entity标识
     * @param startTime       开始时间
     * @param endTime         结束时间
     * @param stayTime        停留时间阈值
     * @param stayRadius      停留半径
     * @param processOption   纠偏选项
     * @param coordTypeOutput 返回结果的坐标类型
     */
    public StayPointOption(int tag, long serviceId, String entityName, long startTime, long endTime,
                           int stayTime,
                           int stayRadius, ProcessOption processOption, int coordTypeOutput) {
        super(tag, serviceId);
        this.entityName = entityName;
        this.startTime = startTime;
        this.endTime = endTime;
        this.stayTime = stayTime;
        this.stayRadius = stayRadius;
        this.processOption = processOption;
        this.coordTypeOutput = coordTypeOutput;
    }

    public StayPointRequest toStayPointRequest() {
        StayPointRequest stayPointRequest = new StayPointRequest();
        stayPointRequest.setTag(tag);
        stayPointRequest.setServiceId(serviceId);
        stayPointRequest.setEntityName(entityName);
        stayPointRequest.setStartTime(startTime);
        stayPointRequest.setEndTime(endTime);
        stayPointRequest.setStayTime(stayTime);
        stayPointRequest.setStayRadius(stayRadius);
        if (processOption != null) {
            stayPointRequest.setProcessOption(processOption.toProcessOption());
        }
        stayPointRequest
                .setCoordTypeOutput(com.baidu.trace.model.CoordType.values()[coordTypeOutput]);
        stayPointRequest.setTag(tag);
        return stayPointRequest;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("StayPointRequest{");
        sb.append("tag=").append(tag);
        sb.append(", serviceId=").append(serviceId);
        sb.append(", entityName='").append(entityName).append('\'');
        sb.append(", startTime=").append(startTime);
        sb.append(", endTime=").append(endTime);
        sb.append(", stayTime=").append(stayTime);
        sb.append(", stayRadius=").append(stayRadius);
        sb.append(", processOption=").append(processOption);
        sb.append(", coordTypeOutput=").append(coordTypeOutput);
        sb.append('}');
        return sb.toString();
    }
}
