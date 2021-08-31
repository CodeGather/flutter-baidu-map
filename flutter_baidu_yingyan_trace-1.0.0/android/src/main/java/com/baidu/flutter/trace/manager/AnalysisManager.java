package com.baidu.flutter.trace.manager;

import java.util.Map;

import com.baidu.flutter.trace.Constant;
import com.baidu.flutter.trace.model.analysis.DrivingBehaviorOption;
import com.baidu.flutter.trace.model.analysis.DrivingBehaviorResult;
import com.baidu.flutter.trace.model.analysis.StayPointOption;
import com.baidu.flutter.trace.model.analysis.StayPointResult;
import com.baidu.flutter.trace.model.entity.BoundSearchOption;
import com.baidu.flutter.trace.model.entity.PolygonSearchResult;
import com.baidu.flutter.trace.utils.BLog;
import com.baidu.flutter.trace.utils.DataConvertUtil;
import com.baidu.trace.api.analysis.DrivingBehaviorRequest;
import com.baidu.trace.api.analysis.DrivingBehaviorResponse;
import com.baidu.trace.api.analysis.OnAnalysisListener;
import com.baidu.trace.api.analysis.StayPointRequest;
import com.baidu.trace.api.analysis.StayPointResponse;
import com.baidu.trace.api.entity.BoundSearchRequest;
import com.baidu.trace.api.entity.OnEntityListener;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

/**
 * Copyright (C) 2019 Baidu, Inc. All Rights Reserved.
 */
public class AnalysisManager extends BaseManager {

    AnalysisManager(LBSTraceController lbsTraceController) {
        super(lbsTraceController);
    }

    @Override
    public void handleMethodCall(MethodCall call, MethodChannel.Result result) {
        if (call == null || call.arguments == null || mLBSTraceController == null) {
            result.success(false);
            return;
        }

        switch (call.method) {
            case Constant.AnalysisMethodId.ANALYSIS_DRIVING_BEHAVIOUR:
                queryDrivingBehavior(call, result);
                break;
            case Constant.AnalysisMethodId.ANALYSIS_STAY_POINT:
                queryStayPoint(call, result);
                break;
            default:

                break;
        }
    }

    private void queryStayPoint(MethodCall call, MethodChannel.Result result) {
        if (call == null || call.arguments == null || mLBSTraceController == null || mLBSTraceController.getLBSTraceClient() == null) {
            result.success(false);
            return;
        }
        StayPointOption stayPointOption =
                (StayPointOption) DataConvertUtil.mapToObject((Map<String, Object>) call.arguments,
                        StayPointOption.class);
        if (stayPointOption == null) {
            result.success(false);
            return;
        }

        StayPointRequest stayPointRequest = stayPointOption.toStayPointRequest();

        mLBSTraceController.getLBSTraceClient().queryStayPoint(stayPointRequest,
                new PluginOnAnalysisListener());
        result.success(true);
    }

    private void queryDrivingBehavior(MethodCall call, MethodChannel.Result result) {
        if (call == null || call.arguments == null || mLBSTraceController == null || mLBSTraceController.getLBSTraceClient() == null) {
            result.success(false);
            return;
        }

        DrivingBehaviorOption drivingBehaviorOption =
                (DrivingBehaviorOption) DataConvertUtil.mapToObject((Map<String, Object>) call.arguments,
                        DrivingBehaviorOption.class);
        if (drivingBehaviorOption == null) {
            result.success(false);
            return;
        }

        DrivingBehaviorRequest drivingBehaviorRequest = drivingBehaviorOption.toDrivingBehaviorRequest();

        mLBSTraceController.getLBSTraceClient().queryDrivingBehavior(drivingBehaviorRequest,
                new PluginOnAnalysisListener());
        result.success(true);

    }

    private class PluginOnAnalysisListener implements OnAnalysisListener {
        public PluginOnAnalysisListener() {
            super();
        }

        @Override
        public void onStayPointCallback(StayPointResponse stayPointResponse) {
            if (stayPointResponse == null || mLBSTraceController == null) {
                return;
            }

            BLog.e("onStayPointCallback = " + stayPointResponse.toString());

            Map map = DataConvertUtil.objectToMap(new StayPointResult(stayPointResponse.getTag(),
                    stayPointResponse.getStatus(), stayPointResponse.getMessage(),
                    stayPointResponse.getStayPointNum(), stayPointResponse.getStayPoints()));

            mLBSTraceController.getMethodChannel().invokeMethod(Constant.AnalysisMethodId.ANALYSIS_STAY_POINT_CALLBACK, map);
        }

        @Override
        public void onDrivingBehaviorCallback(DrivingBehaviorResponse drivingBehaviorResponse) {
            if (drivingBehaviorResponse == null || mLBSTraceController == null) {
                return;
            }

            BLog.e("onDrivingBehaviorCallback = " + drivingBehaviorResponse.toString());

            Map map = DataConvertUtil.objectToMap(new DrivingBehaviorResult(drivingBehaviorResponse.getTag(),
                    drivingBehaviorResponse.getStatus(), drivingBehaviorResponse.getMessage(),
                    drivingBehaviorResponse.getDistance(), drivingBehaviorResponse.getDuration(),
                    drivingBehaviorResponse.getAverageSpeed(),
                    drivingBehaviorResponse.getMaxSpeed(),
                    drivingBehaviorResponse.getSpeedingNum(),
                    drivingBehaviorResponse.getHarshAccelerationNum(),
                    drivingBehaviorResponse.getHarshBreakingNum(),
                    drivingBehaviorResponse.getHarshSteeringNum(),
                    drivingBehaviorResponse.getStartPoint(),
                    drivingBehaviorResponse.getEndPoint(), drivingBehaviorResponse.getSpeedings(),
                    drivingBehaviorResponse.getHarshAccelerationPoints(),
                    drivingBehaviorResponse.getHarshBreakingPoints(), drivingBehaviorResponse.getHarshSteeringPoints()));

            mLBSTraceController.getMethodChannel().invokeMethod(Constant.AnalysisMethodId.ANALYSIS_DRIVING_BEHAVIOUR_CALLBACK, map);
        }
    }

}
