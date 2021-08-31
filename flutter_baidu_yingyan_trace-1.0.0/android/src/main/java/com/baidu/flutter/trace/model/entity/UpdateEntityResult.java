package com.baidu.flutter.trace.model.entity;

import com.baidu.flutter.trace.model.BaseResult;

/**
 * 更新Entity响应结果
 *
 * @author baidu
 */
public final class UpdateEntityResult extends BaseResult {

    /**
     * @param tag     响应标识
     * @param status  状态码
     * @param message 状态消息
     */
    public UpdateEntityResult(int tag, int status, String message) {
        super(tag, status, message);
    }

    @Override
    public String toString() {
        return "UpdateEntityResult [tag=" + tag + ", status=" + status + ", message=" + message
                + "]";
    }

}
