package com.baidu.flutter.trace;

/**
 * Copyright (C) 2019 Baidu, Inc. All Rights Reserved.
 */
public class Constant {

    /**
     * 默认采集周期（单位：秒）
     */
    public static final int GATHER_INTERVAL = 5;

    /**
     * 默认打包数据传输周期（单位：秒）
     */
    public static final int PACKED_DATA_INTERVAL = 30;

    public static class MethodIdPrefix {
        public static final String TRACE_METHOD_ID_PREFIX = "flutter_baidu_yingyan_trace/trace/";
        public static final String TRACK_METHOD_ID_PREFIX = "flutter_baidu_yingyan_trace/track/";
        public static final String FENCE_METHOD_ID_PREFIX = "flutter_baidu_yingyan_trace/fence/";
        public static final String ENTITY_METHOD_ID_PREFIX = "flutter_baidu_yingyan_trace/entity/";
        public static final String ANALYSIS_METHOD_ID_PREFIX =
                "flutter_baidu_yingyan_trace/analysis/";
        public static final String LBS_TRACE_CLIENT =
                "flutter_baidu_yingyan_trace/client/";
        public static final String LBS_TRACE_LOCATION =
                "flutter_baidu_yingyan_trace/location/";
    }

    public static class CommonMethodId {
        public static final String RELEASE =
                MethodIdPrefix.LBS_TRACE_CLIENT + "release";
        public static final String SET_LOCATION_MODE =
                MethodIdPrefix.LBS_TRACE_LOCATION + "setLocationMode";

        public static final String STOP_REAL_TIME_LOC =
                MethodIdPrefix.LBS_TRACE_LOCATION + "stopRealTimeLoc";
    }

    public static class TraceMethodId {
        public static final String ON_PUSH_CALLBACK =
                MethodIdPrefix.TRACE_METHOD_ID_PREFIX + "onPushCallBack";
        public static final String BIND_TRACE_SERVICE_CALLBACK =
                MethodIdPrefix.TRACE_METHOD_ID_PREFIX + "onBindTraceServiceCallBack";
        public static final String START_TRACE_SERVICE =
                MethodIdPrefix.TRACE_METHOD_ID_PREFIX + "startTraceService";
        public static final String START_TRACE_SERVICE_CALLBACK =
                MethodIdPrefix.TRACE_METHOD_ID_PREFIX + "startTraceServiceCallBack";
        public static final String STOP_TRACE_SERVICE =
                MethodIdPrefix.TRACE_METHOD_ID_PREFIX + "stopTraceService";
        public static final String STOP_TRACE_SERVICE_CALLBACK =
                MethodIdPrefix.TRACE_METHOD_ID_PREFIX + "stopTraceServiceCallBack";
        public static final String START_GATHER =
                MethodIdPrefix.TRACE_METHOD_ID_PREFIX + "startGather";
        public static final String START_GATHER_CALLBACK =
                MethodIdPrefix.TRACE_METHOD_ID_PREFIX + "startGatherCallBack";
        public static final String STOP_GATHER =
                MethodIdPrefix.TRACE_METHOD_ID_PREFIX + "stopGather";
        public static final String STOP_GATHER_CALLBACK =
                MethodIdPrefix.TRACE_METHOD_ID_PREFIX + "stopGatherCallBack";
        public static final String SET_INTERVAL =
                MethodIdPrefix.TRACE_METHOD_ID_PREFIX + "setInterval";
        public static final String SET_INTERVAL_CALLBACK =
                MethodIdPrefix.TRACE_METHOD_ID_PREFIX + "setIntervalCallBack";
        public static final String SET_CACHE_SIZE =
                MethodIdPrefix.TRACE_METHOD_ID_PREFIX + "setCacheSize";
        public static final String SET_CACHE_SIZE_CALLBACK =
                MethodIdPrefix.TRACE_METHOD_ID_PREFIX + "setCacheSizeCallBack";
    }

    public static class EntityMethodId {
        public static final String ADD_ENTITY =
                MethodIdPrefix.ENTITY_METHOD_ID_PREFIX + "addEntity";
        public static final String ADD_ENTITY_CALLBACK =
                MethodIdPrefix.ENTITY_METHOD_ID_PREFIX + "addEntityCallBack";
        public static final String UPDATE_ENTITY =
                MethodIdPrefix.ENTITY_METHOD_ID_PREFIX + "updateEntity";
        public static final String UPDATE_ENTITY_CALLBACK =
                MethodIdPrefix.ENTITY_METHOD_ID_PREFIX + "updateEntityCallBack";
        public static final String DELETE_ENTITY =
                MethodIdPrefix.ENTITY_METHOD_ID_PREFIX + "deleteEntity";
        public static final String DELETE_ENTITY_CALLBACK =
                MethodIdPrefix.ENTITY_METHOD_ID_PREFIX + "deleteEntityCallBack";
        public static final String QUERY_ENTITY =
                MethodIdPrefix.ENTITY_METHOD_ID_PREFIX + "queryEntity";
        public static final String QUERY_ENTITY_CALLBACK =
                MethodIdPrefix.ENTITY_METHOD_ID_PREFIX + "queryEntityCallBack";
        public static final String SEARCH_ENTITY =
                MethodIdPrefix.ENTITY_METHOD_ID_PREFIX + "searchEntity";
        public static final String SEARCH_ENTITY_CALLBACK =
                MethodIdPrefix.ENTITY_METHOD_ID_PREFIX + "searchEntityCallBack";
        public static final String BOUND_SEARCH_ENTITY =
                MethodIdPrefix.ENTITY_METHOD_ID_PREFIX + "boundSearchEntity";
        public static final String BOUND_SEARCH_ENTITY_CALLBACK =
                MethodIdPrefix.ENTITY_METHOD_ID_PREFIX + "boundSearchEntityCallBack";
        public static final String AROUND_SEARCH_ENTITY =
                MethodIdPrefix.ENTITY_METHOD_ID_PREFIX + "aroundSearchEntity";
        public static final String AROUND_SEARCH_ENTITY_CALLBACK =
                MethodIdPrefix.ENTITY_METHOD_ID_PREFIX + "aroundSearchEntityCallBack";
        public static final String POLYGON_SEARCH_ENTITY =
                MethodIdPrefix.ENTITY_METHOD_ID_PREFIX + "polygonSearchEntity";
        public static final String POLYGON_SEARCH_ENTITY_CALLBACK =
                MethodIdPrefix.ENTITY_METHOD_ID_PREFIX + "polygonSearchEntityCallBack";
        public static final String DISTRICT_SEARCH_ENTITY =
                MethodIdPrefix.ENTITY_METHOD_ID_PREFIX + "districtSearchEntity";
        public static final String DISTRICT_SEARCH_ENTITY_CALLBACK =
                MethodIdPrefix.ENTITY_METHOD_ID_PREFIX + "districtSearchEntityCallBack";
        public static final String QUERY_REAL_TIME_LOC =
                MethodIdPrefix.ENTITY_METHOD_ID_PREFIX + "queryRealTimeLoc";
        public static final String QUERY_REAL_TIME_LOC_CallBack =
                MethodIdPrefix.ENTITY_METHOD_ID_PREFIX + "queryRealTimeLocCallBack";
    }

    public static class FenceMethodId {
        public static final String CREATE_FENCE =
                MethodIdPrefix.FENCE_METHOD_ID_PREFIX + "createFence";
        public static final String CREATE_FENCE_CALLBACK =
                MethodIdPrefix.FENCE_METHOD_ID_PREFIX + "createFenceCallBack";
        public static final String UPDATE_FENCE =
                MethodIdPrefix.FENCE_METHOD_ID_PREFIX + "updateFence";
        public static final String UPDATE_FENCE_CALLBACK =
                MethodIdPrefix.FENCE_METHOD_ID_PREFIX + "updateFenceCallBack";
        public static final String DELETE_FENCE =
                MethodIdPrefix.FENCE_METHOD_ID_PREFIX + "deleteFence";
        public static final String DELETE_FENCE_CALLBACK =
                MethodIdPrefix.FENCE_METHOD_ID_PREFIX + "deleteFenceCallBack";
        public static final String QUERY_FENCE_LIST =
                MethodIdPrefix.FENCE_METHOD_ID_PREFIX + "queryFenceList";
        public static final String QUERY_FENCE_LIST_CALLBACK =
                MethodIdPrefix.FENCE_METHOD_ID_PREFIX + "queryFenceListCallBack";
        public static final String QUERY_MONITORED_STATUS =
                MethodIdPrefix.FENCE_METHOD_ID_PREFIX + "queryMonitoredStatus";
        public static final String QUERY_MONITORED_STATUS_CALLBACK =
                MethodIdPrefix.FENCE_METHOD_ID_PREFIX + "queryMonitoredStatusCallBack";
        public static final String QUERY_MONITORED_STATUS_BY_LOCATION =
                MethodIdPrefix.FENCE_METHOD_ID_PREFIX + "queryMonitoredStatusByLocation";
        public static final String QUERY_MONITORED_STATUS_BY_LOCATION_CALLBACK =
                MethodIdPrefix.FENCE_METHOD_ID_PREFIX + "queryMonitoredStatusByLocationCallBack";
        public static final String QUERY_HISTORY_ALARM =
                MethodIdPrefix.FENCE_METHOD_ID_PREFIX + "queryHistoryAlarm";
        public static final String QUERY_HISTORY_ALARM_CALLBACK =
                MethodIdPrefix.FENCE_METHOD_ID_PREFIX + "queryHistoryAlarmCallBack";

        public static final String ADD_MONITORED_PERSON =
                MethodIdPrefix.FENCE_METHOD_ID_PREFIX + "addMonitoredPerson";
        public static final String ADD_MONITORED_PERSON_CALLBACK =
                MethodIdPrefix.FENCE_METHOD_ID_PREFIX + "addMonitoredPersonCallBack";
        public static final String DELETE_MONITORED_PERSON =
                MethodIdPrefix.FENCE_METHOD_ID_PREFIX + "deleteMonitoredPerson";
        public static final String DELETE_MONITORED_PERSON_CALLBACK =
                MethodIdPrefix.FENCE_METHOD_ID_PREFIX + "deleteMonitoredPersonCallBack";
        public static final String QUERY_LIST_MONITORED_PERSON =
                MethodIdPrefix.FENCE_METHOD_ID_PREFIX + "queryListMonitoredPerson";
        public static final String QUERY_LIST_MONITORED_PERSON_CALLBACK =
                MethodIdPrefix.FENCE_METHOD_ID_PREFIX + "queryListMonitoredPersonCallBack";
    }

    public static class AnalysisMethodId {
        public static final String ANALYSIS_STAY_POINT =
                MethodIdPrefix.ANALYSIS_METHOD_ID_PREFIX + "analyzeStayPoint";
        public static final String ANALYSIS_STAY_POINT_CALLBACK =
                MethodIdPrefix.ANALYSIS_METHOD_ID_PREFIX + "analyzeStayPointCallBack";
        public static final String ANALYSIS_DRIVING_BEHAVIOUR =
                MethodIdPrefix.ANALYSIS_METHOD_ID_PREFIX + "analyzeDrivingBehaviour";
        public static final String ANALYSIS_DRIVING_BEHAVIOUR_CALLBACK =
                MethodIdPrefix.ANALYSIS_METHOD_ID_PREFIX + "analyzeDrivingBehaviourCallBack";
    }

    public static class TrackMethodId {
        public static final String ADD_CUSTOM_POINT =
                MethodIdPrefix.TRACK_METHOD_ID_PREFIX + "addCustomPoint";
        public static final String ADD_CUSTOM_POINT_CALLBACK =
                MethodIdPrefix.TRACK_METHOD_ID_PREFIX + "addCustomPointCallBack";
        public static final String BATCH_ADD_CUSTOM_POINT =
                MethodIdPrefix.TRACK_METHOD_ID_PREFIX + "batchAddCustomPoint";
        public static final String BATCH_ADD_CUSTOM_POINT_CALLBACK =
                MethodIdPrefix.TRACK_METHOD_ID_PREFIX + "batchAddCustomPointCallBack";
        public static final String QUERY_TRACK_DISTANCE =
                MethodIdPrefix.TRACK_METHOD_ID_PREFIX + "queryTrackDistance";
        public static final String QUERY_TRACK_DISTANCE_CALLBACK =
                MethodIdPrefix.TRACK_METHOD_ID_PREFIX + "queryTrackDistanceCallBack";
        public static final String QUERY_HISTORY_TRACK =
                MethodIdPrefix.TRACK_METHOD_ID_PREFIX + "queryHistoryTrack";
        public static final String QUERY_HISTORY_TRACK_CALLBACK =
                MethodIdPrefix.TRACK_METHOD_ID_PREFIX + "queryHistoryTrackCallBack";
        public static final String QUERY_TRACK_CACHE_INFO =
                MethodIdPrefix.TRACK_METHOD_ID_PREFIX + "queryTrackCacheInfo";
        public static final String QUERY_TRACK_CACHE_INFO_CALLBACK =
                MethodIdPrefix.TRACK_METHOD_ID_PREFIX + "queryTrackCacheInfoCallBack";
        public static final String CLEAR_TRACK_CACHE =
                MethodIdPrefix.TRACK_METHOD_ID_PREFIX + "clearTrackCache";
        public static final String CLEAR_TRACK_CACHE_CALLBACK =
                MethodIdPrefix.TRACK_METHOD_ID_PREFIX + "clearTrackCacheCallBack";
        public static final String QUERY_TRACK_LATEST_POINT =
                MethodIdPrefix.TRACK_METHOD_ID_PREFIX + "queryTrackLatestPoint";
        public static final String QUERY_TRACK_LATEST_POINT_CALLBACK =
                MethodIdPrefix.TRACK_METHOD_ID_PREFIX + "queryTrackLatestPointCallBack";
    }

}
