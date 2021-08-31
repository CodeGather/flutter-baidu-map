package com.baidu.flutter.trace.model.entity;

import java.util.List;

/**
 * 查询Entity响应结果
 *
 * @author baidu
 */
public final class EntityListResult extends CommonResult {

    public EntityListResult() {
        super();
    }

    /**
     * @param tag     响应标识（与请求标识一致）
     * @param status  状态码
     * @param message 状态消息
     */
    public EntityListResult(int tag, int status, String message) {
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
    public EntityListResult(int tag, int status, String message, int total, int size,
                            List<com.baidu.trace.api.entity.EntityInfo> entities) {
        super(tag, status, message, total, size, entities);
    }

    @Override
    public String toString() {
        return "EntityListResult [tag=" + tag + ", status=" + status + ", message=" + message
                + ", totalSize=" + totalSize
                + ", size=" + size + ", entities=" + entities + "]";
    }

}
