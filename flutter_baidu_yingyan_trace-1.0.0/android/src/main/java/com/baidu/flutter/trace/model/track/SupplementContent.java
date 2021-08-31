package com.baidu.flutter.trace.model.track;

/**
 * SupplementContent
 *
 * @author Baidu
 * @version 1.0.0
 * @date 2021/1/5 1:53 PM
 * @description 轨迹补偿内容枚举类
 */
public enum SupplementContent {

    /**
     * 对于中断区间，只补偿中断的里程，不补偿轨迹点
     */
    only_distance,

    /**
     * 对于中断区间，既补偿里程，又补偿轨迹点
     */
    distance_and_points
}
