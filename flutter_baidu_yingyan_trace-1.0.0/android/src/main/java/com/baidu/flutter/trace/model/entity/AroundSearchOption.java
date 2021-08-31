package com.baidu.flutter.trace.model.entity;

import com.baidu.flutter.trace.model.CoordType;
import com.baidu.flutter.trace.model.LatLng;
import com.baidu.trace.api.entity.AroundSearchRequest;

/**
 * 周边搜索：根据圆心半径和筛选条件进行搜索
 *
 * @author baidu
 */
public final class AroundSearchOption extends CommonOption {

    /**
     * 圆心经纬度
     */
    private LatLng center;

    /**
     * 半径，取值范围[1, 5000]
     */
    private double radius;

    /**
     * 圆心坐标类型，默认值为坐标类型百度经纬度(bd09ll)
     */
    private int coordTypeInput = CoordType.bd09ll.ordinal();

    public LatLng getCenter() {
        return center;
    }

    /**
     * 设置圆心
     *
     * @param center
     */
    public void setCenter(LatLng center) {
        this.center = center;
    }

    public double getRadius() {
        return radius;
    }

    /**
     * 设置半径，取值范围[1, 5000]
     *
     * @param radius
     */
    public void setRadius(double radius) {
        this.radius = radius;
    }

    public int getCoordTypeInput() {
        return coordTypeInput;
    }

    /**
     * 设置坐标类型
     *
     * @param coordTypeInput
     */
    public void setCoordTypeInput(int coordTypeInput) {
        this.coordTypeInput = coordTypeInput;
    }

    public AroundSearchOption() {
        super();
    }

    /**
     * @param tag       请求标识
     * @param serviceId 轨迹服务ID
     */
    public AroundSearchOption(int tag, long serviceId) {
        super(tag, serviceId);
    }

    /**
     * @param tag             请求标识
     * @param serviceId       轨迹服务ID
     * @param filterCondition 过滤条件
     * @param coordTypeOutput 返回结果的坐标类型
     * @param pageIndex       分页索引
     * @param pageSize        分页大小
     */
    public AroundSearchOption(int tag, long serviceId, FilterCondition filterCondition,
                              int coordTypeOutput,
                              int pageIndex, int pageSize) {
        super(tag, serviceId, filterCondition, coordTypeOutput, pageIndex, pageSize);
    }

    /**
     * @param tag             请求标识
     * @param serviceId       轨迹服务ID
     * @param center          圆心坐标
     * @param radius          半径
     * @param coordTypeInput  圆心坐标类型
     * @param filterCondition 过滤条件
     * @param coordTypeOutput 返回结果的坐标类型
     * @param pageIndex       分页索引
     * @param pageSize        分页大小
     */
    public AroundSearchOption(int tag, long serviceId, LatLng center, double radius,
                              int coordTypeInput,
                              FilterCondition filterCondition, int coordTypeOutput,
                              int pageIndex,
                              int pageSize) {
        super(tag, serviceId, filterCondition, coordTypeOutput, pageIndex, pageSize);
        this.center = center;
        this.radius = radius;
        this.coordTypeInput = coordTypeInput;
    }

    /**
     * @param tag             请求标识
     * @param serviceId       轨迹服务ID
     * @param center          圆心坐标
     * @param radius          半径
     * @param coordTypeInput  圆心坐标类型
     * @param filterCondition 过滤条件
     * @param sortBy          排序方法
     * @param coordTypeOutput 返回结果的坐标类型
     * @param pageIndex       分页索引
     * @param pageSize        分页大小
     */
    public AroundSearchOption(int tag, long serviceId, LatLng center, double radius,
                              int coordTypeInput,
                              FilterCondition filterCondition, SortBy sortBy,
                              int coordTypeOutput,
                              int pageIndex, int pageSize) {
        super(tag, serviceId, filterCondition, sortBy, coordTypeOutput, pageIndex, pageSize);
        this.center = center;
        this.radius = radius;
        this.coordTypeInput = coordTypeInput;
    }

    public AroundSearchRequest toAroundSearchRequest() {
        AroundSearchRequest aroundSearchRequest = new AroundSearchRequest();
        aroundSearchRequest.setTag(tag);
        aroundSearchRequest.setServiceId(serviceId);
        if (center != null) {
            aroundSearchRequest
                    .setCenter(new com.baidu.trace.model.LatLng(center.latitude, center.longitude));
        }
        aroundSearchRequest.setRadius(radius);
        aroundSearchRequest
                .setCoordTypeInput(com.baidu.trace.model.CoordType.values()[coordTypeInput]);
        if (filterCondition != null) {
            aroundSearchRequest.setFilterCondition(filterCondition.toFilterCondition());
        }
        if (sortBy != null) {
            aroundSearchRequest.setSortBy(sortBy.toSortBy());
        }
        return aroundSearchRequest;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("AroundSearchRequest{");
        sb.append("tag=").append(tag);
        sb.append(", serviceId=").append(serviceId);
        sb.append(", center=").append(center);
        sb.append(", radius=").append(radius);
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
