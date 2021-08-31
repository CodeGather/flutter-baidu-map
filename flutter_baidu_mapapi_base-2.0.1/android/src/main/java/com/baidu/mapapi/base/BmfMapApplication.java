package com.baidu.mapapi.base;

import android.app.Application;

import com.baidu.mapapi.SDKInitializer;

/**
 * BmfMapApplicationt有两种使用方式：
 * 1、直接继承与BmfMapApplication
 * 2、将onCreate里的初始化逻辑拷到业务工程Application的onCreate函数里
 */
public class BmfMapApplication extends Application {
    @Override
    public void onCreate() {
        super.onCreate();
        SDKInitializer.initialize(this);
    }
}
