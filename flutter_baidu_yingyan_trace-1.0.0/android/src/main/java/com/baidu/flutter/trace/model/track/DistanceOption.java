package com.baidu.flutter.trace.model.track;

import com.baidu.flutter.trace.model.BaseOption;
import com.baidu.flutter.trace.model.ProcessOption;
import com.baidu.trace.api.track.DistanceRequest;

/**
 * 查询里程请求参数类
 *
 * @author baidu
 */
public final class DistanceOption extends BaseOption {

    /**
     * entity标识
     */
    private String entityName;

    /**
     * 起始时间
     */
    private long startTime;

    /**
     * 结束时间
     */
    private long endTime;

    /**
     * 是否返回纠偏后轨迹，默认不纠偏
     * <p>
     * <pre>
     * true：打开轨迹纠偏，返回纠偏后轨迹;
     * false：关闭轨迹纠偏，返回原始轨迹。
     *
     * 打开纠偏时，请求时间段内轨迹点数量不能超过2万，否则将返回错误。
     * </pre>
     */
    private boolean isProcessed = false;

    /**
     * 纠偏选项，可选项为：
     * <p>
     * <pre>
     * needDenoise：去噪（false:不需要，true:需要）
     * needMapMatch：绑路（false:不需要，true:需要）
     * transportMode：交通方式（driving， riding, walking）
     *
     * </pre>
     */
    private ProcessOption processOption;

    /**
     * 里程补偿方式
     */
    private int supplementMode;

    /**
     * 低速阈值, 单位：千米/小时
     * isProcessed=true时，则返回结果中将增加low_speed_distance字段，表示速度低于该值的里程。
     * 示例：lowSpeedThreshold=20，则返回结果中将增加low_speed_distance字段表示
     * 此段轨迹中速度低于20千米/小时的里程，可用于网约车行业中计算低速里程。
     * <p>
     * V3.1.0版本新增字段
     */
    private double lowSpeedThreshold;

    public String getEntityName() {
        return entityName;
    }

    /**
     * 设置entity标识
     *
     * @param entityName entity标识
     */
    public void setEntityName(String entityName) {
        this.entityName = entityName;
    }

    public long getStartTime() {
        return startTime;
    }

    /**
     * 设置起始时间
     *
     * @param startTime 起始时间
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
     * @param endTime 结束时间
     */
    public void setEndTime(long endTime) {
        this.endTime = endTime;
    }

    public boolean isProcessed() {
        return isProcessed;
    }

    /**
     * 设置是否返回纠偏后轨迹
     *
     * @param isProcessed 是否返回纠偏后轨迹
     */
    public void setProcessed(boolean isProcessed) {
        this.isProcessed = isProcessed;
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
     * transportMode：交通方式（driving， riding, walking）
     * </pre>
     *
     * @param processOption 纠偏选项
     */
    public void setProcessOption(ProcessOption processOption) {
        this.processOption = processOption;
    }

    public int getSupplementMode() {
        return supplementMode;
    }

    /**
     * 设置里程补偿方式
     *
     * @param supplementMode 里程补偿方式
     */
    public void setSupplementMode(int supplementMode) {
        this.supplementMode = supplementMode;
    }

    /**
     * 获取低速阈值, 单位：千米/小时
     * isProcessed=true时，则返回结果中将增加low_speed_distance字段，表示速度低于该值的里程。
     * 示例：lowSpeedThreshold=20，则返回结果中将增加low_speed_distance字段表示
     * 此段轨迹中速度低于20千米/小时的里程，可用于网约车行业中计算低速里程。
     * <p>
     * V3.1.0版本新增字段
     *
     * @return 低速阈值
     */
    public double getLowSpeedThreshold() {
        return lowSpeedThreshold;
    }

    /**
     * 设置低速阈值, 单位：千米/小时
     * isProcessed=true时，则返回结果中将增加low_speed_distance字段，表示速度低于该值的里程。
     * 示例：lowSpeedThreshold=20，则返回结果中将增加low_speed_distance字段表示
     * 此段轨迹中速度低于20千米/小时的里程，可用于网约车行业中计算低速里程。
     * <p>
     * V3.1.0版本新增字段
     *
     * @param lowSpeedThreshold 低速阈值
     */
    public void setLowSpeedThreshold(double lowSpeedThreshold) {
        this.lowSpeedThreshold = lowSpeedThreshold;
    }

    public DistanceOption() {
        super();
    }

    /**
     * @param tag       请求标识
     * @param serviceId 轨迹服务ID
     */
    public DistanceOption(int tag, long serviceId) {
        super(tag, serviceId);
    }

    /**
     * @param tag        请求标识
     * @param serviceId  轨迹服务ID
     * @param entityName entity标识
     */
    public DistanceOption(int tag, long serviceId, String entityName) {
        super(tag, serviceId);
        this.entityName = entityName;
    }

    /**
     * 查询里程请求构造方法
     *
     * @param tag            请求标识
     * @param serviceId      轨迹服务ID
     * @param entityName     entity标识
     * @param startTime      起始时间
     * @param endTime        结束时间
     * @param isProcessed    是否返回纠偏后轨迹
     * @param processOption  纠偏选项
     * @param supplementMode 里程补偿方式
     */
    public DistanceOption(int tag, long serviceId, String entityName, long startTime, long endTime,
                          boolean isProcessed, ProcessOption processOption, int supplementMode) {
        super(tag, serviceId);
        this.entityName = entityName;
        this.startTime = startTime;
        this.endTime = endTime;
        this.isProcessed = isProcessed;
        this.processOption = processOption;
        this.supplementMode = supplementMode;
    }

    /**
     * 查询里程请求构造方法
     * V3.1.0版本新增
     *
     * @param tag               请求标识
     * @param serviceId         轨迹服务ID
     * @param entityName        entity标识
     * @param startTime         起始时间
     * @param endTime           结束时间
     * @param isProcessed       是否返回纠偏后轨迹
     * @param processOption     纠偏选项
     * @param supplementMode    里程补偿方式
     * @param lowSpeedThreshold 低速阈值
     */
    public DistanceOption(int tag, long serviceId, String entityName, long startTime, long endTime,
                          boolean isProcessed, ProcessOption processOption, int supplementMode,
                          double lowSpeedThreshold) {
        super(tag, serviceId);
        this.entityName = entityName;
        this.startTime = startTime;
        this.endTime = endTime;
        this.isProcessed = isProcessed;
        this.processOption = processOption;
        this.supplementMode = supplementMode;
        this.lowSpeedThreshold = lowSpeedThreshold;
    }

    public DistanceRequest toDistanceRequest() {
        DistanceRequest distanceRequest = new DistanceRequest();
        distanceRequest.setTag(tag);
        distanceRequest.setServiceId(serviceId);
        distanceRequest.setServiceId(serviceId);
        distanceRequest.setStartTime(startTime);
        distanceRequest.setEndTime(endTime);
        distanceRequest.setProcessed(isProcessed);
        distanceRequest.setProcessOption(processOption.toProcessOption());
        distanceRequest.setSupplementMode(
                com.baidu.trace.api.track.SupplementMode.values()[supplementMode]);
        distanceRequest.setLowSpeedThreshold(lowSpeedThreshold);
        return distanceRequest;
    }

    @Override
    public String toString() {
        return "DistanceRequest [tag=" + tag + ", serviceId=" + serviceId + ", entityName="
                + entityName
                + ", startTime=" + startTime + ", endTime=" + endTime + ", isProcessed="
                + isProcessed
                + ", processOption=" + processOption + ", supplementMode=" + supplementMode
                + ", lowSpeedThreshold=" + lowSpeedThreshold + "]";
    }

}
