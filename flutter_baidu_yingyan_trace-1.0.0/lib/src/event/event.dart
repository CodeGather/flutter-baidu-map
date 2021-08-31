import 'package:flutter_baidu_yingyan_trace/flutter_baidu_yingyan_trace.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/around_search_entity_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/bound_search_entity_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/delete_entity_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/district_search_entity_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/keyword_search_entity_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/polygon_search_entity_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/real_time_loc_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/entity/search_entity_list_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/add_monitored_person_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/create_fence_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/delete_fence_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/delete_monitored_person_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/query_fence_list_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/query_history_alarm_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/query_list_monitored_person_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/query_monitored_status_by_location_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/query_monitored_status_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/fence/update_fence_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/push_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/trace/gather_result.dart';
import 'package:flutter_baidu_yingyan_trace/src/model/trace/trace_result.dart';

class BaseEvent<T> {
  T value;
  BaseEvent(this.value);
}

class TraceServiceEvent extends BaseEvent<TraceResult> {
  TraceServiceEvent(TraceResult value) : super(value);
}

class StartTraceServiceEvent extends TraceServiceEvent {
  StartTraceServiceEvent(TraceResult value) : super(value);
}

class PushEvent extends BaseEvent<PushResult> {
  PushEvent(PushResult value) : super(value);
}

class BindTraceServiceEvent extends TraceServiceEvent {
  BindTraceServiceEvent(TraceResult value) : super(value);
}

class StopTraceServiceEvent extends TraceServiceEvent {
  StopTraceServiceEvent(TraceResult value) : super(value);
}

class GatherEvent extends BaseEvent<GatherResult> {
  GatherEvent(GatherResult value) : super(value);
}

class StartGatherEvent extends GatherEvent {
  StartGatherEvent(GatherResult value) : super(value);
}

class StopGatherEvent extends GatherEvent {
  StopGatherEvent(GatherResult value) : super(value);
}

class SetCacheSizeEvent extends BaseEvent<SetCacheMaxSizeErrorCode> {
  SetCacheSizeEvent(SetCacheMaxSizeErrorCode value) : super(value);
}

class SetIntervalEvent extends BaseEvent<SetIntervalErrorCode> {
  SetIntervalEvent(SetIntervalErrorCode value) : super(value);
}

class AddEntityEvent extends BaseEvent<AddEntityResult> {
  AddEntityEvent(AddEntityResult value) : super(value);
}

class UpdateEntityEvent extends BaseEvent<UpdateEntityResult> {
  UpdateEntityEvent(UpdateEntityResult value) : super(value);
}

class DeleteEntityEvent extends BaseEvent<DeleteEntityResult> {
  DeleteEntityEvent(DeleteEntityResult value) : super(value);
}

class EntitySearchListEvent extends BaseEvent<EntityListSearchResult> {
  EntitySearchListEvent(EntityListSearchResult value) : super(value);
}

class KeyWordSearchEntityEvent extends BaseEvent<KeyWordSearchEntityResult> {
  KeyWordSearchEntityEvent(KeyWordSearchEntityResult value) : super(value);
}

class BoundSearchEntityEvent extends BaseEvent<BoundSearchEntityResult> {
  BoundSearchEntityEvent(BoundSearchEntityResult value) : super(value);
}

class AroundSearchEntityEvent extends BaseEvent<AroundSearchEntityResult> {
  AroundSearchEntityEvent(AroundSearchEntityResult value) : super(value);
}

class PolygonSearchEntityEvent extends BaseEvent<PolygonSearchEntityResult> {
  PolygonSearchEntityEvent(PolygonSearchEntityResult value) : super(value);
}

class DistrictSearchEntityEvent extends BaseEvent<DistrictSearchEntityResult> {
  DistrictSearchEntityEvent(DistrictSearchEntityResult value) : super(value);
}

class QueryRealTimeLocationEvent extends BaseEvent<RealTimeLocationResult> {
  QueryRealTimeLocationEvent(RealTimeLocationResult value) : super(value);
}

class DrivingBehaviourAnalysisEvent extends BaseEvent<DrivingBehaviourAnalysisResult> {
  DrivingBehaviourAnalysisEvent(DrivingBehaviourAnalysisResult value) : super(value);
}

class StayPointAnalysisEvent extends BaseEvent<StayPointAnalysisResult> {
  StayPointAnalysisEvent(StayPointAnalysisResult value) : super(value);
}

class AddCustomTrackPointEvent extends BaseEvent<AddCustomTrackPointResult> {
  AddCustomTrackPointEvent(AddCustomTrackPointResult value) : super(value);
}

class AddCustomTrackPointsEvent extends BaseEvent<AddCustomTrackPointsResult> {
  AddCustomTrackPointsEvent(AddCustomTrackPointsResult value) : super(value);
}

class ClearTrackCacheEvent extends BaseEvent<ClearTrackCacheResult> {
  ClearTrackCacheEvent(ClearTrackCacheResult value) : super(value);
}

class QueryTrackDistanceEvent extends BaseEvent<QueryTrackDistanceResult> {
  QueryTrackDistanceEvent(QueryTrackDistanceResult value) : super(value);
}

class QueryHistoryTrackEvent extends BaseEvent<QueryHistoryTrackResult> {
  QueryHistoryTrackEvent(QueryHistoryTrackResult value) : super(value);
}

class QueryTrackLatestPointEvent extends BaseEvent<QueryTrackLatestPointResult> {
  QueryTrackLatestPointEvent(QueryTrackLatestPointResult value) : super(value);
}

class QueryTrackCacheInfoEvent extends BaseEvent<QueryTrackCacheInfoResult> {
  QueryTrackCacheInfoEvent(QueryTrackCacheInfoResult value) : super(value);
}

class CreateFenceEvent extends BaseEvent<CreateFenceResult> {
  CreateFenceEvent(CreateFenceResult value) : super(value);
}

class UpdateFenceEvent extends BaseEvent<UpdateFenceResult> {
  UpdateFenceEvent(UpdateFenceResult value) : super(value);
}

class DeleteFenceEvent extends BaseEvent<DeleteFenceResult> {
  DeleteFenceEvent(DeleteFenceResult value) : super(value);
}

class QueryFenceListEvent extends BaseEvent<QueryFenceListResult> {
  QueryFenceListEvent(QueryFenceListResult value) : super(value);
}

class AddMonitoredPersonEvent extends BaseEvent<AddMonitoredPersonResult> {
  AddMonitoredPersonEvent(AddMonitoredPersonResult value) : super(value);
}

class DeleteMonitoredPersonEvent extends BaseEvent<DeleteMonitoredPersonResult> {
  DeleteMonitoredPersonEvent(DeleteMonitoredPersonResult value) : super(value);
}

class QueryHistoryAlarmEvent extends BaseEvent<QueryHistoryAlarmResult> {
  QueryHistoryAlarmEvent(QueryHistoryAlarmResult value) : super(value);
}

class QueryListMonitoredPersonEvent extends BaseEvent<QueryListMonitoredPersonResult> {
  QueryListMonitoredPersonEvent(QueryListMonitoredPersonResult value) : super(value);
}

class QueryMonitoredStatusEvent extends BaseEvent<QueryMonitoredStatusResult> {
  QueryMonitoredStatusEvent(QueryMonitoredStatusResult value) : super(value);
}

class QueryMonitoredStatusByLocationEvent extends BaseEvent<QueryMonitoredStatusByLocationResult> {
  QueryMonitoredStatusByLocationEvent(QueryMonitoredStatusByLocationResult value) : super(value);
}