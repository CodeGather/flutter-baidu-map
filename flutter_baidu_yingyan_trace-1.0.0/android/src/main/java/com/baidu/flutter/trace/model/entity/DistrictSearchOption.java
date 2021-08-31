package com.baidu.flutter.trace.model.entity;

import com.baidu.trace.api.entity.DistrictSearchRequest;

/**
 * 行政区搜索：搜索中国范围内，国家、省、市、区/县中的entity
 *
 * @author baidu
 */

public final class DistrictSearchOption extends CommonOption {

    /**
     * 行政区划关键字
     */
    private String keyword;

    /**
     * 设置返回值的内容，默认值为ReturnType.all
     */
    private int returnType = ReturnType.all.ordinal();

    public String getKeyword() {
        return keyword;
    }

    /**
     * 设置行政区划关键字
     *
     * @param keyword
     */
    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public int getReturnType() {
        return returnType;
    }

    /**
     * 设置返回值的内容，默认值为ReturnType.all
     *
     * @param returnType
     */
    public void setReturnType(int returnType) {
        this.returnType = returnType;
    }

    public DistrictSearchOption() {
        super();
    }

    /**
     * @param tag        请求标识
     * @param serviceId  轨迹服务ID
     * @param keyword    行政区划关键字
     * @param returnType 返回值内容
     */
    public DistrictSearchOption(int tag, long serviceId, String keyword, int returnType) {
        super(tag, serviceId);
        this.keyword = keyword;
        this.returnType = returnType;
    }

    /**
     * @param tag             请求标识
     * @param serviceId       轨迹服务ID
     * @param filterCondition 过滤条件
     * @param coordTypeOutput 返回结果的坐标类型
     * @param keyword         行政区划关键字
     * @param returnType      返回值内容
     * @param pageIndex       分页索引
     * @param pageSize        分页大小
     */
    public DistrictSearchOption(int tag, long serviceId, FilterCondition filterCondition,
                                int coordTypeOutput, String keyword, int returnType,
                                int pageIndex, int pageSize) {
        super(tag, serviceId, filterCondition, coordTypeOutput, pageIndex, pageSize);
        this.keyword = keyword;
        this.returnType = returnType;
    }

    /**
     * @param tag             请求标识
     * @param serviceId       轨迹服务ID
     * @param filterCondition 过滤条件
     * @param sortBy          排序方法
     * @param coordTypeOutput 返回结果的坐标类型
     * @param keyword         行政区划关键字
     * @param returnType      返回值内容
     * @param pageIndex       分页索引
     * @param pageSize        分页大小
     */
    public DistrictSearchOption(int tag, long serviceId, FilterCondition filterCondition,
                                SortBy sortBy, int coordTypeOutput, String keyword,
                                int returnType, int pageIndex, int pageSize) {
        super(tag, serviceId, filterCondition, sortBy, coordTypeOutput, pageIndex, pageSize);
        this.keyword = keyword;
        this.returnType = returnType;
    }

    public DistrictSearchRequest toDistrictSearchRequest() {
        DistrictSearchRequest districtSearchRequest = new DistrictSearchRequest();
        districtSearchRequest.setTag(tag);
        districtSearchRequest.setServiceId(serviceId);
        districtSearchRequest
                .setCoordTypeOutput(com.baidu.trace.model.CoordType.values()[coordTypeOutput]);
        if (filterCondition != null) {
            districtSearchRequest.setFilterCondition(filterCondition.toFilterCondition());
        }
        if (sortBy != null) {
            districtSearchRequest.setSortBy(sortBy.toSortBy());
        }
        districtSearchRequest.setKeyword(keyword);
        districtSearchRequest
                .setReturnType(com.baidu.trace.api.entity.ReturnType.values()[returnType]);
        districtSearchRequest.setPageIndex(pageIndex);
        districtSearchRequest.setPageSize(pageSize);
        return districtSearchRequest;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("DistrictSearchOption{");
        sb.append("tag=").append(tag);
        sb.append(", serviceId=").append(serviceId);
        sb.append(", filterCondition=").append(filterCondition);
        sb.append(", sortBy=").append(sortBy);
        sb.append(", coordTypeOutput=").append(coordTypeOutput);
        sb.append(", keyword='").append(keyword).append("\'");
        sb.append(", returnType=").append(returnType);
        sb.append(", pageIndex=").append(pageIndex);
        sb.append(", pageSize=").append(pageSize);
        sb.append('}');
        return sb.toString();
    }
}
