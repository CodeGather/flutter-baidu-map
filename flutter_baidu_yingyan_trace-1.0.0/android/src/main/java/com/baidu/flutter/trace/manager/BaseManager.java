package com.baidu.flutter.trace.manager;


import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

/**
 * Copyright (C) 2019 Baidu, Inc. All Rights Reserved.
 */
public abstract class BaseManager {
    
    protected LBSTraceController mLBSTraceController;
    
    BaseManager(LBSTraceController lbsTraceController) {
        mLBSTraceController = lbsTraceController;
    }
    
    abstract void handleMethodCall(MethodCall call, MethodChannel.Result result);
}
