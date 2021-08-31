package com.baidu.flutter.trace.model.fence;

import java.util.ArrayList;
import java.util.List;

import com.baidu.flutter.trace.model.CoordType;
import com.baidu.flutter.trace.model.LatLng;

/**
 * 多边形围栏
 *
 * @author baidu
 */
public final class PolygonFence extends Fence {

    /**
     * 顶点坐标集
     */
    private List<LatLng> vertexes;

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
     * 多边形围栏构造方法（暂只有服务端类型）
     *
     * @param fenceId         围栏编号
     * @param fenceName       围栏名称
     * @param fenceType       围栏类型
     * @param monitoredPerson 监控对象
     * @param vertexes        顶点坐标集
     * @param denoise         围栏去噪精度
     * @param coordType       坐标类型
     */
    private PolygonFence(long fenceId, String fenceName, int fenceType, String monitoredPerson,
                         List<LatLng> vertexes, int denoise, int coordType) {
        super(fenceId, fenceName, monitoredPerson, denoise, fenceType);
        super.vertexes = vertexes;
        super.coordType = coordType;
        this.vertexes = vertexes;
        this.coordType = coordType;
    }

    /**
     * 创建服务端多边形围栏
     *
     * @param fenceId         围栏编号
     * @param fenceName       围栏名称
     * @param monitoredPerson 监控对象
     * @param vertexes        顶点坐标集
     * @param denoise         围栏去噪精度
     * @param coordType       坐标类型
     * @return
     */
    public static PolygonFence buildServerFence(long fenceId, String fenceName,
                                                String monitoredPerson,
                                                List<LatLng> vertexes, int denoise, int coordType) {
        return new PolygonFence(fenceId, fenceName, FenceType.server.ordinal(), monitoredPerson,
                vertexes,
                denoise, coordType);
    }

    public static PolygonFence fromSDKObject(com.baidu.trace.api.fence.PolygonFence polygonFence) {
        if (polygonFence == null) {
            return null;
        }
        List<LatLng> latLngs = new ArrayList<>();
        if (polygonFence.getVertexes() != null) {
            for (com.baidu.trace.model.LatLng latLng : polygonFence.getVertexes()) {
                latLngs.add(LatLng.fromSDKObject(latLng));
            }
        }
        return new PolygonFence(polygonFence.getFenceId(),
                polygonFence.getFenceName(),
                polygonFence.getFenceType().ordinal(),
                polygonFence.getMonitoredPerson(), latLngs,
                polygonFence.getDenoise(),
                polygonFence.getCoordType().ordinal());
    }

    @Override
    public String toString() {
        return "PolygonFence [fenceId=" + fenceId + ", fenceName=" + fenceName + ", fenceType="
                + fenceType
                + ", monitoredPerson=" + monitoredPerson + ", vertexes=" + vertexes + ", denoise="
                + denoise
                + ", coordType=" + coordType + "]";
    }

}
