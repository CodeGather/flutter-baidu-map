package com.baidu.flutter.trace.manager;

import android.app.Activity;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Build;
import android.os.PowerManager;
import android.provider.Settings;

import androidx.core.app.NotificationCompat;

import java.util.HashMap;
import java.util.Map;

import com.baidu.flutter.trace.Constant;
import com.baidu.flutter.trace.R;
import com.baidu.flutter.trace.model.PushResult;
import com.baidu.flutter.trace.model.TraceOption;
import com.baidu.flutter.trace.utils.BLog;
import com.baidu.flutter.trace.utils.DataConvertUtil;
import com.baidu.trace.Trace;
import com.baidu.trace.model.OnTraceListener;
import com.baidu.trace.model.PushMessage;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

import static android.content.Context.NOTIFICATION_SERVICE;
import static android.content.Context.POWER_SERVICE;
import static androidx.core.content.ContextCompat.getSystemService;

/**
 * Copyright (C) 2019 Baidu, Inc. All Rights Reserved.
 */
public class TraceManager extends BaseManager {
    private Context mContext;

    TraceManager(LBSTraceController lbsTraceController, Context context) {
        super(lbsTraceController);
        mContext = context;
    }

    @Override
    public void handleMethodCall(MethodCall call, MethodChannel.Result result) {
        if (call == null || mLBSTraceController == null) {
            result.success(false);
            return;
        }

        switch (call.method) {
            case Constant.TraceMethodId.START_TRACE_SERVICE:
                startTrace(call, result);
                break;
            case Constant.TraceMethodId.STOP_TRACE_SERVICE:
                stopTrace(call, result);
                break;

            case Constant.TraceMethodId.START_GATHER:
                startGather(result);
                break;

            case Constant.TraceMethodId.STOP_GATHER:
                stopGather(result);
                break;

            case Constant.TraceMethodId.SET_INTERVAL:
                setInterval(call, result);
                break;

            case Constant.TraceMethodId.SET_CACHE_SIZE:
                setCacheSize(call, result);
                break;

            case Constant.TraceMethodId.IGNORE_BATTERY:
                ignoreBattery();
                break;

            default:
                break;
        }
    }

    private void startTrace(MethodCall call, MethodChannel.Result result) {
        if (call == null || call.arguments == null || mLBSTraceController == null
                || mLBSTraceController.getLBSTraceClient() == null) {
            result.success(false);
            return;
        }

        TraceOption traceOption =
                (TraceOption) DataConvertUtil.mapToObject((Map<String, Object>) call.arguments,
                        TraceOption.class);

        if (traceOption == null) {
            result.success(false);
            return;
        }

        // 开启服务前创建通知
        traceOption.toTrace().setNotification(createNotification());

        // 开始轨迹服务
        mLBSTraceController.getLBSTraceClient().startTrace(traceOption.toTrace(), new PluginOnTraceListener());

        result.success(true);
    }

    /**
     * 在8.0以上手机，如果app切到后台，系统会限制定位相关接口调用频率
     * 可以在启动轨迹上报服务时提供一个通知，这样Service启动时会使用该通知成为前台Service，可以避免此限制
     */
    private Notification createNotification() {
        NotificationManager manager=(NotificationManager) mContext.getSystemService(NOTIFICATION_SERVICE);
        //高版本需要渠道
        if(Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O){
            //只在Android O之上需要渠道，这里的第一个参数要和下面的channelId一样
            NotificationChannel notificationChannel = new NotificationChannel("1","zongjicha", NotificationManager.IMPORTANCE_HIGH);
            notificationChannel.setImportance(NotificationManager.IMPORTANCE_HIGH);
            //如果这里用IMPORTANCE_NOENE就需要在系统的设置里面开启渠道，通知才能正常弹出
            manager.createNotificationChannel(notificationChannel);
        }
        int logos = mContext.getResources().getIdentifier("ic_launcher", "mipmap", mContext.getPackageName());

        //这里的第二个参数要和上面的第一个参数一样
        Notification notifications = new NotificationCompat.Builder(mContext,"1")
                .setContentTitle("踪迹查正在保护您的安全")
                .setContentText("关闭踪迹查会导致位置丢失，请谨慎操作")
                .setWhen(System.currentTimeMillis())
                .setSmallIcon(logos)
                .setShowWhen(true)
                .setVisibility(NotificationCompat.VISIBILITY_PUBLIC)
                .setPriority(NotificationCompat.PRIORITY_MAX)
                .setOngoing(true)
                .setAutoCancel(false)
                .build();

        manager.notify(1, notifications);
        return notifications;
    }

    private void stopTrace(MethodCall call, MethodChannel.Result result) {
        if (call == null || call.arguments == null || mLBSTraceController == null
                || mLBSTraceController.getLBSTraceClient() == null) {
            result.success(false);
            return;
        }

        TraceOption traceOption =
                (TraceOption) DataConvertUtil.mapToObject((Map<String, Object>) call.arguments,
                        TraceOption.class);

        if (traceOption == null) {
            result.success(false);
            return;
        }

        mLBSTraceController.getLBSTraceClient().stopTrace(traceOption.toTrace(),
                new PluginOnTraceListener());

        result.success(true);
    }

    private void startGather(MethodChannel.Result result) {
        if (mLBSTraceController == null || mLBSTraceController.getLBSTraceClient() == null) {
            result.success(false);
            return;
        }

        mLBSTraceController.getLBSTraceClient().startGather(new PluginOnTraceListener());

        result.success(true);
    }

    private void stopGather(MethodChannel.Result result) {
        if (mLBSTraceController == null || mLBSTraceController.getLBSTraceClient() == null) {
            result.success(false);
            return;
        }

        mLBSTraceController.getLBSTraceClient().stopGather(new PluginOnTraceListener());

        result.success(true);
    }

    private void setInterval(MethodCall call, MethodChannel.Result result) {
        if (call == null || call.arguments == null || mLBSTraceController == null
                || mLBSTraceController.getLBSTraceClient() == null) {
            result.success(false);
            return;
        }

        int gatherInterval = Constant.GATHER_INTERVAL;
        int packInterval = Constant.PACKED_DATA_INTERVAL;

        Map<?, ?> map = DataConvertUtil.toMap(call.arguments);
        if (map.containsKey("gatherInterval")) {
            gatherInterval = DataConvertUtil.toInt(map.get("gatherInterval"));
        }

        if (map.containsKey("packInterval")) {
            packInterval = DataConvertUtil.toInt(map.get("packInterval"));
        }

        boolean ret = mLBSTraceController.getLBSTraceClient().setInterval(gatherInterval,
                packInterval);

        result.success(ret);
    }

    private void setCacheSize(MethodCall call, MethodChannel.Result result) {
        if (call == null || call.arguments == null || mLBSTraceController == null
                || mLBSTraceController.getLBSTraceClient() == null) {
            result.success(false);
            return;
        }

        int cacheSize = 0;

        Map<?, ?> map = DataConvertUtil.toMap(call.arguments);
        if (map.containsKey("size")) {
            cacheSize = DataConvertUtil.toInt(map.get("size"));
        }

        boolean ret = mLBSTraceController.getLBSTraceClient().setCacheSize(cacheSize);

        result.success(ret);
    }

    private class PluginOnTraceListener implements OnTraceListener {

        @Override
        public void onBindServiceCallback(int i, String s) {
            if (mLBSTraceController == null) {
                return;
            }

            BLog.e("onBindServiceCallback status = " + i + "; message = " + s);
            Map<String, Object> map = new HashMap<>();
            map.put("status", i);
            map.put("message", s);

            mLBSTraceController.getMethodChannel()
                    .invokeMethod(Constant.TraceMethodId.BIND_TRACE_SERVICE_CALLBACK, map);
        }

        @Override
        public void onStartTraceCallback(int i, String s) {
            if (mLBSTraceController == null) {
                return;
            }

            BLog.e("onStartTraceCallback status = " + i + "; message = " + s);
            Map<String, Object> map = new HashMap<>();
            map.put("status", i);
            map.put("message", s);

            mLBSTraceController.getMethodChannel()
                    .invokeMethod(Constant.TraceMethodId.START_TRACE_SERVICE_CALLBACK, map);
        }

        @Override
        public void onStopTraceCallback(int i, String s) {
            if (mLBSTraceController == null) {
                return;
            }

            BLog.e("onStopTraceCallback status = " + i + "; message = " + s);
            Map<String, Object> map = new HashMap<>();
            map.put("status", i);
            map.put("message", s);

            mLBSTraceController.getMethodChannel()
                    .invokeMethod(Constant.TraceMethodId.STOP_TRACE_SERVICE_CALLBACK, map);
        }

        @Override
        public void onStartGatherCallback(int i, String s) {
            if (mLBSTraceController == null) {
                return;
            }

            BLog.e("onStartGatherCallback status = " + i + "; message = " + s);
            Map<String, Object> map = new HashMap<>();
            map.put("status", i);
            map.put("message", s);

            mLBSTraceController.getMethodChannel()
                    .invokeMethod(Constant.TraceMethodId.START_GATHER_CALLBACK, map);
        }

        @Override
        public void onStopGatherCallback(int i, String s) {
            if (mLBSTraceController == null) {
                return;
            }

            BLog.e("onStopGatherCallback status = " + i + "; message = " + s);
            Map<String, Object> map = new HashMap<>();
            map.put("status", i);
            map.put("message", s);

            mLBSTraceController.getMethodChannel()
                    .invokeMethod(Constant.TraceMethodId.STOP_GATHER_CALLBACK, map);
        }

        @Override
        public void onPushCallback(byte b, PushMessage pushMessage) {

            BLog.e("onPushCallback b = " + b + "; pushMessage = " + pushMessage.toString());

            Map map = DataConvertUtil.objectToMap(new PushResult((int) b, pushMessage.getMessage(),
                    pushMessage.getFenceAlarmPushInfo()));

            mLBSTraceController.getMethodChannel()
                    .invokeMethod(Constant.TraceMethodId.ON_PUSH_CALLBACK, map);
        }

        @Override
        public void onInitBOSCallback(int i, String s) {

        }
    }

    /**
     * 忽略电池优化
     */
    public void ignoreBattery() {
        PowerManager powerManager = (PowerManager) mContext.getSystemService(POWER_SERVICE);
        boolean hasIgnored = false;
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.M) {
            hasIgnored = powerManager.isIgnoringBatteryOptimizations(mContext.getPackageName());
            // 判断当前APP是否有加入电池优化的白名单，如果没有，弹出加入电池优化的白名单的设置对话框。
            if(!hasIgnored) {
                Intent intent = new Intent(Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS);
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                intent.setData(Uri.parse("package:"+mContext.getPackageName()));
                mContext.startActivity(intent);
            } else {
                //已加入电池优化的白名单 则进入系统电池优化页面
                Intent powerUsageIntent = new Intent(Settings.ACTION_IGNORE_BATTERY_OPTIMIZATION_SETTINGS);
                powerUsageIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                PackageManager packageManager = mContext.getPackageManager();
                ResolveInfo resolveInfo = packageManager.resolveActivity(powerUsageIntent, 0);
                //判断系统是否有这个页面
                if (resolveInfo != null) {
                    mContext.startActivity(powerUsageIntent);
                }
            }
        }
    }

}
