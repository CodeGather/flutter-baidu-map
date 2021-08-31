package com.baidu.flutter.trace;

import com.baidu.flutter.trace.manager.LBSTraceController;

import androidx.annotation.NonNull;
import io.flutter.embedding.engine.plugins.FlutterPlugin;

/**
 * FlutterBaiduLbsTracePlugin
 */
public class LBSTraceFlutterPlugin implements FlutterPlugin {

    private LBSTraceController lbsTraceController;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        lbsTraceController = new LBSTraceController(flutterPluginBinding);
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        lbsTraceController.release();
    }
}
