package com.baidu.flutter.trace.model.track;

import java.util.ArrayList;
import java.util.List;

import com.baidu.flutter.trace.model.BaseResult;

/**
 * 查询缓存轨迹响应结果
 *
 * @author baidu
 */
public final class QueryCacheTrackResult extends BaseResult {

    /**
     * 查询结果
     */
    private List<CacheTrackInfo> cacheInfoResult;

    /**
     * 获取缓存数据查询结果
     *
     * @return
     */
    public List<CacheTrackInfo> getResult() {
        return cacheInfoResult;
    }

    public void setResult(List<CacheTrackInfo> result) {
        this.cacheInfoResult = result;
    }

    public QueryCacheTrackResult() {
        super();
    }

    /**
     * @param tag     响应标识
     * @param status  状态码
     * @param message 状态消息
     */
    public QueryCacheTrackResult(int tag, int status, String message,
                                 List<com.baidu.trace.api.track.CacheTrackInfo> cacheTrackInfos) {
        super(tag, status, message);
        if (cacheTrackInfos != null) {
            List<CacheTrackInfo> cacheTrackInfoList = new ArrayList<>();
            for (com.baidu.trace.api.track.CacheTrackInfo cacheTrackInfo : cacheTrackInfos) {
                cacheTrackInfoList.add(CacheTrackInfo.fromSDKObject(cacheTrackInfo));
            }
            this.cacheInfoResult = cacheTrackInfoList;
        }

    }

    @Override
    public String toString() {
        return "QueryCacheTrackResponse [tag=" + tag + ", status=" + status + ", message=" + message
                + ", result="
                + cacheInfoResult + "]";
    }

}
