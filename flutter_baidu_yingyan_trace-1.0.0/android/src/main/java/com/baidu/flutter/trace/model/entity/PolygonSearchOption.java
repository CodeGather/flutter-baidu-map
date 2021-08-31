package com.baidu.flutter.trace.model.entity;

import java.util.List;

import com.baidu.flutter.trace.model.CoordType;
import com.baidu.trace.api.entity.PolygonSearchRequest;

/**
 * 多边形搜索：根据设定的多边形进行搜索
 *
 * @author baidu
 */

public final class PolygonSearchOption extends CommonOption {

    /**
     * 多边形边界点
     */
    private List<com.baidu.trace.model.LatLng> vertexes;

    /**
     * 多边形边界点的坐标类型，默认为百度经纬度
     */
    private int coordTypeInput = CoordType.bd09ll.ordinal();

    public List<com.baidu.trace.model.LatLng> getVertexes() {
        return vertexes;
    }

    /**
     * 设置多边形边界点
     *
     * @param vertexes
     */
    public void setVertexes(List<com.baidu.trace.model.LatLng> vertexes) {
        this.vertexes = vertexes;
    }

    public int getCoordTypeInput() {
        return coordTypeInput;
    }

    /**
     * 设置多边形边界点的坐标类型，默认为百度经纬度
     *
     * @param coordTypeInput
     */
    public void setCoordTypeInput(int coordTypeInput) {
        this.coordTypeInput = coordTypeInput;
    }

    public PolygonSearchOption() {
        super();
    }

    /**
     * @param tag            请求标识
     * @param serviceId      轨迹服务ID
     * @param vertexes       多边形边界点
     * @param coordTypeInput 多边形边界点坐标类型
     */
    public PolygonSearchOption(int tag, long serviceId, List<com.baidu.trace.model.LatLng> vertexes,
                               int coordTypeInput) {
        super(tag, serviceId);
        this.vertexes = vertexes;
        this.coordTypeInput = coordTypeInput;
    }

    /**
     * @param tag             请求标识
     * @param serviceId       轨迹服务ID
     * @param filterCondition 过滤条件
     * @param coordTypeOutput 返回结果的坐标类型
     * @param vertexes        多边形边界点
     * @param coordTypeInput  多边形边界点坐标类型
     * @param pageIndex       分页索引
     * @param pageSize        分页大小
     */
    public PolygonSearchOption(int tag, long serviceId, FilterCondition filterCondition,
                               int coordTypeOutput, List<com.baidu.trace.model.LatLng> vertexes,
                               int coordTypeInput,
                               int pageIndex, int pageSize) {
        super(tag, serviceId, filterCondition, coordTypeOutput, pageIndex, pageSize);
        this.vertexes = vertexes;
        this.coordTypeInput = coordTypeInput;
    }

    /**
     * @param tag             请求标识
     * @param serviceId       轨迹服务ID
     * @param filterCondition 过滤条件
     * @param sortBy          排序方法
     * @param coordTypeOutput 返回结果的坐标类型
     * @param vertexes        多边形边界点
     * @param coordTypeInput  多边形边界点坐标类型
     * @param pageIndex       分页索引
     * @param pageSize        分页大小
     */
    public PolygonSearchOption(int tag, long serviceId, FilterCondition filterCondition,
                               SortBy sortBy, int coordTypeOutput,
                               List<com.baidu.trace.model.LatLng> vertexes,
                               int coordTypeInput, int pageIndex, int pageSize) {
        super(tag, serviceId, filterCondition, sortBy, coordTypeOutput, pageIndex, pageSize);
        this.vertexes = vertexes;
        this.coordTypeInput = coordTypeInput;
    }

    public PolygonSearchRequest toPolygonSearchRequest() {
        PolygonSearchRequest polygonSearchRequest = new PolygonSearchRequest();
        polygonSearchRequest.setTag(tag);
        polygonSearchRequest.setServiceId(serviceId);
        polygonSearchRequest.setVertexes(vertexes);
        if (filterCondition != null) {
            polygonSearchRequest.setFilterCondition(filterCondition.toFilterCondition());
        }
        if (sortBy != null) {
            polygonSearchRequest.setSortBy(sortBy.toSortBy());
        }
        polygonSearchRequest
                .setCoordTypeInput(com.baidu.trace.model.CoordType.values()[coordTypeInput]);
        polygonSearchRequest
                .setCoordTypeOutput(com.baidu.trace.model.CoordType.values()[coordTypeOutput]);
        polygonSearchRequest.setPageIndex(pageIndex);
        polygonSearchRequest.setPageSize(pageSize);
        return polygonSearchRequest;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("PolygonSearchOption{");
        sb.append("tag=").append(tag);
        sb.append(", serviceId=").append(serviceId);
        sb.append(", vertexes=").append(vertexes);
        sb.append(", coordTypeInput=").append(coordTypeInput);
        sb.append(", filterCondition=").append(filterCondition);
        sb.append(", sortBy=").append(sortBy);
        sb.append(", coordTypeOutput=").append(coordTypeOutput);
        sb.append(", pageIndex=").append(pageIndex);
        sb.append(", pageSize=").append(pageSize);
        sb.append('}');
        return sb.toString();
    }
}
