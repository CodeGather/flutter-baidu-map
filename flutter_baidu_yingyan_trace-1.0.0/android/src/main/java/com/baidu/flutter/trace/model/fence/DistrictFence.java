package com.baidu.flutter.trace.model.fence;

/**
 * 行政区划围栏
 */
public class DistrictFence extends Fence {

    /**
     * 行政区划关键字
     */
    private String keyword;

    /**
     * 结构化的行政区划描述
     * <p>
     * 注：仅在查询行政区域围栏时，该字段有值。
     */
    private String district;

    /**
     * 获取行政区划关键字
     *
     * @return
     */
    public String getKeyword() {
        return keyword;
    }

    /**
     * 设置行政区划关键字
     *
     * @param keyword
     */
    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    /**
     * 获取结构化的行政区划描述
     * <p>
     * 注：仅在查询行政区域围栏时，该字段有值。
     */
    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    /**
     * @param fenceId         围栏编号
     * @param fenceName       围栏名称
     * @param monitoredPerson 监控对象
     * @param denoise         去噪参数
     * @param fenceType       围栏类型
     * @param keyword         行政区划关键字
     */
    private DistrictFence(long fenceId, String fenceName, String monitoredPerson, int denoise,
                          int fenceType, String keyword) {
        super(fenceId, fenceName, monitoredPerson, denoise, fenceType);
        super.keyword = keyword;
        this.keyword = keyword;
    }

    /**
     * 创建服务端行政区划围栏
     *
     * @param fenceId         围栏编号
     * @param fenceName       围栏名称
     * @param monitoredPerson 监控对象
     * @param denoise         去噪参数
     * @param keyword         行政区划关键字
     * @return
     */
    public static DistrictFence buildServerFence(long fenceId, String fenceName,
                                                 String monitoredPerson,
                                                 int denoise, String keyword) {
        return new DistrictFence(fenceId, fenceName, monitoredPerson, denoise,
                FenceType.server.ordinal(),
                keyword);
    }

    public static DistrictFence fromSDKObject(
            com.baidu.trace.api.fence.DistrictFence districtFence) {
        if (districtFence == null) {
            return null;
        }
        return new DistrictFence(districtFence.getFenceId(),
                districtFence.getFenceName(),
                districtFence.getMonitoredPerson(), districtFence.getDenoise(),
                districtFence.getFenceType().ordinal(),
                districtFence.getKeyword());
    }

    @Override
    public String toString() {
        return "DistrictFence [fenceId=" + fenceId + ", fenceName=" + fenceName + ", fenceType="
                + fenceType
                + ", monitoredPerson=" + monitoredPerson + ", keyword=" + keyword + ", district="
                + district
                + ", denoise=" + denoise + "]";
    }
}
