package com.baidu.flutter.trace.model.track;

import com.baidu.flutter.trace.model.BaseOption;
import com.baidu.trace.api.track.QueryCacheTrackRequest;

/**
 * 查询缓存轨迹请求
 *
 * @author baidu
 */
public final class QueryCacheTrackOption extends BaseOption {

    /**
     * 要查询缓存轨迹的entityName
     * <p>
     * 注：entityName为null或空串时，表示查询所有缓存轨迹的entity。
     * </p>
     */
    private String entityName;

    /**
     * 是否查询entityName对应的缓存轨迹的距离
     * 默认为false，即不查询缓存轨迹距离
     * <p>
     * 注：entityName为null或空串时，表示查询所有entity的缓存轨迹的距离
     * </p>
     */
    private boolean isQueryCacheDistance = false;

    /**
     * 定位点去噪精度
     * 查询缓存距离时，对缓存的GPS轨迹点进行去噪
     * <p>
     * 取值=0时，则不过滤；当取值大于0的整数时，则过滤掉radius大于设定值的轨迹点。
     * 针对GPS点，建议值设置为20
     * </p>
     */
    private short radiusThreshold = 0;

    /**
     * 查询缓存轨迹点距离时指定的起始时间
     * 指定时间段查询缓存轨迹距离，该时间段内如无缓存轨迹点，则距离为0
     * <p>
     * 格式为Unix时间戳
     * 如果不指定该值，则查询所有缓存轨迹点距离
     * </p>
     */
    private long startTime;

    /**
     * 查询缓存轨迹点距离时指定的终止时间
     * 指定时间段查询缓存轨迹距离，该时间段内如无缓存轨迹点，则距离为0
     * <p>
     * 格式为Unix时间戳
     * 如果不指定该值，则查询所有缓存轨迹点距离
     * </p>
     */
    private long endTime;

    public String getEntityName() {
        return entityName;
    }

    /**
     * 设置要查询缓存轨迹的entityName
     *
     * @param entityName
     */
    public void setEntityName(String entityName) {
        this.entityName = entityName;
    }

    /**
     * 是否进行entityName对应的缓存轨迹距离
     *
     * @return true -- 查询entityName对应的缓存轨迹距离，false -- 不查询entityName对应的缓存轨迹距离
     */
    public boolean isQueryCacheDistance() {
        return isQueryCacheDistance;
    }

    /**
     * 设置是否查询entityName对应的缓存轨迹距离
     * 默认为false，即不查询entityName对应的缓存轨迹距离。
     * entityName为null或空串时，表示查询所有entity的缓存轨迹的距离
     *
     * @param queryCacheDistance true--查询entityName对应的缓存轨迹距离，false--不查询entityName对应的缓存轨迹距离
     */
    public void setQueryCacheDistance(boolean queryCacheDistance) {
        isQueryCacheDistance = queryCacheDistance;
    }

    /**
     * 获取定位点去噪精度
     * 查询缓存距离时，对缓存的GPS轨迹点进行去噪
     * <p>
     * 取值=0时，则不过滤；当取值大于0的整数时，则过滤掉radius大于设定值的轨迹点。
     * 针对GPS点，建议值设置为20
     * </p>
     *
     * @return 定位点去噪精度
     */
    public short getRadiusThreshold() {
        return radiusThreshold;
    }

    /**
     * 获取定位点去噪精度
     * 查询缓存距离时，对缓存的GPS轨迹点进行去噪
     * <p>
     * 取值=0时，则不过滤；当取值大于0的整数时，则过滤掉radius大于设定值的轨迹点。
     * 针对GPS点，建议值设置为20
     * </p>
     *
     * @param radiusThreshold 定位点去噪精度，默认值为0
     */
    public void setRadiusThreshold(short radiusThreshold) {
        this.radiusThreshold = radiusThreshold;
    }

    /**
     * 获取查询缓存轨迹点距离时指定的起始时间
     * 指定时间段查询缓存轨迹距离，该时间段内如无缓存轨迹点，则距离为0
     * <p>
     * 格式为Unix时间戳
     * 如果不指定该值，则查询所有缓存轨迹点距离
     * </p>
     *
     * @return 查询缓存轨迹点距离时指定的起始时间
     */
    public long getStartTime() {
        return startTime;
    }

    /**
     * 设置查询缓存轨迹点距离时指定的起始时间
     * 指定时间段查询缓存轨迹距离，该时间段内如无缓存轨迹点，则距离为0
     * <p>
     * 格式为Unix时间戳
     * 如果不指定该值，则查询所有缓存轨迹点距离
     * </p>
     *
     * @param startTime 查询缓存轨迹点距离时指定的起始时间
     */
    public void setStartTime(long startTime) {
        this.startTime = startTime;
    }

    /**
     * 获取查询缓存轨迹点距离时指定的终止时间
     * 指定时间段查询缓存轨迹距离，该时间段内如无缓存轨迹点，则距离为0
     * <p>
     * 格式为Unix时间戳
     * 如果不指定该值，则查询所有缓存轨迹点距离
     * </p>
     *
     * @return 查询缓存轨迹点距离时指定的终止时间
     */
    public long getEndTime() {
        return endTime;
    }

    /**
     * 设置查询缓存轨迹点距离时指定的终止时间
     * 指定时间段查询缓存轨迹距离，该时间段内如无缓存轨迹点，则距离为0
     * <p>
     * 格式为Unix时间戳
     * 如果不指定该值，则查询所有缓存轨迹点距离
     * </p>
     *
     * @param endTime 查询缓存轨迹点距离时指定的终止时间
     */
    public void setEndTime(long endTime) {
        this.endTime = endTime;
    }

    public QueryCacheTrackOption() {
        super();
    }

    /**
     * @param tag       请求标识
     * @param serviceId 轨迹服务ID
     */
    public QueryCacheTrackOption(int tag, long serviceId) {
        super(tag, serviceId);
    }

    /**
     * @param tag        请求标识
     * @param serviceId  轨迹服务ID
     * @param entityName entity标识
     */
    public QueryCacheTrackOption(int tag, long serviceId, String entityName) {
        super(tag, serviceId);
        this.entityName = entityName;
    }

    /**
     * 不指定时间段查询缓存轨迹距离
     * V3.1.0舍弃该接口，请使用{@link #QueryCacheTrackOption(int, long, String, boolean, short, long, long)}
     *
     * @param tag                  请求标识
     * @param serviceId            轨迹服务ID
     * @param entityName           entity标识
     * @param isQueryCacheDistance 是否查询entityName对应的缓存轨迹距离，默认为false，即不查询entityName对应的缓存轨迹距离。
     *                             entityName为null或空串时，表示查询所有entity的缓存轨迹的距离
     * @param radiusThreshold      定位点去噪精度。查询缓存距离时，对缓存的GPS轨迹点进行去噪，取值=0时，则不过滤；
     *                             当取值大于0的整数时，则过滤掉radius大于设定值的轨迹点。针对GPS点，建议值设置为20
     */
    @Deprecated
    public QueryCacheTrackOption(int tag, long serviceId, String entityName,
                                 boolean isQueryCacheDistance, short radiusThreshold) {
        super(tag, serviceId);
        this.entityName = entityName;
        this.isQueryCacheDistance = isQueryCacheDistance;
        this.radiusThreshold = radiusThreshold;
    }

    /**
     * 指定时间段查询缓存轨迹距离
     *
     * @param tag                  请求标识
     * @param serviceId            轨迹服务ID
     * @param entityName           entity标识
     * @param isQueryCacheDistance 是否查询entityName对应的缓存轨迹距离，默认为false，即不查询entityName对应的缓存轨迹距离。
     *                             entityName为null或空串时，表示查询所有entity的缓存轨迹的距离
     * @param radiusThreshold      定位点去噪精度。查询缓存距离时，对缓存的GPS轨迹点进行去噪，取值=0时，则不过滤；
     *                             当取值大于0的整数时，则过滤掉radius大于设定值的轨迹点。针对GPS点，建议值设置为20
     * @param startTime            查询缓存轨迹点距离时指定的起始时间, 格式为Unix时间戳。如果不指定该值，则查询所有缓存轨迹点距离。
     * @param endTime              查询缓存轨迹点距离时指定的终止时间, 格式为Unix时间戳。如果不指定该值，则查询所有缓存轨迹点距离。终止时间要
     *                             小于起始时间{@link #startTime}。如果该时间段内无缓存轨迹点，则缓存距离为0
     */
    public QueryCacheTrackOption(int tag, long serviceId, String entityName,
                                 boolean isQueryCacheDistance,
                                 short radiusThreshold, long startTime, long endTime) {
        super(tag, serviceId);
        this.entityName = entityName;
        this.isQueryCacheDistance = isQueryCacheDistance;
        this.radiusThreshold = radiusThreshold;
        this.startTime = startTime;
        this.endTime = endTime;
    }

    public QueryCacheTrackRequest toQueryCacheTrackRequest() {
        QueryCacheTrackRequest queryCacheTrackRequest = new QueryCacheTrackRequest();
        queryCacheTrackRequest.setTag(tag);
        queryCacheTrackRequest.setServiceId(serviceId);
        queryCacheTrackRequest.setEntityName(entityName);
        queryCacheTrackRequest.setQueryCacheDistance(isQueryCacheDistance);
        queryCacheTrackRequest.setRadiusThreshold(radiusThreshold);
        return queryCacheTrackRequest;
    }

    @Override
    public String toString() {
        return "QueryCacheTrackRequest [tag=" + tag + ", serviceId=" + serviceId + ", entityName="
                + entityName + ", isQueryCacheDistance = "
                + isQueryCacheDistance + ", radiusThreshold = " + radiusThreshold + "]";
    }

}
