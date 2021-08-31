package com.baidu.flutter.trace.model.track;

import com.baidu.flutter.trace.model.BaseResult;

/**
 * 删除缓存数据响应结果
 *
 * @author baidu
 */
public final class ClearCacheTrackResult extends BaseResult {

    public ClearCacheTrackResult() {
    }

    /**
     * @param status  状态码
     * @param message 状态消息
     */
    public ClearCacheTrackResult(int status, String message) {
        super(status, message);
    }

    /**
     * @param tag     响应标识（与请求标识一致）
     * @param status  状态码
     * @param message 状态消息
     */
    public ClearCacheTrackResult(int tag, int status, String message) {
        super(tag, status, message);
    }

    @Override
    public String toString() {
        return "ClearCacheTrackResponse [tag=" + tag + ", status=" + status + ", message=" + message
                + "]";
    }

}
