package com.baidu.flutter.trace.model.entity;

import java.util.List;

/**
 * 多边形搜索Entity响应结果
 *
 * @author baidu
 */

public final class PolygonSearchResult extends CommonResult {

    public PolygonSearchResult() {
        super();
    }

    /**
     * @param tag     响应标识（与请求标识一致）
     * @param status  状态码
     * @param message 状态消息
     */
    public PolygonSearchResult(int tag, int status, String message) {
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
    public PolygonSearchResult(int tag, int status, String message, int total, int size,
                               List<com.baidu.trace.api.entity.EntityInfo> entities) {
        super(tag, status, message, total, size, entities);
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("PolygonSearchResult{");
        sb.append("tag=").append(tag);
        sb.append(", status=").append(status);
        sb.append(", message='").append(message).append('\'');
        sb.append(", totalSize=").append(totalSize);
        sb.append(", size=").append(size);
        sb.append(", entities=").append(entities);
        sb.append('}');
        return sb.toString();
    }
}
