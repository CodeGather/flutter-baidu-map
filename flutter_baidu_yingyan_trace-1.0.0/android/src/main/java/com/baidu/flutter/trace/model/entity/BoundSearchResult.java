package com.baidu.flutter.trace.model.entity;

import java.util.List;

/**
 * 矩形搜索entity响应结果
 *
 * @author baidu
 */
public final class BoundSearchResult extends CommonResult {

    public BoundSearchResult() {
        super();
    }

    /**
     * @param tag     响应标识（与请求标识一致）
     * @param status  状态码
     * @param message 状态信息
     */
    public BoundSearchResult(int tag, int status, String message) {
        super(tag, status, message);
    }

    /**
     * @param tag      响应标识（与请求标识一致）
     * @param status   状态码
     * @param message  状态信息
     * @param total    本次检索总结果条数
     * @param size     本页返回的结果条数
     * @param entities entity详细信息列表
     */
    public BoundSearchResult(int tag, int status, String message, int total, int size,
                             List<com.baidu.trace.api.entity.EntityInfo> entities) {
        super(tag, status, message, total, size, entities);
    }

    @Override
    public String toString() {
        return "BoundSearchResult [tag=" + tag + ", status=" + status + ", message=" + message
                + ", totalSize=" + totalSize
                + ", size=" + size + ", entities=" + entities + "]";
    }

}
