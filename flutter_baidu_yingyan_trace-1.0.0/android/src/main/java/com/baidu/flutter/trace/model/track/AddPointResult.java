package com.baidu.flutter.trace.model.track;

import com.baidu.flutter.trace.model.BaseResult;

/**
 * 上传单个轨迹点响应类
 */

public class AddPointResult extends BaseResult {

    public AddPointResult() {
    }

    /**
     * 创建上传单个轨迹点响应实例
     *
     * @param tag 响应标识（与请求标识一致）
     */
    public AddPointResult(int tag) {
        this.tag = tag;
    }

    /**
     * 创建上传单个轨迹点响应实例
     *
     * @param tag     响应标识（与请求标识一致）
     * @param status  状态码
     * @param message 状态消息
     */
    public AddPointResult(int tag, int status, String message) {
        super(tag, status, message);
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("AddPointResponse{");
        sb.append("tag=").append(tag);
        sb.append(", status=").append(status);
        sb.append(", message=").append(message).append('\'');
        sb.append('}');
        return sb.toString();
    }
}
