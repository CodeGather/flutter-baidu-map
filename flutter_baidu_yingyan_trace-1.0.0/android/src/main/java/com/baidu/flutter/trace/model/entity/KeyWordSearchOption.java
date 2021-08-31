package com.baidu.flutter.trace.model.entity;

import com.baidu.trace.api.entity.SearchRequest;

/**
 * 搜索entity：根据关键字及过滤条件进行搜索
 *
 * @author baidu
 */
public final class KeyWordSearchOption extends CommonOption {

    /**
     * 搜索关键字，目前仅支持模糊检索entityName和entityDesc字段， keyword为空时检索全部
     */
    private String keyword;

    public String getKeyword() {
        return keyword;
    }

    /**
     * 设置关键字
     *
     * @param keyword
     */
    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public KeyWordSearchOption() {
        super();
    }

    public KeyWordSearchOption(int tag, long serviceId) {
        super(tag, serviceId);
    }

    /**
     * @param tag             请求标识
     * @param serviceId       轨迹服务ID
     * @param keyword         关键字
     * @param filterCondition 过滤条件
     * @param coordTypeOutput 返回结果的坐标类型
     * @param pageIndex       分页索引
     * @param pageSize        分页大小
     */
    public KeyWordSearchOption(int tag, long serviceId, String keyword,
                               FilterCondition filterCondition,
                               int coordTypeOutput, int pageIndex, int pageSize) {
        super(tag, serviceId, filterCondition, coordTypeOutput, pageIndex, pageSize);
        this.keyword = keyword;
    }

    /**
     * @param tag             请求标识
     * @param serviceId       轨迹服务ID
     * @param keyword         关键字
     * @param filterCondition 过滤条件
     * @param sortBy          排序方法
     * @param coordTypeOutput 返回结果的坐标类型
     * @param pageIndex       分页索引
     * @param pageSize        分页大小
     */
    public KeyWordSearchOption(int tag, long serviceId, String keyword,
                               FilterCondition filterCondition,
                               SortBy sortBy, int coordTypeOutput, int pageIndex,
                               int pageSize) {
        super(tag, serviceId, filterCondition, sortBy, coordTypeOutput, pageIndex, pageSize);
        this.keyword = keyword;
    }

    public SearchRequest toSearchRequest() {
        SearchRequest searchRequest = new SearchRequest();
        searchRequest.setTag(tag);
        searchRequest.setServiceId(serviceId);
        searchRequest.setKeyword(keyword);
        if (filterCondition != null) {
            searchRequest.setFilterCondition(filterCondition.toFilterCondition());
        }
        if (sortBy != null) {
            searchRequest.setSortBy(sortBy.toSortBy());
        }
        searchRequest.setCoordTypeOutput(com.baidu.trace.model.CoordType.values()[coordTypeOutput]);
        searchRequest.setPageIndex(pageIndex);
        searchRequest.setPageSize(pageSize);
        return searchRequest;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("KeyWordSearchOption{");
        sb.append("tag='").append(tag);
        sb.append(", serviceId='").append(serviceId);
        sb.append(", keyword='").append(keyword).append('\'');
        sb.append(", filterCondition=").append(filterCondition);
        sb.append(", sortBy=").append(sortBy);
        sb.append(", coordTypeOutput=").append(coordTypeOutput);
        sb.append(", pageIndex=").append(pageIndex);
        sb.append(", pageSize=").append(pageSize);
        sb.append('}');
        return sb.toString();
    }
}
