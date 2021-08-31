package com.baidu.flutter.trace.model.fence;

import java.util.ArrayList;
import java.util.List;

import com.baidu.flutter.trace.model.CoordType;
import com.baidu.flutter.trace.model.LatLng;

/**
 * 多段线围栏
 *
 * @author baidu
 */
public final class PolylineFence extends Fence {

    /**
     * 顶点坐标集
     */
    private List<LatLng> vertexes;

    /**
     * 偏离距离
     */
    private int offset;

    /**
     * 坐标类型，默认百度经纬度
     */
    private int coordType = CoordType.bd09ll.ordinal();

    public List<LatLng> getVertexes() {
        return vertexes;
    }

    public List<com.baidu.trace.model.LatLng> getSDKVertexes() {
        if (vertexes == null) {
            return null;
        }
        List<com.baidu.trace.model.LatLng> latLngs = new ArrayList<>();
        for (LatLng latLng : vertexes) {
            latLngs.add(latLng.toLatLng());
        }
        return latLngs;
    }

    /**
     * 设置顶点坐标集
     *
     * @param vertexes
     */
    public void setVertexes(List<LatLng> vertexes) {
        this.vertexes = vertexes;
    }

    public int getOffset() {
        return offset;
    }

    /**
     * 设置偏离距离
     *
     * @param offset
     */
    public void setOffset(int offset) {
        this.offset = offset;
    }

    public int getCoordType() {
        return coordType;
    }

    /**
     * 设置坐标类型
     *
     * @param coordType
     */
    public void setCoordType(int coordType) {
        this.coordType = coordType;
    }

    /**
     * 多段线围栏构造方法
     *
     * @param fenceId         围栏编号
     * @param fenceName       围栏名称
     * @param fenceType       围栏类型
     * @param monitoredPerson 监控对象
     * @param vertexes        顶点坐标集
     * @param offset          偏离距离
     * @param denoise         围栏去噪参数
     * @param coordType       坐标类型
     * @return
     */
    private PolylineFence(long fenceId, String fenceName, int fenceType, String monitoredPerson,
                          List<LatLng> vertexes, int offset, int denoise, int coordType) {
        super(fenceId, fenceName, monitoredPerson, denoise, fenceType);
        super.vertexes = vertexes;
        super.offset = offset;
        super.coordType = coordType;
        this.vertexes = vertexes;
        this.offset = offset;
        this.coordType = coordType;
    }

    /**
     * 创建服务端多段线围栏
     *
     * @param fenceName       围栏名称
     * @param monitoredPerson 监控对象
     * @param vertexes        顶点坐标集
     * @param offset          偏离距离
     * @param denoise         围栏去噪参数
     * @param coordType       坐标类型
     * @return
     */
    public static PolylineFence buildServerFence(long fenceId, String fenceName,
                                                 String monitoredPerson,
                                                 List<LatLng> vertexes, int offset, int denoise,
                                                 int coordType) {
        return new PolylineFence(fenceId, fenceName, FenceType.server.ordinal(), monitoredPerson,
                vertexes
                , offset, denoise,
                coordType);
    }

    public static PolylineFence fromSDKObject(
            com.baidu.trace.api.fence.PolylineFence polylineFence) {
        if (polylineFence == null) {
            return null;
        }
        List<com.baidu.flutter.trace.model.LatLng> latLngs = new ArrayList<>();
        if (polylineFence.getVertexes() != null) {
            for (com.baidu.trace.model.LatLng latLng : polylineFence.getVertexes()) {
                latLngs.add(com.baidu.flutter.trace.model.LatLng.fromSDKObject(latLng));
            }
        }
        return new PolylineFence(polylineFence.getFenceId(),
                polylineFence.getFenceName(),
                polylineFence.getFenceType().ordinal(),
                polylineFence.getMonitoredPerson(), latLngs,
                polylineFence.getOffset(),
                polylineFence.getDenoise(),
                polylineFence.getCoordType().ordinal());
    }

    @Override
    public String toString() {
        return "PolylineFence [fenceId=" + fenceId + ", fenceName=" + fenceName + ", fenceType="
                + fenceType
                + ", monitoredPerson=" + monitoredPerson + ", vertexes=" + vertexes + ", offset="
                + offset
                + ", denoise=" + denoise + ", coordType=" + coordType + "]";
    }

}
