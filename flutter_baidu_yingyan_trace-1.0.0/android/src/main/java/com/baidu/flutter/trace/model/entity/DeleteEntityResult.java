package com.baidu.flutter.trace.model.entity;

import com.baidu.trace.model.BaseResponse;

/**
 * 删除Entity响应结果
 *
 * @author baidu
 */
public final class DeleteEntityResult extends BaseResponse {

    /**
     * @param tag     响应标识（与请求标识一致）
     * @param status  状态码
     * @param message 状态消息
     */
    public DeleteEntityResult(int tag, int status, String message) {
        super(tag, status, message);
    }

    @Override
    public String toString() {
        return "DeleteEntityResult [tag=" + tag + ", status=" + status + ", message=" + message
                + "]";
    }

}
