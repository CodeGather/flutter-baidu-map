package com.baidu.flutter.trace.manager;

import java.util.HashMap;
import java.util.Map;

import com.baidu.flutter.trace.Constant;
import com.baidu.flutter.trace.model.TraceOption;
import com.baidu.flutter.trace.model.entity.AddEntityOption;
import com.baidu.flutter.trace.model.entity.AddEntityResult;
import com.baidu.flutter.trace.model.track.AddPointOption;
import com.baidu.flutter.trace.model.track.AddPointResult;
import com.baidu.flutter.trace.model.track.AddPointsOption;
import com.baidu.flutter.trace.model.track.AddPointsResult;
import com.baidu.flutter.trace.model.track.ClearCacheTrackOption;
import com.baidu.flutter.trace.model.track.ClearCacheTrackResult;
import com.baidu.flutter.trace.model.track.DistanceOption;
import com.baidu.flutter.trace.model.track.DistanceResult;
import com.baidu.flutter.trace.model.track.HistoryTrackOption;
import com.baidu.flutter.trace.model.track.HistoryTrackResult;
import com.baidu.flutter.trace.model.track.LatestPointOption;
import com.baidu.flutter.trace.model.track.LatestPointResult;
import com.baidu.flutter.trace.model.track.QueryCacheTrackOption;
import com.baidu.flutter.trace.model.track.QueryCacheTrackResult;
import com.baidu.flutter.trace.utils.BLog;
import com.baidu.flutter.trace.utils.DataConvertUtil;
import com.baidu.trace.api.entity.AddEntityRequest;
import com.baidu.trace.api.track.AddPointRequest;
import com.baidu.trace.api.track.AddPointResponse;
import com.baidu.trace.api.track.AddPointsRequest;
import com.baidu.trace.api.track.AddPointsResponse;
import com.baidu.trace.api.track.ClearCacheTrackRequest;
import com.baidu.trace.api.track.ClearCacheTrackResponse;
import com.baidu.trace.api.track.DistanceRequest;
import com.baidu.trace.api.track.DistanceResponse;
import com.baidu.trace.api.track.HistoryTrackRequest;
import com.baidu.trace.api.track.HistoryTrackResponse;
import com.baidu.trace.api.track.LatestPointRequest;
import com.baidu.trace.api.track.LatestPointResponse;
import com.baidu.trace.api.track.OnTrackListener;
import com.baidu.trace.api.track.QueryCacheTrackRequest;
import com.baidu.trace.api.track.QueryCacheTrackResponse;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

/**
 * Copyright (C) 2019 Baidu, Inc. All Rights Reserved.
 */
public class TrackManager extends BaseManager {

    TrackManager(LBSTraceController lbsTraceController) {
        super(lbsTraceController);
    }

    @Override
    public void handleMethodCall(MethodCall call, MethodChannel.Result result) {
        if (call == null || mLBSTraceController == null) {
            result.success(false);
            return;
        }

        switch (call.method) {
            case Constant.TrackMethodId.ADD_CUSTOM_POINT:
                addPoint(call, result);
                break;
            case Constant.TrackMethodId.BATCH_ADD_CUSTOM_POINT:
                addPoints(call, result);
                break;

            case Constant.TrackMethodId.CLEAR_TRACK_CACHE:
                clearTrackCache(call, result);
                break;

            case Constant.TrackMethodId.QUERY_TRACK_DISTANCE:
                queryDistance(call, result);
                break;

            case Constant.TrackMethodId.QUERY_HISTORY_TRACK:
                queryHistoryTrack(call, result);
                break;

            case Constant.TrackMethodId.QUERY_TRACK_CACHE_INFO:
                queryTrackCacheInfo(call, result);
                break;

            case Constant.TrackMethodId.QUERY_TRACK_LATEST_POINT:
                queryLatestPoint(call, result);
                break;

            default:
                break;
        }
    }

    private void addPoint(MethodCall call, MethodChannel.Result result) {
        if (call == null || call.arguments == null || mLBSTraceController == null || mLBSTraceController.getLBSTraceClient() == null) {
            result.success(false);
            return;
        }

        AddPointOption addPointOption =
                (AddPointOption)DataConvertUtil.mapToObject((Map<String, Object>) call.arguments,
                        AddPointOption.class);
        if (addPointOption == null) {
            result.success(false);
            return;
        }

        AddPointRequest addPointRequest = addPointOption.toAddPointRequest();

        mLBSTraceController.getLBSTraceClient().addPoint(addPointRequest,
                new PluginOnTrackListener());
        result.success(true);
    }

    private void addPoints(MethodCall call, MethodChannel.Result result) {
        if (call == null || call.arguments == null || mLBSTraceController == null || mLBSTraceController.getLBSTraceClient() == null) {
            result.success(false);
            return;
        }

        AddPointsOption addPointsOption =
                (AddPointsOption)DataConvertUtil.mapToObject((Map<String, Object>) call.arguments,
                        AddPointsOption.class);
        if (addPointsOption == null) {
            result.success(false);
            return;
        }

        AddPointsRequest addPointsRequest = addPointsOption.toAddPointsRequest();

        mLBSTraceController.getLBSTraceClient().addPoints(addPointsRequest,
                new PluginOnTrackListener());
        result.success(true);
    }

    private void clearTrackCache(MethodCall call, MethodChannel.Result result) {
        if (call == null || call.arguments == null || mLBSTraceController == null || mLBSTraceController.getLBSTraceClient() == null) {
            result.success(false);
            return;
        }

        ClearCacheTrackOption clearCacheTrackOption =
                (ClearCacheTrackOption)DataConvertUtil.mapToObject((Map<String, Object>) call.arguments,
                        ClearCacheTrackOption.class);
        if (clearCacheTrackOption == null) {
            result.success(false);
            return;
        }

        ClearCacheTrackRequest clearCacheTrackRequest = clearCacheTrackOption.toClearCacheTrackRequest();

        mLBSTraceController.getLBSTraceClient().clearCacheTrack(clearCacheTrackRequest,
                new PluginOnTrackListener());
        result.success(true);
    }

    private void queryHistoryTrack(MethodCall call, MethodChannel.Result result) {
        if (call == null || call.arguments == null || mLBSTraceController == null || mLBSTraceController.getLBSTraceClient() == null) {
            result.success(false);
            return;
        }

        HistoryTrackOption historyTrackOption =
                (HistoryTrackOption)DataConvertUtil.mapToObject((Map<String, Object>) call.arguments,
                        HistoryTrackOption.class);
        if (historyTrackOption == null) {
            result.success(false);
            return;
        }

        HistoryTrackRequest historyTrackRequest = historyTrackOption.toHistoryTrackRequest();

        mLBSTraceController.getLBSTraceClient().queryHistoryTrack(historyTrackRequest,
                new PluginOnTrackListener());
        result.success(true);
    }

    private void queryDistance(MethodCall call, MethodChannel.Result result) {
        if (call == null || call.arguments == null || mLBSTraceController == null || mLBSTraceController.getLBSTraceClient() == null) {
            result.success(false);
            return;
        }

        DistanceOption distanceOption =
                (DistanceOption)DataConvertUtil.mapToObject((Map<String, Object>) call.arguments,
                        DistanceOption.class);
        if (distanceOption == null) {
            result.success(false);
            return;
        }

        DistanceRequest distanceRequest = distanceOption.toDistanceRequest();

        mLBSTraceController.getLBSTraceClient().queryDistance(distanceRequest,
                new PluginOnTrackListener());
        result.success(true);
    }

    private void queryLatestPoint(MethodCall call, MethodChannel.Result result) {
        if (call == null || call.arguments == null || mLBSTraceController == null || mLBSTraceController.getLBSTraceClient() == null) {
            result.success(false);
            return;
        }

        LatestPointOption latestPointOption =
                (LatestPointOption)DataConvertUtil.mapToObject((Map<String, Object>) call.arguments,
                        LatestPointOption.class);
        if (latestPointOption == null) {
            result.success(false);
            return;
        }

        LatestPointRequest latestPointRequest = latestPointOption.toLatestPointRequest();

        mLBSTraceController.getLBSTraceClient().queryLatestPoint(latestPointRequest,
                new PluginOnTrackListener());
        result.success(true);
    }

    private void queryTrackCacheInfo(MethodCall call, MethodChannel.Result result) {
        if (call == null || call.arguments == null || mLBSTraceController == null || mLBSTraceController.getLBSTraceClient() == null) {
            result.success(false);
            return;
        }

        QueryCacheTrackOption queryCacheTrackOption =
                (QueryCacheTrackOption)DataConvertUtil.mapToObject((Map<String, Object>) call.arguments,
                        QueryCacheTrackOption.class);
        if (queryCacheTrackOption == null) {
            result.success(false);
            return;
        }

        QueryCacheTrackRequest queryCacheTrackRequest = queryCacheTrackOption.toQueryCacheTrackRequest();

        mLBSTraceController.getLBSTraceClient().queryCacheTrack(queryCacheTrackRequest,
                new PluginOnTrackListener());
        result.success(true);
    }

    private class PluginOnTrackListener extends OnTrackListener {
        PluginOnTrackListener() {
            super();
        }

        @Override
        public void onAddPointCallback(AddPointResponse addPointResponse) {
            if (addPointResponse == null || mLBSTraceController == null) {
                return;
            }

            BLog.e("addPointResponse = " + addPointResponse.toString());

            Map map = DataConvertUtil.objectToMap(new AddPointResult(addPointResponse.getTag(),
                    addPointResponse.getStatus(), addPointResponse.getMessage()));

            mLBSTraceController.getMethodChannel().invokeMethod(Constant.TrackMethodId.ADD_CUSTOM_POINT_CALLBACK,
                    map);
        }

        @Override
        public void onAddPointsCallback(AddPointsResponse addPointsResponse) {
            if (addPointsResponse == null || mLBSTraceController == null) {
                return;
            }

            BLog.e("addPointsResponse = " + addPointsResponse.toString());

            Map map = DataConvertUtil.objectToMap(new AddPointsResult(addPointsResponse.getTag(),
                    addPointsResponse.getStatus(), addPointsResponse.getMessage(),
                    addPointsResponse.getSuccessNum(), addPointsResponse.getFailInfo()));

            mLBSTraceController.getMethodChannel().invokeMethod(Constant.TrackMethodId.BATCH_ADD_CUSTOM_POINT_CALLBACK,
                    map);
        }

        @Override
        public void onHistoryTrackCallback(HistoryTrackResponse historyTrackResponse) {
            if (historyTrackResponse == null || mLBSTraceController == null) {
                return;
            }

            BLog.e("historyTrackResponse = " + historyTrackResponse.toString());

            Map map =
                    DataConvertUtil.objectToMap(new HistoryTrackResult(historyTrackResponse.getTag(),
                    historyTrackResponse.getStatus(), historyTrackResponse.getMessage(),
                            historyTrackResponse.getTotal(), historyTrackResponse.getSize(),
                            historyTrackResponse.getEntityName(),
                            historyTrackResponse.getDistance(),
                            historyTrackResponse.getTollDistance(),
                            historyTrackResponse.getStartPoint(),
                            historyTrackResponse.getEndPoint(), historyTrackResponse.getTrackPoints()));

            mLBSTraceController.getMethodChannel().invokeMethod(Constant.TrackMethodId.QUERY_HISTORY_TRACK_CALLBACK,
                    map);
        }

        @Override
        public void onDistanceCallback(DistanceResponse distanceResponse) {
            if (distanceResponse == null || mLBSTraceController == null) {
                return;
            }

            BLog.e("distanceResponse = " + distanceResponse.toString());

            Map map = DataConvertUtil.objectToMap(new DistanceResult(distanceResponse.getTag(),
                    distanceResponse.getStatus(), distanceResponse.getMessage(),
                    distanceResponse.getEntityName(), distanceResponse.getDistance(),
                    distanceResponse.getLowSpeedDistance()));

            mLBSTraceController.getMethodChannel().invokeMethod(Constant.TrackMethodId.QUERY_TRACK_DISTANCE_CALLBACK,
                    map);
        }

        @Override
        public void onLatestPointCallback(LatestPointResponse latestPointResponse) {
            if (latestPointResponse == null || mLBSTraceController == null) {
                return;
            }

            BLog.e("latestPointResponse = " + latestPointResponse.toString());

            Map map = DataConvertUtil.objectToMap(new LatestPointResult(latestPointResponse.getTag(),
                    latestPointResponse.getStatus(), latestPointResponse.getMessage(),
                    latestPointResponse.getEntityName(), latestPointResponse.getLatestPoint(),
                    latestPointResponse.getLimitSpeed()));

            mLBSTraceController.getMethodChannel().invokeMethod(Constant.TrackMethodId.QUERY_TRACK_LATEST_POINT_CALLBACK,
                    map);
        }

        @Override
        public void onQueryCacheTrackCallback(QueryCacheTrackResponse queryCacheTrackResponse) {
            if (queryCacheTrackResponse == null || mLBSTraceController == null) {
                return;
            }

            BLog.e("queryCacheTrackResponse = " + queryCacheTrackResponse.toString());

            Map map = DataConvertUtil.objectToMap(new QueryCacheTrackResult(queryCacheTrackResponse.getTag(),
                    queryCacheTrackResponse.getStatus(), queryCacheTrackResponse.getMessage(),
                    queryCacheTrackResponse.getResult()));

            mLBSTraceController.getMethodChannel().invokeMethod(Constant.TrackMethodId.QUERY_TRACK_CACHE_INFO_CALLBACK,
                    map);
        }

        @Override
        public void onClearCacheTrackCallback(ClearCacheTrackResponse clearCacheTrackResponse) {
            if (clearCacheTrackResponse == null || mLBSTraceController == null) {
                return;
            }

            BLog.e("clearCacheTrackResponse = " + clearCacheTrackResponse.toString());

            Map map = DataConvertUtil.objectToMap(new ClearCacheTrackResult(clearCacheTrackResponse.getTag(),
                    clearCacheTrackResponse.getStatus(), clearCacheTrackResponse.getMessage()));

            mLBSTraceController.getMethodChannel().invokeMethod(Constant.TrackMethodId.CLEAR_TRACK_CACHE_CALLBACK,
                    map);
        }
    }


}
