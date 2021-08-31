package com.baidu.flutter.trace.model.track;

import java.util.Map;

import com.baidu.flutter.trace.model.LatLng;
import com.baidu.flutter.trace.model.Point;

/**
 * 最新轨迹点
 *
 * @author baidu
 */
public class LatestPoint extends Point {

    /**
     * 楼层
     */
    private String floor;

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
     * 仅当请求参数{@link com.baidu.trace.model.ProcessOption}中needMapMatch=1且绑路成功时，返回该字段。
     * 可能的返回值：高速路；都市高速路；国道；省道；县道；乡镇道路；其他道路；九级路；轮渡；行人道路
     * 注意：该功能为高级付费服务，需通过反馈平台联系工作人员开通
     * <p>
     * V3.1.0版本新增字段
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
     * 仅当请求参数is_processed=1时返回。
     * 可能的返回值：未知；GPS/北斗定位；网络定位；基站定位
     * <p>
     * V3.1.0版本新增字段
     */
    private String locateMode;

    /**
     * 轨迹对应的交通方式（鹰眼分析得出）
     * 仅当请求参数{@link com.baidu.trace.model.ProcessOption}中transportMode=auto时返回。
     * 可能的返回值：未知；驾车；骑行；步行；停留
     * 注意：该功能为高级付费服务，需通过反馈平台联系工作人员开通
     * <p>
     * V3.1.0版本新增字段
     */
    private String transportMode;

    /**
     * 获取楼层
     *
     * @return
     */
    public String getFloor() {
        return floor;
    }

    public void setFloor(String floor) {
        this.floor = floor;
    }

    /**
     * 获取对象名称
     *
     * @return
     */
    public String getObjectName() {
        return objectName;
    }

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

    public void setColumns(Map<String, String> columns) {
        this.columns = columns;
    }

    public LatestPoint() {
        super();
    }

    /**
     * @param location  位置坐标
     * @param coordType 坐标类型
     */
    public LatestPoint(LatLng location, int coordType) {
        super(location, coordType);
    }

    /**
     * @param location   位置坐标
     * @param coordType  坐标类型
     * @param floor      楼层
     * @param objectName 对象名称
     * @param columns    自定义轨迹属性（track attribute）
     */
    public LatestPoint(LatLng location, int coordType, String floor, String objectName,
                       Map<String, String> columns) {
        super(location, coordType);
        this.floor = floor;
        this.objectName = objectName;
        this.columns = columns;
    }

    /**
     * V3.1.0版本新增
     *
     * @param location      位置坐标
     * @param coordType     坐标类型
     * @param floor         楼层
     * @param objectName    对象名称
     * @param columns       自定义轨迹属性（track attribute）
     * @param roadGrade     轨迹对应的道路等级
     * @param locateMode    轨迹对应的定位方式
     * @param transportMode 轨迹对应的交通方式
     */
    public LatestPoint(LatLng location, int coordType, String floor, String objectName,
                       Map<String, String> columns, String roadGrade, String roadName,
                       String locateMode, String transportMode) {
        super(location, coordType);
        this.floor = floor;
        this.objectName = objectName;
        this.columns = columns;
        this.roadGrade = roadGrade;
        this.roadName = roadName;
        this.locateMode = locateMode;
        this.transportMode = transportMode;
    }

    /**
     * 获取轨迹对应的道路等级
     * V3.1.0版本新增字段
     * <p>
     * 仅当请求参数{@link com.baidu.trace.model.ProcessOption}中needMapMatch=1且绑路成功时，返回该字段。
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
     * V3.1.0版本新增字段
     * <p>
     * 仅当请求参数{@link com.baidu.trace.model.ProcessOption}中needMapMatch=1且绑路成功时，返回该字段。
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
     * V3.1.0版本新增字段
     * <p>
     * 可能的返回值：未知；GPS/北斗定位；网络定位；基站定位
     *
     * @return 轨迹对应的定位方式
     */
    public String getLocateMode() {
        return locateMode;
    }

    /**
     * 设置轨迹对应的定位方式（鹰眼分析得出）
     * V3.1.0版本新增字段
     * <p>
     * 可能的返回值：未知；GPS/北斗定位；网络定位；基站定位
     *
     * @param locateMode 轨迹对应的定位方式
     */
    public void setLocateMode(String locateMode) {
        this.locateMode = locateMode;
    }

    /**
     * 获取轨迹对应的交通方式（鹰眼分析得出）
     * V3.1.0版本新增字段
     * <p>
     * 仅当请求参数{@link com.baidu.trace.model.ProcessOption}中transportMode=auto时返回。
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
     * V3.1.0版本新增字段
     * <p>
     * 仅当请求参数{@link com.baidu.trace.model.ProcessOption}中transportMode=auto时返回。
     * 可能的返回值：未知；驾车；骑行；步行；停留
     * 注意：该功能为高级付费服务，需通过反馈平台联系工作人员开通
     *
     * @param transportMode 轨迹对应的交通方式
     */
    public void setTransportMode(String transportMode) {
        this.transportMode = transportMode;
    }

    public static LatestPoint fromSDKObject(com.baidu.trace.api.track.LatestPoint latestPoint) {
        if (latestPoint == null) {
            return null;
        }
        LatestPoint latestPointTmp = new LatestPoint();
        latestPointTmp.setLocation(latestPoint.getLocation());
        latestPointTmp.setCoordType(latestPoint.getCoordType().ordinal());
        latestPointTmp.setRadius(latestPoint.getRadius());
        latestPointTmp.setLocTime(latestPoint.getLocTime());
        latestPointTmp.setDirection(latestPoint.getDirection());
        latestPointTmp.setSpeed(latestPoint.getSpeed());
        latestPointTmp.setHeight(latestPoint.getHeight());
        latestPointTmp.setFloor(latestPoint.getFloor());
        latestPointTmp.setObjectName(latestPoint.getObjectName());
        latestPointTmp.setColumns(latestPoint.getColumns());
        latestPointTmp.setRoadGrade(latestPoint.getRoadGrade());
        latestPointTmp.setRoadName(latestPoint.getRoadName());
        latestPointTmp.setLocateMode(latestPoint.getLocateMode());
        latestPointTmp.setTransportMode(latestPoint.getTransportMode());
        return latestPointTmp;
    }

    @Override
    public String toString() {
        return "LatestPoint [location=" + location + ", coordType=" + coordType + ", radius="
                + radius + ", locTime="
                + locTime + ", direction=" + direction + ", speed=" + speed + ", height=" + height
                + ", floor=" + floor
                + ", objectName=" + objectName + ", columns=" + columns + ", roadGrade=" + roadGrade
                + ", roadName=" + roadName + ", locateMode=" + locateMode + ", transportMode="
                + transportMode + "]";
    }

}
