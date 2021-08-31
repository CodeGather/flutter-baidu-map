package com.baidu.flutter.trace.model;

/**
 * 纠偏选项
 *
 * @author baidu
 */
public class ProcessOption {

    /**
     * 去噪，默认需要（false：不需要；true：需要）
     */
    private boolean denoise = true;

    /**
     * 抽稀，仅在查询历史轨迹时有效，默认需要（false：不需要；true：需要）
     */
    private boolean vacuate = true;

    /**
     * 绑路，默认不需要（false：不需要；true：需要）
     */
    private boolean mapMatch = false;

    /**
     * 精度过滤，默认不需要（0:不需要，>0：radius过滤值）
     */
    private int radiusThreshold = 0;

    /**
     * 交通方式，默认为驾车。V3.1.0版本后支持auto
     */
    private int transportMode = TransportMode.driving.ordinal();

    public boolean isNeedDenoise() {
        return denoise;
    }

    /**
     * 设置去噪，默认需要（false：不需要；true：需要）
     *
     * @param needDenoise 是否需要去噪
     * @return ProcessOption
     */
    public ProcessOption setNeedDenoise(boolean needDenoise) {
        this.denoise = needDenoise;
        return this;
    }

    public boolean isNeedVacuate() {
        return vacuate;
    }

    /**
     * 设置抽稀，仅在查询历史轨迹时有效，默认需要（false：不需要；true：需要）
     *
     * @param needVacuate 是否需要抽稀
     * @return ProcessOption
     */
    public ProcessOption setNeedVacuate(boolean needVacuate) {
        this.vacuate = needVacuate;
        return this;
    }

    public boolean isNeedMapMatch() {
        return mapMatch;
    }

    /**
     * 设置绑路，默认不需要（false：不需要；true：需要）
     *
     * @param needMapMatch 是否需要绑路
     * @return ProcessOption
     */
    public ProcessOption setNeedMapMatch(boolean needMapMatch) {
        this.mapMatch = needMapMatch;
        return this;
    }

    public int getRadiusThreshold() {
        return radiusThreshold;
    }

    /**
     * 设置精度过滤，默认不需要（0:不需要，>0：radius过滤值）
     *
     * @param radiusThreshold 过滤精度值
     * @return ProcessOption
     */
    public ProcessOption setRadiusThreshold(int radiusThreshold) {
        this.radiusThreshold = radiusThreshold;
        return this;
    }

    public int getTransportMode() {
        return transportMode;
    }

    /**
     * 设置交通方式，默认为驾车
     * V3.1.0版本（包括）后支持auto
     *
     * @param transportMode 交通方式，详细参见{@link TransportMode}
     * @return ProcessOption
     */
    public ProcessOption setTransportMode(int transportMode) {
        this.transportMode = transportMode;
        return this;
    }

    public ProcessOption() {
        super();
    }

    /**
     * @param needDenoise     去噪
     * @param needVacuate     抽稀
     * @param needMapMatch    绑路
     * @param radiusThreshold 精度过滤
     * @param transportMode   交通方式
     */
    public ProcessOption(boolean needDenoise, boolean needVacuate, boolean needMapMatch,
                         int radiusThreshold,
                         int transportMode) {
        super();
        this.denoise = needDenoise;
        this.vacuate = needVacuate;
        this.mapMatch = needMapMatch;
        this.radiusThreshold = radiusThreshold;
        this.transportMode = transportMode;
    }

    public com.baidu.trace.model.ProcessOption toProcessOption() {
        com.baidu.trace.model.ProcessOption processOption =
                new com.baidu.trace.model.ProcessOption();
        processOption.setNeedDenoise(denoise);
        processOption.setNeedVacuate(vacuate);
        processOption.setNeedMapMatch(mapMatch);
        processOption.setRadiusThreshold(radiusThreshold);
        // 这里和Flutter端定义的枚举值不一致，单独处理
        if (transportMode == 0) {
            transportMode = 3;
        } else {
            transportMode = transportMode - 1;
        }
        processOption.setTransportMode(com.baidu.trace.model.TransportMode.values()[transportMode]);
        return processOption;
    }

    @Override
    public String toString() {
        return "ProcessOption [needDenoise=" + denoise + ", needVacuate=" + vacuate
                + ", needMapMatch="
                + mapMatch + ", radiusThreshold=" + radiusThreshold + ", transportMode="
                + transportMode + "]";
    }

}
