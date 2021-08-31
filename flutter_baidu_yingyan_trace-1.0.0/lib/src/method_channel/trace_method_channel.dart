import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_baidu_yingyan_trace/flutter_baidu_yingyan_trace.dart';
import 'package:flutter_baidu_yingyan_trace/src/callback/analysis_callback.dart';
import 'package:flutter_baidu_yingyan_trace/src/callback/trace_callback.dart';
import 'package:flutter_baidu_yingyan_trace/src/callback/track_callback.dart';
import 'package:flutter_baidu_yingyan_trace/src/event/event.dart';
import 'package:flutter_baidu_yingyan_trace/src/interface/analysis_interface.dart';
import 'package:flutter_baidu_yingyan_trace/src/interface/entity_interface.dart';
import 'package:flutter_baidu_yingyan_trace/src/interface/fence_interface.dart';
import 'package:flutter_baidu_yingyan_trace/src/interface/location_interface.dart';
import 'package:flutter_baidu_yingyan_trace/src/interface/trace_interface.dart';
import 'package:flutter_baidu_yingyan_trace/src/interface/track_interface.dart';
import 'package:flutter_baidu_yingyan_trace/src/method_channel/yingyan_methods.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/analysis/driving_behavior_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/analysis/stay_point_analysis_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/add_entity_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/around_search_entity_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/around_search_entity_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/bound_search_entity_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/bound_search_entity_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/delete_entity_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/delete_entity_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/district_search_entity_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/district_search_entity_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/keyword_search_entity_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/keyword_search_entity_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/polygon_search_entity_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/real_time_loc_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/real_time_loc_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/search_entity_list_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/search_entity_list_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/add_monitored_person_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/add_monitored_person_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/create_fence_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/create_fence_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/delete_fence_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/delete_fence_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/delete_monitored_person_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/delete_monitored_person_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/query_fence_list_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/query_fence_list_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/query_history_alarm_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/query_history_alarm_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/query_list_monitored_person_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/query_list_monitored_person_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/query_monitored_status_by_location_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/query_monitored_status_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/query_monitored_status_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/update_fence_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/update_fence_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/location/location_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/location_mode.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/push_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/trace/gather_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/trace/service_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/trace/trace.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/trace/trace_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/add_custom_track_point_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/add_custom_track_points_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/clear_track_cache_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/query_history_track_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/query_track_cacheInfo_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/query_track_distance_option.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/track/query_track_latest_point_option.dart';

class BaiduYingYanMethodChannel
    implements
        TraceInterface,
        AnalysisInterface,
        TrackInterface,
        EntityInterface,
        LocationInterface,
        FenceInterface {
  static const MethodChannel _channel = const MethodChannel('flutter_baidu_yingyan_trace');

  static final BaiduYingYanMethodChannel instance = BaiduYingYanMethodChannel._internal();

  factory BaiduYingYanMethodChannel() => instance;

  BaiduYingYanMethodChannel._internal() {
    _channel.setMethodCallHandler((call) => _handleMethodCall(call));
  }

  StreamController<BaseEvent> _streamController =
      StreamController<BaseEvent>.broadcast();

  Stream<BaseEvent> _events() => _streamController.stream;

  StreamController<BaseEvent> get streamController => _streamController;

  set streamController(StreamController<BaseEvent> value) {
    _streamController = value;
  }

  Map<String, bool> streamSubscriptions = <String, bool>{};

  void onBindServiceCallback(TraceCallback traceCallback) {
    if (streamSubscriptions.containsKey("onBindServiceCallback") &&
        streamSubscriptions["onBindServiceCallback"]!) {
      return;
    }
    _events().where((event) => event is BindTraceServiceEvent).listen((event) {
      traceCallback.onBindServiceCallback!(event.value);
    });
    streamSubscriptions["onBindServiceCallback"] = true;
  }

  void onPushCallBack(TraceCallback traceCallback) {
    if (streamSubscriptions.containsKey("onPushCallBack") &&
        streamSubscriptions["onPushCallBack"]!) {
      return;
    }
    _events().where((event) => event is PushEvent).listen((event) {
      traceCallback.onPushCallBack!(event.value);
    });
    streamSubscriptions["onPushCallBack"] = true;
  }

  void onStartTraceServiceCallBack(TraceCallback traceCallback) {
    if (streamSubscriptions.containsKey("onStartTraceServiceCallBack") &&
        streamSubscriptions["onStartTraceServiceCallBack"]!) {
      return;
    }
    _events().where((event) => event is StartTraceServiceEvent).listen((event) {
      traceCallback.onStartTraceServiceCallBack!(event.value);
    });
    streamSubscriptions["onStartTraceServiceCallBack"] = true;
  }

  void onStopTraceServiceCallBack(TraceCallback traceCallback) {
    if (streamSubscriptions.containsKey("onStopTraceServiceCallBack") &&
        streamSubscriptions["onStopTraceServiceCallBack"]!) {
      return;
    }
    _events().where((event) => event is StopTraceServiceEvent).listen((event) {
      traceCallback.onStopTraceServiceCallBack!(event.value);
    });
    streamSubscriptions["onStopTraceServiceCallBack"] = true;
  }

  void onStartGatherCallBack(TraceCallback traceCallback) {
    if (streamSubscriptions.containsKey("onStartGatherCallBack") &&
        streamSubscriptions["onStartGatherCallBack"]!) {
      return;
    }
    _events().where((event) => event is StartGatherEvent).listen((event) {
      traceCallback.onStartGatherCallBack!(event.value);
    });
    streamSubscriptions["onStartGatherCallBack"] = true;
  }

  void onStopGatherCallBack(TraceCallback traceCallback) {
    if (streamSubscriptions.containsKey("onStopGatherCallBack") &&
        streamSubscriptions["onStopGatherCallBack"]!) {
      return;
    }
    _events().where((event) => event is StopGatherEvent).listen((event) {
      if (event is StopGatherEvent) {
        traceCallback.onStopGatherCallBack!(event.value);
      }
    });
    streamSubscriptions["onStopGatherCallBack"] = true;
  }

  void onSetCacheSizeCallBack(TraceCallback traceCallback) {
    if (streamSubscriptions.containsKey("onSetCacheSizeCallBack") &&
        streamSubscriptions["onSetCacheSizeCallBack"]!) {
      return;
    }
    _events().where((event) => event is SetCacheSizeEvent).listen((event) {
      if (event is SetCacheSizeEvent) {
        traceCallback.onSetCacheSizeCallBack!(event.value);
      }
    });
    streamSubscriptions["onSetCacheSizeCallBack"] = true;
  }

  void onSetIntervalCallBack(TraceCallback traceCallback) {
    if (streamSubscriptions.containsKey("onSetIntervalCallBack") &&
        streamSubscriptions["onSetIntervalCallBack"]!) {
      return;
    }
    _events().where((event) => event is SetIntervalEvent).listen((event) {
      if (event is SetIntervalEvent) {
        traceCallback.onSetIntervalCallBack!(event.value);
      }
    });
    streamSubscriptions["onSetIntervalCallBack"] = true;
  }

  void onAddEntityCallBack(EntityCallBack ?entityCallBack) {
    if (streamSubscriptions.containsKey("onAddEntityCallBack") &&
        streamSubscriptions["onAddEntityCallBack"]!) {
      return;
    }
    _events().where((event) => event is AddEntityEvent).listen((event) {
      entityCallBack!.onAddEntityCallBack!(event.value);
    });
    streamSubscriptions["onAddEntityCallBack"] = true;
  }

  void onUpdateEntityCallBack(EntityCallBack entityCallBack) {
    if (streamSubscriptions.containsKey("onUpdateEntityCallBack") &&
        streamSubscriptions["onUpdateEntityCallBack"]!) {
      return;
    }
    _events().where((event) => event is UpdateEntityEvent).listen((event) {
      entityCallBack.onUpdateEntityCallBack!(event.value);
    });
    streamSubscriptions["onUpdateEntityCallBack"] = true;
  }

  void onDeleteEntityCallBack(EntityCallBack entityCallBack) {
    if (streamSubscriptions.containsKey("onDeleteEntityCallBack") &&
        streamSubscriptions["onDeleteEntityCallBack"]!) {
      return;
    }
    _events().where((event) => event is DeleteEntityEvent).listen((event) {
      entityCallBack.onDeleteEntityCallBack!(event.value);
    });
    streamSubscriptions["onDeleteEntityCallBack"] = true;
  }

  void onKeyWordSearchEntityCallBack(EntityCallBack entityCallBack) {
    if (streamSubscriptions.containsKey("onKeyWordSearchEntityCallBack") &&
        streamSubscriptions["onKeyWordSearchEntityCallBack"]!) {
      return;
    }
    _events()
        .where((event) => event is KeyWordSearchEntityEvent)
        .listen((event) {
      entityCallBack.onKeyWordSearchEntityCallBack!(event.value);
    });
    streamSubscriptions["onKeyWordSearchEntityCallBack"] = true;
  }

  void onPolygonSearchEntityCallBack(EntityCallBack entityCallBack) {
    if (streamSubscriptions.containsKey("onPolygonSearchEntityCallBack") &&
        streamSubscriptions["onPolygonSearchEntityCallBack"]!) {
      return;
    }
    _events()
        .where((event) => event is PolygonSearchEntityEvent)
        .listen((event) {
      entityCallBack.onPolygonSearchEntityCallBack!(event.value);
    });
    streamSubscriptions["onPolygonSearchEntityCallBack"] = true;
  }

  void onDistrictSearchEntityCallBack(EntityCallBack entityCallBack) {
    if (streamSubscriptions.containsKey("onDistrictSearchEntityCallBack") &&
        streamSubscriptions["onDistrictSearchEntityCallBack"]!) {
      return;
    }
    _events()
        .where((event) => event is DistrictSearchEntityEvent)
        .listen((event) {
      entityCallBack.onDistrictSearchEntityCallBack!(event.value);
    });
    streamSubscriptions["onDistrictSearchEntityCallBack"] = true;
  }

  void onAroundSearchEntityCallBack(EntityCallBack entityCallBack) {
    if (streamSubscriptions.containsKey("onAroundSearchEntityCallBack") &&
        streamSubscriptions["onAroundSearchEntityCallBack"]!) {
      return;
    }
    _events()
        .where((event) => event is AroundSearchEntityEvent)
        .listen((event) {
      entityCallBack.onAroundSearchEntityCallBack!(event.value);
    });
    streamSubscriptions["onAroundSearchEntityCallBack"] = true;
  }

  void onBoundSearchEntityCallBack(EntityCallBack entityCallBack) {
    if (streamSubscriptions.containsKey("onBoundSearchEntityCallBack") &&
        streamSubscriptions["onBoundSearchEntityCallBack"]!) {
      return;
    }
    _events().where((event) => event is BoundSearchEntityEvent).listen((event) {
      entityCallBack.onBoundSearchEntityCallBack!(event.value);
    });
    streamSubscriptions["onBoundSearchEntityCallBack"] = true;
  }

  void onEntitySearchListCallBack(EntityCallBack entityCallBack) {
    if (streamSubscriptions.containsKey("onEntitySearchListCallBack") &&
        streamSubscriptions["onEntitySearchListCallBack"]!) {
      return;
    }
    _events().where((event) => event is EntitySearchListEvent).listen((event) {
      entityCallBack.onEntitySearchListCallBack!(event.value);
    });
    streamSubscriptions["onEntitySearchListCallBack"] = true;
  }

  void onQueryRealTimeLocationCallBack(EntityCallBack entityCallBack) {
    if (streamSubscriptions.containsKey("onQueryRealTimeLocationCallBack") &&
        streamSubscriptions["onQueryRealTimeLocationCallBack"]!) {
      return;
    }
    _events()
        .where((event) => event is QueryRealTimeLocationEvent)
        .listen((event) {
      entityCallBack.onQueryRealTimeLocationCallBack!(event.value);
    });
    streamSubscriptions["onQueryRealTimeLocationCallBack"] = true;
  }

  void onDrivingBehaviorCallBack(AnalysisCallBack analysisCallBack) {
    if (streamSubscriptions.containsKey("onDrivingBehaviorCallBack") &&
        streamSubscriptions["onDrivingBehaviorCallBack"]!) {
      return;
    }
    _events()
        .where((event) => event is DrivingBehaviourAnalysisEvent)
        .listen((event) {
      analysisCallBack.onDrivingBehaviourAnalysisCallBack!(event.value);
    });
    streamSubscriptions["onDrivingBehaviorCallBack"] = true;
  }

  void onStayPointAnalysisCallBack(AnalysisCallBack analysisCallBack) {
    if (streamSubscriptions.containsKey("onStayPointAnalysisCallBack") &&
        streamSubscriptions["onStayPointAnalysisCallBack"]!) {
      return;
    }
    _events().where((event) => event is StayPointAnalysisEvent).listen((event) {
      analysisCallBack.onStayPointAnalysisCallBack!(event.value);
    });
    streamSubscriptions["onStayPointAnalysisCallBack"] = true;
  }

  void onAddCustomTrackPointCallBack(TrackCallBack ?trackCallBack) {
    if (streamSubscriptions.containsKey("onAddCustomTrackPointCallBack") &&
        streamSubscriptions["onAddCustomTrackPointCallBack"]!) {
      return;
    }
    _events()
        .where((event) => event is AddCustomTrackPointEvent)
        .listen((event) {
      trackCallBack!.onAddCustomTrackPointCallBack!(event.value);
    });
    streamSubscriptions["onAddCustomTrackPointCallBack"] = true;
  }

  void onAddCustomTrackPointsCallBack(TrackCallBack ?trackCallBack) {
    if (streamSubscriptions.containsKey("onAddCustomTrackPointsCallBack") &&
        streamSubscriptions["onAddCustomTrackPointsCallBack"]!) {
      return;
    }
    _events()
        .where((event) => event is AddCustomTrackPointsEvent)
        .listen((event) {
      trackCallBack!.onAddCustomTrackPointsCallBack!(event.value);
    });
    streamSubscriptions["onAddCustomTrackPointsCallBack"] = true;
  }

  void onClearTrackCacheCallBack(TrackCallBack ?trackCallBack) {
    if (streamSubscriptions.containsKey("onClearTrackCacheCallBack") &&
        streamSubscriptions["onClearTrackCacheCallBack"]!) {
      return;
    }
    _events().where((event) => event is ClearTrackCacheEvent).listen((event) {
      trackCallBack!.onClearTrackCacheCallBack!(event.value);
    });
    streamSubscriptions["onClearTrackCacheCallBack"] = true;
  }

  void onQueryHistoryTrackCallBack(TrackCallBack ?trackCallBack) {
    if (streamSubscriptions.containsKey("onQueryHistoryTrackCallBack") &&
        streamSubscriptions["onQueryHistoryTrackCallBack"]!) {
      return;
    }
    _events().where((event) => event is QueryHistoryTrackEvent).listen((event) {
      trackCallBack!.onQueryHistoryTrackCallBack!(event.value);
    });
    streamSubscriptions["onQueryHistoryTrackCallBack"] = true;
  }

  void onQueryTrackCacheInfoCallBack(TrackCallBack ?trackCallBack) {
    if (streamSubscriptions.containsKey("onQueryTrackCacheInfoCallBack") &&
        streamSubscriptions["onQueryTrackCacheInfoCallBack"]!) {
      return;
    }
    _events()
        .where((event) => event is QueryTrackCacheInfoEvent)
        .listen((event) {
      trackCallBack!.onQueryTrackCacheInfoCallBack!(event.value);
    });
    streamSubscriptions["onQueryTrackCacheInfoCallBack"] = true;
  }

  void onQueryTrackDistanceCallBack(TrackCallBack ?trackCallBack) {
    if (streamSubscriptions.containsKey("onQueryTrackDistanceCallBack") &&
        streamSubscriptions["onQueryTrackDistanceCallBack"]!) {
      return;
    }
    _events()
        .where((event) => event is QueryTrackDistanceEvent)
        .listen((event) {
      trackCallBack!.onQueryTrackDistanceCallBack!(event.value);
    });
    streamSubscriptions["onQueryTrackDistanceCallBack"] = true;
  }

  void onQueryTrackLatestPointCallBack(TrackCallBack ?trackCallBack) {
    if (streamSubscriptions.containsKey("onQueryTrackLatestPointCallBack") &&
        streamSubscriptions["onQueryTrackLatestPointCallBack"]!) {
      return;
    }
    _events()
        .where((event) => event is QueryTrackLatestPointEvent)
        .listen((event) {
      trackCallBack!.onQueryTrackLatestPointCallBack!(event.value);
    });
    streamSubscriptions["onQueryTrackLatestPointCallBack"] = true;
  }

  void onCreateFenceCallback(FenceCallback fenceCallback) {
    if (streamSubscriptions.containsKey("onCreateFenceCallback") &&
        streamSubscriptions["onCreateFenceCallback"]!) {
      return;
    }
    _events().where((event) => event is CreateFenceEvent).listen((event) {
      fenceCallback.onCreateFenceCallback!(event.value);
    });
    streamSubscriptions["onCreateFenceCallback"] = true;
  }

  void onUpdateFenceCallback(FenceCallback fenceCallback) {
    if (streamSubscriptions.containsKey("onUpdateFenceCallback") &&
        streamSubscriptions["onUpdateFenceCallback"]!) {
      return;
    }
    _events().where((event) => event is UpdateFenceEvent).listen((event) {
      fenceCallback.onUpdateFenceCallback!(event.value);
    });
    streamSubscriptions["onUpdateFenceCallback"] = true;
  }

  void onDeleteFenceCallback(FenceCallback fenceCallback) {
    if (streamSubscriptions.containsKey("onDeleteFenceCallback") &&
        streamSubscriptions["onDeleteFenceCallback"]!) {
      return;
    }
    _events().where((event) => event is DeleteFenceEvent).listen((event) {
      fenceCallback.onDeleteFenceCallback!(event.value);
    });
    streamSubscriptions["onDeleteFenceCallback"] = true;
  }

  void onQueryFenceListCallback(FenceCallback fenceCallback) {
    if (streamSubscriptions.containsKey("onQueryFenceListCallback") &&
        streamSubscriptions["onQueryFenceListCallback"]!) {
      return;
    }
    _events().where((event) => event is QueryFenceListEvent).listen((event) {
      fenceCallback.onQueryFenceListCallback!(event.value);
    });
    streamSubscriptions["onQueryFenceListCallback"] = true;
  }

  void onAddMonitoredPersonCallback(FenceCallback fenceCallback) {
    if (streamSubscriptions.containsKey("onAddMonitoredPersonCallback") &&
        streamSubscriptions["onAddMonitoredPersonCallback"]!) {
      return;
    }
    _events()
        .where((event) => event is AddMonitoredPersonEvent)
        .listen((event) {
      fenceCallback.onAddMonitoredPersonCallback!(event.value);
    });
    streamSubscriptions["onAddMonitoredPersonCallback"] = true;
  }

  void onDeleteMonitoredPersonCallback(FenceCallback fenceCallback) {
    if (streamSubscriptions.containsKey("onDeleteMonitoredPersonCallback") &&
        streamSubscriptions["onDeleteMonitoredPersonCallback"]!) {
      return;
    }
    _events()
        .where((event) => event is DeleteMonitoredPersonEvent)
        .listen((event) {
      fenceCallback.onDeleteMonitoredPersonCallback!(event.value);
    });
    streamSubscriptions["onDeleteMonitoredPersonCallback"] = true;
  }

  void onQueryHistoryAlarmCallback(FenceCallback fenceCallback) {
    if (streamSubscriptions.containsKey("onQueryHistoryAlarmCallback") &&
        streamSubscriptions["onQueryHistoryAlarmCallback"]!) {
      return;
    }
    _events().where((event) => event is QueryHistoryAlarmEvent).listen((event) {
      fenceCallback.onQueryHistoryAlarmCallback!(event.value);
    });
    streamSubscriptions["onQueryHistoryAlarmCallback"] = true;
  }

  void onQueryListMonitoredPersonCallback(FenceCallback fenceCallback) {
    if (streamSubscriptions.containsKey("onQueryListMonitoredPersonCallback") &&
        streamSubscriptions["onQueryListMonitoredPersonCallback"]!) {
      return;
    }
    _events()
        .where((event) => event is QueryListMonitoredPersonEvent)
        .listen((event) {
      fenceCallback.onQueryListMonitoredPersonCallback!(event.value);
    });
    streamSubscriptions["onQueryListMonitoredPersonCallback"] = true;
  }

  void onQueryMonitoredStatusCallback(FenceCallback fenceCallback) {
    if (streamSubscriptions.containsKey("onQueryMonitoredStatusCallback") &&
        streamSubscriptions["onQueryMonitoredStatusCallback"]!) {
      return;
    }
    _events()
        .where((event) => event is QueryMonitoredStatusEvent)
        .listen((event) {
      fenceCallback.onQueryMonitoredStatusCallback!(event.value);
    });
    streamSubscriptions["onQueryMonitoredStatusCallback"] = true;
  }

  void onQueryMonitoredStatusByLocationCallback(FenceCallback fenceCallback) {
    if (streamSubscriptions
            .containsKey("onQueryMonitoredStatusByLocationCallback") &&
        streamSubscriptions["onQueryMonitoredStatusByLocationCallback"]!) {
      return;
    }
    _events()
        .where((event) => event is QueryMonitoredStatusByLocationEvent)
        .listen((event) {
      fenceCallback.onQueryMonitoredStatusByLocationCallback!(event.value);
    });
    streamSubscriptions["onQueryMonitoredStatusByLocationCallback"] = true;
  }

  /// native -> flutter
  Future<dynamic> _handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case TraceMethods.kPushCallBack:
        PushResult pushResult = PushResult.fromMap(call.arguments);
        _streamController.sink.add(PushEvent(pushResult));
        break;
      case TraceMethods.kBindTraceServiceCallBack:
        TraceResult traceResult = TraceResult.fromMap(call.arguments);
        _streamController.sink.add(BindTraceServiceEvent(traceResult));
        break;
      case TraceMethods.kStartTraceServiceCallBack:
        TraceResult traceResult = TraceResult.fromMap(call.arguments);
        _streamController.sink.add(StartTraceServiceEvent(traceResult));
        break;
      case TraceMethods.kStopTraceServiceCallBack:
        TraceResult traceResult = TraceResult.fromMap(call.arguments);
        _streamController.sink.add(StopTraceServiceEvent(traceResult));
        break;
      case TraceMethods.kStartGatherCallBack:
        GatherResult gatherResult = GatherResult.fromMap(call.arguments);
        _streamController.sink.add(StartGatherEvent(gatherResult));
        break;
      case TraceMethods.kStopGatherCallBack:
        GatherResult gatherResult = GatherResult.fromMap(call.arguments);
        _streamController.sink.add(StopGatherEvent(gatherResult));
        break;
      case TraceMethods.kSetCacheSizeCallBack:
        SetCacheMaxSizeErrorCode setCacheMaxSizeErrorCode =
            SetCacheMaxSizeErrorCode.values[call.arguments["errorCode"] as int];
        _streamController.sink.add(SetCacheSizeEvent(setCacheMaxSizeErrorCode));
        break;
      case TraceMethods.kSetIntervalCallBack:
        {
          SetIntervalErrorCode setIntervalErrorCode =
              SetIntervalErrorCode.values[call.arguments["errorCode"] as int];
          _streamController.sink.add(SetIntervalEvent(setIntervalErrorCode));
          break;
        }
      case EntityMethods.kAddEntityCallBack:
        _streamController.sink.add(AddEntityEvent(AddEntityResult.fromMap(call.arguments)));
        break;
      case EntityMethods.kUpdateEntityCallBack:
        _streamController.sink.add(
            UpdateEntityEvent(UpdateEntityResult.fromMap(call.arguments)));
        break;
      case EntityMethods.kDeleteEntityCallBack:
        _streamController.sink.add(
            DeleteEntityEvent(DeleteEntityResult.fromMap(call.arguments)));
        break;
      case EntityMethods.kAroundSearchEntityCallBack:
        _streamController.sink.add(AroundSearchEntityEvent(
            AroundSearchEntityResult.fromMap(call.arguments)));
        break;
      case EntityMethods.kBoundSearchEntityCallBack:
        _streamController.sink.add(BoundSearchEntityEvent(
            BoundSearchEntityResult.fromMap(call.arguments)));
        break;
      case EntityMethods.kPolygonSearchEntityCallBack:
        _streamController.sink.add(PolygonSearchEntityEvent(
            PolygonSearchEntityResult.fromMap(call.arguments)));
        break;
      case EntityMethods.kDistrictSearchEntityCallBack:
        _streamController.sink.add(DistrictSearchEntityEvent(
            DistrictSearchEntityResult.fromMap(call.arguments)));
        break;
      case EntityMethods.kSearchEntityCallBack:
        _streamController.sink.add(KeyWordSearchEntityEvent(
            KeyWordSearchEntityResult.fromMap(call.arguments)));
        break;
      case EntityMethods.kQueryEntityListCallBack:
        _streamController.sink.add(EntitySearchListEvent(
            EntityListSearchResult.fromMap(call.arguments)));
        break;
      case EntityMethods.kQueryRealTimeLocCallBack:
        _streamController.sink.add(QueryRealTimeLocationEvent(
            RealTimeLocationResult.fromMap(call.arguments)));
        break;
      case AnalysisMethods.kAnalyzeDrivingBehaviourCallBack:
        _streamController.sink.add(DrivingBehaviourAnalysisEvent(
            DrivingBehaviourAnalysisResult.fromMap(call.arguments)));
        break;
      case AnalysisMethods.kAnalyzeStayPointCallBack:
        _streamController.sink.add(StayPointAnalysisEvent(
            StayPointAnalysisResult.fromMap(call.arguments)));
        break;
      case TrackMethods.kAddCustomPointCallBack:
        _streamController.sink.add(AddCustomTrackPointEvent(
            AddCustomTrackPointResult.fromMap(call.arguments)));
        break;
      case TrackMethods.kBatchAddCustomPointCallBack:
        _streamController.sink.add(AddCustomTrackPointsEvent(
            AddCustomTrackPointsResult.fromMap(call.arguments)));
        break;
      case TrackMethods.kClearTrackCacheCallBack:
        _streamController.sink.add(ClearTrackCacheEvent(
            ClearTrackCacheResult.fromMap(call.arguments)));
        break;
      case TrackMethods.kQueryHistoryTrackCallBack:
        _streamController.sink.add(QueryHistoryTrackEvent(
            QueryHistoryTrackResult.fromMap(call.arguments)));
        break;
      case TrackMethods.kQueryTrackCacheInfoCallBack:
        _streamController.sink.add(QueryTrackCacheInfoEvent(
            QueryTrackCacheInfoResult.fromMap(call.arguments)));
        break;
      case TrackMethods.kQueryTrackLatestPointCallBack:
        _streamController.sink.add(QueryTrackLatestPointEvent(
            QueryTrackLatestPointResult.fromMap(call.arguments)));
        break;
      case TrackMethods.kQueryTrackDistanceCallBack:
        _streamController.sink.add(QueryTrackDistanceEvent(
            QueryTrackDistanceResult.fromMap(call.arguments)));
        break;
      case FenceMethods.kCreateFenceCallBack:
        _streamController.sink.add(CreateFenceEvent(CreateFenceResult.fromMap(call.arguments)));
        break;
      case FenceMethods.kUpdateFenceCallBack:
        _streamController.sink.add(UpdateFenceEvent(UpdateFenceResult.fromMap(call.arguments)));
        break;
      case FenceMethods.kDeleteFenceCallBack:
        _streamController.sink.add(DeleteFenceEvent(DeleteFenceResult.fromMap(call.arguments)));
        break;
      case FenceMethods.kQueryFenceListCallBack:
        _streamController.sink.add(
            QueryFenceListEvent(QueryFenceListResult.fromMap(call.arguments)));
        break;
      case FenceMethods.kAddMonitoredPersonCallBack:
        _streamController.sink.add(AddMonitoredPersonEvent(
            AddMonitoredPersonResult.fromMap(call.arguments)));
        break;
      case FenceMethods.kDeleteMonitoredPersonCallBack:
        _streamController.sink.add(DeleteMonitoredPersonEvent(
            DeleteMonitoredPersonResult.fromMap(call.arguments)));
        break;
      case FenceMethods.kQueryHistoryAlarmCallBack:
        _streamController.sink.add(QueryHistoryAlarmEvent(
            QueryHistoryAlarmResult.fromMap(call.arguments)));
        break;
      case FenceMethods.kQueryListMonitoredPersonCallBack:
        _streamController.sink.add(QueryListMonitoredPersonEvent(
            QueryListMonitoredPersonResult.fromMap(call.arguments)));
        break;
      case FenceMethods.kQueryMonitoredStatusCallBack:
        _streamController.sink.add(QueryMonitoredStatusEvent(
            QueryMonitoredStatusResult.fromMap(call.arguments)));
        break;
      case FenceMethods.kQueryMonitoredStatusByLocationCallBack:
        _streamController.sink.add(QueryMonitoredStatusByLocationEvent(
            QueryMonitoredStatusByLocationResult.fromMap(call.arguments)));
        break;
      default:
    }
  }

  ///  *********** 采集服务相关 ***********

  @override
  Future<bool> configServerInfo(ServiceOption ?serviceOption) async {
    bool result = false;
    try {
      result = (await _channel.invokeMethod(
          TraceMethods.kConfigServerInfo, serviceOption!.toMap())) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  @override
  Future<bool> setCacheSize(
      {required int size, TraceCallback ?traceCallback}) async {
    bool result = false;
    try {
      if (traceCallback!.onSetCacheSizeCallBack != null) {
        instance.onSetCacheSizeCallBack(traceCallback);
      }
      result = (await _channel
          .invokeMethod(TraceMethods.kSetCacheSize, {'size': size})) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  @override
  Future<bool> setInterval(
      {required int gatherInterval,
      required int packInterval,
      TraceCallback ?traceCallback}) async {
    bool result = false;
    try {
      if (traceCallback!.onSetIntervalCallBack != null) {
        instance.onSetIntervalCallBack(traceCallback);
      }
      result = (await _channel.invokeMethod(TraceMethods.kSetInterval, {
        'gatherInterval': gatherInterval,
        'packInterval': packInterval
      })) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  @override
  Future<bool> startGather({TraceCallback ?traceCallback}) async {
    bool result = false;
    try {
      if (traceCallback!.onStartGatherCallBack != null) {
        instance.onStartGatherCallBack(traceCallback);
      }
      result = (await _channel.invokeMethod(TraceMethods.kStartGather)) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  @override
  Future<bool> startTraceService(
      {required Trace trace, TraceCallback ?traceCallback}) async {
    bool result = false;
    try {
      if (traceCallback!.onStartTraceServiceCallBack != null) {
        instance.onStartTraceServiceCallBack(traceCallback);
      }
      if (traceCallback.onBindServiceCallback != null) {
        instance.onBindServiceCallback(traceCallback);
      }
      if (traceCallback.onPushCallBack != null) {
        instance.onPushCallBack(traceCallback);
      }
      result = (await _channel.invokeMethod(
          TraceMethods.kStartTraceService, trace.toMap())) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  @override
  Future<bool> stopGather({TraceCallback ?traceCallback}) async {
    bool result = false;
    try {
      if (traceCallback!.onStopGatherCallBack != null) {
        instance.onStopGatherCallBack(traceCallback);
      }
      result = (await _channel.invokeMethod(TraceMethods.kStopGather)) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  @override
  Future<bool> stopTraceService(
      {required Trace trace, TraceCallback ?traceCallback}) async {
    bool result = false;
    try {
      if (traceCallback!.onStopTraceServiceCallBack != null) {
        instance.onStopTraceServiceCallBack(traceCallback);
      }
      result = (await _channel.invokeMethod(
          TraceMethods.kStopTraceService, trace.toMap())) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  ///  *********** 定位相关 ***********
  @override
  Future<bool> requestLocalPermission() async {
    bool result = false;
    try {
      Map map = (await _channel
          .invokeMethod(LocationMethods.kRequestLocalPermission)) as Map;
      result = map['result'] as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  @override
  Future<bool> configLocationInfo(LocationOption ?locationOption) async {
    bool result = false;
    try {
      Map map = (await _channel.invokeMethod(
          LocationMethods.kConfigLocationInfo,
          {'locationOption': locationOption!.toMap()})) as Map;
      result = map['result'] as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  Future<bool> setLocationMode(LocationMode ?locationMode) async {
    bool result = false;
    try {
      result = (await _channel.invokeMethod(LocationMethods.kSetLocationMode,
          {'locationMode': locationMode?.index})) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  ///  *********** 轨迹分析相关 ***********

  @override
  Future<bool> analyzeDrivingBehaviour(
      {required DrivingBehaviourAnalysisOption drivingBehaviourAnalysisOption,
      AnalysisCallBack ?analysisCallBack}) async {
    bool result = false;
    try {
      if (analysisCallBack!.onDrivingBehaviourAnalysisCallBack != null) {
        instance.onDrivingBehaviorCallBack(analysisCallBack);
      }
      result = (await _channel.invokeMethod(
          AnalysisMethods.kAnalyzeDrivingBehaviour,
          drivingBehaviourAnalysisOption.toMap())) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  @override
  Future<bool> analyzeStayPoint(
      {required StayPointAnalysisOption stayPointAnalysisOption,
      AnalysisCallBack ?analysisCallBack}) async {
    bool result = false;
    try {
      if (analysisCallBack!.onStayPointAnalysisCallBack != null) {
        instance.onStayPointAnalysisCallBack(analysisCallBack);
      }
      result = (await _channel.invokeMethod(AnalysisMethods.kAnalyzeStayPoint,
          stayPointAnalysisOption.toMap())) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  ///  *********** 轨迹纠偏与里程计算 ***********
  @override
  Future<bool> addCustomPoints(
      {required AddCustomTrackPointsOption addCustomTrackPointsOption,
      TrackCallBack ?trackCallBack}) async {
    bool result = false;
    try {
      if (trackCallBack!.onAddCustomTrackPointsCallBack != null) {
        instance.onAddCustomTrackPointsCallBack(trackCallBack);
      }
      result = (await _channel.invokeMethod(TrackMethods.kBatchAddCustomPoint,
          addCustomTrackPointsOption.toMap())) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  @override
  Future<bool> addCustomPoint(
      {required AddCustomTrackPointOption addCustomTrackPointOption,
      TrackCallBack ?trackCallBack}) async {
    bool result = false;
    try {
      if (trackCallBack!.onAddCustomTrackPointCallBack != null) {
        instance.onAddCustomTrackPointCallBack(trackCallBack);
      }
      result = (await _channel.invokeMethod(
              TrackMethods.kAddCustomPoint, addCustomTrackPointOption.toMap()))
          as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  @override
  Future<bool> clearTrackCache(
      {required ClearTrackCacheOption clearTrackCacheOption,
      TrackCallBack ?trackCallBack}) async {
    bool result = false;
    try {
      if (trackCallBack!.onClearTrackCacheCallBack != null) {
        instance.onClearTrackCacheCallBack(trackCallBack);
      }
      result = (await _channel.invokeMethod(
              TrackMethods.kClearTrackCache, clearTrackCacheOption.toMap()))
          as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  @override
  Future<bool> queryHistoryTrack(
      {required QueryHistoryTrackOption queryHistoryTrackOption,
      TrackCallBack ?trackCallBack}) async {
    bool result = false;
    try {
      if (trackCallBack!.onQueryHistoryTrackCallBack != null) {
        instance.onQueryHistoryTrackCallBack(trackCallBack);
      }
      result = (await _channel.invokeMethod(TrackMethods.kQueryHistoryTrack,
          queryHistoryTrackOption.toMap())) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  @override
  Future<bool> queryTrackCacheInfo(
      {required QueryTrackCacheInfoOption queryTrackCacheInfoOption,
      TrackCallBack ?trackCallBack}) async {
    bool result = false;
    try {
      if (trackCallBack!.onQueryTrackCacheInfoCallBack != null) {
        instance.onQueryTrackCacheInfoCallBack(trackCallBack);
      }
      result = (await _channel.invokeMethod(TrackMethods.kQueryTrackCacheInfo,
          queryTrackCacheInfoOption.toMap())) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  @override
  Future<bool> queryTrackDistance(
      {required QueryTrackDistanceOption queryTrackDistanceOption,
      TrackCallBack ?trackCallBack}) async {
    bool result = false;
    try {
      if (trackCallBack!.onQueryTrackDistanceCallBack != null) {
        instance.onQueryTrackDistanceCallBack(trackCallBack);
      }
      result = (await _channel.invokeMethod(TrackMethods.kQueryTrackDistance,
          queryTrackDistanceOption.toMap())) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  @override
  Future<bool> queryTrackLatestPoint(
      {required QueryTrackLatestPointOption queryTrackLatestPointOption,
      TrackCallBack ?trackCallBack}) async {
    bool result=false;
    try {
      if (trackCallBack!.onQueryTrackLatestPointCallBack != null) {
        instance.onQueryTrackLatestPointCallBack(trackCallBack);
      }
      result = (await _channel.invokeMethod(TrackMethods.kQueryTrackLatestPoint,
          queryTrackLatestPointOption.toMap())) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  ///  *********** entity相关 ***********
  @override
  Future<bool> addEntity(
      AddEntityOption ?addEntityOption, EntityCallBack ?entityCallBack) async {
    bool result = false;
    try {
      if (entityCallBack!.onAddEntityCallBack != null) {
        instance.onAddEntityCallBack(entityCallBack);
      }
      result = (await _channel.invokeMethod(
          EntityMethods.kAddEntity, addEntityOption?.toMap())) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  @override
  Future<bool> aroundSearchEntity(
      AroundSearchEntityOption aroundSearchEntityOption,
      EntityCallBack ?entityCallBack) async {
    bool result = false;
    try {
      if (entityCallBack!.onAroundSearchEntityCallBack != null) {
        instance.onAroundSearchEntityCallBack(entityCallBack);
      }
      result = (await _channel.invokeMethod(EntityMethods.kAroundSearchEntity,
          aroundSearchEntityOption.toMap())) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  @override
  Future<bool> boundSearchEntity(
      BoundSearchEntityOption boundSearchEntityOption,
      EntityCallBack ?entityCallBack) async {
    bool result = false;
    try {
      if (entityCallBack!.onBoundSearchEntityCallBack != null) {
        instance.onBoundSearchEntityCallBack(entityCallBack);
      }
      result = (await _channel.invokeMethod(EntityMethods.kBoundSearchEntity,
          boundSearchEntityOption.toMap())) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  @override
  Future<bool> deleteEntity(DeleteEntityOption deleteEntityOption,
      EntityCallBack ?entityCallBack) async {
    bool result = false;
    try {
      if (entityCallBack!.onDeleteEntityCallBack != null) {
        instance.onDeleteEntityCallBack(entityCallBack);
      }
      result = (await _channel.invokeMethod(
          EntityMethods.kDeleteEntity, deleteEntityOption.toMap())) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  @override
  Future<bool> districtSearchEntity(
      DistrictSearchEntityOption districtSearchEntityOption,
      EntityCallBack ?entityCallBack) async {
    bool result = false;
    try {
      if (entityCallBack!.onDistrictSearchEntityCallBack != null) {
        instance.onDistrictSearchEntityCallBack(entityCallBack);
      }
      result = (await _channel.invokeMethod(EntityMethods.kDistrictSearchEntity,
          districtSearchEntityOption.toMap())) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  @override
  Future<bool> polygonSearchEntity(
      PolygonSearchEntityOption polygonSearchEntityOption,
      EntityCallBack ?entityCallBack) async {
    bool result = false;
    try {
      if (entityCallBack!.onPolygonSearchEntityCallBack != null) {
        instance.onPolygonSearchEntityCallBack(entityCallBack);
      }
      result = (await _channel.invokeMethod(EntityMethods.kPolygonSearchEntity,
          polygonSearchEntityOption.toMap())) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  @override
  Future<bool> queryEntityList(EntityListSearchOption entityListSearchOption,
      EntityCallBack ?entityCallBack) async {
    bool result = false;
    try {
      if (entityCallBack!.onEntitySearchListCallBack != null) {
        instance.onEntitySearchListCallBack(entityCallBack);
      }
      result = (await _channel.invokeMethod(
              EntityMethods.kQueryEntityList, entityListSearchOption.toMap()))
          as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  @override
  Future<bool> keyWordSearchEntity(
      KeyWordSearchEntityOption keyWordSearchEntityOption,
      EntityCallBack ?entityCallBack) async {
    bool result = false;
    try {
      if (entityCallBack!.onKeyWordSearchEntityCallBack != null) {
        instance.onKeyWordSearchEntityCallBack(entityCallBack);
      }
      result = (await _channel.invokeMethod(
              EntityMethods.kSearchEntity, keyWordSearchEntityOption.toMap()))
          as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  @override
  Future<bool> updateEntity(UpdateEntityOption updateEntityOption,
      EntityCallBack ?entityCallBack) async {
    bool result = false;
    try {
      if (entityCallBack!.onUpdateEntityCallBack != null) {
        instance.onUpdateEntityCallBack(entityCallBack);
      }
      result = (await _channel.invokeMethod(
          EntityMethods.kUpdateEntity, updateEntityOption.toMap())) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  ///  *********** 围栏相关 ***********
  @override
  Future<bool> addMonitoredPerson(
      {required AddMonitoredPersonOption addMonitoredPersonOption,
      FenceCallback ?fenceCallback}) async {
    bool result = false;
    try {
      if (fenceCallback!.onAddMonitoredPersonCallback != null) {
        instance.onAddMonitoredPersonCallback(fenceCallback);
      }
      result = (await _channel.invokeMethod(FenceMethods.kAddMonitoredPerson,
          addMonitoredPersonOption.toMap())) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  @override
  Future<bool> createFence(
      {required CreateFenceOption createFenceOption,
      FenceCallback ?fenceCallback}) async {
    bool result = false;
    try {
      if (fenceCallback!.onCreateFenceCallback != null) {
        instance.onCreateFenceCallback(fenceCallback);
      }
      result = (await _channel.invokeMethod(
          FenceMethods.kCreateFence, createFenceOption.toMap())) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  @override
  Future<bool> deleteFence(
      {required DeleteFenceOption deleteFenceOption,
      FenceCallback ?fenceCallback}) async {
    bool result = false;
    try {
      if (fenceCallback!.onDeleteFenceCallback != null) {
        instance.onDeleteFenceCallback(fenceCallback);
      }
      result = (await _channel.invokeMethod(
          FenceMethods.kDeleteFence, deleteFenceOption.toMap())) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  @override
  Future<bool> deleteMonitoredPerson(
      {required DeleteMonitoredPersonOption deleteMonitoredPersonOption,
      FenceCallback ?fenceCallback}) async {
    bool result = false;
    try {
      if (fenceCallback!.onDeleteMonitoredPersonCallback != null) {
        instance.onDeleteMonitoredPersonCallback(fenceCallback);
      }
      result = (await _channel.invokeMethod(FenceMethods.kDeleteMonitoredPerson,
          deleteMonitoredPersonOption.toMap())) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  @override
  Future<bool> queryFenceList(
      {required QueryFenceListOption queryFenceListOption,
      FenceCallback ?fenceCallback}) async {
    bool result = false;
    try {
      if (fenceCallback!.onQueryFenceListCallback != null) {
        instance.onQueryFenceListCallback(fenceCallback);
      }
      result = (await _channel.invokeMethod(
          FenceMethods.kQueryFenceList, queryFenceListOption.toMap())) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  @override
  Future<bool> queryHistoryAlarm(
      {required QueryHistoryAlarmOption queryHistoryAlarmOption,
      FenceCallback ?fenceCallback}) async {
    bool result = false;
    try {
      if (fenceCallback!.onQueryHistoryAlarmCallback != null) {
        instance.onQueryHistoryAlarmCallback(fenceCallback);
      }
      result = (await _channel.invokeMethod(FenceMethods.kQueryHistoryAlarm,
          queryHistoryAlarmOption.toMap())) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  @override
  Future<bool> queryListMonitoredPerson(
      {required QueryListMonitoredPersonOption queryListMonitoredPersonOption,
      FenceCallback ?fenceCallback}) async {
    bool result = false;
    try {
      if (fenceCallback!.onQueryListMonitoredPersonCallback != null) {
        instance.onQueryListMonitoredPersonCallback(fenceCallback);
      }
      result = (await _channel.invokeMethod(
          FenceMethods.kQueryListMonitoredPerson,
          queryListMonitoredPersonOption.toMap())) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  @override
  Future<bool> queryMonitoredStatus(
      {required QueryMonitoredStatusOption queryMonitoredStatusOption,
      FenceCallback ?fenceCallback}) async {
    bool result = false;
    try {
      if (fenceCallback!.onQueryMonitoredStatusCallback != null) {
        instance.onQueryMonitoredStatusCallback(fenceCallback);
      }
      result = (await _channel.invokeMethod(FenceMethods.kQueryMonitoredStatus,
          queryMonitoredStatusOption.toMap())) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  @override
  Future<bool> queryMonitoredStatusByLocation(
      {required
          QueryMonitoredStatusByLocationOption
              queryMonitoredStatusByLocationOption,
      FenceCallback ?fenceCallback}) async {
    bool result = false;
    try {
      if (fenceCallback!.onQueryMonitoredStatusByLocationCallback != null) {
        instance.onQueryMonitoredStatusByLocationCallback(fenceCallback);
      }
      result = (await _channel.invokeMethod(
          FenceMethods.kQueryMonitoredStatusByLocation,
          queryMonitoredStatusByLocationOption.toMap())) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  @override
  Future<bool> updateFence(
      {required UpdateFenceOption updateFenceOption,
      FenceCallback ?fenceCallback}) async {
    bool result = false;
    try {
      if (fenceCallback!.onUpdateFenceCallback != null) {
        instance.onUpdateFenceCallback(fenceCallback);
      }
      result = (await _channel.invokeMethod(
          FenceMethods.kUpdateFence, updateFenceOption.toMap())) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  Future<bool> queryRealTimeLoc(
      {required RealTimeLocationOption realTimeLocationOption,
      EntityCallBack ?entityCallBack}) async {
    bool result = false;
    try {
      if (entityCallBack!.onQueryRealTimeLocationCallBack != null) {
        instance.onQueryRealTimeLocationCallBack(entityCallBack);
      }
      result = (await _channel.invokeMethod(
              EntityMethods.kQueryRealTimeLoc, realTimeLocationOption.toMap()))
          as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  Future<bool> stopRealTimeLoc() async {
    bool result = false;
    try {
      result =
          (await _channel.invokeMethod(CommonMethods.kStopRealTimeLoc)) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  Future<bool> release() async {
    bool result = false;
    try {
      await _streamController.sink.close();
      await _streamController.close();
      streamSubscriptions.clear();
      // result = (await _channel.invokeMethod(
      //     CommonMethods.kRelease)) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }
}
