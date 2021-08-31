package com.baidu.flutter.trace.model.entity;

import com.baidu.trace.api.entity.AddEntityResponse;
import com.baidu.trace.api.entity.AroundSearchResponse;
import com.baidu.trace.api.entity.BoundSearchResponse;
import com.baidu.trace.api.entity.DeleteEntityResponse;
import com.baidu.trace.api.entity.DistrictSearchResponse;
import com.baidu.trace.api.entity.EntityListResponse;
import com.baidu.trace.api.entity.PolygonSearchResponse;
import com.baidu.trace.api.entity.SearchResponse;
import com.baidu.trace.api.entity.UpdateEntityResponse;
import com.baidu.trace.model.TraceLocation;

/**
 * Entity监听器
 *
 * @author huangshaowen01
 */
public abstract class OnEntityListener {

    /**
     * 添加Entity回调接口
     *
     * @param response 响应结果
     */
    public void onAddEntityCallback(AddEntityResponse response) {
    }

    /**
     * 更新Entity回调接口
     *
     * @param response 响应结果
     */
    public void onUpdateEntityCallback(UpdateEntityResponse response) {
    }

    /**
     * 删除Entity回调接口
     *
     * @param response 响应结果
     */
    public void onDeleteEntityCallback(DeleteEntityResponse response) {
    }

    /**
     * 查询Entity列表回调接口
     *
     * @param response 响应结果
     */
    public void onEntityListCallback(EntityListResponse response) {
    }

    /**
     * 搜索Entity回调接口
     *
     * @param response 响应结果
     */
    public void onSearchEntityCallback(SearchResponse response) {
    }

    /**
     * 矩形搜索回调接口
     *
     * @param response 响应结果
     */
    public void onBoundSearchCallback(BoundSearchResponse response) {
    }

    /**
     * 周边搜索回调接口
     *
     * @param response 响应结果
     */
    public void onAroundSearchCallback(AroundSearchResponse response) {
    }

    /**
     * 多边形搜索回调接口
     *
     * @param response 响应结果
     */
    public void onPolygonSearchCallback(PolygonSearchResponse response) {
    }

    /**
     * 行政区搜索回调接口
     *
     * @param response 响应结果
     */
    public void onDistrictSearchCallback(DistrictSearchResponse response) {
    }

    /**
     * 实时定位回调接口
     *
     * @param location 定位结果
     */
    public void onReceiveLocation(TraceLocation location) {
    }

}
