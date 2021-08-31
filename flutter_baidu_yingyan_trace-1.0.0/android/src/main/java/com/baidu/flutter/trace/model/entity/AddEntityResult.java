package com.baidu.flutter.trace.model.entity;

import com.baidu.flutter.trace.model.BaseResult;

/**
 * 创建Entity响应结果
 *
 * @author baidu
 */
public final class AddEntityResult extends BaseResult {

    /**
     * @param tag     响应标识（与请求标识一致）
     * @param status  状态码
     * @param message 状态信息
     */
    public AddEntityResult(int tag, int status, String message) {
        super(tag, status, message);
    }

    @Override
    public String toString() {
        return "AddEntityResult [tag=" + tag + ", status=" + status + ", message=" + message + "]";
    }

}
