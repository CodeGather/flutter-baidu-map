package com.baidu.flutter.trace.manager;

import java.util.Map;

import com.baidu.flutter.trace.Constant;
import com.baidu.flutter.trace.utils.DataConvertUtil;
import com.baidu.trace.LBSTraceClient;
import com.baidu.trace.model.LocationMode;

import android.content.Context;
import android.os.Handler;
import android.util.Log;
import androidx.annotation.NonNull;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

/**
 * Copyright (C) 2019 Baidu, Inc. All Rights Reserved.
 */
public class LBSTraceController implements MethodChannel.MethodCallHandler {

    private final MethodChannel mMethodChannel;

    private EntityManager mEntityManager;
    private FenceManager mFenceManager;
    private AnalysisManager mAnalysisManager;
    private TraceManager mTraceManager;
    private TrackManager mTrackManager;

    private LBSTraceClient mLBSTraceClient;

    private Context mContext;

    public LBSTraceController(FlutterPlugin.FlutterPluginBinding flutterPluginBinding) {
        mMethodChannel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "flutter_baidu_yingyan_trace");
        mMethodChannel.setMethodCallHandler(this);
        mLBSTraceClient = new LBSTraceClient(flutterPluginBinding.getApplicationContext());
        mContext = flutterPluginBinding.getApplicationContext();
    }

    public void release() {
        mMethodChannel.setMethodCallHandler(null);
        mLBSTraceClient.clear();
    }

    public LBSTraceClient getLBSTraceClient() {
        return mLBSTraceClient;
    }

    public MethodChannel getMethodChannel() {
        return mMethodChannel;
    }

    private EntityManager getEntityManager() {
        if (mEntityManager == null) {
            mEntityManager = new EntityManager(LBSTraceController.this);
        }
        return mEntityManager;
    }

    private FenceManager getFenceManager() {
        if (mFenceManager == null) {
            mFenceManager = new FenceManager(this);
        }
        return mFenceManager;
    }

    private AnalysisManager getAnalysisManager() {
        if (mAnalysisManager == null) {
            mAnalysisManager = new AnalysisManager(this);
        }
        return mAnalysisManager;
    }

    private TraceManager getTraceManager() {
        if (mTraceManager == null) {
            mTraceManager = new TraceManager(this, mContext);
        }
        return mTraceManager;
    }

    private TrackManager getTrackManager() {
        if (mTrackManager == null) {
            mTrackManager = new TrackManager(this);
        }
        return mTrackManager;
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        if (call.method.startsWith(Constant.MethodIdPrefix.TRACE_METHOD_ID_PREFIX)) {
            getTraceManager().handleMethodCall(call, result);
        } else if (call.method.startsWith(Constant.MethodIdPrefix.TRACK_METHOD_ID_PREFIX)) {
            getTrackManager().handleMethodCall(call, result);
        } else if (call.method.startsWith(Constant.MethodIdPrefix.ENTITY_METHOD_ID_PREFIX)) {
            getEntityManager().handleMethodCall(call, result);
        } else if (call.method.startsWith(Constant.MethodIdPrefix.FENCE_METHOD_ID_PREFIX)) {
            getFenceManager().handleMethodCall(call, result);
        } else if (call.method.startsWith(Constant.MethodIdPrefix.ANALYSIS_METHOD_ID_PREFIX)) {
            getAnalysisManager().handleMethodCall(call, result);
        } else if (call.method.equals(Constant.CommonMethodId.RELEASE)) {
            if (mLBSTraceClient != null) {
                mLBSTraceClient.clear();
            }
        } else if (call.method.equals(Constant.CommonMethodId.SET_LOCATION_MODE)) {
            if (call == null || call.arguments == null || mLBSTraceClient == null) {
                result.success(false);
                return;
            }
            int locMode = 0;
            Map<?, ?> map = DataConvertUtil.toMap(call.arguments);
            if (map.containsKey("locationMode")) {
                locMode = DataConvertUtil.toInt(map.get("locationMode"));
            }
            mLBSTraceClient.setLocationMode(LocationMode.values()[locMode]);
            result.success(true);
        } else if (call.method.equals(Constant.CommonMethodId.STOP_REAL_TIME_LOC)) {
            if (mLBSTraceClient != null) {
                mLBSTraceClient.stopRealTimeLoc();
            }
        } else  {
            result.notImplemented();
        }
    }
}
