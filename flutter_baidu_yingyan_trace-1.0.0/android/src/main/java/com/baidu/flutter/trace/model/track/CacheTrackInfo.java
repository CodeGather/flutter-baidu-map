package com.baidu.flutter.trace.model.track;

/**
 * 缓存轨迹信息
 *
 * @author baidu
 */
public class CacheTrackInfo {

    /**
     * 缓存轨迹所属entity
     */
    private String entityName;

    /**
     * 所属entity对应的缓存数据量。
     *
     * <pre>
     * 仅在查询缓存轨迹时，该字段有效；
     * 删除缓存轨迹时，该字段无效。
     * </pre>
     */
    private int total;

    /**
     * 开始时间
     *
     * <pre>
     * 查询缓存轨迹时，为所属entity对应缓存轨迹的开始时间；
     * 删除缓存轨迹时，为要删除缓存轨迹的开始时间。
     * </pre>
     */
    private long startTime;

    /**
     * 结束时间
     * <pre>
     *
     * 查询轨迹时，为所属entity对应缓存轨迹的结束时间；
     *
     * 删除缓存轨迹时，为要删除缓存轨迹的结束时间。
     * </pre>
     */
    private long endTime;

    /**
     * 缓存轨迹的距离，单位：米
     *
     * <pre>
     * 查询轨迹时，为所属entity对应缓存轨迹的距离；
     * entityName为null或空串时，表示查询所有entity的缓存轨迹的距离
     * </pre>
     */
    private double cacheDistance = 0;

    /**
     * 获取缓存轨迹所属entity
     *
     * @return entity标识
     */
    public String getEntityName() {
        return entityName;
    }

    /**
     * 设置entity标识
     *
     * @param entityName entity标识
     */
    public void setEntityName(String entityName) {
        this.entityName = entityName;
    }

    /**
     * 获取所属entity对应的缓存数据量
     *
     * <pre>
     * 仅在查询缓存轨迹时，该字段有值。
     * </pre>
     *
     * @return 缓存轨迹的数量
     */
    public int getTotal() {
        return total;
    }

    /**
     * 设置所属entity对应的缓存数据量
     *
     * <pre>
     * 仅在查询缓存轨迹时，该字段有值。
     * </pre>
     *
     * @param total 缓存轨迹的数量
     */
    public void setTotal(int total) {
        this.total = total;
    }

    /**
     * 获取开始时间
     *
     * <pre>
     * 查询缓存轨迹时，为所属entity对应缓存轨迹的开始时间；
     * 删除缓存轨迹时，为要删除缓存轨迹的开始时间。
     * </pre>
     *
     * @return 开始时间
     */
    public long getStartTime() {
        return startTime;
    }

    /**
     * 设置开始时间
     *
     * <pre>
     * 查询缓存轨迹时，为所属entity对应缓存轨迹的开始时间；
     * 删除缓存轨迹时，为要删除缓存轨迹的开始时间。
     * </pre>
     *
     * @param startTime 开始时间
     */
    public void setStartTime(long startTime) {
        this.startTime = startTime;
    }

    /**
     * 获取结束时间
     *
     * <pre>
     * 查询轨迹时，为所属entity对应缓存轨迹的结束时间；
     * 删除缓存轨迹时，为要删除缓存轨迹的结束时间。
     * </pre>
     *
     * @return 结束时间
     */
    public long getEndTime() {
        return endTime;
    }

    /**
     * 设置结束时间
     *
     * <pre>
     * 查询缓存轨迹时，为所属entity对应缓存轨迹的结束时间；
     * 删除缓存轨迹时，为要删除缓存轨迹的结束时间。
     * </pre>
     *
     * @param endTime 结束时间
     */
    public void setEndTime(long endTime) {
        this.endTime = endTime;
    }

    /**
     * 获取缓存轨迹距离，单位：米
     *
     * <pre>
     * 查询轨迹时，为所属entity对应缓存轨迹的距离；
     * entityName为null或空串时，表示查询所有entity的缓存轨迹的距离
     * </pre>
     *
     * @return entity对应缓存轨迹的距离
     */
    public double getCacheDistance() {
        return cacheDistance;
    }

    /**
     * 设置缓存轨迹距离，单位：米
     *
     * <pre>
     * 查询轨迹时，为所属entity对应缓存轨迹的距离；
     * entityName为null或空串时，表示查询所有entity的缓存轨迹的距离
     * </pre>
     *
     * @param cacheDistance entity对应缓存轨迹的距离
     */
    public void setCacheDistance(double cacheDistance) {
        this.cacheDistance = cacheDistance;
    }

    public CacheTrackInfo() {
        super();
    }

    /**
     * @param entityName entity标识
     * @param startTime  开始时间
     * @param endTime    结束时间
     */
    public CacheTrackInfo(String entityName, long startTime, long endTime) {
        this.entityName = entityName;
        this.startTime = startTime;
        this.endTime = endTime;
    }

    /**
     * @param entityName entity标识
     * @param total      缓存数据量
     * @param startTime  开始时间
     * @param endTime    结束时间
     */
    public CacheTrackInfo(String entityName, int total, long startTime, long endTime) {
        super();
        this.entityName = entityName;
        this.total = total;
        this.startTime = startTime;
        this.endTime = endTime;
    }

    /**
     * @param entityName    entity标识
     * @param total         缓存数据量
     * @param startTime     开始时间
     * @param endTime       结束时间
     * @param cacheDistance 缓存轨迹对应的距离
     */
    public CacheTrackInfo(String entityName, int total, long startTime, long endTime,
                          double cacheDistance) {
        super();
        this.entityName = entityName;
        this.total = total;
        this.startTime = startTime;
        this.endTime = endTime;
        this.cacheDistance = cacheDistance;
    }

    /**
     * @param entityName    entity标识
     * @param startTime     开始时间
     * @param endTime       结束时间
     * @param cacheDistance 缓存轨迹对应的距离
     */
    public CacheTrackInfo(String entityName, long startTime, long endTime, double cacheDistance) {
        this.entityName = entityName;
        this.startTime = startTime;
        this.endTime = endTime;
        this.cacheDistance = cacheDistance;
    }

    public com.baidu.trace.api.track.CacheTrackInfo toCacheTrackInfo() {
        com.baidu.trace.api.track.CacheTrackInfo cacheTrackInfo =
                new com.baidu.trace.api.track.CacheTrackInfo();
        cacheTrackInfo.setEntityName(entityName);
        cacheTrackInfo.setStartTime(startTime);
        cacheTrackInfo.setEndTime(endTime);
        cacheTrackInfo.setTotal(total);
        cacheTrackInfo.setCacheDistance(cacheDistance);
        return cacheTrackInfo;
    }

    public static CacheTrackInfo fromSDKObject(
            com.baidu.trace.api.track.CacheTrackInfo cacheTrackInfo) {
        if (cacheTrackInfo == null) {
            return null;
        }
        CacheTrackInfo cacheTrackInfoTmp = new CacheTrackInfo();
        cacheTrackInfoTmp.setEntityName(cacheTrackInfo.getEntityName());
        cacheTrackInfoTmp.setStartTime(cacheTrackInfo.getStartTime());
        cacheTrackInfoTmp.setEndTime(cacheTrackInfo.getEndTime());
        cacheTrackInfoTmp.setTotal(cacheTrackInfo.getTotal());
        cacheTrackInfoTmp.setCacheDistance(cacheTrackInfo.getCacheDistance());
        return cacheTrackInfoTmp;
    }

    @Override
    public String toString() {
        return "CacheTrackInfo [entityName=" + entityName + ", total=" + total + ", startTime="
                + startTime
                + ", endTime=" + endTime + ", cacheDistance=" + cacheDistance + "]";
    }

}
