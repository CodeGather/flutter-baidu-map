package com.baidu.bmfmap.map.overlayhandler;

import static com.baidu.bmfmap.utils.Constants.MethodProtocol.TraceProtocol.TRACE_OVERLAY_ANIMATION_DID_END_CALLBACK;
import static com.baidu.bmfmap.utils.Constants.MethodProtocol.TraceProtocol.TRACE_OVERLAY_ANIMATION_DID_START_CALLBACK;
import static com.baidu.bmfmap.utils.Constants.MethodProtocol.TraceProtocol.TRACE_OVERLAY_ANIMATION_RUNNING_PROGRESS_CALLBACK;
import static com.baidu.bmfmap.utils.Constants.MethodProtocol.TraceProtocol.TRACE_OVERLAY_ANIMATION_UPDATE_POSITION_CALLBACK;

import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;

import androidx.annotation.Nullable;

import com.baidu.bmfmap.BMFMapController;
import com.baidu.bmfmap.utils.Constants;
import com.baidu.bmfmap.utils.Env;
import com.baidu.bmfmap.utils.converter.FlutterDataConveter;
import com.baidu.bmfmap.utils.converter.TypeConverter;
import com.baidu.mapapi.map.BaiduMap;
import com.baidu.mapapi.map.Marker;
import com.baidu.mapapi.map.track.TraceAnimationListener;
import com.baidu.mapapi.map.track.TraceOptions;
import com.baidu.mapapi.map.track.TraceOverlay;
import com.baidu.mapapi.model.LatLng;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

/**
 * 3.1.0 动态轨迹绘制
 */
public class TraceHandler extends OverlayHandler implements TraceAnimationListener {
    private static final String TAG = "TraceHandler";
    private static MarkerHandler markerHandler;
    private static Map<String, Object> marker;

    protected final HashMap<String, TraceOverlay> mTraceOverlayMap = new HashMap<>();
    
    public TraceHandler(BMFMapController bmfMapController) {
        super(bmfMapController);
    }

    @Override
    public void handlerMethodCall(MethodCall call, MethodChannel.Result result) {
        super.handlerMethodCall(call, result);
        if (Env.DEBUG) {
            Log.d(TAG, "handlerMethodCall enter");
        }

        if (null == result) {
            return;
        }
        Map<String, Object> argument = call.arguments();
        if (null == argument) {
            if (Env.DEBUG) {
                Log.d(TAG, "argument is null");
            }
            result.success(false);
            return;
        }

        String methodId = call.method;
        boolean ret = false;
        switch (methodId) {
            case Constants.MethodProtocol.TraceProtocol.MAP_ADD_TRACE_OVERLAY_METHOD:
                ret = addTraceOverlay(argument);
                break; 
            case Constants.MethodProtocol.TraceProtocol.MAP_REMOVE_TRACE_OVERLAY_METHOD:
                ret = removeOneTraceOverLayById(argument);
                break;
            default:
                break;
        }

        result.success(ret);
    }

    private boolean addTraceOverlay(Map<String, Object> argument) {
        if (mMapController == null) {
            return false;
        }

        BaiduMap baiduMap = mMapController.getBaiduMap();
        if (baiduMap == null) {
            return false;
        }

        if (!argument.containsKey("id")
                || !argument.containsKey("coordinates")) {
            if (Env.DEBUG) {
                Log.d(TAG, "argument does not contain");
            }
            return false;
        }

        final String id = new TypeConverter<String>().getValue(argument, "id");
        if (TextUtils.isEmpty(id)) {
            if (Env.DEBUG) {
                Log.d(TAG, "id is null");
            }
            return false;
        }

        if (mTraceOverlayMap.containsKey(id)) {
            return false;
        }

        List<Map<String, Double>> coordinates =
                (List<Map<String, Double>>) argument.get("coordinates");
        List<LatLng> latLngList = FlutterDataConveter.mapToLatlngs(coordinates);
        if (null == latLngList) {
            if (Env.DEBUG) {
                Log.d(TAG, "latLngList is null");
            }
            return false;
        }

        final TraceOptions traceOptions = new TraceOptions();
        traceOptions.points(latLngList);
        
        Map<String, Object> traceOverlayAnimateOption = 
                (Map<String, Object>) argument.get("traceOverlayAnimateOption");
        if (null != traceOverlayAnimateOption && traceOverlayAnimateOption.size() > 0) {
            Boolean animate = (Boolean) traceOverlayAnimateOption.get("animate");
            if (null != animate) {
                traceOptions.animate(animate);
            }

            Double delay = (Double) traceOverlayAnimateOption.get("delay");
            if (null != delay) {
                traceOptions.animationDuration(delay.intValue() * 1000);
            }

            Double duration = (Double) traceOverlayAnimateOption.get("duration");
            if (null != duration) {
                traceOptions.animationTime(duration.intValue() * 1000);
            }

            Integer easingCurve = (Integer) traceOverlayAnimateOption.get("easingCurve");
            if (null != easingCurve) {
                traceOptions.animationType(TraceOptions.TraceAnimateType.values()[easingCurve]);
            }

            Boolean trackMove = (Boolean) traceOverlayAnimateOption.get("trackMove");
            if (null != trackMove) {
                traceOptions.setTrackMove(trackMove);
            }
        }
        
        Integer width = (Integer) argument.get("width");
        if (null != width) {
            traceOptions.width(width);
        }

        String fillColorStr = (String) argument.get("fillColor");
        if (!TextUtils.isEmpty(fillColorStr)) {
            Integer fillColor = FlutterDataConveter.getColor(fillColorStr);
            if (null != fillColor) {
                traceOptions.color(fillColor);
            }
        }

        final Double fromValue = (Double) argument.get("fromValue");
        final Double toValue = (Double) argument.get("toValue");
        final String strokeColor = (String) argument.get("strokeColor");

//        marker = (Map<String, Object>) argument.get("marker");
//        if (null != marker) {
//            marker.put("position", coordinates.get(0));
//            if (markerHandler == null) {
//                markerHandler = new MarkerHandler(mMapController);
//            }
//            markerHandler.clean();
//            boolean status = markerHandler.addMarkerImp(marker);
//            Log.d(TAG, "setOptions: " + status);
//        }

        final TraceOverlay overlay = baiduMap.addTraceOverlay(traceOptions, new TraceAnimationListener() {
            @Override
            public void onTraceAnimationUpdate(int percent) {
                MethodChannel methodChannel = mMapController.getMethodChannel();
                if (null == methodChannel) {
                    return;
                }
                HashMap<String, Object> traceOverlayMap = new HashMap<>();
                HashMap<String, Object> optionMap = traceOverlayOptionMap(traceOptions, fromValue, toValue, strokeColor, id);
                traceOverlayMap.put("traceOverlay", optionMap);
                traceOverlayMap.put("progress", (double) percent);
                if (percent == 0) {
                    methodChannel.invokeMethod(TRACE_OVERLAY_ANIMATION_DID_START_CALLBACK, traceOverlayMap,
                            new MethodChannel.Result() {
                        @Override
                        public void success(@Nullable Object result) {
                            if (Env.DEBUG) {
                                Log.d(TAG, "onTraceAnimationUpdate methodChannel is success: ");
                            }
                        }

                        @Override
                        public void error(String errorCode, @Nullable String errorMessage,
                                          @Nullable Object errorDetails) {
                            if (Env.DEBUG) {
                                Log.d(TAG, "error: " + " errorCode : " + errorCode
                                        + " errorMessage: " + errorMessage);
                            }
                        }

                        @Override
                        public void notImplemented() {

                        }
                    });
                }

                methodChannel.invokeMethod(TRACE_OVERLAY_ANIMATION_RUNNING_PROGRESS_CALLBACK, traceOverlayMap,
                        new MethodChannel.Result() {
                    @Override
                    public void success(@Nullable Object result) {
                        if (Env.DEBUG) {
                            Log.d(TAG, "onTraceAnimationUpdate methodChannel is success: ");
                        }
                    }

                    @Override
                    public void error(String errorCode, @Nullable String errorMessage, @Nullable Object errorDetails) {
                        if (Env.DEBUG) {
                            Log.d(TAG, "onTraceAnimationUpdate error: " + " errorCode : " +
                                    errorCode + " errorMessage: " + errorMessage);
                        }
                    }

                    @Override
                    public void notImplemented() {

                    }
                });
            }

            @Override
            public void onTraceUpdatePosition(LatLng latLng) {
                MethodChannel methodChannel = mMapController.getMethodChannel();
                if (null == latLng || null == methodChannel) {
                    return;
                }
                HashMap<String, Object> coordinateMap = new HashMap<>();
                HashMap<String, Double> coord = new HashMap<>();
                coord.put("latitude", latLng.latitude);
                coord.put("longitude", latLng.longitude);
                coordinateMap.put("coord", coord);

//                Marker markers = (Marker) markerHandler.mMarkerMap.get(marker.get("id"));
//                System.out.println(markers);
//                markers.setPosition(latLng);
                methodChannel.invokeMethod(TRACE_OVERLAY_ANIMATION_UPDATE_POSITION_CALLBACK,
                        coordinateMap, new MethodChannel.Result() {
                            @Override
                            public void success(@Nullable Object result) {
                                if (Env.DEBUG) {
                                    Log.d(TAG, "onTraceUpdatePosition methodChannel is success: ");
                                }
                            }

                            @Override
                            public void error(String errorCode, @Nullable String errorMessage,
                                              @Nullable Object errorDetails) {
                                if (Env.DEBUG) {
                                    Log.d(TAG, "onTraceUpdatePosition error: " +" errorCode : " +
                                            ""+ errorCode + " errorMessage: " + errorMessage);
                                }
                            }

                            @Override
                            public void notImplemented() {

                            }
                        });
            }

            @Override
            public void onTraceAnimationFinish() {
                MethodChannel methodChannel = mMapController.getMethodChannel();
                if (null == methodChannel) {
                    if (Env.DEBUG) {
                        Log.d(TAG, "onTraceAnimationFinish:  methodChannel is null");
                    }
                    return;
                }
                Log.e(TAG, "onTraceAnimationFinish: " );
                HashMap<String, Object> traceOverlayMap = new HashMap<>();
                HashMap<String, Object> optionMap = traceOverlayOptionMap(traceOptions,
                        fromValue, toValue, strokeColor, id);
                traceOverlayMap.put("traceOverlay", optionMap);
                traceOverlayMap.put("flag", true);
                methodChannel.invokeMethod(TRACE_OVERLAY_ANIMATION_DID_END_CALLBACK,
                        traceOverlayMap, new MethodChannel.Result() {
                    @Override
                    public void success(@Nullable Object result) {
                        if (Env.DEBUG) {
                            Log.e(TAG, "onTraceAnimationFinish is success: ");
                        }
                    }

                    @Override
                    public void error(String errorCode, @Nullable String errorMessage, @Nullable Object errorDetails) {
                        if (Env.DEBUG) {
                            Log.d(TAG, "onTraceAnimationFinish error: " +" errorCode : " +
                                    ""+ errorCode + " errorMessage: " + errorMessage);
                        }
                    }

                    @Override
                    public void notImplemented() {

                    }
                });
            }
        });
        if (null == overlay) {
            return false;
        }

        Bundle bundle = new Bundle();
        bundle.putString("id", id);
        mTraceOverlayMap.put(id, overlay);
        return true;
    }

    private boolean removeOneTraceOverLayById(Map<String, Object> argument) {
        if (mMapController == null) {
            return false;
        }

        BaiduMap baiduMap = mMapController.getBaiduMap();
        if (baiduMap == null) {
            return false;
        }

        if (!argument.containsKey("id")) {
            if (Env.DEBUG) {
                Log.d(TAG, "argument does not contain");
            }
            return false;
        }
        
        String id = new TypeConverter<String>().getValue(argument, "id");
        if (TextUtils.isEmpty(id)) {
            return false;
        }

        TraceOverlay overlay = mTraceOverlayMap.get(id);
        if (null == overlay) {
            if (Env.DEBUG) {
                Log.d(TAG, "not found overlay with id:" + id);
            }
            return false;
        }

        overlay.remove();
        if (mTraceOverlayMap != null) {
            mTraceOverlayMap.remove(id);
        }

        if (Env.DEBUG) {
            Log.d(TAG, "remove Overlay success");
        }
        return true;
    }
    
    @Override
    public void onTraceAnimationUpdate(int i) {

    }

    @Override
    public void onTraceUpdatePosition(LatLng latLng) {

    }

    @Override
    public void onTraceAnimationFinish() {

    }

    @Override
    public void clean() {
        super.clean();

        if (mTraceOverlayMap != null && mTraceOverlayMap.size() > 0) {
            mTraceOverlayMap.clear();
        }
    }

    private HashMap<String, Object> traceOverlayOptionMap(TraceOptions traceOptions, Double fromValue,
                                                           Double toValue, String strokeColor, String id) {

        HashMap<String, Object> optionMap = new HashMap<>();
        HashMap<String, Object> traceOverlayAnimateOptionMap = new HashMap<>();
        traceOverlayAnimateOptionMap.put("animate", traceOptions.isAnimation());
        traceOverlayAnimateOptionMap.put("delay", (double) traceOptions.getAnimationDuration());
        traceOverlayAnimateOptionMap.put("duration", (double) traceOptions.getAnimationTime());
        // android 不支持此参数，回调给用户传入的参数
        if (null != fromValue) {
            traceOverlayAnimateOptionMap.put("fromValue", fromValue);
        } else {
            traceOverlayAnimateOptionMap.put("fromValue", 0.0d);
        }

        if (null != toValue) {
            traceOverlayAnimateOptionMap.put("toValue", toValue);
        } else {
            traceOverlayAnimateOptionMap.put("toValue", 0.0d);
        }
        traceOverlayAnimateOptionMap.put("trackMove", traceOptions.isTrackMove());
        traceOverlayAnimateOptionMap.put("easingCurve", traceOptions.getAnimateType().ordinal());
        optionMap.put("width", traceOptions.getWidth());
        optionMap.put("fillColor", Integer.toHexString(traceOptions.getColor()));
        if (null != strokeColor) {
            optionMap.put("strokeColor", strokeColor);
        } else {
            optionMap.put("strokeColor", "");
        }
        optionMap.put("traceOverlayAnimateOption", traceOverlayAnimateOptionMap);
        List<Object> latlngLists = new ArrayList<>();
        List<LatLng> points = traceOptions.getPoints();
        if (null != points) {
            for (int i = 0; i < points.size(); i++) {
                HashMap<String, Double> latlngHashMap = new HashMap<>();
                latlngHashMap.put("latitude", points.get(i).latitude);
                latlngHashMap.put("longitude", points.get(i).longitude);
                latlngLists.add(latlngHashMap);
            }
        }
        optionMap.put("coordinates", latlngLists);
        optionMap.put("id", id);
        return optionMap;
    }
}
