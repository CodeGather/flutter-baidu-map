package com.baidu.flutter.trace.model.track;

import java.util.ArrayList;
import java.util.List;

import com.baidu.flutter.trace.model.BaseOption;
import com.baidu.trace.api.track.ClearCacheTrackRequest;

/**
 * 清理缓存轨迹请求
 *
 * @author baidu
 */
public final class ClearCacheTrackOption extends BaseOption {

    /**
     * 要删除缓存轨迹的entityNames，默认为null。
     * <pre>
     * entityNames为null时，表示清除所有缓存轨迹数据，不区分entityName；
     *
     * 注：entityNames与cacheTrackInfos不能同时设置，
     * 若同时设置，则以cacheTrackInfos为准；
     * 若两者存在某一为null，某一不为null的情况，则以不为null的为准。
     * </pre>
     */
    private List<String> entityNames = null;

    /**
     * 要删除缓存轨迹信息集，默认为null。
     * <pre>
     * 删除指定时间段内的缓存轨迹信息，cacheTrackInfos为null时，表示清除所有缓存轨迹数据，不区分entityName；
     *
     * 注：entityNames与cacheTrackInfos不能同时设置，
     * 若同时设置，则以cacheTrackInfos为准；
     * 若两者存在某一为null，某一不为null的情况，则以不为null的为准。
     * </pre>
     */
    private List<CacheTrackInfo> trackCacheOptions = null;

    public List<String> getEntityNames() {
        return entityNames;
    }

    /**
     * 设置要删除缓存的entityNames，默认为null。
     * <pre>
     * entityNames为null时，表示清除所有缓存轨迹数据，不区分entityName；
     *
     * 注：entityNames与cacheTrackInfos不能同时设置，
     * 若同时设置，则以cacheTrackInfos为准。
     * 若两者存在某一为null，某一不为null的情况，则以不为null的为准。
     * </pre>
     *
     * @param entityNames
     */
    public void setEntityNames(List<String> entityNames) {
        this.entityNames = entityNames;
    }

    public List<CacheTrackInfo> getCacheTrackInfos() {
        return trackCacheOptions;
    }

    /**
     * 设置要删除的缓存轨迹信息集，默认为null。
     * <pre>
     * cacheTrackInfos为null时，表示清除所有缓存轨迹数据，不区分entityName；
     *
     * 注：entityNames与cacheTrackInfos不能同时设置，
     * 若同时设置，则以cacheTrackInfos为准；
     * 若两者存在某一为null，某一不为null的情况，则以不为null的为准。
     * </pre>
     *
     * @param cacheTrackInfos
     */
    public void setCacheTrackInfos(List<CacheTrackInfo> cacheTrackInfos) {
        this.trackCacheOptions = cacheTrackInfos;
    }

    public ClearCacheTrackOption() {
        super();
    }

    /**
     * @param tag       请求标识
     * @param serviceId 轨迹服务ID
     */
    public ClearCacheTrackOption(int tag, long serviceId) {
        super(tag, serviceId);
    }

    /**
     * @param tag         请求标识
     * @param serviceId   轨迹服务ID
     * @param entityNames entity列表
     */
    public ClearCacheTrackOption(int tag, long serviceId, List<String> entityNames) {
        super(tag, serviceId);
        this.entityNames = entityNames;
    }

    public ClearCacheTrackRequest toClearCacheTrackRequest() {
        ClearCacheTrackRequest clearCacheTrackRequest = new ClearCacheTrackRequest();
        clearCacheTrackRequest.setTag(tag);
        clearCacheTrackRequest.setServiceId(serviceId);
        clearCacheTrackRequest.setEntityNames(entityNames);
        if (trackCacheOptions != null) {
            List<com.baidu.trace.api.track.CacheTrackInfo> cacheTrackInfoList = new ArrayList<>();
            for (CacheTrackInfo cacheTrackInfo : trackCacheOptions) {
                cacheTrackInfoList.add(cacheTrackInfo.toCacheTrackInfo());
            }
            clearCacheTrackRequest.setCacheTrackInfos(cacheTrackInfoList);
        }
        return clearCacheTrackRequest;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("ClearCacheTrackRequest{");
        sb.append("tag=").append(tag);
        sb.append(", serviceId=").append(serviceId);
        sb.append(", entityNames=").append(entityNames);
        sb.append(", trackCacheOptions=").append(trackCacheOptions);
        sb.append('}');
        return sb.toString();
    }
}
