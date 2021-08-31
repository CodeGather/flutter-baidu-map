package com.baidu.flutter.trace.model.entity;

import com.baidu.flutter.trace.model.CoordType;
import com.baidu.flutter.trace.model.LatLng;
import com.baidu.trace.api.entity.BoundSearchRequest;

/**
 * 矩形搜索：根据矩形地理范围和筛选条件进行搜索
 *
 * @author baidu
 */
public final class BoundSearchOption extends CommonOption {

    /**
     * 矩形区域左下角坐标
     */
    private LatLng lowerLeft;

    /**
     * 矩形区域右上角
     */
    private LatLng upperRight;

    /**
     * 矩形坐标类型，默认为百度经纬度
     */
    private int coordTypeInput = CoordType.bd09ll.ordinal();

    public LatLng getLowerLeft() {
        return lowerLeft;
    }

    /**
     * 设置矩形区域左下角坐标
     *
     * @param lowerLeft
     */
    public void setLowerLeft(LatLng lowerLeft) {
        this.lowerLeft = lowerLeft;
    }

    public LatLng getUpperRight() {
        return upperRight;
    }

    /**
     * 设置矩形区域右上角坐标
     *
     * @param upperRight
     */
    public void setUpperRight(LatLng upperRight) {
        this.upperRight = upperRight;
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

    public FilterCondition getFilterCondition() {
        return filterCondition;
    }

    public BoundSearchOption() {
        super();
    }

    /**
     * @param tag       请求标识
     * @param serviceId 轨迹服务ID
     */
    public BoundSearchOption(int tag, long serviceId) {
        super(tag, serviceId);
    }

    /**
     * @param tag             请求标识
     * @param serviceId       轨迹服务ID
     * @param filterCondition 过滤条件
     * @param coordTypeOutput 返回结果坐标类型
     * @param pageIndex       分页索引
     * @param pageSize        分页大小
     */
    public BoundSearchOption(int tag, long serviceId, FilterCondition filterCondition,
                             int coordTypeOutput,
                             int pageIndex, int pageSize) {
        super(tag, serviceId, filterCondition, coordTypeOutput, pageIndex, pageSize);
    }

    /**
     * @param tag             请求标识
     * @param serviceId       轨迹服务ID
     * @param lowerLeft       左下角坐标
     * @param upperRight      右上角坐标
     * @param coordTypeInput  矩形坐标类型
     * @param filterCondition 过滤条件
     * @param coordTypeOutput 返回结果坐标类型
     * @param pageIndex       分页索引
     * @param pageSize        分页大小
     */
    public BoundSearchOption(int tag, long serviceId, LatLng lowerLeft, LatLng upperRight,
                             int coordTypeInput,
                             FilterCondition filterCondition, int coordTypeOutput,
                             int pageIndex, int pageSize) {
        super(tag, serviceId, filterCondition, coordTypeOutput, pageIndex, pageSize);
        this.lowerLeft = lowerLeft;
        this.upperRight = upperRight;
        this.coordTypeInput = coordTypeInput;
    }

    /**
     * @param tag             请求标识
     * @param serviceId       轨迹服务ID
     * @param lowerLeft       左下角坐标
     * @param upperRight      右上角坐标
     * @param coordTypeInput  矩形坐标类型
     * @param filterCondition 过滤条件
     * @param sortBy          排序方法
     * @param coordTypeOutput 返回结果坐标类型
     * @param pageIndex       分页索引
     * @param pageSize        分页大小
     */
    public BoundSearchOption(int tag, long serviceId, LatLng lowerLeft, LatLng upperRight,
                             int coordTypeInput,
                             FilterCondition filterCondition, SortBy sortBy,
                             int coordTypeOutput,
                             int pageIndex, int pageSize) {
        super(tag, serviceId, filterCondition, sortBy, coordTypeOutput, pageIndex, pageSize);
        this.lowerLeft = lowerLeft;
        this.upperRight = upperRight;
        this.coordTypeInput = coordTypeInput;
    }

    public BoundSearchRequest toBoundSearchRequest() {
        BoundSearchRequest boundSearchRequest = new BoundSearchRequest();
        boundSearchRequest.setTag(tag);
        boundSearchRequest.setServiceId(serviceId);
        if (lowerLeft != null) {
            boundSearchRequest.setLowerLeft(new com.baidu.trace.model.LatLng(lowerLeft.latitude,
                    lowerLeft.longitude));
        }
        if (upperRight != null) {
            boundSearchRequest.setLowerLeft(new com.baidu.trace.model.LatLng(upperRight.latitude,
                    upperRight.longitude));
        }
        boundSearchRequest
                .setCoordTypeInput(com.baidu.trace.model.CoordType.values()[coordTypeInput]);
        if (filterCondition != null) {
            boundSearchRequest.setFilterCondition(filterCondition.toFilterCondition());
        }
        if (sortBy != null) {
            boundSearchRequest.setSortBy(sortBy.toSortBy());
        }
        boundSearchRequest
                .setCoordTypeOutput(com.baidu.trace.model.CoordType.values()[coordTypeOutput]);
        boundSearchRequest.setPageIndex(pageIndex);
        boundSearchRequest.setPageSize(pageSize);
        return boundSearchRequest;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("BoundSearchRequest{");
        sb.append("tag=").append(tag);
        sb.append(", serviceId=").append(serviceId);
        sb.append(", lowerLeft=").append(lowerLeft);
        sb.append(", upperRight=").append(upperRight);
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
