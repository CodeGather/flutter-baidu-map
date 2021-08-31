package com.baidu.flutter.trace.model.track;

/**
 * 里程补偿方式
 *
 * <pre>
 * 在里程计算时，两个轨迹点定位时间间隔5分钟以上，被认为是中断。
 * </pre>
 *
 * @author baidu
 */
public enum SupplementMode {

    /**
     * 不补充（中断两点间距离不记入里程）
     */
    no_supplement,

    /**
     * 使用直线距离补充
     */
    straight,

    /**
     * 使用最短驾车路线距离补充
     */
    driving,

    /**
     * 使用最短骑行路线距离补充
     */
    riding,

    /**
     * 使用最短步行路线距离补充
     */
    walking

}
