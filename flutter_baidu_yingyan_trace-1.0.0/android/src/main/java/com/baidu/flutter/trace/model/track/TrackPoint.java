package com.baidu.flutter.trace.model.track;

import java.util.Map;

import com.baidu.flutter.trace.model.Point;
import com.baidu.trace.model.CoordType;
import com.baidu.trace.model.LatLng;

/**
 * 轨迹点信息
 *
 * @author baidu
 */
public class TrackPoint extends Point {

    /**
     * 创建时间（该时间为服务端时间）
     * <p>
     * 注：仅在查询历史轨迹时有值；批量添加轨迹点时，无须设置该字段。
     */
    private String createTime;

    /**
     * 对象名称
     */
    private String objectName;

    /**
     * 自定义轨迹属性（track attribute）
     */
    private Map<String, String> columns;

    /**
     * 轨迹对应的道路等级
     * V3.1.0新增字段
     * <p>
     * 仅当请求参数isProcessed = true 且{@link com.baidu.trace.model.ProcessOption}中needMapMatch=true
     * 时，返回该字段
     * 可能的返回值：高速路；都市高速路；国道；省道；县道；乡镇道路；其他道路；九级路；轮渡；行人道路
     * 注意：该功能为高级付费服务，需通过反馈平台联系工作人员开通
     */
    private String roadGrade;

    /**
     * 轨迹对应的道路名称
     * V3.1.0新增字段
     * <p>
     * 如"信息路"
     * 若道路未命名或百度地图未采集到该道路名称，则返回"无名路"
     * 注意：该功能为高级付费服务，需通过反馈平台联系工作人员开通
     */
    private String roadName;

    /**
     * 轨迹对应的定位方式（鹰眼分析得出）
     * V3.1.0新增字段
     * <p>
     * 仅当请求参数isProcessed = true时返回。
     * 可能的返回值：未知；GPS/北斗定位；网络定位；基站定位*
     */
    private String locateMode;

    /**
     * 轨迹对应的交通方式（鹰眼分析得出）
     * V3.1.0新增字段
     * <p>
     * 仅当请求参数isProcessed = true且{@link com.baidu.trace.model.ProcessOption}中transport_mode=auto时返回。
     * 可能的返回值：未知；驾车；骑行；步行；停留
     * 注意：该功能为高级付费服务，需通过反馈平台联系工作人员开通
     */
    private String transportMode;

    /**
     * 若为原始轨迹点位置纠正后的点，则不返回该字段；
     * 若该点为鹰眼纠偏绑路时自动补充的道路形状点，则supplement=1；
     * 若该点为通过请求参数中天蝎的SupplementMode和SupplementContent在长距离中断区间使用路线规划补偿的轨迹点，则supplement=2；
     */
    private int supplement;

    /**
     * 获取创建时间（该时间为服务端时间），仅在查询历史轨迹时有值。
     *
     * @return
     */
    public String getCreateTime() {
        return createTime;
    }

    /**
     * 设置创建时间（该时间为服务端时间）
     * <p>
     * 注：批量添加轨迹点时，无须设置该字段。
     *
     * @param createTime
     */
    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    /**
     * 获取对象名称
     *
     * @return
     */
    public String getObjectName() {
        return objectName;
    }

    /**
     * 设置对象名称
     *
     * @param objectName
     */
    public void setObjectName(String objectName) {
        this.objectName = objectName;
    }

    /**
     * 获取自定义轨迹属性（track attribute）
     *
     * @return
     */
    public Map<String, String> getColumns() {
        return columns;
    }

    /**
     * 设置取自定义轨迹属性（track attribute）
     *
     * @param columns
     */
    public void setColumns(Map<String, String> columns) {
        this.columns = columns;
    }

    /**
     * 获取轨迹对应的道路等级
     * V3.1.0新增字段
     * <p>
     * 仅当请求参数isProcessed = true 且{@link com.baidu.trace.model.ProcessOption}中needMapMatch=true
     * 时，返回该字段
     * 可能的返回值：高速路；都市高速路；国道；省道；县道；乡镇道路；其他道路；九级路；轮渡；行人道路
     * 注意：该功能为高级付费服务，需通过反馈平台联系工作人员开通
     *
     * @return 轨迹对应的道路等级
     */
    public String getRoadGrade() {
        return roadGrade;
    }

    /**
     * 设置轨迹对应的道路等级
     * V3.1.0新增字段
     * <p>
     * 仅当请求参数isProcessed = true 且{@link com.baidu.trace.model.ProcessOption}中needMapMatch=true
     * 时，返回该字段
     * 可能的返回值：高速路；都市高速路；国道；省道；县道；乡镇道路；其他道路；九级路；轮渡；行人道路
     * 注意：该功能为高级付费服务，需通过反馈平台联系工作人员开通
     *
     * @param roadGrade 轨迹对应的道路等级
     */
    public void setRoadGrade(String roadGrade) {
        this.roadGrade = roadGrade;
    }

    /**
     * 获取轨迹对应的道路名称
     * V3.1.0新增字段
     * <p>
     * 如"信息路"
     * 若道路未命名或百度地图未采集到该道路名称，则返回"无名路"
     * 注意：该功能为高级付费服务，需通过反馈平台联系工作人员开通
     *
     * @return 轨迹对应的道路名称
     */
    public String getRoadName() {
        return roadName;
    }

    /**
     * 设置轨迹对应的道路名称
     * V3.1.0新增字段
     * <p>
     * 如"信息路"
     * 若道路未命名或百度地图未采集到该道路名称，则返回"无名路"
     * 注意：该功能为高级付费服务，需通过反馈平台联系工作人员开通
     *
     * @param roadName 轨迹对应的道路名称
     */
    public void setRoadName(String roadName) {
        this.roadName = roadName;
    }

    /**
     * 获取轨迹对应的定位方式（鹰眼分析得出）
     * V3.1.0新增字段
     * <p>
     * 仅当请求参数isProcessed = true时返回。
     * 可能的返回值：未知；GPS/北斗定位；网络定位；基站定位
     *
     * @return 轨迹对应的定位方式
     */
    public String getLocateMode() {
        return locateMode;
    }

    /**
     * 设置轨迹对应的定位方式（鹰眼分析得出）
     * V3.1.0新增字段
     * <p>
     * 仅当请求参数isProcessed = true时返回。
     * 可能的返回值：未知；GPS/北斗定位；网络定位；基站定位
     *
     * @param locateMode 轨迹对应的定位方式
     */
    public void setLocateMode(String locateMode) {
        this.locateMode = locateMode;
    }

    /**
     * 获取轨迹对应的交通方式（鹰眼分析得出）
     * V3.1.0新增字段
     * <p>
     * 仅当请求参数isProcessed = true且{@link com.baidu.trace.model.ProcessOption}中transport_mode=auto时返回。
     * 可能的返回值：未知；驾车；骑行；步行；停留
     * 注意：该功能为高级付费服务，需通过反馈平台联系工作人员开通
     *
     * @return 轨迹对应的交通方式
     */
    public String getTransportMode() {
        return transportMode;
    }

    /**
     * 设置轨迹对应的交通方式（鹰眼分析得出）
     * V3.1.0新增字段
     * <p>
     * 仅当请求参数isProcessed = true且{@link com.baidu.trace.model.ProcessOption}中transport_mode=auto时返回。
     * 可能的返回值：未知；驾车；骑行；步行；停留
     * 注意：该功能为高级付费服务，需通过反馈平台联系工作人员开通
     *
     * @param transportMode 轨迹对应的交通方式
     */
    public void setTransportMode(String transportMode) {
        this.transportMode = transportMode;
    }

    /**
     * 获取是否为补充的点
     * V3.1.8新增字段
     *
     * @return 是否为补充的点
     */
    public int getSupplement() {
        return supplement;
    }

    /**
     * 设置是否为补充的点
     * V3.1.8新增字段
     *
     * @param supplement 是否为补充的点
     */
    public void setSupplement(int supplement) {
        this.supplement = supplement;
    }

    public TrackPoint() {
        super();
    }

    /**
     * @param coordType 坐标类型
     */
    public TrackPoint(int coordType) {
        this.coordType = coordType;
    }

    /**
     * @param createTime 创建时间（该时间为服务端时间）
     * @param objectName 对象名称
     * @param columns    自定义轨迹属性（track attribute）
     */
    public TrackPoint(String createTime, String objectName, Map<String, String> columns) {
        super();
        this.createTime = createTime;
        this.objectName = objectName;
        this.columns = columns;
    }

    /**
     * V3.1.0版本新增字段构造方法
     *
     * @param createTime    创建时间（该时间为服务端时间）
     * @param objectName    对象名称
     * @param columns       自定义轨迹属性（track attribute）
     * @param roadGrade     轨迹对应的道路等级
     * @param roadName      轨迹对应的道路名称
     * @param locateMode    轨迹对应的定位方式
     * @param transportMode 轨迹对应的交通方式
     */
    public TrackPoint(String createTime, String objectName, Map<String, String> columns,
                      String roadGrade, String roadName, String locateMode, String transportMode) {
        super();
        this.createTime = createTime;
        this.objectName = objectName;
        this.columns = columns;
        this.roadGrade = roadGrade;
        this.roadName = roadName;
        this.locateMode = locateMode;
        this.transportMode = transportMode;
    }

    public com.baidu.trace.api.track.TrackPoint toTracePoint() {
        com.baidu.trace.api.track.TrackPoint trackPoint =
                new com.baidu.trace.api.track.TrackPoint();
        if (location != null) {
            trackPoint.setLocation(new LatLng(location.latitude, location.longitude));
        }
        trackPoint.setCoordType(CoordType.values()[coordType]);
        trackPoint.setRadius(radius);
        trackPoint.setLocTime(locTime);
        trackPoint.setDirection(direction);
        trackPoint.setSpeed(speed);
        trackPoint.setHeight(height);
        trackPoint.setCreateTime(createTime);
        trackPoint.setObjectName(objectName);
        trackPoint.setColumns(columns);
        trackPoint.setRoadGrade(roadGrade);
        trackPoint.setRoadName(roadName);
        trackPoint.setLocateMode(locateMode);
        trackPoint.setTransportMode(transportMode);
        return trackPoint;

    }

    public static TrackPoint fromSDKObject(com.baidu.trace.api.track.TrackPoint trackPoint) {
        if (trackPoint == null) {
            return null;
        }
        TrackPoint flutterTrackPoint = new TrackPoint();
        flutterTrackPoint.setLocation(trackPoint.getLocation());
        flutterTrackPoint.setCoordType(trackPoint.getCoordType().ordinal());
        flutterTrackPoint.setRadius(trackPoint.getRadius());
        flutterTrackPoint.setLocTime(trackPoint.getLocTime());
        flutterTrackPoint.setDirection(trackPoint.getDirection());
        flutterTrackPoint.setSpeed(trackPoint.getSpeed());
        flutterTrackPoint.setHeight(trackPoint.getHeight());
        flutterTrackPoint.setCreateTime(trackPoint.getCreateTime());
        flutterTrackPoint.setObjectName(trackPoint.getObjectName());
        flutterTrackPoint.setColumns(trackPoint.getColumns());
        flutterTrackPoint.setRoadGrade(trackPoint.getRoadGrade());
        flutterTrackPoint.setRoadName(trackPoint.getRoadName());
        flutterTrackPoint.setLocateMode(trackPoint.getLocateMode());
        flutterTrackPoint.setTransportMode(trackPoint.getTransportMode());
        flutterTrackPoint.setSupplement(trackPoint.getSupplement());
        return flutterTrackPoint;
    }

    @Override
    public String toString() {
        return "TrackPoint [location=" + location + ", coordType=" + coordType + ", radius="
                + radius + ", locTime="
                + locTime + ", direction=" + direction + ", speed=" + speed + ", height=" + height
                + ", createTime="
                + createTime + ", objectName=" + objectName + ", columns=" + columns
                + ", roadGrade=" + roadGrade + ", roadName=" + roadName + ", locateMode="
                + locateMode + ", transportMode=" + transportMode + ", supplement=" + supplement + "]";
    }

}
