package com.baidu.flutter.trace.model.entity;

import java.util.List;

/**
 * 行政区搜索entity响应结果
 *
 * @author baidu
 */

public final class DistrictSearchResult extends CommonResult {

    /**
     * 关键字匹配的行政区划列表
     * <p>
     * 注：只在行政区搜索entity失败时（关键字匹配至多个行政区），该字段有值。
     */
    private List<String> districtList;

    /**
     * 获取关键字匹配的行政区划列表
     * <p>
     * 注：只在行政区搜索entity失败时（关键字匹配至多个行政区），该字段有值。
     *
     * @return
     */
    public List<String> getDistrictList() {
        return districtList;
    }

    public void setDistrictList(List<String> districtList) {
        this.districtList = districtList;
    }

    public DistrictSearchResult() {
        super();
    }

    /**
     * @param tag     响应标识（与请求标识一致）
     * @param status  状态码
     * @param message 状态消息
     */
    public DistrictSearchResult(int tag, int status, String message) {
        super(tag, status, message);
    }

    /**
     * @param tag      响应标识（与请求标识一致）
     * @param status   状态码
     * @param message  状态消息
     * @param total    本次检索总结果条数
     * @param size     本页返回的结果条数
     * @param entities entity详细信息列表
     */
    public DistrictSearchResult(int tag, int status, String message, int total, int size,
                                List<com.baidu.trace.api.entity.EntityInfo> entities) {
        super(tag, status, message, total, size, entities);
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("DistrictSearchResult{");
        sb.append("tag=").append(tag);
        sb.append(", status=").append(status);
        sb.append(", message='").append(message).append('\'');
        sb.append(", totalSize=").append(totalSize);
        sb.append(", size=").append(size);
        sb.append(", entities=").append(entities);
        sb.append(", districtList=").append(districtList);
        sb.append('}');
        return sb.toString();
    }
}
