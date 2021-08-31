package com.baidu.flutter.trace.model.track;

import com.baidu.flutter.trace.model.BaseOption;
import com.baidu.flutter.trace.model.CoordType;
import com.baidu.flutter.trace.model.ProcessOption;
import com.baidu.trace.api.track.LatestPointRequest;

/**
 * 查询最新轨迹点请求参数
 *
 * @author baidu
 */
public final class LatestPointOption extends BaseOption {

    /**
     * entity标识
     */
    private String entityName;

    /**
     * 纠偏选项，可选项为：
     * <p>
     * <pre>
     * needDenoise：去噪（false:不需要，true:需要）
     * needMapMatch：绑路（false:不需要，true:需要）
     * radiusThreshold：精度过滤（0:不需要，>0：radius过滤值）
     * transportMode：交通方式（driving， riding, walking）
     *
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

    public ProcessOption getProcessOption() {
        return processOption;
    }

    /**
     * 设置纠偏选项，可选项为：
     * <p>
     * <pre>
     * needDenoise：去噪（false:不需要，true:需要）
     * needMapMatch：绑路（false:不需要，true:需要）
     * radiusThreshold：精度过滤（0:不需要，>0：radius过滤值）
     * transportMode：交通方式（driving， riding, walking）
     *
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

    public LatestPointOption() {
        super();
    }

    /**
     * @param tag       请求标识
     * @param serviceId 轨迹服务ID
     */
    public LatestPointOption(int tag, long serviceId) {
        super(tag, serviceId);
    }

    /**
     * @param tag        请求标识
     * @param serviceId  轨迹服务ID
     * @param entityName entity标识
     */
    public LatestPointOption(int tag, long serviceId, String entityName) {
        this(tag, serviceId);
        this.entityName = entityName;
    }

    /**
     * @param tag             请求标识
     * @param serviceId       轨迹服务ID
     * @param entityName      entity标识
     * @param processOption   纠偏选项
     * @param coordTypeOutput 返回结果的坐标类型
     */
    public LatestPointOption(int tag, long serviceId, String entityName,
                             ProcessOption processOption,
                             int coordTypeOutput) {
        this(tag, serviceId, entityName);
        this.processOption = processOption;
        this.coordTypeOutput = coordTypeOutput;
    }

    public LatestPointRequest toLatestPointRequest() {
        LatestPointRequest latestPointRequest = new LatestPointRequest();
        latestPointRequest.setTag(tag);
        latestPointRequest.setServiceId(serviceId);
        latestPointRequest.setEntityName(entityName);
        if (processOption != null) {
            latestPointRequest.setProcessOption(processOption.toProcessOption());
        }
        latestPointRequest
                .setCoordTypeOutput(com.baidu.trace.model.CoordType.values()[coordTypeOutput]);
        return latestPointRequest;
    }

    @Override
    public String toString() {
        return "LatestPointRequest [tag=" + tag + ", serviceId=" + serviceId + ", entityName="
                + entityName
                + ", processOption=" + processOption + ", coordTypeOutput=" + coordTypeOutput + "]";
    }

}
