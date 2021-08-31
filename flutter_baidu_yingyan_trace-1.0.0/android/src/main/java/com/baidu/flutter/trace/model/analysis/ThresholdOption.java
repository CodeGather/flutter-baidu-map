package com.baidu.flutter.trace.model.analysis;

/**
 * 阈值选项
 *
 * @author baidu
 */
public final class ThresholdOption {

    /**
     * 固定限速值，单位：km/h，默认值：0
     * <pre>
     * 取值规则：
     * 0：根据百度地图道路限速数据计算超速点；
     * 其他数值：以设置的数值为阈值，轨迹点速度超过该值则认为是超速。
     *
     * 示例：
     * speedingThreshold=0，以道路限速数据计算；
     * speedingThreshold=80，限速值为80km/h。
     * </pre>
     */
    private double speedingThreshold;

    /**
     * 急加速的加速度阈值，单位：m^2/s，默认值：1.67，仅支持正数
     */
    private double harshAccelerationThreshold;

    /**
     * 急减速的加速度阈值，单位：m^2/s，默认值：-1.67，仅支持负数
     */
    private double harshBreakingThreshold;

    /**
     * 急转弯的向心加速度阈值，单位：m^2/s，默认值：5，仅支持正数
     */
    private double harshSteeringThreshold;

    public double getSpeedingThreshold() {
        return speedingThreshold;
    }

    /**
     * 设置固定限速值，单位：km/h，默认值：0
     * <pre>
     * 取值规则：
     * 0：根据百度地图道路限速数据计算超速点；
     * 其他数值：以设置的数值为阈值，轨迹点速度超过该值则认为是超速。
     *
     * 示例：
     * speedingThreshold=0，以道路限速数据计算；
     * speedingThreshold=80，限速值为80km/h。
     * </pre>
     *
     * @param speedingThreshold
     * @return ThresholdOption
     */
    public ThresholdOption setSpeedingThreshold(double speedingThreshold) {
        this.speedingThreshold = speedingThreshold;
        return this;
    }

    public double getHarshAccelerationThreshold() {
        return harshAccelerationThreshold;
    }

    /**
     * 设置急加速的加速度阈值，单位：m^2/s，默认值：1.67，仅支持正数
     *
     * @param harshAccelerationThreshold
     * @return ThresholdOption
     */
    public ThresholdOption setHarshAccelerationThreshold(double harshAccelerationThreshold) {
        this.harshAccelerationThreshold = harshAccelerationThreshold;
        return this;
    }

    public double getHarshBreakingThreshold() {
        return harshBreakingThreshold;
    }

    /**
     * 设置急减速的加速度阈值，单位：m^2/s，默认值：-1.67，仅支持负数
     *
     * @param harshBreakingThreshold
     * @return ThresholdOption
     */
    public ThresholdOption setHarshBreakingThreshold(double harshBreakingThreshold) {
        this.harshBreakingThreshold = harshBreakingThreshold;
        return this;
    }

    public double getHarshSteeringThreshold() {
        return harshSteeringThreshold;
    }

    /**
     * 设置急转弯的向心加速度阈值，单位：m^2/s，默认值：5，仅支持正数
     *
     * @param harshSteeringThreshold
     * @return ThresholdOption
     */
    public ThresholdOption setHarshSteeringThreshold(double harshSteeringThreshold) {
        this.harshSteeringThreshold = harshSteeringThreshold;
        return this;
    }

    public ThresholdOption() {
    }

    /**
     * @param speedingThreshold          固定限速值
     * @param harshAccelerationThreshold 急加速的加速度阈值
     * @param harshBreakingThreshold     急减速的加速度阈值
     * @param harshSteeringThreshold     急转弯的向心加速度阈值
     */
    public ThresholdOption(double speedingThreshold, double harshAccelerationThreshold,
                           double harshBreakingThreshold, double harshSteeringThreshold) {
        this.speedingThreshold = speedingThreshold;
        this.harshAccelerationThreshold = harshAccelerationThreshold;
        this.harshBreakingThreshold = harshBreakingThreshold;
        this.harshSteeringThreshold = harshSteeringThreshold;
    }

    public com.baidu.trace.api.analysis.ThresholdOption toThresholdOption() {
        com.baidu.trace.api.analysis.ThresholdOption thresholdOption =
                new com.baidu.trace.api.analysis.ThresholdOption();
        thresholdOption.setHarshAccelerationThreshold(harshAccelerationThreshold);
        thresholdOption.setSpeedingThreshold(speedingThreshold);
        thresholdOption.setHarshBreakingThreshold(harshBreakingThreshold);
        thresholdOption.setHarshSteeringThreshold(harshSteeringThreshold);
        return thresholdOption;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("ThresholdOption{");
        sb.append("speedingThreshold=").append(speedingThreshold);
        sb.append(", harshAccelerationThreshold=").append(harshAccelerationThreshold);
        sb.append(", harshBreakingThreshold=").append(harshBreakingThreshold);
        sb.append(", harshSteeringThreshold=").append(harshSteeringThreshold);
        sb.append('}');
        return sb.toString();
    }
}
