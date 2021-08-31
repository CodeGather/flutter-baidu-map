package com.baidu.flutter.trace.model.track;

import com.baidu.flutter.trace.model.BaseOption;
import com.baidu.flutter.trace.model.CoordType;
import com.baidu.flutter.trace.model.ProcessOption;
import com.baidu.flutter.trace.model.SortType;
import com.baidu.trace.api.track.HistoryTrackRequest;

/**
 * 查询历史轨迹请求参数
 *
 * @author baidu
 */
public final class HistoryTrackOption extends BaseOption {

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
     * needVacuate：抽稀（false:不需要，true:需要）
     * needMapMatch：绑路（false:不需要，true:需要）
     * radiusThreshold：精度过滤（0:不需要，>0：radius过滤值）
     * transportMode：交通方式（driving， riding, walking，auto）
     *
     * </pre>
     */
    private ProcessOption processOption;

    /**
     * 里程补偿方式，默认不补充
     */
    private int supplementMode = SupplementMode.no_supplement.ordinal();

    /**
     * 返回结果的排序规则，默认升序排序
     */
    private int sortType = SortType.asc.ordinal();

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

    /**
     * 分页索引
     */
    private int pageIndex;

    /**
     * 分页大小
     */
    private int pageSize;

    /**
     * 低速阈值, 单位：千米/小时
     * V3.1.0新增字段
     * <p>
     * 若填写该值且isProcessed = true时，则返回结果中将增加lowSpeedDistance字段，表示速度低于该值的里程。
     * 示例：
     * lowSpeedThreshold = 20，则返回结果中将增加lowSpeedDistance字段表示
     * 此段轨迹中速度低于20千米/小时的里程，可用于网约车行业中计算低速里程。
     */
    private double lowSpeedThreshold;

    /**
     * 轨迹补偿内容
     * V3.1.8新增字段
     *
     * 仅在supplement_mode不为no_supplement时生效。
     * 默认值：only_distance。
     * 可选值：
     * only_distance：对于中断区间，只补偿中断的里程，不补偿轨迹点
     * distance_and_points：对于中断区间，既补偿里程，又补偿轨迹点
     */
    private int supplementContent = SupplementContent.only_distance.ordinal();

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
     * 设置起始时间
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

    public boolean isProcessed() {
        return isProcessed;
    }

    /**
     * 设置是否返回纠偏后轨迹，默认不纠偏
     * <p>
     * <pre>
     * true：打开轨迹纠偏，返回纠偏后轨迹;
     * false：关闭轨迹纠偏，返回原始轨迹。
     *
     * 打开纠偏时，请求时间段内轨迹点数量不能超过2万，否则将返回错误。
     * </pre>
     *
     * @param isProcessed
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
     * needVacuate：抽稀（false:不需要，true:需要）
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

    public int getSupplementMode() {
        return supplementMode;
    }

    /**
     * 设置里程补偿方式，默认不补充
     *
     * @param supplementMode
     */
    public void setSupplementMode(int supplementMode) {
        this.supplementMode = supplementMode;
    }

    public int getSortType() {
        return sortType;
    }

    /**
     * 设置返回结果的排序规则，默认升序排序
     *
     * @param sortType
     */
    public void setSortType(int sortType) {
        this.sortType = sortType;
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

    public int getPageIndex() {
        return pageIndex;
    }

    /**
     * 设置分页索引
     *
     * @param pageIndex
     */
    public void setPageIndex(int pageIndex) {
        this.pageIndex = pageIndex;
    }

    public int getPageSize() {
        return pageSize;
    }

    /**
     * 设置分页大小
     *
     * @param pageSize
     */
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    /**
     * 获取低速阈值, 单位：千米/小时
     * V3.1.0新增字段
     * <p>
     * 若填写该值且isProcessed = true时，则返回结果中将增加lowSpeedDistance字段，表示速度低于该值的里程。
     * 示例：
     * lowSpeedThreshold = 20，则返回结果中将增加lowSpeedDistance字段表示
     * 此段轨迹中速度低于20千米/小时的里程，可用于网约车行业中计算低速里程。
     *
     * @return 低速阈值, 单位：千米/小时
     */
    public double getLowSpeedThreshold() {
        return lowSpeedThreshold;
    }

    /**
     * 设置低速阈值, 单位：千米/小时
     * V3.1.0新增字段
     * <p>
     * 若填写该值且isProcessed = true时，则返回结果中将增加lowSpeedDistance字段，表示速度低于该值的里程。
     * 示例：
     * lowSpeedThreshold = 20，则返回结果中将增加lowSpeedDistance字段表示
     * 此段轨迹中速度低于20千米/小时的里程，可用于网约车行业中计算低速里程。
     *
     * @param lowSpeedThreshold 低速阈值, 单位：千米/小时
     */
    public void setLowSpeedThreshold(double lowSpeedThreshold) {
        this.lowSpeedThreshold = lowSpeedThreshold;
    }

    /**
     * 获取轨迹补偿内容
     *
     * @return 轨迹补偿内容
     */
    public int getSupplementContent() {
        return supplementContent;
    }

    /**
     * 设置轨迹补偿内容
     * V3.1.8新增字段
     *
     * 仅在supplement_mode不为no_supplement时生效。
     * 默认值：only_distance。
     * 可选值：
     * only_distance：对于中断区间，只补偿中断的里程，不补偿轨迹点
     * distance_and_points：对于中断区间，既补偿里程，又补偿轨迹点
     *
     * @param supplementContent 轨迹补偿内容
     */
    public void setSupplementContent(int supplementContent) {
        this.supplementContent = supplementContent;
    }

    public HistoryTrackOption() {
        super();
    }

    /**
     * @param tag       请求标识
     * @param serviceId 轨迹服务ID
     */
    public HistoryTrackOption(int tag, long serviceId) {
        super(tag, serviceId);
    }

    /**
     * @param tag        请求标识
     * @param serviceId  轨迹服务ID
     * @param entityName entity标识
     */
    public HistoryTrackOption(int tag, long serviceId, String entityName) {
        this(tag, serviceId);
        this.entityName = entityName;
    }

    /**
     * @param tag             请求标识
     * @param serviceId       轨迹服务ID
     * @param entityName      entity标识
     * @param startTime       开始时间
     * @param endTime         结束时间
     * @param isProcessed     是否返回纠偏后轨迹
     * @param processOption   纠偏选项
     * @param supplementMode  里程补偿方式
     * @param sortType        返回结果的排序规则
     * @param coordTypeOutput 返回结果的坐标类型
     * @param pageIndex       分页索引
     * @param pageSize        分页大小
     */
    public HistoryTrackOption(int tag, long serviceId, String entityName, long startTime,
                              long endTime,
                              boolean isProcessed, ProcessOption processOption, int supplementMode,
                              int sortType, int coordTypeOutput, int pageIndex,
                              int pageSize) {
        this(tag, serviceId, entityName);
        this.startTime = startTime;
        this.endTime = endTime;
        this.isProcessed = isProcessed;
        this.processOption = processOption;
        this.supplementMode = supplementMode;
        this.sortType = sortType;
        this.coordTypeOutput = coordTypeOutput;
        this.pageIndex = pageIndex;
        this.pageSize = pageSize;
    }

    /**
     * V3.1.0版本新增字段构造方法
     *
     * @param tag               请求标识
     * @param serviceId         轨迹服务ID
     * @param entityName        entity标识
     * @param startTime         开始时间
     * @param endTime           结束时间
     * @param isProcessed       是否返回纠偏后轨迹
     * @param processOption     纠偏选项
     * @param supplementMode    里程补偿方式
     * @param sortType          返回结果的排序规则
     * @param coordTypeOutput   返回结果的坐标类型
     * @param pageIndex         分页索引
     * @param pageSize          分页大小
     * @param lowSpeedThreshold 低速阈值
     */
    public HistoryTrackOption(int tag, long serviceId, String entityName, long startTime,
                              long endTime,
                              boolean isProcessed, ProcessOption processOption, int supplementMode,
                              int sortType, int coordTypeOutput, int pageIndex, int pageSize,
                              double lowSpeedThreshold) {
        this(tag, serviceId, entityName);
        this.startTime = startTime;
        this.endTime = endTime;
        this.isProcessed = isProcessed;
        this.processOption = processOption;
        this.supplementMode = supplementMode;
        this.sortType = sortType;
        this.coordTypeOutput = coordTypeOutput;
        this.pageIndex = pageIndex;
        this.pageSize = pageSize;
        this.lowSpeedThreshold = lowSpeedThreshold;
    }

    /**
     * V3.1.8版本新增字段构造方法
     *
     * @param tag                  请求标识
     * @param serviceId            轨迹服务ID
     * @param entityName           entity标识
     * @param startTime            开始时间
     * @param endTime              结束时间
     * @param isProcessed          是否返回纠偏后轨迹
     * @param processOption        纠偏选项
     * @param supplementMode       里程补偿方式
     * @param sortType             返回结果的排序规则
     * @param coordTypeOutput      返回结果的坐标类型
     * @param pageIndex            分页索引
     * @param pageSize             分页大小
     * @param lowSpeedThreshold    低速阈值
     * @param supplementContent    轨迹补偿内容
     */
    public HistoryTrackOption(int tag, long serviceId, String entityName, long startTime, long endTime,
                               boolean isProcessed, ProcessOption processOption, int supplementMode,
                               int sortType, int coordTypeOutput, int pageIndex, int pageSize,
                               double lowSpeedThreshold, int supplementContent) {
        this(tag, serviceId, entityName);
        this.startTime = startTime;
        this.endTime = endTime;
        this.isProcessed = isProcessed;
        this.processOption = processOption;
        this.supplementMode = supplementMode;
        this.sortType = sortType;
        this.coordTypeOutput = coordTypeOutput;
        this.pageIndex = pageIndex;
        this.pageSize = pageSize;
        this.lowSpeedThreshold = lowSpeedThreshold;
        this.supplementContent = supplementContent;
    }

    public HistoryTrackRequest toHistoryTrackRequest() {
        HistoryTrackRequest historyTrackRequest = new HistoryTrackRequest();
        historyTrackRequest.setTag(tag);
        historyTrackRequest.setServiceId(serviceId);
        historyTrackRequest.setEntityName(entityName);
        historyTrackRequest.setStartTime(startTime);
        historyTrackRequest.setEndTime(endTime);
        historyTrackRequest.setProcessed(isProcessed);
        historyTrackRequest.setProcessOption(processOption.toProcessOption());
        historyTrackRequest.setSupplementMode(
                com.baidu.trace.api.track.SupplementMode.values()[supplementMode]);
        historyTrackRequest.setSortType(com.baidu.trace.model.SortType.values()[sortType]);
        historyTrackRequest
                .setCoordTypeOutput(com.baidu.trace.model.CoordType.values()[coordTypeOutput]);
        historyTrackRequest.setPageIndex(pageIndex);
        historyTrackRequest.setPageSize(pageSize);
        historyTrackRequest.setLowSpeedThreshold(lowSpeedThreshold);
        historyTrackRequest.setSupplementContent(
                com.baidu.trace.api.track.SupplementContent.values()[supplementContent]);
        return historyTrackRequest;
    }

    @Override
    public String toString() {
        return "HistoryTrackRequest [tag=" + tag + ", serviceId=" + serviceId + ", entityName="
                + entityName
                + ", startTime=" + startTime + ", endTime=" + endTime + ", isProcessed="
                + isProcessed
                + ", processOption=" + processOption + ", supplementMode=" + supplementMode
                + ", sortType=" + sortType
                + ", coordTypeOutput=" + coordTypeOutput + ", pageIndex=" + pageIndex
                + ", pageSize=" + pageSize
                + "lowSpeedThreshold=" + lowSpeedThreshold + "supplementContent="
                + supplementContent + "]";
    }

}
