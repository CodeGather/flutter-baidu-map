package com.baidu.flutter.trace.model.fence;

/**
 * 围栏信息（封装查询围栏列表时返回的围栏信息）
 *
 * @author baidu
 */
public final class FenceInfo {

    /**
     * 围栏形状
     */
    private int fenceShape;

    /**
     * 圆形围栏：仅当围栏形状(fenceShape)为圆形(circle)时，circleFence才有值
     */
    private CircleFence circleFence;

    /**
     * 多边形围栏：仅当围栏形状(fenceShape)为多边形(polygon)时，polygonFence才有值
     */
    private PolygonFence polygonFence;

    /**
     * 多段线围栏：仅当围栏形状(fenceShape)为多段线(polyline)时，polylineFence才有值
     */
    private PolylineFence polylineFence;

    /**
     * 行政区划围栏：仅当围栏形状(fenceShape)为行政区划(district)时，districtFence才有值
     */
    private DistrictFence districtFence;

    /**
     * 创建时间
     */
    private String createTime;

    /**
     * 修改时间
     */
    private String modifyTime;

    /**
     * 获取围栏形状
     *
     * @return
     */
    public int getFenceShape() {
        return fenceShape;
    }

    public void setFenceShape(int fenceShape) {
        this.fenceShape = fenceShape;
    }

    /**
     * 获取圆形围栏：仅当围栏形状(fenceShape)为圆形(circle)时才有值
     *
     * @return
     */
    public CircleFence getCircleFence() {
        return circleFence;
    }

    public void setCircleFence(CircleFence circleFence) {
        this.circleFence = circleFence;
    }

    /**
     * 获取多边形围栏：仅当围栏形状(fenceShape)为多边形围栏(polygon)时才有值
     *
     * @return
     */
    public PolygonFence getPolygonFence() {
        return polygonFence;
    }

    public void setPolygonFence(PolygonFence polygonFence) {
        this.polygonFence = polygonFence;
    }

    /**
     * 获取多段线围栏：仅当围栏形状(fenceShape)为多边形围栏(polyline)时才有值
     *
     * @return
     */
    public PolylineFence getPolylineFence() {
        return polylineFence;
    }

    public void setPolylineFence(PolylineFence polylineFence) {
        this.polylineFence = polylineFence;
    }

    /**
     * 获取行政区划围栏：仅当围栏形状(fenceShape)为行政区划(district)时，districtFence才有值
     *
     * @return
     */
    public DistrictFence getDistrictFence() {
        return districtFence;
    }

    public void setDistrictFence(DistrictFence districtFence) {
        this.districtFence = districtFence;
    }

    /**
     * 获取创建时间
     *
     * @return
     */
    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    /**
     * 获取修改时间
     *
     * @return
     */
    public String getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(String modifyTime) {
        this.modifyTime = modifyTime;
    }

    public FenceInfo() {
        super();
    }

    /**
     * @param fenceShape    围栏形状
     * @param circleFence   圆形围栏
     * @param polygonFence  多边形围栏
     * @param polylineFence 多段线围栏
     * @param createTime    创建时间
     * @param modifyTime    修改时间
     */
    public FenceInfo(int fenceShape, CircleFence circleFence, PolygonFence polygonFence,
                     PolylineFence polylineFence, String createTime, String modifyTime) {
        super();
        this.fenceShape = fenceShape;
        this.circleFence = circleFence;
        this.polygonFence = polygonFence;
        this.polylineFence = polylineFence;
        this.createTime = createTime;
        this.modifyTime = modifyTime;
    }

    /**
     * @param fenceShape    围栏形状
     * @param circleFence   圆形围栏
     * @param polygonFence  多边形围栏
     * @param polylineFence 多段线围栏
     * @param districtFence 行政区划围栏
     * @param createTime    创建时间
     * @param modifyTime    修改时间
     */
    public FenceInfo(int fenceShape, CircleFence circleFence, PolygonFence polygonFence,
                     PolylineFence polylineFence, DistrictFence districtFence, String createTime,
                     String modifyTime) {
        super();
        this.fenceShape = fenceShape;
        this.circleFence = circleFence;
        this.polygonFence = polygonFence;
        this.polylineFence = polylineFence;
        this.districtFence = districtFence;
        this.createTime = createTime;
        this.modifyTime = modifyTime;
    }

    public static FenceInfo fromSDKObject(com.baidu.trace.api.fence.FenceInfo fenceInfo) {
        if (fenceInfo == null) {
            return null;
        }
        FenceInfo fenceInfoTmp = new FenceInfo();
        fenceInfoTmp.setFenceShape(fenceInfo.getFenceShape().ordinal());
        fenceInfoTmp.setCircleFence(CircleFence.fromSDKObject(fenceInfo.getCircleFence()));
        fenceInfoTmp.setDistrictFence(DistrictFence.fromSDKObject(fenceInfo.getDistrictFence()));
        fenceInfoTmp.setPolygonFence(PolygonFence.fromSDKObject(fenceInfo.getPolygonFence()));
        fenceInfoTmp.setPolylineFence(PolylineFence.fromSDKObject(fenceInfo.getPolylineFence()));
        fenceInfoTmp.setCreateTime(fenceInfo.getCreateTime());
        fenceInfoTmp.setModifyTime(fenceInfo.getModifyTime());
        return fenceInfoTmp;
    }

    @Override
    public String toString() {
        if (FenceShape.circle.ordinal() == fenceShape) {
            return "FenceInfo [fenceShape=" + fenceShape + ", circleFence=" + circleFence
                    + ", createTime=" + createTime + ", modifyTime=" + modifyTime + "]";
        } else if (FenceShape.polygon.ordinal() == fenceShape) {
            return "FenceInfo [fenceShape=" + fenceShape + ", polygonFence=" + polygonFence
                    + ", createTime=" + createTime + ", modifyTime=" + modifyTime + "]";
        } else if (FenceShape.polyline.ordinal() == fenceShape) {
            return "FenceInfo [fenceShape=" + fenceShape + ", polylineFence=" + polylineFence
                    + ", createTime=" + createTime + ", modifyTime=" + modifyTime + "]";
        } else if (FenceShape.district.ordinal() == fenceShape) {
            return "FenceInfo [fenceShape=" + fenceShape + ", districtFence=" + districtFence
                    + ", createTime=" + createTime + ", modifyTime=" + modifyTime + "]";
        } else {
            return "FenceInfo [fenceShape=" + fenceShape + ", circleFence=" + circleFence
                    + ", polygonFence="
                    + polygonFence + ", polylineFence=" + polylineFence + ", districtFence="
                    + districtFence + ", "
                    + "createTime=" + createTime + ", modifyTime=" + modifyTime + "]";
        }
    }

}
