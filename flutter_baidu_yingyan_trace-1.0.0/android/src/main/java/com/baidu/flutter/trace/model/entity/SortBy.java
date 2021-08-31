package com.baidu.flutter.trace.model.entity;

/**
 * 实时位置搜索的排序方法
 */

public class SortBy {

    /**
     * 排序字段名称
     */
    private String fieldName;

    /**
     * 排序规则
     */
    private int sortType;

    /**
     * 获取排序字段名称
     *
     * @return
     */
    public String getFieldName() {
        return fieldName;
    }

    /**
     * 获取排序规则
     *
     * @return
     */
    public int getSortType() {
        return sortType;
    }

    /**
     * 设置排序规则
     *
     * @param sortType
     */
    public void setSortType(int sortType) {
        this.sortType = sortType;
    }

    public SortBy() {

    }

    /**
     * @param fieldName 排序字段名称
     * @param sortType  排序规则
     */
    public SortBy(String fieldName, int sortType) {
        this.fieldName = fieldName;
        this.sortType = sortType;
    }

    public com.baidu.trace.api.entity.SortBy toSortBy() {
        com.baidu.trace.api.entity.SortBy sortBy =
                com.baidu.trace.api.entity.SortBy.buildCustomKey(fieldName,
                        com.baidu.trace.model.SortType.values()[sortType]);
        return sortBy;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("SortBy{");
        sb.append("fieldName='").append(fieldName).append('\'');
        sb.append(", sortType=").append(sortType);
        sb.append('}');
        return sb.toString();
    }
}
