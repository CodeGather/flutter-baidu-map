package com.baidu.flutter.trace.manager;

import java.util.Map;

import com.baidu.flutter.trace.Constant;
import com.baidu.flutter.trace.model.entity.AddEntityOption;
import com.baidu.flutter.trace.model.entity.AddEntityResult;
import com.baidu.flutter.trace.model.entity.AroundSearchOption;
import com.baidu.flutter.trace.model.entity.AroundSearchResult;
import com.baidu.flutter.trace.model.entity.BoundSearchOption;
import com.baidu.flutter.trace.model.entity.BoundSearchResult;
import com.baidu.flutter.trace.model.entity.DeleteEntityOption;
import com.baidu.flutter.trace.model.entity.DeleteEntityResult;
import com.baidu.flutter.trace.model.entity.DistrictSearchOption;
import com.baidu.flutter.trace.model.entity.DistrictSearchResult;
import com.baidu.flutter.trace.model.entity.EntityListOption;
import com.baidu.flutter.trace.model.entity.EntityListResult;
import com.baidu.flutter.trace.model.entity.KeyWordSearchOption;
import com.baidu.flutter.trace.model.entity.KeyWordSearchResult;
import com.baidu.flutter.trace.model.entity.PolygonSearchOption;
import com.baidu.flutter.trace.model.entity.PolygonSearchResult;
import com.baidu.flutter.trace.model.entity.RealTimeLocationOption;
import com.baidu.flutter.trace.model.entity.RealTimeLocationResult;
import com.baidu.flutter.trace.model.entity.UpdateEntityOption;
import com.baidu.flutter.trace.model.entity.UpdateEntityResult;
import com.baidu.flutter.trace.utils.BLog;
import com.baidu.flutter.trace.utils.DataConvertUtil;
import com.baidu.trace.api.entity.AddEntityRequest;
import com.baidu.trace.api.entity.AddEntityResponse;
import com.baidu.trace.api.entity.AroundSearchRequest;
import com.baidu.trace.api.entity.AroundSearchResponse;
import com.baidu.trace.api.entity.BoundSearchRequest;
import com.baidu.trace.api.entity.BoundSearchResponse;
import com.baidu.trace.api.entity.DeleteEntityRequest;
import com.baidu.trace.api.entity.DeleteEntityResponse;
import com.baidu.trace.api.entity.DistrictSearchRequest;
import com.baidu.trace.api.entity.DistrictSearchResponse;
import com.baidu.trace.api.entity.EntityListRequest;
import com.baidu.trace.api.entity.EntityListResponse;
import com.baidu.trace.api.entity.LocRequest;
import com.baidu.trace.api.entity.OnEntityListener;
import com.baidu.trace.api.entity.PolygonSearchRequest;
import com.baidu.trace.api.entity.PolygonSearchResponse;
import com.baidu.trace.api.entity.SearchRequest;
import com.baidu.trace.api.entity.SearchResponse;
import com.baidu.trace.api.entity.UpdateEntityRequest;
import com.baidu.trace.api.entity.UpdateEntityResponse;
import com.baidu.trace.model.TraceLocation;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

/**
 * Copyright (C) 2019 Baidu, Inc. All Rights Reserved.
 */
public class EntityManager extends BaseManager {

    private static final String TAG = EntityManager.class.getName();


    EntityManager(LBSTraceController lbsTraceController) {
        super(lbsTraceController);

    }

    @Override
    public void handleMethodCall(MethodCall call, MethodChannel.Result result) {
        if (call == null || call.arguments == null || mLBSTraceController == null) {
            result.success(false);
            return;
        }

        switch (call.method) {
            case Constant.EntityMethodId.ADD_ENTITY:
                addEntity(call, result);
                break;
            case Constant.EntityMethodId.UPDATE_ENTITY:
                updateEntity(call, result);
                break;

            case Constant.EntityMethodId.DELETE_ENTITY:
                deleteEntity(call, result);
                break;
            case Constant.EntityMethodId.QUERY_ENTITY:
                queryEntityList(call, result);
                break;
            case Constant.EntityMethodId.SEARCH_ENTITY:
                searchEntity(call, result);
                break;
            case Constant.EntityMethodId.BOUND_SEARCH_ENTITY:
                boundSearchEntity(call, result);
                break;
            case Constant.EntityMethodId.AROUND_SEARCH_ENTITY:
                aroundSearchEntity(call, result);
                break;
            case Constant.EntityMethodId.POLYGON_SEARCH_ENTITY:
                polygonSearchEntity(call, result);
                break;
            case Constant.EntityMethodId.DISTRICT_SEARCH_ENTITY:
                districtSearchEntity(call, result);
                break;
            case Constant.EntityMethodId.QUERY_REAL_TIME_LOC:
                queryRealTimeLocation(call, result);
                break;

            default:

                break;
        }
    }
    
    private void addEntity(MethodCall call, MethodChannel.Result result) {
        if (call == null || call.arguments == null || mLBSTraceController == null || mLBSTraceController.getLBSTraceClient() == null) {
            result.success(false);
            return;
        }

        AddEntityOption addEntityOption =
                (AddEntityOption)DataConvertUtil.mapToObject((Map<String, Object>) call.arguments,
                        AddEntityOption.class);
        if (addEntityOption == null) {
            result.success(false);
            return;
        }

        AddEntityRequest addEntityRequest = addEntityOption.toAddEntityRequest();

        mLBSTraceController.getLBSTraceClient().addEntity(addEntityRequest,
                new PluginOnEntityListener());
        result.success(true);
    }

    private void updateEntity(MethodCall call, MethodChannel.Result result) {
        if (call == null || call.arguments == null || mLBSTraceController == null || mLBSTraceController.getLBSTraceClient() == null) {
            result.success(false);
            return;
        }
        UpdateEntityOption  updateEntityOption =
                (UpdateEntityOption)DataConvertUtil.mapToObject((Map<String, Object>) call.arguments,
                        UpdateEntityOption.class);
        if (updateEntityOption == null) {
            result.success(false);
            return;
        }

        UpdateEntityRequest updateEntityRequest = updateEntityOption.toUpdateEntityRequest();

        mLBSTraceController.getLBSTraceClient().updateEntity(updateEntityRequest,
                new PluginOnEntityListener());
        result.success(true);
    }

    private void deleteEntity(MethodCall call, MethodChannel.Result result) {
        if (call == null || call.arguments == null || mLBSTraceController == null || mLBSTraceController.getLBSTraceClient() == null) {
            result.success(false);
            return;
        }
        DeleteEntityOption deleteEntityOption =
                (DeleteEntityOption)DataConvertUtil.mapToObject((Map<String, Object>) call.arguments,
                        DeleteEntityOption.class);
        if (deleteEntityOption == null) {
            result.success(false);
            return;
        }

        DeleteEntityRequest deleteEntityRequest = deleteEntityOption.toDeleteEntityRequest();

        mLBSTraceController.getLBSTraceClient().deleteEntity(deleteEntityRequest,
                new PluginOnEntityListener());
        result.success(true);
    }

    private void queryEntityList(MethodCall call, MethodChannel.Result result) {
        if (call == null || call.arguments == null || mLBSTraceController == null || mLBSTraceController.getLBSTraceClient() == null) {
            result.success(false);
            return;
        }
        EntityListOption entityListOption =
                (EntityListOption)DataConvertUtil.mapToObject((Map<String, Object>) call.arguments,
                        EntityListOption.class);
        if (entityListOption == null) {
            result.success(false);
            return;
        }

        EntityListRequest entityListRequest = entityListOption.toEntityListRequest();

        mLBSTraceController.getLBSTraceClient().queryEntityList(entityListRequest,
                new PluginOnEntityListener());
        result.success(true);
    }

    private void boundSearchEntity(MethodCall call, MethodChannel.Result result) {
        if (call == null || call.arguments == null || mLBSTraceController == null || mLBSTraceController.getLBSTraceClient() == null) {
            result.success(false);
            return;
        }
        BoundSearchOption boundSearchOption =
                (BoundSearchOption)DataConvertUtil.mapToObject((Map<String, Object>) call.arguments,
                        BoundSearchOption.class);
        if (boundSearchOption == null) {
            result.success(false);
            return;
        }

        BoundSearchRequest boundSearchRequest = boundSearchOption.toBoundSearchRequest();

        mLBSTraceController.getLBSTraceClient().boundSearchEntity(boundSearchRequest,
                new PluginOnEntityListener());
        result.success(true);
    }

    private void aroundSearchEntity(MethodCall call, MethodChannel.Result result) {
        if (call == null || call.arguments == null || mLBSTraceController == null || mLBSTraceController.getLBSTraceClient() == null) {
            result.success(false);
            return;
        }
        AroundSearchOption aroundSearchOption =
                (AroundSearchOption)DataConvertUtil.mapToObject((Map<String, Object>) call.arguments,
                        AroundSearchOption.class);
        if (aroundSearchOption == null) {
            result.success(false);
            return;
        }

        AroundSearchRequest aroundSearchRequest = aroundSearchOption.toAroundSearchRequest();

        mLBSTraceController.getLBSTraceClient().aroundSearchEntity(aroundSearchRequest,
                new PluginOnEntityListener());
        result.success(true);
    }

    private void polygonSearchEntity(MethodCall call, MethodChannel.Result result) {
        if (call == null || call.arguments == null || mLBSTraceController == null || mLBSTraceController.getLBSTraceClient() == null) {
            result.success(false);
            return;
        }
        PolygonSearchOption polygonSearchOption =
                (PolygonSearchOption)DataConvertUtil.mapToObject((Map<String, Object>) call.arguments,
                        PolygonSearchOption.class);
        if (polygonSearchOption == null) {
            result.success(false);
            return;
        }

        PolygonSearchRequest polygonSearchRequest = polygonSearchOption.toPolygonSearchRequest();

        mLBSTraceController.getLBSTraceClient().polygonSearchEntity(polygonSearchRequest,
                new PluginOnEntityListener());
        result.success(true);
    }

    private void districtSearchEntity(MethodCall call, MethodChannel.Result result) {
        if (call == null || call.arguments == null || mLBSTraceController == null || mLBSTraceController.getLBSTraceClient() == null) {
            result.success(false);
            return;
        }
        DistrictSearchOption districtSearchOption =
                (DistrictSearchOption)DataConvertUtil.mapToObject((Map<String, Object>) call.arguments,
                        DistrictSearchOption.class);
        if (districtSearchOption == null) {
            result.success(false);
            return;
        }

        DistrictSearchRequest districtSearchRequest = districtSearchOption.toDistrictSearchRequest();

        mLBSTraceController.getLBSTraceClient().districtSearchEntity(districtSearchRequest,
                new PluginOnEntityListener());
        result.success(true);
    }

    private void searchEntity(MethodCall call, MethodChannel.Result result) {
        if (call == null || call.arguments == null || mLBSTraceController == null || mLBSTraceController.getLBSTraceClient() == null) {
            result.success(false);
            return;
        }
        KeyWordSearchOption keyWordSearchOption =
                (KeyWordSearchOption)DataConvertUtil.mapToObject((Map<String, Object>) call.arguments,
                        KeyWordSearchOption.class);
        if (keyWordSearchOption == null) {
            result.success(false);
            return;
        }

        SearchRequest searchRequest = keyWordSearchOption.toSearchRequest();

        mLBSTraceController.getLBSTraceClient().searchEntity(searchRequest,
                new PluginOnEntityListener());
        result.success(true);
    }

    private void queryRealTimeLocation(MethodCall call, MethodChannel.Result result) {
        if (call == null || call.arguments == null || mLBSTraceController == null
                || mLBSTraceController.getLBSTraceClient() == null) {
            result.success(false);
            return;
        }
        RealTimeLocationOption realTimeLocationOption =
                (RealTimeLocationOption) DataConvertUtil
                        .mapToObject((Map<String, Object>) call.arguments,
                                RealTimeLocationOption.class);
        if (realTimeLocationOption == null) {
            result.success(false);
            return;
        }

        LocRequest locRequest = realTimeLocationOption.toLocRequest();

        mLBSTraceController.getLBSTraceClient().queryRealTimeLoc(locRequest,
                new PluginOnEntityListener());
        result.success(true);
    }

    private class PluginOnEntityListener extends OnEntityListener {
        public PluginOnEntityListener() {
            super();
        }

        @Override
        public void onAddEntityCallback(AddEntityResponse addEntityResponse) {
            if (addEntityResponse == null || mLBSTraceController == null) {
                return;
            }

            BLog.e("addEntityResponse = " + addEntityResponse.toString());

            Map map = DataConvertUtil.objectToMap(new AddEntityResult(addEntityResponse.getTag(),
                    addEntityResponse.getStatus(), addEntityResponse.getMessage()));

            mLBSTraceController.getMethodChannel()
                    .invokeMethod(Constant.EntityMethodId.ADD_ENTITY_CALLBACK, map);
        }

        @Override
        public void onUpdateEntityCallback(UpdateEntityResponse updateEntityResponse) {
            if (updateEntityResponse == null || mLBSTraceController == null) {
                return;
            }

            BLog.e("updateEntityResponse = " + updateEntityResponse.toString());

            Map map = DataConvertUtil
                    .objectToMap(new UpdateEntityResult(updateEntityResponse.getTag(),
                            updateEntityResponse.getStatus(), updateEntityResponse.getMessage()));

            mLBSTraceController.getMethodChannel()
                    .invokeMethod(Constant.EntityMethodId.UPDATE_ENTITY_CALLBACK, map);
        }

        @Override
        public void onDeleteEntityCallback(DeleteEntityResponse deleteEntityResponse) {
            if (deleteEntityResponse == null || mLBSTraceController == null) {
                return;
            }

            BLog.e("deleteEntityResponse = " + deleteEntityResponse.toString());

            Map map = DataConvertUtil
                    .objectToMap(new DeleteEntityResult(deleteEntityResponse.getTag(),
                            deleteEntityResponse.getStatus(), deleteEntityResponse.getMessage()));

            mLBSTraceController.getMethodChannel()
                    .invokeMethod(Constant.EntityMethodId.DELETE_ENTITY_CALLBACK, map);
        }

        @Override
        public void onEntityListCallback(EntityListResponse entityListResponse) {
            if (entityListResponse == null || mLBSTraceController == null) {
                return;
            }

            BLog.e("entityListResponse = " + entityListResponse.toString());

            Map map = DataConvertUtil.objectToMap(new EntityListResult(entityListResponse.getTag(),
                    entityListResponse.getStatus(), entityListResponse.getMessage(),
                    entityListResponse.getTotal(), entityListResponse.getSize(),
                    entityListResponse.getEntities()));

            mLBSTraceController.getMethodChannel()
                    .invokeMethod(Constant.EntityMethodId.QUERY_ENTITY_CALLBACK, map);
        }

        @Override
        public void onSearchEntityCallback(SearchResponse searchResponse) {
            if (searchResponse == null || mLBSTraceController == null) {
                return;
            }

            BLog.e("searchResponse = " + searchResponse.toString());

            Map map = DataConvertUtil.objectToMap(new KeyWordSearchResult(searchResponse.getTag(),
                    searchResponse.getStatus(), searchResponse.getMessage(),
                    searchResponse.getTotal(), searchResponse.getSize(),
                    searchResponse.getEntities()));

            mLBSTraceController.getMethodChannel()
                    .invokeMethod(Constant.EntityMethodId.SEARCH_ENTITY_CALLBACK, map);
        }

        @Override
        public void onBoundSearchCallback(BoundSearchResponse boundSearchResponse) {
            if (boundSearchResponse == null || mLBSTraceController == null) {
                return;
            }

            BLog.e("boundSearchResponse = " + boundSearchResponse.toString());

            Map map =
                    DataConvertUtil.objectToMap(new BoundSearchResult(boundSearchResponse.getTag(),
                            boundSearchResponse.getStatus(), boundSearchResponse.getMessage()));

            mLBSTraceController.getMethodChannel()
                    .invokeMethod(Constant.EntityMethodId.BOUND_SEARCH_ENTITY_CALLBACK, map);
        }

        @Override
        public void onAroundSearchCallback(AroundSearchResponse aroundSearchResponse) {
            if (aroundSearchResponse == null || mLBSTraceController == null) {
                return;
            }

            BLog.e("aroundSearchResponse = " + aroundSearchResponse.toString());

            Map map = DataConvertUtil
                    .objectToMap(new AroundSearchResult(aroundSearchResponse.getTag(),
                            aroundSearchResponse.getStatus(), aroundSearchResponse.getMessage()));

            mLBSTraceController.getMethodChannel()
                    .invokeMethod(Constant.EntityMethodId.AROUND_SEARCH_ENTITY_CALLBACK, map);
        }

        @Override
        public void onPolygonSearchCallback(PolygonSearchResponse polygonSearchResponse) {
            if (polygonSearchResponse == null || mLBSTraceController == null) {
                return;
            }

            BLog.e("polygonSearchResponse = " + polygonSearchResponse.toString());

            Map map = DataConvertUtil
                    .objectToMap(new PolygonSearchResult(polygonSearchResponse.getTag(),
                            polygonSearchResponse.getStatus(), polygonSearchResponse.getMessage()));

            mLBSTraceController.getMethodChannel()
                    .invokeMethod(Constant.EntityMethodId.POLYGON_SEARCH_ENTITY_CALLBACK, map);
        }

        @Override
        public void onDistrictSearchCallback(DistrictSearchResponse districtSearchResponse) {
            if (districtSearchResponse == null || mLBSTraceController == null) {
                return;
            }

            BLog.e("districtSearchResponse = " + districtSearchResponse.toString());

            Map map = DataConvertUtil
                    .objectToMap(new DistrictSearchResult(districtSearchResponse.getTag(),
                            districtSearchResponse.getStatus(),
                            districtSearchResponse.getMessage()));

            mLBSTraceController.getMethodChannel()
                    .invokeMethod(Constant.EntityMethodId.DISTRICT_SEARCH_ENTITY_CALLBACK, map);
        }

        @Override
        public void onReceiveLocation(TraceLocation traceLocation) {
            if (traceLocation == null || mLBSTraceController == null) {
                return;
            }

            BLog.e("onReceiveLocation = " + traceLocation.toString());

            Map map = DataConvertUtil.objectToMap(new RealTimeLocationResult(traceLocation.getTag(),
                    traceLocation.getStatus(), traceLocation.getMessage(),
                    traceLocation.getFloor(), traceLocation.getIndoor(),
                    traceLocation.getBuilding(), traceLocation.getLatitude(),
                    traceLocation.getLongitude(), traceLocation.getCoordType().ordinal(),
                    traceLocation.getRadius(), traceLocation.getDirection(),
                    traceLocation.getSpeed(), traceLocation.getAltitude(),
                    traceLocation.getTime()));

            mLBSTraceController.getMethodChannel()
                    .invokeMethod(Constant.EntityMethodId.QUERY_REAL_TIME_LOC_CallBack, map);
        }
    }
}
