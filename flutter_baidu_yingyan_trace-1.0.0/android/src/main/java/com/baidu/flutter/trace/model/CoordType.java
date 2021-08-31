package com.baidu.flutter.trace.model;

/**
 * 坐标类型
 *
 * @author baidu
 */
public enum CoordType {

    /**
     * GPS原始坐标
     */
    wgs84,

    /**
     * 国测局加密坐标
     */
    gcj02,

    /**
     * 百度经纬度坐标
     */
    bd09ll
}
