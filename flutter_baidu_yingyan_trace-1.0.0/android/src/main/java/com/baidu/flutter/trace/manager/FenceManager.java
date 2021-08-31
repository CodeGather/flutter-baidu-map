package com.baidu.flutter.trace.manager;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.baidu.flutter.trace.Constant;
import com.baidu.flutter.trace.model.fence.AddMonitoredPersonOption;
import com.baidu.flutter.trace.model.fence.AddMonitoredPersonResult;
import com.baidu.flutter.trace.model.fence.CreateFenceOption;
import com.baidu.flutter.trace.model.fence.CreateFenceResult;
import com.baidu.flutter.trace.model.fence.DeleteFenceOption;
import com.baidu.flutter.trace.model.fence.DeleteFenceResult;
import com.baidu.flutter.trace.model.fence.DeleteMonitoredPersonOption;
import com.baidu.flutter.trace.model.fence.DeleteMonitoredPersonResult;
import com.baidu.flutter.trace.model.fence.FenceListOption;
import com.baidu.flutter.trace.model.fence.FenceListResult;
import com.baidu.flutter.trace.model.fence.HistoryAlarmOption;
import com.baidu.flutter.trace.model.fence.HistoryAlarmResult;
import com.baidu.flutter.trace.model.fence.ListMonitoredPersonOption;
import com.baidu.flutter.trace.model.fence.ListMonitoredPersonResult;
import com.baidu.flutter.trace.model.fence.MonitoredStatusByLocationOption;
import com.baidu.flutter.trace.model.fence.MonitoredStatusByLocationResult;
import com.baidu.flutter.trace.model.fence.MonitoredStatusOption;
import com.baidu.flutter.trace.model.fence.MonitoredStatusResult;
import com.baidu.flutter.trace.model.fence.UpdateFenceOption;
import com.baidu.flutter.trace.model.fence.UpdateFenceResult;
import com.baidu.flutter.trace.utils.BLog;
import com.baidu.flutter.trace.utils.DataConvertUtil;
import com.baidu.trace.api.fence.AddMonitoredPersonRequest;
import com.baidu.trace.api.fence.AddMonitoredPersonResponse;
import com.baidu.trace.api.fence.CreateFenceRequest;
import com.baidu.trace.api.fence.CreateFenceResponse;
import com.baidu.trace.api.fence.DeleteFenceRequest;
import com.baidu.trace.api.fence.DeleteFenceResponse;
import com.baidu.trace.api.fence.DeleteMonitoredPersonRequest;
import com.baidu.trace.api.fence.DeleteMonitoredPersonResponse;
import com.baidu.trace.api.fence.FenceListRequest;
import com.baidu.trace.api.fence.FenceListResponse;
import com.baidu.trace.api.fence.HistoryAlarmRequest;
import com.baidu.trace.api.fence.HistoryAlarmResponse;
import com.baidu.trace.api.fence.ListMonitoredPersonRequest;
import com.baidu.trace.api.fence.ListMonitoredPersonResponse;
import com.baidu.trace.api.fence.MonitoredStatusByLocationRequest;
import com.baidu.trace.api.fence.MonitoredStatusByLocationResponse;
import com.baidu.trace.api.fence.MonitoredStatusRequest;
import com.baidu.trace.api.fence.MonitoredStatusResponse;
import com.baidu.trace.api.fence.OnFenceListener;
import com.baidu.trace.api.fence.UpdateFenceRequest;
import com.baidu.trace.api.fence.UpdateFenceResponse;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

/**
 * Copyright (C) 2019 Baidu, Inc. All Rights Reserved.
 */
public class FenceManager extends BaseManager {

    FenceManager(LBSTraceController lbsTraceController) {
        super(lbsTraceController);
    }

    @Override
    public void handleMethodCall(MethodCall call, MethodChannel.Result result) {
        switch (call.method) {
            case Constant.FenceMethodId.CREATE_FENCE:
                createFence(call, result);
                break;
            case Constant.FenceMethodId.UPDATE_FENCE:
                updateFence(call, result);
                break;

            case Constant.FenceMethodId.DELETE_FENCE:
                deleteFence(call, result);
                break;
            case Constant.FenceMethodId.QUERY_FENCE_LIST:
                queryFenceList(call, result);
                break;
            case Constant.FenceMethodId.QUERY_MONITORED_STATUS:
                queryMonitoredStatus(call, result);
                break;
            case Constant.FenceMethodId.QUERY_MONITORED_STATUS_BY_LOCATION:
                queryMonitoredStatusByLocation(call, result);
                break;
            case Constant.FenceMethodId.QUERY_HISTORY_ALARM:
                queryFenceHistoryAlarmInfo(call, result);
                break;
            case Constant.FenceMethodId.ADD_MONITORED_PERSON:
                addFenceMonitoredPerson(call, result);
                break;
            case Constant.FenceMethodId.DELETE_MONITORED_PERSON:
                deleteFenceMonitoredPerson(call, result);
                break;
            case Constant.FenceMethodId.QUERY_LIST_MONITORED_PERSON:
                listFenceMonitoredPerson(call, result);
                break;

            default:

                break;
        }
    }

    private void createFence(MethodCall call, MethodChannel.Result result) {
        if (call == null || call.arguments == null || mLBSTraceController == null || mLBSTraceController.getLBSTraceClient() == null) {
            result.success(false);
            return;
        }

        CreateFenceOption createFenceOption =
                (CreateFenceOption) DataConvertUtil.mapToObject((Map<String, Object>) call.arguments,
                        CreateFenceOption.class);
        if (createFenceOption == null) {
            result.success(false);
            return;
        }

        CreateFenceRequest createFenceRequest = createFenceOption.toCreateFenceRequest();
        if (createFenceRequest == null) {
            result.success(false);
            return;
        }

        mLBSTraceController.getLBSTraceClient().createFence(createFenceRequest,
                new PluginOnFenceListener());
        result.success(true);
    }

    private void updateFence(MethodCall call, MethodChannel.Result result) {
        if (call == null || call.arguments == null || mLBSTraceController == null || mLBSTraceController.getLBSTraceClient() == null) {
            result.success(false);
            return;
        }

        UpdateFenceOption updateFenceOption =
                (UpdateFenceOption) DataConvertUtil.mapToObject((Map<String, Object>) call.arguments,
                        UpdateFenceOption.class);
        if (updateFenceOption == null) {
            result.success(false);
            return;
        }

        UpdateFenceRequest updateFenceRequest = updateFenceOption.toUpdateFenceRequest();
        if (updateFenceRequest == null) {
            result.success(false);
            return;
        }

        mLBSTraceController.getLBSTraceClient().updateFence(updateFenceRequest,
                new PluginOnFenceListener());
        result.success(true);
    }

    private void deleteFence(MethodCall call, MethodChannel.Result result) {
        if (call == null || call.arguments == null || mLBSTraceController == null || mLBSTraceController.getLBSTraceClient() == null) {
            result.success(false);
            return;
        }

        DeleteFenceOption deleteFenceOption =
                (DeleteFenceOption) DataConvertUtil.mapToObject((Map<String, Object>) call.arguments,
                        DeleteFenceOption.class);
        if (deleteFenceOption == null) {
            result.success(false);
            return;
        }

        DeleteFenceRequest deleteFenceRequest = deleteFenceOption.toDeleteFenceRequest();
        if (deleteFenceRequest == null) {
            result.success(false);
            return;
        }

        mLBSTraceController.getLBSTraceClient().deleteFence(deleteFenceRequest,
                new PluginOnFenceListener());
        result.success(true);
    }

    private void queryFenceList(MethodCall call, MethodChannel.Result result) {
        if (call == null || call.arguments == null || mLBSTraceController == null || mLBSTraceController.getLBSTraceClient() == null) {
            result.success(false);
            return;
        }

        Map<String, Object> mapData = (Map<String, Object>) call.arguments;
        List<Long> fenceIds = ((List) mapData.get("fenceIds"));
        List<Long> list = new ArrayList<>();
        for (int i = 0; i < fenceIds.size(); i++) {
            list.add(Long.valueOf(String.valueOf(fenceIds.get(i))));
        }
        mapData.put("fenceIds", list);
        FenceListOption fenceListOption =
                (FenceListOption) DataConvertUtil.mapToObject((Map<String, Object>) call.arguments,
                        FenceListOption.class);
        if (fenceListOption == null) {
            result.success(false);
            return;
        }
        
        FenceListRequest fenceListRequest = fenceListOption.toFenceListRequest();
        if (fenceListRequest == null) {
            result.success(false);
            return;
        }
        mLBSTraceController.getLBSTraceClient().queryFenceList(fenceListRequest,
                new PluginOnFenceListener());
        result.success(true);
    }

    private void queryMonitoredStatus(MethodCall call, MethodChannel.Result result) {
        if (call == null || call.arguments == null || mLBSTraceController == null || mLBSTraceController.getLBSTraceClient() == null) {
            result.success(false);
            return;
        }

        MonitoredStatusOption monitoredStatusOption =
                (MonitoredStatusOption) DataConvertUtil.mapToObject((Map<String, Object>) call.arguments,
                        MonitoredStatusOption.class);
        if (monitoredStatusOption == null) {
            result.success(false);
            return;
        }

        MonitoredStatusRequest monitoredStatusRequest = monitoredStatusOption.toMonitoredStatusRequest();
        if (monitoredStatusRequest == null) {
            result.success(false);
            return;
        }

        mLBSTraceController.getLBSTraceClient().queryMonitoredStatus(monitoredStatusRequest,
                new PluginOnFenceListener());
        result.success(true);
    }

    private void queryMonitoredStatusByLocation(MethodCall call, MethodChannel.Result result) {
        if (call == null || call.arguments == null || mLBSTraceController == null || mLBSTraceController.getLBSTraceClient() == null) {
            result.success(false);
            return;
        }

        MonitoredStatusByLocationOption monitoredStatusByLocationOption =
                (MonitoredStatusByLocationOption) DataConvertUtil.mapToObject((Map<String, Object>) call.arguments,
                        MonitoredStatusByLocationOption.class);
        if (monitoredStatusByLocationOption == null) {
            result.success(false);
            return;
        }

        MonitoredStatusByLocationRequest monitoredStatusByLocationRequest =
                monitoredStatusByLocationOption.toMonitoredStatusByLocationRequest();
        if (monitoredStatusByLocationRequest == null) {
            result.success(false);
            return;
        }

        mLBSTraceController.getLBSTraceClient().queryMonitoredStatusByLocation(monitoredStatusByLocationRequest,
                new PluginOnFenceListener());
        result.success(true);
    }

    private void queryFenceHistoryAlarmInfo(MethodCall call, MethodChannel.Result result) {
        if (call == null || call.arguments == null || mLBSTraceController == null || mLBSTraceController.getLBSTraceClient() == null) {
            result.success(false);
            return;
        }

        HistoryAlarmOption historyAlarmOption =
                (HistoryAlarmOption) DataConvertUtil.mapToObject((Map<String, Object>) call.arguments,
                        HistoryAlarmOption.class);
        if (historyAlarmOption == null) {
            result.success(false);
            return;
        }

        HistoryAlarmRequest historyAlarmRequest =
                historyAlarmOption.toHistoryAlarmRequest();
        if (historyAlarmRequest == null) {
            result.success(false);
            return;
        }

        mLBSTraceController.getLBSTraceClient().queryFenceHistoryAlarmInfo(historyAlarmRequest,
                new PluginOnFenceListener());
        result.success(true);
    }

    private void addFenceMonitoredPerson(MethodCall call, MethodChannel.Result result) {
        if (call == null || call.arguments == null || mLBSTraceController == null || mLBSTraceController.getLBSTraceClient() == null) {
            result.success(false);
            return;
        }

        AddMonitoredPersonOption addMonitoredPersonOption =
                (AddMonitoredPersonOption) DataConvertUtil.mapToObject((Map<String, Object>) call.arguments,
                        AddMonitoredPersonOption.class);
        if (addMonitoredPersonOption == null) {
            result.success(false);
            return;
        }

        AddMonitoredPersonRequest addMonitoredPersonRequest =
                addMonitoredPersonOption.toAddMonitoredPersonRequest();
        if (addMonitoredPersonRequest == null) {
            result.success(false);
            return;
        }

        mLBSTraceController.getLBSTraceClient().addFenceMonitoredPerson(addMonitoredPersonRequest,
                new PluginOnFenceListener());
        result.success(true);
    }

    private void deleteFenceMonitoredPerson(MethodCall call, MethodChannel.Result result) {
        if (call == null || call.arguments == null || mLBSTraceController == null || mLBSTraceController.getLBSTraceClient() == null) {
            result.success(false);
            return;
        }

        DeleteMonitoredPersonOption deleteMonitoredPersonOption =
                (DeleteMonitoredPersonOption) DataConvertUtil.mapToObject((Map<String, Object>) call.arguments,
                        DeleteMonitoredPersonOption.class);
        if (deleteMonitoredPersonOption == null) {
            result.success(false);
            return;
        }

        DeleteMonitoredPersonRequest deleteMonitoredPersonRequest =
                deleteMonitoredPersonOption.toDeleteMonitoredPersonRequest();
        if (deleteMonitoredPersonRequest == null) {
            result.success(false);
            return;
        }

        mLBSTraceController.getLBSTraceClient().deleteFenceMonitoredPerson(deleteMonitoredPersonRequest,
                new PluginOnFenceListener());
        result.success(true);
    }

    private void listFenceMonitoredPerson(MethodCall call, MethodChannel.Result result) {
        if (call == null || call.arguments == null || mLBSTraceController == null || mLBSTraceController.getLBSTraceClient() == null) {
            result.success(false);
            return;
        }

        ListMonitoredPersonOption listMonitoredPersonOption =
                (ListMonitoredPersonOption) DataConvertUtil.mapToObject((Map<String, Object>) call.arguments,
                        ListMonitoredPersonOption.class);
        if (listMonitoredPersonOption == null) {
            result.success(false);
            return;
        }

        ListMonitoredPersonRequest listMonitoredPersonRequest = listMonitoredPersonOption.toListMonitoredPersonRequest();

        mLBSTraceController.getLBSTraceClient().listFenceMonitoredPerson(listMonitoredPersonRequest,
                new PluginOnFenceListener());
        result.success(true);
    }

    private class PluginOnFenceListener implements OnFenceListener {

        @Override
        public void onCreateFenceCallback(CreateFenceResponse createFenceResponse) {
            if (createFenceResponse == null || mLBSTraceController == null) {
                return;
            }

            BLog.e("createFenceResponse = " + createFenceResponse.toString());

            Map map = DataConvertUtil.objectToMap(
                new CreateFenceResult(
                    createFenceResponse.getTag(),
                    createFenceResponse.getStatus(),
                    createFenceResponse.getMessage(),
                    createFenceResponse.getFenceName(),
                    createFenceResponse.getFenceId(),
                    createFenceResponse.getFenceShape().ordinal(),
                    createFenceResponse.getFenceType().ordinal()
                )
            );

            mLBSTraceController.getMethodChannel().invokeMethod(Constant.FenceMethodId.CREATE_FENCE_CALLBACK,
                    map);
        }

        @Override
        public void onUpdateFenceCallback(UpdateFenceResponse updateFenceResponse) {
            if (updateFenceResponse == null || mLBSTraceController == null) {
                return;
            }

            BLog.e("updateFenceResponse = " + updateFenceResponse.toString());

            Map map = DataConvertUtil.objectToMap(new UpdateFenceResult(updateFenceResponse.getTag(),
                    updateFenceResponse.getStatus(),
                    updateFenceResponse.getMessage(),
                    updateFenceResponse.getFenceId(),
                    updateFenceResponse.getFenceName(),
                    updateFenceResponse.getFenceType().ordinal()));

            mLBSTraceController.getMethodChannel().invokeMethod(Constant.FenceMethodId.UPDATE_FENCE_CALLBACK,
                    map);
        }

        @Override
        public void onDeleteFenceCallback(DeleteFenceResponse deleteFenceResponse) {
            if (deleteFenceResponse == null || mLBSTraceController == null) {
                return;
            }

            BLog.e(Constant.FenceMethodId.DELETE_FENCE_CALLBACK + "deleteFenceResponse = " + deleteFenceResponse.toString());

            Map map = DataConvertUtil.objectToMap(new DeleteFenceResult(deleteFenceResponse.getTag(),
                    deleteFenceResponse.getStatus(),
                    deleteFenceResponse.getMessage(),
                    deleteFenceResponse.getFenceIds(),
                    deleteFenceResponse.getFenceType().ordinal()));
            if (deleteFenceResponse.getFenceIds().size() > 0) {
                List<String> list = new ArrayList<>();
                for (int i = 0; i < deleteFenceResponse.getFenceIds().size(); i++) {
                    list.add(String.valueOf(deleteFenceResponse.getFenceIds().get(i)));
                }
                map.put("fenceIds", list);
            }

            mLBSTraceController.getMethodChannel().invokeMethod(Constant.FenceMethodId.DELETE_FENCE_CALLBACK,
                    map);
        }

        @Override
        public void onFenceListCallback(FenceListResponse fenceListResponse) {
            if (fenceListResponse == null || mLBSTraceController == null) {
                return;
            }

            BLog.e("fenceListResponse = " + fenceListResponse.toString());

            Map map = DataConvertUtil.objectToMap(new FenceListResult(fenceListResponse.getTag(),
                    fenceListResponse.getStatus(),
                    fenceListResponse.getMessage(),
                    fenceListResponse.getSize(),
                    fenceListResponse.getFenceType().ordinal(),fenceListResponse.getFenceInfos(),
                    fenceListResponse.getTotalSize()));

            mLBSTraceController.getMethodChannel().invokeMethod(Constant.FenceMethodId.QUERY_FENCE_LIST_CALLBACK,
                    map);
        }

        @Override
        public void onMonitoredStatusCallback(MonitoredStatusResponse monitoredStatusResponse) {
            if (monitoredStatusResponse == null || mLBSTraceController == null) {
                return;
            }

            BLog.e("monitoredStatusResponse = " + monitoredStatusResponse.toString());

            Map map = DataConvertUtil.objectToMap(new MonitoredStatusResult(monitoredStatusResponse.getTag(),
                    monitoredStatusResponse.getStatus(),
                    monitoredStatusResponse.getMessage(),
                    monitoredStatusResponse.getTotalSize(),
                    monitoredStatusResponse.getSize(),
                    monitoredStatusResponse.getFenceType().ordinal(),
                    monitoredStatusResponse.getMonitoredStatusInfos()));

            mLBSTraceController.getMethodChannel().invokeMethod(Constant.FenceMethodId.QUERY_MONITORED_STATUS_CALLBACK,
                    map);
        }

        @Override
        public void onMonitoredStatusByLocationCallback(
                MonitoredStatusByLocationResponse monitoredStatusByLocationResponse) {
            if (monitoredStatusByLocationResponse == null || mLBSTraceController == null) {
                return;
            }

            BLog.e("monitoredStatusByLocationResponse = " + monitoredStatusByLocationResponse.toString());

            Map map = DataConvertUtil.objectToMap(new MonitoredStatusByLocationResult(monitoredStatusByLocationResponse.getTag(),
                    monitoredStatusByLocationResponse.getStatus(),
                    monitoredStatusByLocationResponse.getMessage(),
                    monitoredStatusByLocationResponse.getTotalSize(),
                    monitoredStatusByLocationResponse.getSize(),
                    monitoredStatusByLocationResponse.getFenceType().ordinal(),
                    monitoredStatusByLocationResponse.getMonitoredStatusInfos()));

            mLBSTraceController.getMethodChannel().invokeMethod(Constant.FenceMethodId.QUERY_MONITORED_STATUS_BY_LOCATION_CALLBACK,
                    map);
        }

        @Override
        public void onHistoryAlarmCallback(HistoryAlarmResponse historyAlarmResponse) {
            if (historyAlarmResponse == null || mLBSTraceController == null) {
                return;
            }

            BLog.e("historyAlarmResponse = " + historyAlarmResponse.toString());

            Map map = DataConvertUtil.objectToMap(new HistoryAlarmResult(historyAlarmResponse.getTag(),
                    historyAlarmResponse.getStatus(),
                    historyAlarmResponse.getMessage(),
                    historyAlarmResponse.getTotal(),
                    historyAlarmResponse.getSize(),
                    historyAlarmResponse.getFenceType().ordinal(),
                    historyAlarmResponse.getFenceAlarmInfos()));

            mLBSTraceController.getMethodChannel().invokeMethod(Constant.FenceMethodId.QUERY_HISTORY_ALARM_CALLBACK,
                    map);
        }

        @Override
        public void onAddMonitoredPersonCallback(
                AddMonitoredPersonResponse addMonitoredPersonResponse) {
            if (addMonitoredPersonResponse == null || mLBSTraceController == null) {
                return;
            }

            BLog.e("addMonitoredPersonResponse = " + addMonitoredPersonResponse.toString());

            Map map = DataConvertUtil.objectToMap(new AddMonitoredPersonResult(addMonitoredPersonResponse.getTag(),
                    addMonitoredPersonResponse.getStatus(),
                    addMonitoredPersonResponse.getMessage(),
                    addMonitoredPersonResponse.getFenceType().ordinal()));

            mLBSTraceController.getMethodChannel().invokeMethod(Constant.FenceMethodId.ADD_MONITORED_PERSON_CALLBACK,
                    map);
        }

        @Override
        public void onDeleteMonitoredPersonCallback(
                DeleteMonitoredPersonResponse deleteMonitoredPersonResponse) {
            if (deleteMonitoredPersonResponse == null || mLBSTraceController == null) {
                return;
            }

            BLog.e("deleteMonitoredPersonResponse = " + deleteMonitoredPersonResponse.toString());

            Map map = DataConvertUtil.objectToMap(new DeleteMonitoredPersonResult(deleteMonitoredPersonResponse.getTag(),
                    deleteMonitoredPersonResponse.getStatus(),
                    deleteMonitoredPersonResponse.getMessage(),
                    deleteMonitoredPersonResponse.getFenceType().ordinal()));

            mLBSTraceController.getMethodChannel().invokeMethod(Constant.FenceMethodId.DELETE_MONITORED_PERSON_CALLBACK,
                    map);
        }

        @Override
        public void onListMonitoredPersonCallback(
                ListMonitoredPersonResponse listMonitoredPersonResponse) {
            if (listMonitoredPersonResponse == null || mLBSTraceController == null) {
                return;
            }

            BLog.e("listMonitoredPersonResponse = " + listMonitoredPersonResponse.toString());

            Map map = DataConvertUtil.objectToMap(new ListMonitoredPersonResult(listMonitoredPersonResponse.getTag(),
                    listMonitoredPersonResponse.getStatus(),
                    listMonitoredPersonResponse.getMessage(),
                    listMonitoredPersonResponse.getTotalSize(),
                    listMonitoredPersonResponse.getPageSize(),
                    listMonitoredPersonResponse.getMonitoredPerson(),
                    listMonitoredPersonResponse.getFenceType().ordinal()));

            mLBSTraceController.getMethodChannel().invokeMethod(Constant.FenceMethodId.QUERY_LIST_MONITORED_PERSON_CALLBACK,
                    map);

        }
    }
}
